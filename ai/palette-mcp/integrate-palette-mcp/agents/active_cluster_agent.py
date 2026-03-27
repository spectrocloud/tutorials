# Copyright (c) Spectro Cloud
# SPDX-License-Identifier: Apache-2.0

"""Palette-focused agent for active cluster mapping."""

from __future__ import annotations

import importlib
import json
from typing import Any

from pydantic import BaseModel

from helpers import suppress_console_output

ACTIVE_CLUSTER_SYSTEM_PROMPT = (
    "You are a Palette active-cluster mapping specialist. "
    "Use only Palette MCP tools to identify active clusters that use a provided set of cluster profile UIDs. "
    "Return factual results only."
)


class ActiveCluster(BaseModel):
    uid: str
    name: str
    cluster_profile_uid: str
    cluster_profile_name: str
    evidence_field_path: str
    evidence: str


class ActiveClusterOutput(BaseModel):
    pack_name: str
    target_profile_uids: list[str]
    total_active_clusters_scanned: int
    active_clusters_using_matched_profiles: list[ActiveCluster]
    checked_active_cluster_uids: list[str]
    notes: str


async def initialize_active_cluster_agent(
    model: str,
    mcp_tools: list,
) -> Any:
    from langchain.agents import create_agent
    from langchain_openai import ChatOpenAI

    checkpoint_module = importlib.import_module("langgraph.checkpoint.memory")
    InMemorySaver = checkpoint_module.InMemorySaver

    llm = ChatOpenAI(model=model)
    return create_agent(
        model=llm,
        tools=mcp_tools,
        system_prompt=ACTIVE_CLUSTER_SYSTEM_PROMPT,
        response_format=ActiveClusterOutput,
        checkpointer=InMemorySaver(),
    )


# async def invoke_active_cluster_agent(
#     agent: Any,
#     pack_name: str,
#     matched_profiles_output: str,
#     debug_level: str,
#     run_id: str,
# ) -> str:
#     hide_mcp_output = debug_level != "verbose"
#     schema = json.dumps(ActiveClusterOutput.model_json_schema(), indent=2)
#     active_cluster_prompt = (
#         f"Given this profile discovery result for pack '{pack_name}':\n"
#         f"{matched_profiles_output}\n\n"
#         "Required process:\n"
#         "1) Extract matched profile UIDs from the input JSON.\n"
#         "2) Call gather_or_delete_clusters with action='list' and active_only=true.\n"
#         "3) For each active cluster uid from step 2, call gather_or_delete_clusters with action='get'.\n"
#         "4) Match clusters using explicit profile UID fields only.\n"
#         "5) If no clusters match, return an empty list and include every checked active cluster uid.\n\n"
#         "Return a response that conforms to this JSON schema:\n"
#         f"{schema}\n"
#     )
#     run_config = {
#         "configurable": {"thread_id": f"active-cluster:{pack_name.lower()}:{run_id}"}
#     }
#     with suppress_console_output(hide_mcp_output):
#         result = await agent.ainvoke(
#             {"messages": [{"role": "user", "content": active_cluster_prompt}]},
#             config=run_config,
#         )
#     structured = result.get("structured_response")
#     if isinstance(structured, ActiveClusterOutput):
#         return structured.model_dump_json()
#     messages = result.get("messages", [])
#     for message in reversed(messages):
#         content = getattr(message, "content", None)
#         if isinstance(content, str) and content.strip():
#             return content
#     return str(result)
