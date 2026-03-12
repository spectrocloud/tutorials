# Copyright (c) Spectro Cloud
# SPDX-License-Identifier: Apache-2.0

"""Local LangChain tools used by the tutorial agent."""

from __future__ import annotations

import os
import json
from typing import Any
import urllib.error
import urllib.request

from langchain.tools import tool


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


def _build_labels(tags: list[str]) -> dict[str, str]:
    """Convert a list of tag strings into a Palette labels dict.

    Supported formats:
      - "key:value"  ->  {"key": "value"}
      - "single"     ->  {"single": "true"}
    """
    labels: dict[str, str] = {}
    for tag in tags:
        if ":" in tag:
            key, _, value = tag.partition(":")
            labels[key.strip()] = value.strip()
        else:
            labels[tag.strip()] = "true"
    return labels


@tool
def tag_cluster_for_review(cluster_uid: str, tags: list[str]) -> str:
    """Tag a Palette cluster with the provided labels via HTTP PATCH.

    tags: list of strings in 'key:value' or 'single' format.
    """
    if not cluster_uid.strip():
        return "STDOUT:\n\nSTDERR:\nMissing cluster UID.\nRC: 2"

    return _patch_palette_metadata(
        resource_path=f"/v1/spectroclusters/{cluster_uid}/metadata",
        missing_identifier_error="Missing cluster UID.",
        tags=tags,
    )


@tool
def tag_cluster_profile_for_review(cluster_profile_uid: str, tags: list[str]) -> str:
    """Tag a Palette cluster profile with the provided labels via HTTP PATCH.

    tags: list of strings in 'key:value' or 'single' format.
    """
    if not cluster_profile_uid.strip():
        return "STDOUT:\n\nSTDERR:\nMissing cluster profile UID.\nRC: 2"

    return _patch_palette_metadata(
        resource_path=f"/v1/clusterprofiles/{cluster_profile_uid}/metadata",
        missing_identifier_error="Missing cluster profile UID.",
        tags=tags,
    )


def _patch_palette_metadata(resource_path: str, missing_identifier_error: str, tags: list[str]) -> str:
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
            "labels": _build_labels(tags),
        }
    }
    url = f"{host.rstrip('/')}{resource_path}"
    request = urllib.request.Request(
        url=url,
        data=json.dumps(payload).encode("utf-8"),
        headers={
            "ProjectUid": project_uid,
            "Content-Type": "application/json",
            "apiKey": api_key,
        },
        method="PATCH",
    )

    try:
        with urllib.request.urlopen(request, timeout=30) as response:
            http_status = response.getcode()
            body_output = response.read().decode("utf-8", errors="replace").rstrip()
            stderr_output = ""
            rc = 0
    except TimeoutError:
        return "STDOUT:\n\nSTDERR:\nTagging request timed out after 30s.\nRC: 124"
    except urllib.error.HTTPError as exc:
        http_status = exc.code
        body_output = exc.read().decode("utf-8", errors="replace").rstrip()
        stderr_output = str(exc)
        rc = 0
    except urllib.error.URLError as exc:
        return f"STDOUT:\n\nSTDERR:\nFailed to execute HTTP request: {exc.reason}\nRC: 127"
    except OSError as exc:
        return f"STDOUT:\n\nSTDERR:\nFailed to execute HTTP request: {exc}\nRC: 127"

    is_success = str(http_status).startswith("2")

    return (
        f"STDOUT:\n{body_output}\n\n"
        f"STDERR:\n{stderr_output}\n"
        f"SUCCESS: {str(is_success).lower()}\n"
        f"RC: {rc}"
    )
