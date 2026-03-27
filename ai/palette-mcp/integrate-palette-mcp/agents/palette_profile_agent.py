# Copyright (c) Spectro Cloud
# SPDX-License-Identifier: Apache-2.0

"""Palette-focused agent for cluster profile discovery."""

from __future__ import annotations

import importlib
import json
from typing import Any, Literal

from pydantic import BaseModel

from helpers import suppress_console_output

PROFILE_FINDER_SYSTEM_PROMPT = (
    "You are a Palette profile discovery specialist. "
    "Use only Palette MCP tools to find cluster profiles that include a target pack. "
    "First list cluster profiles, then inspect details when needed. "
    "Always capture and return cluster profile scope. "
    "Return factual results only."
)


class MatchedProfile(BaseModel):
    uid: str
    name: str
    scope: Literal["tenant", "project", "system", "unknown"]
    pack_references: list[str]
    evidence: str


class ProfileDiscoveryOutput(BaseModel):
    pack_name: str
    total_profiles_scanned: int
    matched_profiles: list[MatchedProfile]
    notes: str


async def initialize_profile_finder_agent(
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
        system_prompt=PROFILE_FINDER_SYSTEM_PROMPT,
        response_format=ProfileDiscoveryOutput,
        checkpointer=InMemorySaver(),
    )


async def invoke_profile_finder_agent(
    agent: Any,
    pack_name: str,
    debug_level: str,
    run_id: str,
) -> str:
    hide_mcp_output = debug_level != "verbose"
    schema = json.dumps(ProfileDiscoveryOutput.model_json_schema(), indent=2)
    profile_finder_prompt = (
        "Find all cluster profiles in Palette that use the pack named "
        f"'{pack_name}'. Use Palette MCP tools only.\n\n"
        "Required process:\n"
        "1) Call gather_or_delete_clusterprofiles with action='list', limit=50, and compact=false.\n"
        "2) Review the output and check if the pack name is in the list. Match pack name case-insensitively. If the pack present, add it to the list of cluster profiles to review. If it is not, do not add it to the list.\n"
        "3) For each matched profile, include scope from metadata.annotations.scope when available.\n"
        "4) If there is a continue token, use it to retrieve the next page of results. Do not stop until you have gathered all cluster profiles and there is no continue token. Repeat the process until you have gathered all cluster profiles.\n"
        "5) If scope is missing, set scope to 'unknown' and mention in notes.\n\n"
        "6) If the pack name is not in the list, return an empty list and mention in notes.\n"
        "Important:\n"
        "Make sure you reviewed all cluster profiles. There should be no continue token at the end of the process."
        "Return a response that conforms to this JSON schema:\n"
        f"{schema}\n"
    )
    run_config = {
        "configurable": {"thread_id": f"profile-finder:{pack_name.lower()}:{run_id}"}
    }
    with suppress_console_output(hide_mcp_output):
        result = await agent.ainvoke(
            {"messages": [{"role": "user", "content": profile_finder_prompt}]},
            config=run_config,
        )
    structured = result.get("structured_response")
    if isinstance(structured, ProfileDiscoveryOutput):
        return structured.model_dump_json()
    messages = result.get("messages", [])
    for message in reversed(messages):
        content = getattr(message, "content", None)
        if isinstance(content, str) and content.strip():
            return content
    return str(result)
