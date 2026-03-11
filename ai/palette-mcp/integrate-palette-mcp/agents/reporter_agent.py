# Copyright (c) Spectro Cloud
# SPDX-License-Identifier: Apache-2.0

"""Reporter agent that formats discovery output for humans."""

from __future__ import annotations

import importlib
from typing import Any

from helpers import extract_text_response

REPORTER_SYSTEM_PROMPT = (
    "You are a reporting agent. Produce clear, structured, concise reports. "
    "Do not invent data. If discovery data is uncertain, call that out clearly."
)

# async def initialize_reporter_agent(model: str) -> Any:
#     from langchain.agents import create_agent
#     from langchain_openai import ChatOpenAI

#     checkpoint_module = importlib.import_module("langgraph.checkpoint.memory")
#     InMemorySaver = checkpoint_module.InMemorySaver

#     llm = ChatOpenAI(model=model)
#     return create_agent(
#         model=llm,
#         tools=[],
#         system_prompt=REPORTER_SYSTEM_PROMPT,
#         checkpointer=InMemorySaver(),
#     )


# async def run_reporter_agent(
#     agent: Any,
#     pack_name: str,
#     profile_discovery_output: str,
#     active_cluster_output: str,
#     tagging_output: str,
#     run_id: str,
# ) -> str:
#     reporter_prompt = (
#         f"Create a report for cluster profiles using pack '{pack_name}'.\n\n"
#         "Use these outputs as the source of truth:\n\n"
#         "Profile discovery output:\n"
#         f"{profile_discovery_output}\n\n"
#         "Active cluster mapping output:\n"
#         f"{active_cluster_output}\n\n"
#         "Tagging output:\n"
#         f"{tagging_output}\n\n"
#         "Output format:\n"
#         "1) Summary (1-2 sentences)\n"
#         "2) Matching cluster profiles (bullet list with uid, name, and evidence)\n"
#         "3) Active clusters using the matched cluster profiles (bullet list with uid, name, cluster profile uid, and cluster profile name)\n"
#         "4) Tagging results for clusters and cluster profiles (what was tagged, success/failure)\n"
#         "   Include a separate list of skipped cluster profiles with reason (for example, scope=system).\n"
#         "5) Notes and caveats\n"
#         "If active cluster data appears incomplete or unchecked, explicitly say the result may be incomplete.\n"
#         "If there are no matching cluster profiles, return 'No matching cluster profiles found' in the summary and omit the rest of the output."
#     )
#     run_config = {"configurable": {"thread_id": f"reporter:{pack_name.lower()}:{run_id}"}}
#     result = await agent.ainvoke(
#         {
#             "messages": [
#                 {
#                     "role": "user",
#                     "content": reporter_prompt,
#                 }
#             ]
#         },
#         config=run_config,
#     )
#     return extract_text_response(result)
