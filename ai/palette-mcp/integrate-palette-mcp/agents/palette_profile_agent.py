# Copyright (c) Spectro Cloud
# SPDX-License-Identifier: Apache-2.0

"""Palette-focused agent for cluster profile discovery."""

from __future__ import annotations

import importlib
from typing import Any

from helpers import (
    build_palette_server_config,
    extract_text_response,
    suppress_console_output,
)

PROFILE_FINDER_SYSTEM_PROMPT = (
    "You are a Palette profile discovery specialist. "
    "Use only Palette MCP tools to find cluster profiles that include a target pack. "
    "First list cluster profiles, then inspect details when needed. "
    "Always capture and return cluster profile scope. "
    "Return factual results only."
)

async def initialize_profile_finder_agent(
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
        system_prompt=PROFILE_FINDER_SYSTEM_PROMPT,
        checkpointer=InMemorySaver(),
    )


async def run_profile_finder_agent(
    agent: Any,
    pack_name: str,
    debug_level: str,
    run_id: str,
) -> str:
    hide_mcp_output = debug_level != "verbose"
    profile_finder_prompt = (
        "Find all cluster profiles in Palette that use the pack named "
        f"'{pack_name}'. Use Palette MCP tools only.\n\n"
        "Required process:\n"
        "1) Call gather_or_delete_clusterprofiles with action='list'.\n"
        "2) If list output lacks pack details, call action='get' for relevant cluster profile uids.\n"
        "3) Match pack name case-insensitively.\n"
        "4) For each matched profile, include scope from metadata.annotations.scope when available.\n"
        "5) If scope is missing, set scope to 'unknown' and mention in notes.\n\n"
        "Important:\n"
        "- Return only profile-level results. Do not query clusters in this agent.\n\n"
        "Return JSON with this shape:\n"
        "{\n"
        '  "pack_name": "<pack>",\n'
        '  "total_profiles_scanned": <int>,\n'
        '  "matched_profiles": [\n'
        "    {\n"
        '      "uid": "<uid>",\n'
        '      "name": "<name>",\n'
        '      "scope": "<tenant|project|system|unknown>",\n'
        '      "pack_references": ["<ref1>", "<ref2>"],\n'
        '      "evidence": "<short evidence>"\n'
        "    }\n"
        "  ],\n"
        '  "notes": "<short note>"\n'
        "}\n"
    )
    run_config = {
        "configurable": {"thread_id": f"profile-finder:{pack_name.lower()}:{run_id}"}
    }
    with suppress_console_output(hide_mcp_output):
        result = await agent.ainvoke(
            {"messages": [{"role": "user", "content": profile_finder_prompt}]},
            config=run_config,
        )
    return extract_text_response(result)
