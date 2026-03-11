# Copyright (c) Spectro Cloud
# SPDX-License-Identifier: Apache-2.0

"""Helper functions for the Palette MCP tutorial agent."""

from __future__ import annotations

import asyncio
import contextlib
import os
import shutil
import sys
from collections.abc import Awaitable
from typing import Any, TextIO

VALID_DEBUG_LEVELS = {"warn", "info", "verbose"}


def resolve_container_runtime() -> str:
    """Return the preferred local container runtime command."""
    if shutil.which("docker") is not None:
        return "docker"
    if shutil.which("podman") is not None:
        return "podman"
    raise RuntimeError("Docker or Podman is not available in PATH.")


def get_debug_level() -> str:
    debug_value = os.getenv("DEBUG") or os.getenv("debug") or "warn"
    debug_level = debug_value.strip().lower()
    if debug_level not in VALID_DEBUG_LEVELS:
        print(f"Warning: invalid DEBUG='{debug_value}'. Falling back to 'warn'.")
        return "warn"
    return debug_level


def is_debug_enabled(current_level: str, min_level: str) -> bool:
    levels = {"warn": 1, "info": 2, "verbose": 3}
    return levels[current_level] >= levels[min_level]


@contextlib.contextmanager
def suppress_console_output(enabled: bool) -> Any:
    """Temporarily suppress process stdout/stderr."""
    if not enabled:
        yield
        return

    devnull = open(os.devnull, "w", encoding="utf-8")
    old_stdout_fd = os.dup(1)
    old_stderr_fd = os.dup(2)
    try:
        os.dup2(devnull.fileno(), 1)
        os.dup2(devnull.fileno(), 2)
        yield
    finally:
        os.dup2(old_stdout_fd, 1)
        os.dup2(old_stderr_fd, 2)
        os.close(old_stdout_fd)
        os.close(old_stderr_fd)
        devnull.close()


def ensure_local_prerequisites() -> None:
    resolve_container_runtime()
    if not os.getenv("OPENAI_API_KEY"):
        raise RuntimeError("OPENAI_API_KEY is not set.")


def build_palette_server_config(
    default_env_file: str,
    default_kubeconfig_dir: str,
    default_mcp_image: str,
) -> dict[str, dict[str, Any]]:
    container_runtime = resolve_container_runtime()
    env_file = os.getenv("PALETTE_MCP_ENV_FILE", default_env_file)
    kubeconfig_dir = os.getenv("PALETTE_MCP_KUBECONFIG_DIR", default_kubeconfig_dir)
    mcp_image = os.getenv("PALETTE_MCP_IMAGE", default_mcp_image)

    return {
        "palette": {
            "transport": "stdio",
            "command": container_runtime,
            "args": [
                "run",
                "--rm",
                "-i",
                "--mount",
                f"type=bind,source={kubeconfig_dir},target=/tmp/kubeconfig",
                "--env-file",
                env_file,
                mcp_image,
            ],
        }
    }


def extract_text_response(result: dict[str, Any]) -> str:
    """Best-effort extraction of final agent text from LangChain result payload."""
    messages = result.get("messages")
    if isinstance(messages, list):
        for message in reversed(messages):
            content = getattr(message, "content", None)
            if isinstance(content, str) and content.strip():
                return content
            if isinstance(content, list):
                text_parts = [
                    part.get("text", "")
                    for part in content
                    if isinstance(part, dict) and part.get("type") == "text"
                ]
                joined = "\n".join(part for part in text_parts if part.strip()).strip()
                if joined:
                    return joined

    return str(result)


def _get_status_stream() -> tuple[TextIO, bool]:
    """Use terminal directly so status remains visible when stdout is suppressed."""
    try:
        return open("/dev/tty", "w", encoding="utf-8"), True
    except OSError:
        return sys.stdout, False


async def _thinking_indicator(stream: TextIO, interval_seconds: int = 2) -> None:
    """Show a simple progress line while the agent is working."""
    frames = ["Thinking ...", "Thinking ....", "Thinking ....."]
    index = 0
    while True:
        message = frames[index % len(frames)]
        stream.write(f"\r{message}")
        stream.flush()
        index += 1
        await asyncio.sleep(interval_seconds)


async def run_with_thinking_indicator(work: Awaitable[str]) -> str:
    stream, should_close = _get_status_stream()
    indicator_task = asyncio.create_task(_thinking_indicator(stream))
    try:
        return await work
    finally:
        indicator_task.cancel()
        with contextlib.suppress(asyncio.CancelledError):
            await indicator_task
        stream.write("\r" + (" " * 40) + "\r")
        stream.flush()
        if should_close:
            stream.close()
