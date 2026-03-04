# Copyright (c) Spectro Cloud
# SPDX-License-Identifier: Apache-2.0

"""Palette-focused agent for active cluster mapping."""

from __future__ import annotations

import importlib
from typing import Any

from helpers import build_palette_server_config, extract_text_response, suppress_console_output

ACTIVE_CLUSTER_SYSTEM_PROMPT = (
    "You are a Palette active-cluster mapping specialist. "
    "Use only Palette MCP tools to identify active clusters that use a provided set of cluster profile UIDs. "
    "Return factual results only."
)

async def initialize_active_cluster_agent(
    model: str,
    debug_level: str,
    default_env_file: str,
    default_kubeconfig_dir: str,
    default_mcp_image: str,
) -> Any:
    from langchain.agents import create_agent
    from langchain_openai import ChatOpenAI

    checkpoint_module = importlib.import_module("langgraph.checkpoint.memory")
    InMemorySaver = checkpoint_module.InMemorySaver

    try:
        mcp_client_module = importlib.import_module("langchain_mcp_adapters.client")
        MultiServerMCPClient = mcp_client_module.MultiServerMCPClient
    except (ImportError, AttributeError):
        mcp_module = importlib.import_module("langchain_mcp_adapters")
        MultiServerMCPClient = mcp_module.MultiServerMCPClient

    mcp_client = MultiServerMCPClient(
        build_palette_server_config(
            default_env_file=default_env_file,
            default_kubeconfig_dir=default_kubeconfig_dir,
            default_mcp_image=default_mcp_image,
        )
    )
    hide_mcp_output = debug_level != "verbose"
    with suppress_console_output(hide_mcp_output):
        mcp_tools = await mcp_client.get_tools()

    llm = ChatOpenAI(model=model)
    return create_agent(
        model=llm,
        tools=mcp_tools,
        system_prompt=ACTIVE_CLUSTER_SYSTEM_PROMPT,
        checkpointer=InMemorySaver(),
    )


async def run_active_cluster_agent(
    agent: Any,
    pack_name: str,
    matched_profiles_output: str,
    debug_level: str,
    run_id: str,
) -> str:
    hide_mcp_output = debug_level != "verbose"
    active_cluster_prompt = (
        f"Given this profile discovery result for pack '{pack_name}':\n"
        f"{matched_profiles_output}\n\n"
        "Required process:\n"
        "1) Extract matched profile UIDs from the input JSON.\n"
        "2) Call gather_or_delete_clusters with action='list' and active_only=true.\n"
        "3) For each active cluster uid from step 2, call gather_or_delete_clusters with action='get'.\n"
        "4) Match clusters using explicit profile UID fields only.\n"
        "5) If no clusters match, return an empty list and include every checked active cluster uid.\n\n"
        "Return JSON with this shape:\n"
        "{\n"
        '  "pack_name": "<pack>",\n'
        '  "target_profile_uids": ["<uid1>", "<uid2>"],\n'
        '  "total_active_clusters_scanned": <int>,\n'
        '  "active_clusters_using_matched_profiles": [\n'
        "    {\n"
        '      "uid": "<cluster_uid>",\n'
        '      "name": "<cluster_name>",\n'
        '      "cluster_profile_uid": "<profile_uid>",\n'
        '      "cluster_profile_name": "<profile_name>",\n'
        '      "evidence_field_path": "<json.path.to.profile.uid>",\n'
        '      "evidence": "<short evidence>"\n'
        "    }\n"
        "  ],\n"
        '  "checked_active_cluster_uids": ["<uid1>", "<uid2>"],\n'
        '  "notes": "<short note>"\n'
        "}\n"
    )
    run_config = {
        "configurable": {"thread_id": f"active-cluster:{pack_name.lower()}:{run_id}"}
    }
    with suppress_console_output(hide_mcp_output):
        result = await agent.ainvoke(
            {"messages": [{"role": "user", "content": active_cluster_prompt}]},
            config=run_config,
        )
    return extract_text_response(result)
