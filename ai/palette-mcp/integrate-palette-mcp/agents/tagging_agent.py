# Copyright (c) Spectro Cloud
# SPDX-License-Identifier: Apache-2.0

"""Agent that tags matched active clusters for review."""

from __future__ import annotations

import importlib
import json
from typing import Any, Literal

from pydantic import BaseModel

from helpers import suppress_console_output

TAGGING_SYSTEM_PROMPT = (
    "You are a cluster tagging specialist. "
    "Your only job is to apply review tags to active clusters and matched cluster profiles provided in the input. "
    "Never tag cluster profiles with scope='system'. "
    "Never tag a cluster if does not have the pack name in the cluster profile."
    "Use the available tagging tools and do not invent UIDs."
)


class ClusterResult(BaseModel):
    cluster_uid: str
    tool_call_status: Literal["success", "failed"]
    tool_output: str


class ClusterProfileResult(BaseModel):
    cluster_profile_uid: str
    scope: Literal["tenant", "project", "system", "unknown"]
    tool_call_status: Literal["success", "failed"]
    tool_output: str


class ClusterProfileSkipped(BaseModel):
    cluster_profile_uid: str
    scope: str
    reason: str


class TaggingOutput(BaseModel):
    pack_name: str
    requested_tags: list[str]
    clusters_attempted: list[str]
    cluster_profiles_attempted: list[str]
    cluster_results: list[ClusterResult]
    cluster_profile_results: list[ClusterProfileResult]
    cluster_profile_skipped: list[ClusterProfileSkipped]
    notes: str


async def initialize_tagging_agent(model: str, mcp_tools: list) -> Any:
    from langchain.agents import create_agent
    from langchain_openai import ChatOpenAI

    checkpoint_module = importlib.import_module("langgraph.checkpoint.memory")
    InMemorySaver = checkpoint_module.InMemorySaver

    llm = ChatOpenAI(model=model)
    return create_agent(
        model=llm,
        tools=mcp_tools,
        system_prompt=TAGGING_SYSTEM_PROMPT,
        response_format=TaggingOutput,
        checkpointer=InMemorySaver(),
    )


async def invoke_tagging_agent(
    agent: Any,
    pack_name: str,
    profile_discovery_output: str,
    active_cluster_output: str,
    tags: list[str],
    debug_level: str,
    run_id: str,
) -> str:
    if not tags:
        return TaggingOutput(
            pack_name=pack_name,
            requested_tags=[],
            clusters_attempted=[],
            cluster_profiles_attempted=[],
            cluster_results=[],
            cluster_profile_results=[],
            cluster_profile_skipped=[],
            notes="No tags provided by user. Tagging skipped.",
        ).model_dump_json()

    schema = json.dumps(TaggingOutput.model_json_schema(), indent=2)
    tagging_prompt = (
        f"Given this profile discovery output for pack '{pack_name}':\n"
        f"{profile_discovery_output}\n\n"
        f"Given this active cluster mapping output for pack '{pack_name}':\n"
        f"{active_cluster_output}\n\n"
        f"Apply these tags: {tags}\n\n"
        "Task:\n"
        "1) Extract unique cluster UIDs from active_clusters_using_matched_profiles.\n"
        "2) Extract unique cluster profile UIDs and scope values from matched_profiles.\n"
        f"3) For each cluster UID, call search_and_manage_resource_tags with action='create', resource_type='spectroclusters', uid=<uid>, tags={tags}.\n"
        f"4) For each cluster profile UID, call search_and_manage_resource_tags with action='create', resource_type='clusterprofiles', uid=<uid>, tags={tags}, only if scope is not 'system'.\n"
        "5) For scope='system' profiles, skip tagging and record skip reason.\n"
        "6) Return a response that conforms to this JSON schema:\n"
        f"{schema}\n"
        "If there are no resources to tag, return empty arrays and explain in notes."
    )
    hide_mcp_output = debug_level != "verbose"
    run_config = {
        "configurable": {"thread_id": f"tagging:{pack_name.lower()}:{run_id}"}
    }
    with suppress_console_output(hide_mcp_output):
        result = await agent.ainvoke(
            {"messages": [{"role": "user", "content": tagging_prompt}]},
            config=run_config,
        )
    structured = result.get("structured_response")
    if isinstance(structured, TaggingOutput):
        return structured.model_dump_json()
    messages = result.get("messages", [])
    for message in reversed(messages):
        content = getattr(message, "content", None)
        if isinstance(content, str) and content.strip():
            return content
    return str(result)