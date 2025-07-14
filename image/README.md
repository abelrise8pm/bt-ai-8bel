
# XPai Base Container

## Overview
This base container is designed to be shared across multiple projects. It includes pre-configured AI assistant tools (claude-code, goose, gemini-cli) and Node.js runtime, providing a consistent development environment while maintaining security standards for CUI and Federal customers.

For security rationale and compliance details, see our [security stance document](https://docs.google.com/document/d/1LJNSA-MnrNvUikE__-_G9JgEF6GE66cjUUPOWMoag0o/edit?tab=t.0#heading=h.3uxz91ih8lr2).

## Automated Build Pipeline
The base container is automatically built and published to GitHub Container Registry via the workflow in `.github/workflows/build-devcontainer.yml`. This pipeline triggers on:
- Push to main branch (when base container files change)
- Pull requests targeting main branch
- Manual workflow dispatch

Published images are available at `ghcr.io/rise8-us/xpai/ai-assistant-home`.
When consuming these images, make sure the pin to the SHA of the specific image
you want to use. This allows you to prevent changes in the container without
your knowledge because tags can move to newer versions of a container.

## Prerequisites
- Podman (latest version recommended)

## Local Build Instructions

1. Remove existing base container builds from this directory.
```shell
./clean.sh
```

2. Build the base container using Podman
```shell
podman build -t localhost/xpai-base:latest .
```

3. Run the container
```shell
podman run --env-file ../.env -it localhost/xpai-base:latest /bin/bash
```

## Updating Package Versions

The Dockerfile uses pinned version numbers for npm packages to ensure reproducible builds. npm version numbers are immutable - once published, they cannot be changed or moved.

To update package versions:

1. Check for new versions:
```shell
npm view @anthropic-ai/claude-code versions --json
npm view @google/gemini-cli versions --json
```

2. Update the Dockerfile with new version numbers:
```dockerfile
RUN npm install -g \
    @anthropic-ai/claude-code@NEW_VERSION \
    @google/gemini-cli@NEW_VERSION && \
    npm cache clean --force
```

3. Test the build locally with `./test.sh` before committing changes.

## Security Scanning with Trivy

This is useful when fixing security issues.
See `.github/workflows/build-devcontainer.yml` for the
latest Trivy settings.

To scan the container for vulnerabilities using Trivy:

### Install Trivy
```shell
# macOS with Homebrew
brew install trivy
```

### Scan Container Image
```shell
# Basic vulnerability scan (CRITICAL and HIGH severity)
trivy image --cache-backend memory --severity CRITICAL,HIGH --format table localhost/xpai-base:latest

# Full vulnerability scan
trivy image --cache-backend memory --format table localhost/xpai-base:latest

# Clear Trivy cache if needed
trivy clean --all
```
