#!/bin/bash


IMAGE=${1:-"ghcr.io/rise8-us/xpai/dev-container:latest"}

# Shift the first argument (image) out of the argument list
shift

# Get the workspace folder (parent of .devcontainer)
WORKSPACE_FOLDER="$(cd "$(dirname "$0")/.." && pwd)"

# Run podman with devcontainer.json configuration
exec podman run -it --rm \
    --user aiAssistant \
    --env "GEMINI_API_KEY=${GEMINI_API_KEY}" \
    --env "LLM_GEMINI_KEY=${LLM_GEMINI_KEY}" \
    --env "ANTHROPIC_API_KEY=${ANTHROPIC_API_KEY}" \
    --env "GH_TOKEN=${GH_TOKEN}" \
    --workdir "/workspaces/XPai" \
    --mount "type=bind,source=${WORKSPACE_FOLDER},target=/workspaces/XPai" \
    "$IMAGE" \
    "${@:-bash}"