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


# async def invoke_reporter_agent(
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
#         "Produce output that matches this exact template. "
#         "Do not add, remove, or rename any section. "
#         "Do not add extra blank lines between bullet sub-fields. "
#         "Replace every <placeholder> with the real value from the source data.\n\n"
#         "---\n"
#         "1) Summary\n\n"
#         "Pack `<pack_name>` was found in <N> of <total> scanned cluster profiles. "
#         "Among <M> active cluster(s) scanned, <K> active cluster(s) were confirmed to be using one of the matched profiles; "
#         "tagging <succeeded/failed/was skipped> for <summary of tagging outcome>.\n\n"
#         "2) Matching cluster profiles\n\n"
#         "- UID: `<uid>`\n"
#         "  - Name: `<name>`\n"
#         "  - Evidence: <one sentence>\n\n"
#         "(repeat for each matched profile)\n\n"
#         "3) Active clusters using the matched cluster profiles\n\n"
#         "- UID: `<uid>`\n"
#         "  - Name: `<name>`\n"
#         "  - Cluster profile UID: `<profile_uid>`\n"
#         "  - Cluster profile name: `<profile_name>`\n\n"
#         "(repeat for each active cluster)\n\n"
#         "4) Tagging results for clusters and cluster profiles\n\n"
#         "Requested tags:\n"
#         "- `<tag>`\n\n"
#         "(repeat for each tag)\n\n"
#         "Clusters tagged:\n"
#         "- Cluster UID: `<uid>`\n"
#         "  - Result: <Success|Failed|Skipped>\n\n"
#         "(repeat for each cluster)\n\n"
#         "Cluster profiles tagged:\n"
#         "- Cluster profile UID: `<uid>`\n"
#         "  - Name: `<name>`\n"
#         "  - Scope: `<scope>`\n"
#         "  - Result: <Success|Failed|Skipped>\n\n"
#         "(repeat for each tagged profile)\n\n"
#         "Skipped cluster profiles:\n"
#         "- Cluster profile UID: `<uid>`\n"
#         "  - Name: `<name>`\n"
#         "  - Scope: `<scope>`\n"
#         "  - Reason: `<reason>`\n\n"
#         "(repeat for each skipped profile)\n\n"
#         "5) Notes and caveats\n\n"
#         "- <note>\n\n"
#         "(repeat for each note)\n"
#         "---\n\n"
#         "Rules:\n"
#         "- If there are no matching cluster profiles, write 'No matching cluster profiles found.' in the summary and omit sections 2-4.\n"
#         "- If active cluster data appears incomplete, add a note in section 5 stating the result may be incomplete.\n"
#         "- Do not invent data. Only use values present in the source outputs.\n"
#         "- Remove any '(repeat ...)' lines from the final output.\n"
#         "- Remove the '---' delimiters from the final output.\n"
#     )
#     run_config = {
#         "configurable": {"thread_id": f"reporter:{pack_name.lower()}:{run_id}"}
#     }
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
