# Contributing to AI Assistant Container

## Automated Build Pipeline
The base container is automatically built and published to GitHub Container Registry via the workflow in `.github/workflows/build-devcontainer.yml`. This pipeline triggers on:
- Push to main branch (when base container files change)
- Pull requests targeting main branch
- Manual workflow dispatch

Published images are available at `ghcr.io/rise8-us/xpai/ai-assistant-home`.
When consuming these images, make sure the pin to the SHA of the specific image
you want to use. This allows you to prevent changes in the container without
your knowledge because tags can move to newer versions of a container.

## Local Build Instructions

1. Remove existing base container builds from this directory.
```shell
./scripts/clean.sh
```

2. Build the base container using Podman
```shell
podman build -t localhost/ai-assistant-home:latest .
```

3. Run the container
```shell
podman run --env-file .env -it localhost/ai-assistant-home:latest /bin/bash
```

## Updating Tool Versions

Tool versions are automatically updated weekly by the GitHub Action in `.github/workflows/ai-assistant-container-software-version-update.yml`. The workflow uses Claude Code's `release-engineer-beta:update-versions` skill to check for updates and create PRs.

To trigger an update manually, run the workflow from the Actions tab in GitHub.

## Testing

The container includes a test script (`scripts/test.sh`) that validates container functionality. The script uses smart detection to automatically handle different image sources and supports both Docker and Podman runtimes.

### Smart Image Detection

The test script automatically determines how to obtain the image:

1. **Existing Local Image**: If the image exists locally, it uses it directly (no rebuild)
2. **Remote Registry Image**: If the image tag contains a registry domain (e.g., `ghcr.io/...`), it pulls from the registry
3. **Local Build**: For simple tags, it builds the container locally from the current directory

### Environment Variables

#### Test Script Configuration
- `CONTAINER_RUNTIME`: Specify the container runtime to use (`docker` or `podman`). If not set, the script will auto-detect the available runtime, preferring Podman if available.
- `IMAGE_TAG`: Specify the image tag to use for testing (defaults to `test-migration`).

#### Required API Keys for Functional Testing
The test script requires the following API keys to test AI assistant functionality:

- `ANTHROPIC_API_KEY`: Required for testing Claude Code functionality

**For Local Development**: The test script will automatically attempt to load these from `../.env` if not found in the environment.

**For CI/CD**: These must be set as GitHub repository secrets and will be passed as environment variables to the test container.

### Running Tests Locally

```shell
# Run with default settings (auto-detect runtime, build locally with test-migration tag)
./scripts/test.sh

# If you are iterating with an AI assistant, copying to the paste buffer makes iteration faster:
./scripts/test.sh | pbcopy

# Run with specific runtime
CONTAINER_RUNTIME=docker ./scripts/test.sh

# Test a locally built image
IMAGE_TAG=my-custom-tag ./scripts/test.sh

# Test a remote registry image (automatically pulls if not found locally)
IMAGE_TAG=ghcr.io/rise8-us/xpai/ai-assistant-home:staging-abc123 ./scripts/test.sh

# Run with both custom runtime and tag
CONTAINER_RUNTIME=docker IMAGE_TAG=my-custom-tag ./scripts/test.sh
```

### CI/CD Integration

The testing step is automatically integrated into the CI/CD pipeline with a staging + promotion approach:

```
Build Staging → Test → Scan → Promote to Production
```

1. **Build Staging**: Multi-architecture image built and pushed with `staging-{sha}` tag
2. **Test**: Uses the staging image from registry (no rebuild), testing AMD64 variant on GitHub runners
3. **Scan**: Trivy scans the staging image for vulnerabilities
4. **Promote**: Only after successful tests and scans, staging image is promoted to production tags

This prevents registry pollution by ensuring only tested and scanned images reach production tags. The smart detection in `test.sh` automatically handles pulling the staging image from the registry during CI/CD runs.

#### Required Environment Variables for CI

For the functional tests to pass in CI/CD pipelines, the following environment variables must be set as GitHub repository secrets:

- `ANTHROPIC_API_KEY`: Required for testing Claude Code functionality

These variables are automatically passed to the test container during the CI/CD pipeline. The test script will first check for these environment variables, and if not found, attempt to load them from a local `.env` file (for local development).

## Security Scanning with Trivy

This is useful when fixing security issues.
See `.github/workflows/build-ai-assistant-container.yml` for the
latest Trivy settings.

### Install Trivy
```shell
# macOS with Homebrew
brew install trivy

# Linux (Ubuntu/Debian example)
sudo apt-get update && sudo apt-get install trivy
```

### Automated Build and Scan Script

The easiest way to build and scan the container locally is using the provided script:

```shell
# Build container and scan with default settings (CRITICAL,HIGH severity)
./scripts/scan-locally.sh

# Scan with all severity levels
SEVERITY=LOW,MEDIUM,HIGH,CRITICAL ./scripts/scan-locally.sh

# Output scan results in JSON format
SCAN_FORMAT=json ./scripts/scan-locally.sh

# Use specific container runtime
CONTAINER_RUNTIME=docker ./scripts/scan-locally.sh

# Combine multiple options
SEVERITY=MEDIUM,HIGH,CRITICAL SCAN_FORMAT=json CONTAINER_RUNTIME=docker ./scripts/scan-locally.sh
```
