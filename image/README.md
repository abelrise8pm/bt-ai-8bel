
# XPai Base Container

## Overview
This base container is designed to be shared across multiple XPai projects. It includes pre-configured AI assistant tools (claude-code, goose, gemini-cli) and Node.js runtime, providing a consistent development environment while maintaining security standards for CUI and Federal customers.

For security rationale and compliance details, see our [security stance document](https://docs.google.com/document/d/1LJNSA-MnrNvUikE__-_G9JgEF6GE66cjUUPOWMoag0o/edit?tab=t.0#heading=h.3uxz91ih8lr2).

## Automated Build Pipeline
The base container is automatically built and published to GitHub Container Registry via the workflow in `.github/workflows/build-devcontainer.yml`. This pipeline triggers on:
- Push to main branch (when base container files change)
- Pull requests targeting main branch
- Manual workflow dispatch

Published images are available at `ghcr.io/[org]/xpai/ai-assistant-home`.

## Prerequisites
- Podman (latest version recommended)
- DevContainer CLI (`npm install -g @devcontainers/cli`)

## Build Instructions

1. Remove existing base container builds from this directory.
```shell
./clean.sh
```

2. Build the base container
```shell
devcontainer build --workspace-folder . --image-name localhost/xpai-base:latest
```

3. Use the base container in the root `devcontainer.json`
```
"image": "localhost/xpai-base:latest",
```

4. Run the project devcontainer with the base container
```shell
devcontainer up --workspace-folder .
```
or run in VSCode.
