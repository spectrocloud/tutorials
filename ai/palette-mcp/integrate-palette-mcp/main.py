# Copyright (c) Spectro Cloud
# SPDX-License-Identifier: Apache-2.0

"""Workflow runner for Palette pack finder + active cluster finder + reporter + tagging agents."""

from __future__ import annotations

import argparse
import asyncio
import importlib
import os
import sys
import uuid

from helpers import (
    build_palette_server_config,
    ensure_local_prerequisites,
    get_debug_level,
    is_debug_enabled,
    prompt_for_tags,
    run_with_thinking_indicator,
    suppress_console_output,
)
from agents.active_cluster_agent import (
    initialize_active_cluster_agent,
    invoke_active_cluster_agent,
)
from agents.palette_profile_agent import (
    initialize_profile_finder_agent,
    invoke_profile_finder_agent,
)
from agents.reporter_agent import initialize_reporter_agent, invoke_reporter_agent
from agents.tagging_agent import initialize_tagging_agent, invoke_tagging_agent

DEFAULT_MODEL = "gpt-5-nano-2025-08-07"
DEFAULT_MCP_IMAGE = "public.ecr.aws/palette-ai/palette-mcp-server:latest"
DEFAULT_ENV_FILE = os.path.expanduser("~/.palette/.env-mcp")
DEFAULT_KUBECONFIG_DIR = os.path.expanduser("~/projects/spectro-cloud/mcp-kubeconfig")
DEFAULT_PACK_NAME = ""


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="One-shot workflow: Palette profile finder agent + reporter agent."
    )
    parser.add_argument(
        "--pack",
        default=os.getenv("PACK_NAME", DEFAULT_PACK_NAME),
        help=f"Target pack name to search in cluster profiles (default: {DEFAULT_PACK_NAME}).",
    )
    base_model = os.getenv("OPENAI_MODEL", DEFAULT_MODEL)
    parser.add_argument(
        "--model",
        default=base_model,
        help=f"Model used for all agents unless overridden (default: {DEFAULT_MODEL}).",
    )
    args, _ = parser.parse_known_args()
    resolved_model = args.model

    parser.add_argument(
        "--active-cluster-model",
        default=os.getenv("OPENAI_ACTIVE_CLUSTER_MODEL", resolved_model),
        help="Model for the active cluster finder agent (default: --model).",
    )
    parser.add_argument(
        "--reporter-model",
        default=os.getenv("OPENAI_REPORTER_MODEL", resolved_model),
        help="Model for the reporter agent (default: --model).",
    )
    parser.add_argument(
        "--tagging-model",
        default=os.getenv("OPENAI_TAGGING_MODEL", resolved_model),
        help="Model for the tagging agent (default: --model).",
    )
    return parser.parse_args()


async def main_async() -> None:
    args = parse_args()
    run_id = uuid.uuid4().hex[:8]
    debug_level = get_debug_level()
    ensure_local_prerequisites()

    if not args.pack:
        print(
            "Error: no pack name provided. Use --pack <name> or set the PACK_NAME environment variable.",
            file=sys.stderr,
        )
        sys.exit(1)

    if is_debug_enabled(debug_level, "info"):
        print(f"Debug level: {debug_level}")
        print(f"Run ID: {run_id}")
        print("Options:")
        print(f"  --pack:                 {args.pack!r}")
        print(f"  --model:                {args.model}")
        print("Initializing MCP client...")

    try:
        mcp_client_module = importlib.import_module("langchain_mcp_adapters.client")
        MultiServerMCPClient = mcp_client_module.MultiServerMCPClient
    except (ImportError, AttributeError):
        mcp_module = importlib.import_module("langchain_mcp_adapters")
        MultiServerMCPClient = mcp_module.MultiServerMCPClient

    mcp_client = MultiServerMCPClient(
        build_palette_server_config(
            default_env_file=DEFAULT_ENV_FILE,
            default_kubeconfig_dir=DEFAULT_KUBECONFIG_DIR,
            default_mcp_image=DEFAULT_MCP_IMAGE,
        )
    )
    hide_mcp_output = debug_level != "verbose"
    with suppress_console_output(hide_mcp_output):
        mcp_tools = await mcp_client.get_tools()

    if is_debug_enabled(debug_level, "info"):
        print("Initializing profile finder agent...")

    profile_finder_agent = await initialize_profile_finder_agent(
        model=args.model,
        mcp_tools=mcp_tools,
    )
    active_cluster_agent = await initialize_active_cluster_agent(
        model=args.active_cluster_model,
        mcp_tools=mcp_tools,
    )
    tagging_agent = await initialize_tagging_agent(model=args.tagging_model)
    reporter_agent = await initialize_reporter_agent(model=args.reporter_model)

    if is_debug_enabled(debug_level, "info"):
        print(f"Running profile discovery for pack: {args.pack}")

    profile_discovery_output = await run_with_thinking_indicator(
        invoke_profile_finder_agent(
            profile_finder_agent, args.pack, debug_level, run_id
        )
    )

    if is_debug_enabled(debug_level, "info"):
        print("Finding active clusters using matched profiles...")

    active_cluster_output = await run_with_thinking_indicator(
        invoke_active_cluster_agent(
            active_cluster_agent,
            args.pack,
            profile_discovery_output,
            debug_level,
            run_id,
        )
    )

    user_tags = prompt_for_tags(profile_discovery_output, active_cluster_output)

    if user_tags is None:
        if is_debug_enabled(debug_level, "info"):
            print("No matches found. Skipping tagging.")
        tagging_output = '{"skipped": true, "reason": "no matched profiles or active clusters found"}'
    else:
        if is_debug_enabled(debug_level, "info"):
            if user_tags:
                print(f"Tagging with: {user_tags}")
            else:
                print("No tags entered. Skipping tagging.")
        tagging_output = await run_with_thinking_indicator(
            invoke_tagging_agent(
                tagging_agent,
                args.pack,
                profile_discovery_output,
                active_cluster_output,
                user_tags,
                run_id,
            )
        )

    if is_debug_enabled(debug_level, "info"):
        print("Formatting report...")

    final_report = await run_with_thinking_indicator(
        invoke_reporter_agent(
            reporter_agent,
            args.pack,
            profile_discovery_output,
            active_cluster_output,
            tagging_output,
            run_id,
        )
    )
    print(final_report)


if __name__ == "__main__":
    try:
        asyncio.run(main_async())
    except KeyboardInterrupt:
        print("\nExiting.")
    except Exception as exc:  # Keep tutorial errors readable.
        print(f"Error: {exc}", file=sys.stderr)
