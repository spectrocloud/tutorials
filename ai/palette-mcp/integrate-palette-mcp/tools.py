# Copyright (c) Spectro Cloud
# SPDX-License-Identifier: Apache-2.0

"""Local LangChain tools used by the tutorial agent."""

from __future__ import annotations

import os
import json
import re
import shlex
import subprocess
from typing import Any

from langchain.tools import tool


@tool
def kubectl(command: str) -> str:
    """Run kubectl locally and return stdout, stderr, and return code."""
    if not command.strip():
        return "STDOUT:\n\nSTDERR:\nMissing kubectl command.\nRC: 2"

    try:
        args = shlex.split(command)
    except ValueError as exc:
        return f"STDOUT:\n\nSTDERR:\nInvalid command syntax: {exc}\nRC: 2"

    try:
        result = subprocess.run(
            ["kubectl", *args],
            capture_output=True,
            text=True,
            timeout=30,
            check=False,
        )
    except subprocess.TimeoutExpired:
        return "STDOUT:\n\nSTDERR:\nkubectl command timed out after 30s.\nRC: 124"
    except OSError as exc:
        return f"STDOUT:\n\nSTDERR:\nFailed to execute kubectl: {exc}\nRC: 127"

    return (
        f"STDOUT:\n{result.stdout.rstrip()}\n\n"
        f"STDERR:\n{result.stderr.rstrip()}\n"
        f"RC: {result.returncode}"
    )


def _read_env_file(path: str) -> dict[str, str]:
    values: dict[str, str] = {}
    if not os.path.isfile(path):
        return values

    with open(path, encoding="utf-8") as env_file:
        for raw_line in env_file:
            line = raw_line.strip()
            if not line or line.startswith("#"):
                continue
            if line.startswith("export "):
                line = line[len("export ") :].strip()
            if "=" not in line:
                continue
            key, value = line.split("=", 1)
            key = key.strip()
            value = value.strip().strip('"').strip("'")
            if key:
                values[key] = value

    return values


def _resolve_palette_env_file_path() -> str:
    return os.path.expanduser("~/.palette/.env-mcp")


def _normalize_key(key: str) -> str:
    normalized = key.strip().upper()
    return "".join(ch for ch in normalized if ch.isalnum())


def _first_non_empty(source: dict[str, str], keys: list[str]) -> str:
    normalized_source = {_normalize_key(k): v for k, v in source.items()}
    for key in keys:
        value = normalized_source.get(_normalize_key(key), "")
        if value.strip():
            return value.strip()
    return ""


def _resolve_palette_credentials() -> tuple[str, str, str]:
    project_uid_keys = [
        "SPECTROCLOUD_DEFAULT_PROJECT_ID",
    ]
    api_key_keys = [
        "SPECTROCLOUD_APIKEY",
    ]
    host_keys = [
        "SPECTROCLOUD_HOST",
    ]

    project_uid = _first_non_empty(os.environ, project_uid_keys)
    api_key = _first_non_empty(os.environ, api_key_keys)
    host = _first_non_empty(os.environ, host_keys)
    if not host:
        host = "https://api.spectrocloud.com"
    if project_uid and api_key:
        if not host.startswith(("http://", "https://")):
            host = f"https://{host}"
        return project_uid, api_key, host

    env_file_path = _resolve_palette_env_file_path()
    env_values = _read_env_file(env_file_path)
    if not project_uid:
        project_uid = _first_non_empty(env_values, project_uid_keys)
    if not api_key:
        api_key = _first_non_empty(env_values, api_key_keys)
    if host == "https://api.spectrocloud.com":
        parsed_host = _first_non_empty(env_values, host_keys)
        if parsed_host:
            host = parsed_host

    if not host.startswith(("http://", "https://")):
        host = f"https://{host}"

    return project_uid, api_key, host


@tool
def tag_cluster_for_review(cluster_uid: str) -> str:
    """Tag a Palette cluster with nginx/review labels via curl."""
    if not cluster_uid.strip():
        return "STDOUT:\n\nSTDERR:\nMissing cluster UID.\nRC: 2"

    return _patch_palette_metadata(
        resource_path=f"/v1/spectroclusters/{cluster_uid}/metadata",
        missing_identifier_error="Missing cluster UID.",
    )


@tool
def tag_cluster_profile_for_review(cluster_profile_uid: str) -> str:
    """Tag a Palette cluster profile with nginx/review labels via curl."""
    if not cluster_profile_uid.strip():
        return "STDOUT:\n\nSTDERR:\nMissing cluster profile UID.\nRC: 2"

    return _patch_palette_metadata(
        resource_path=f"/v1/clusterprofiles/{cluster_profile_uid}/metadata",
        missing_identifier_error="Missing cluster profile UID.",
    )


def _patch_palette_metadata(resource_path: str, missing_identifier_error: str) -> str:
    if not resource_path.strip():
        return f"STDOUT:\n\nSTDERR:\n{missing_identifier_error}\nRC: 2"

    env_file_path = _resolve_palette_env_file_path()
    project_uid, api_key, host = _resolve_palette_credentials()
    if not project_uid:
        return (
            "STDOUT:\n\nSTDERR:\n"
            "Missing project UID. Checked env and "
            f"{env_file_path} for project UID keys.\nRC: 2"
        )
    if not api_key:
        return (
            "STDOUT:\n\nSTDERR:\n"
            "Missing API key. Checked env and "
            f"{env_file_path} for API key keys.\nRC: 2"
        )

    payload: dict[str, Any] = {
        "metadata": {
            "labels": {
                "nginx": "present",
                "review": "required",
            }
        }
    }
    url = f"{host.rstrip('/')}{resource_path}"
    command = [
        "curl",
        "--location",
        "--silent",
        "--show-error",
        "--request",
        "PATCH",
        url,
        "--header",
        f"ProjectUid: {project_uid}",
        "--header",
        "Content-Type: application/json",
        "--header",
        f"apiKey: {api_key}",
        "--data",
        json.dumps(payload),
        "--write-out",
        "\nHTTP_STATUS:%{http_code}",
    ]

    try:
        result = subprocess.run(
            command,
            capture_output=True,
            text=True,
            timeout=30,
            check=False,
        )
    except subprocess.TimeoutExpired:
        return "STDOUT:\n\nSTDERR:\nTagging request timed out after 30s.\nRC: 124"
    except OSError as exc:
        return f"STDOUT:\n\nSTDERR:\nFailed to execute curl: {exc}\nRC: 127"

    stdout_text = result.stdout.rstrip()
    status_match = re.search(r"HTTP_STATUS:(\d{3})\s*$", stdout_text)
    http_status = status_match.group(1) if status_match else "unknown"
    body_output = re.sub(r"\n?HTTP_STATUS:\d{3}\s*$", "", stdout_text).rstrip()
    is_success = http_status.startswith("2")

    return (
        f"STDOUT:\n{body_output}\n\n"
        f"STDERR:\n{result.stderr.rstrip()}\n"
        f"SUCCESS: {str(is_success).lower()}\n"
        f"RC: {result.returncode}"
    )
