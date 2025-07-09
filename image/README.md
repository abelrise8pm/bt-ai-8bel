
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

## Build Instructions

1. Remove existing base container builds from this directory.
```shell
./clean.sh
```

2. Build the base container using Podman
```shell
podman build -t localhost/xpai-base:latest .
```

3. Use the base container in your project's `devcontainer.json`
```json
"image": "localhost/xpai-base:latest"
```

4. Run the container
```shell
podman run -it localhost/xpai-base:latest
```

5. Find running containers
```shell
podman ps
```

6. Open a bash terminal in the running container
```shell
podman exec -it <container_id> /bin/bash
```
Or to run a new container with bash:
```shell
podman run -it localhost/xpai-base:latest /bin/bash
```

## Security Scanning with Trivy

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
