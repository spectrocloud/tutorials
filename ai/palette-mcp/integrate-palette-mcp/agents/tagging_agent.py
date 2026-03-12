# Copyright (c) Spectro Cloud
# SPDX-License-Identifier: Apache-2.0

"""Agent that tags matched active clusters for review."""

from __future__ import annotations

import importlib
from typing import Any

from helpers import extract_text_response
from tools import tag_cluster_for_review, tag_cluster_profile_for_review

TAGGING_SYSTEM_PROMPT = (
    "You are a cluster tagging specialist. "
    "Your only job is to apply review tags to active clusters and matched cluster profiles provided in the input. "
    "Never tag cluster profiles with scope='system'. "
    "Never tag a cluster if does not have the pack name in the cluster profile."
    "Use the available tagging tools and do not invent UIDs."
)


async def initialize_tagging_agent(model: str) -> Any:
    from langchain.agents import create_agent
    from langchain_openai import ChatOpenAI

    checkpoint_module = importlib.import_module("langgraph.checkpoint.memory")
    InMemorySaver = checkpoint_module.InMemorySaver

    llm = ChatOpenAI(model=model)
    return create_agent(
        model=llm,
        tools=[tag_cluster_for_review, tag_cluster_profile_for_review],
        system_prompt=TAGGING_SYSTEM_PROMPT,
        checkpointer=InMemorySaver(),
    )


async def invoke_tagging_agent(
    agent: Any,
    pack_name: str,
    profile_discovery_output: str,
    active_cluster_output: str,
    tags: list[str],
    run_id: str,
) -> str:
    if not tags:
        return (
            '{"pack_name": "' + pack_name + '", '
            '"requested_tags": [], '
            '"clusters_attempted": [], '
            '"cluster_profiles_attempted": [], '
            '"cluster_results": [], '
            '"cluster_profile_results": [], '
            '"cluster_profile_skipped": [], '
            '"notes": "No tags provided by user. Tagging skipped."}'
        )

    tags_repr = str(tags)
    tagging_prompt = (
        f"Given this profile discovery output for pack '{pack_name}':\n"
        f"{profile_discovery_output}\n\n"
        f"Given this active cluster mapping output for pack '{pack_name}':\n"
        f"{active_cluster_output}\n\n"
        f"Apply these tags: {tags_repr}\n\n"
        "Task:\n"
        "1) Extract unique cluster UIDs from active_clusters_using_matched_profiles.\n"
        "2) Extract unique cluster profile UIDs and scope values from matched_profiles.\n"
        f"3) For each cluster UID, call tag_cluster_for_review with cluster_uid=<uid> and tags={tags_repr}.\n"
        f"4) For each cluster profile UID, call tag_cluster_profile_for_review with cluster_profile_uid=<uid> and tags={tags_repr}, only if scope is not 'system'.\n"
        "5) For scope='system' profiles, skip tagging and record skip reason.\n"
        "6) Return JSON with this shape:\n"
        "{\n"
        '  "pack_name": "<pack>",\n'
        f'  "requested_tags": {tags_repr},\n'
        '  "clusters_attempted": ["<uid1>", "<uid2>"],\n'
        '  "cluster_profiles_attempted": ["<profile_uid1>", "<profile_uid2>"],\n'
        '  "cluster_results": [\n'
        "    {\n"
        '      "cluster_uid": "<uid>",\n'
        '      "tool_call_status": "<success|failed>",\n'
        '      "tool_output": "<raw tool output>"\n'
        "    }\n"
        "  ],\n"
        '  "cluster_profile_results": [\n'
        "    {\n"
        '      "cluster_profile_uid": "<uid>",\n'
        '      "scope": "<tenant|project|system|unknown>",\n'
        '      "tool_call_status": "<success|failed>",\n'
        '      "tool_output": "<raw tool output>"\n'
        "    }\n"
        "  ],\n"
        '  "cluster_profile_skipped": [\n'
        "    {\n"
        '      "cluster_profile_uid": "<uid>",\n'
        '      "scope": "system",\n'
        '      "reason": "scope system is not taggable"\n'
        "    }\n"
        "  ],\n"
        '  "notes": "<short note>"\n'
        "}\n"
        "If there are no resources to tag, return empty arrays and explain in notes."
    )
    run_config = {"configurable": {"thread_id": f"tagging:{pack_name.lower()}:{run_id}"}}
    result = await agent.ainvoke(
        {"messages": [{"role": "user", "content": tagging_prompt}]},
        config=run_config,
    )
    return extract_text_response(result)
