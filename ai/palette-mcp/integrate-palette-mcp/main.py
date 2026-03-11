# Copyright (c) Spectro Cloud
# SPDX-License-Identifier: Apache-2.0

"""One-shot workflow runner for Palette finder + reporter agents."""

from __future__ import annotations

import argparse
import asyncio
import os
import sys
import uuid

from helpers import (
    ensure_local_prerequisites,
    get_debug_level,
    is_debug_enabled,
    run_with_thinking_indicator,
)
from agents.active_cluster_agent import (
    initialize_active_cluster_agent,
    run_active_cluster_agent,
)
from agents.palette_profile_agent import (
    initialize_profile_finder_agent,
    run_profile_finder_agent,
)
from agents.reporter_agent import initialize_reporter_agent, run_reporter_agent
from agents.tagging_agent import initialize_tagging_agent, run_tagging_agent

DEFAULT_MODEL = "gpt-5-nano-2025-08-07"
DEFAULT_MCP_IMAGE = "public.ecr.aws/palette-ai/palette-mcp-server:latest"
DEFAULT_ENV_FILE = os.path.expanduser("~/.palette/.env-mcp")
DEFAULT_KUBECONFIG_DIR = os.path.expanduser("~/projects/spectro-cloud/mcp-kubeconfig")
DEFAULT_PACK_NAME = "nginx"


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="One-shot workflow: Palette profile finder agent + reporter agent."
    )
    parser.add_argument(
        "--pack",
        default=os.getenv("PACK_NAME", DEFAULT_PACK_NAME),
        help=f"Target pack name to search in cluster profiles (default: {DEFAULT_PACK_NAME}).",
    )
    parser.add_argument(
        "--model",
        default=os.getenv("OPENAI_MODEL", DEFAULT_MODEL),
        help=f"Model for the profile finder agent (default: {DEFAULT_MODEL}).",
    )
    parser.add_argument(
        "--active-cluster-model",
        default=os.getenv("OPENAI_ACTIVE_CLUSTER_MODEL", os.getenv("OPENAI_MODEL", DEFAULT_MODEL)),
        help="Model for the active cluster finder agent (default: OPENAI_ACTIVE_CLUSTER_MODEL or OPENAI_MODEL).",
    )
    parser.add_argument(
        "--reporter-model",
        default=os.getenv("OPENAI_REPORTER_MODEL", os.getenv("OPENAI_MODEL", DEFAULT_MODEL)),
        help="Model for the reporter agent (default: OPENAI_REPORTER_MODEL or OPENAI_MODEL).",
    )
    parser.add_argument(
        "--tagging-model",
        default=os.getenv("OPENAI_TAGGING_MODEL", os.getenv("OPENAI_MODEL", DEFAULT_MODEL)),
        help="Model for the tagging agent (default: OPENAI_TAGGING_MODEL or OPENAI_MODEL).",
    )
    return parser.parse_args()


async def main_async() -> None:
    args = parse_args()
    run_id = uuid.uuid4().hex[:8]
    debug_level = get_debug_level()
    ensure_local_prerequisites()

    if is_debug_enabled(debug_level, "info"):
        print(f"Debug level: {debug_level}")
        print(f"Run ID: {run_id}")
        print("Initializing profile finder agent...")

    profile_finder_agent = await initialize_profile_finder_agent(
        model=args.model,
        debug_level=debug_level,
        default_env_file=DEFAULT_ENV_FILE,
        default_kubeconfig_dir=DEFAULT_KUBECONFIG_DIR,
        default_mcp_image=DEFAULT_MCP_IMAGE,
    )
    active_cluster_agent = await initialize_active_cluster_agent(
        model=args.active_cluster_model,
        debug_level=debug_level,
        default_env_file=DEFAULT_ENV_FILE,
        default_kubeconfig_dir=DEFAULT_KUBECONFIG_DIR,
        default_mcp_image=DEFAULT_MCP_IMAGE,
    )
    tagging_agent = await initialize_tagging_agent(model=args.tagging_model)
    reporter_agent = await initialize_reporter_agent(model=args.reporter_model)

    if is_debug_enabled(debug_level, "info"):
        print(f"Running profile discovery for pack: {args.pack}")

    profile_discovery_output = await run_with_thinking_indicator(
        run_profile_finder_agent(profile_finder_agent, args.pack, debug_level, run_id)
    )

    if is_debug_enabled(debug_level, "info"):
        print("Finding active clusters using matched profiles...")

    active_cluster_output = await run_with_thinking_indicator(
        run_active_cluster_agent(
            active_cluster_agent,
            args.pack,
            profile_discovery_output,
            debug_level,
            run_id,
        )
    )

    if is_debug_enabled(debug_level, "info"):
        print("Tagging active clusters...")

    tagging_output = await run_with_thinking_indicator(
        run_tagging_agent(
            tagging_agent,
            args.pack,
            profile_discovery_output,
            active_cluster_output,
            run_id,
        )
    )

    if is_debug_enabled(debug_level, "info"):
        print("Formatting report...")

    final_report = await run_with_thinking_indicator(
        run_reporter_agent(
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
