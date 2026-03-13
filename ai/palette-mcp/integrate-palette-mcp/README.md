# Integrate Palette MCP

This folder contains the demo code for the Integrate Palette MCP in an Agentic Workflow tutorial. The user will learn how to integrate Palette MCP into a LangChain agent workflow.

The workflow is as follows: it identifies if a specific pack is present in your environment's cluster profiles and deployed clusters. If the pack is present, the workflow will ask you what tags you want to apply to the cluster profiles containing the pack and any active clusters using cluster
profiles containing the pack. This will allow to more readily identify the cluster profiles and active clusters that are
using the pack.

## Get Started

Follow the instructions in the tutorial to get started.

## Environment Variables

| Variable                      | Description                                                                                                            | Example                                               |
| ----------------------------- | ---------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------- |
| `OPENAI_API_KEY`              | OpenAI API key. Required.                                                                                              | `sk-...`                                              |
| `OPENAI_MODEL`                | Default model used for all agents. Overridden per-agent by the model-specific variables below.                         | `gpt-4o`                                              |
| `OPENAI_ACTIVE_CLUSTER_MODEL` | Model for the active cluster finder agent. Falls back to `OPENAI_MODEL`.                                               | `gpt-4o-mini`                                         |
| `OPENAI_REPORTER_MODEL`       | Model for the reporter agent. Falls back to `OPENAI_MODEL`.                                                            | `gpt-4o-mini`                                         |
| `OPENAI_TAGGING_MODEL`        | Model for the tagging agent. Falls back to `OPENAI_MODEL`.                                                             | `gpt-4o-mini`                                         |
| `PACK_NAME`                   | Target pack name to search for in cluster profiles. Can also be set via `--pack`.                                      | `nginx`                                               |
| `DEBUG`                       | Log level. Accepted values: `warn`, `info`, `debug`, `verbose`. Defaults to `info`. Can also be set via `--log-level`. | `debug`                                               |
| `PALETTE_MCP_ENV_FILE`        | Path to the env file passed to the Palette MCP container. Defaults to `~/.palette/.env-mcp`.                           | `/home/user/.palette/.env-mcp`                        |
| `PALETTE_MCP_KUBECONFIG_DIR`  | Path to a local directory to bind-mount into the container as `/tmp/kubeconfig`. Omitted if not set.                   | `/home/user/.kube`                                    |
| `PALETTE_MCP_IMAGE`           | Palette MCP container image to use. Defaults to `public.ecr.aws/palette-ai/palette-mcp-server:latest`.                 | `public.ecr.aws/palette-ai/palette-mcp-server:v1.2.0` |
