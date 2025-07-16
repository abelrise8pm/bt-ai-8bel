
# XPai Base Container

## Overview
This base container is designed to be shared across multiple projects. It includes pre-configured AI assistant tools (claude-code, gemini-cli) and Node.js runtime, providing a consistent development environment while maintaining security standards for CUI and Federal customers.

For security rationale and compliance details, see our [security stance document](https://docs.google.com/document/d/1LJNSA-MnrNvUikE__-_G9JgEF6GE66cjUUPOWMoag0o/edit?tab=t.0#heading=h.3uxz91ih8lr2).

## Using as a Base Container for Other Projects

This container can be used as a base for other projects that need AI assistant tools. Here's how to integrate it:

### 1. Reference in Your Devcontainer

Use the published image as your base in `.devcontainer/devcontainer.json`:

```json
{
  "image": "ghcr.io/rise8-us/xpai/ai-assistant-home:@sha256:abc123...",
  "features": {
    // Add any additional features your project needs
  },
  "postCreateCommand": "echo 'Container ready with AI assistants pre-installed'",
  "runArgs": ["--env-file",".env"],
  // change any other mentions to this...
  "remoteUser": "aiAssistant"
}
```

### 2. Create Your Project's Environment File

You can use `./.env.example` as a starting point.

Or if you already have a `.env` file, you can add
the necessary env vars there.

### 3. Pin to Specific SHA

**Important**: Always pin to a specific SHA digest rather than using tags like `latest` or `main`. This ensures your development environment remains consistent and prevents unexpected changes.

To find the SHA for the latest version:
1. Go to [GitHub Container Registry](https://github.com/rise8-us/XPai/pkgs/container/ai-assistant-home)
2. Find the image you want to use
3. Copy the SHA256 digest
4. Use it in your devcontainer configuration as shown above

### 4. Authentication Setup

If your project team encounters authentication issues with `ghcr.io`, follow these steps on your host machine:

1. Log into GitHub CLI with package read permissions:
   ```bash
   gh auth logout
   gh auth login -s read:packages
   ```

2. Use your GitHub CLI token to authenticate with the container registry:
   ```bash
   podman logout ghcr.io
   gh auth token | podman login ghcr.io -u $(gh api user --jq .login) --password-stdin
   ```

3. Test pulling the image:
  ```bash
  podman pull ghcr.io/rise8-us/xpai/ai-assistant-home:<sha>
  ```

### 5. Available AI Assistants

The container comes pre-installed with:
- **Claude Code**: `claude-code` command for AI-powered development
- **Gemini CLI**: `gemini` command for Google's AI assistant

### 6. Best Practices

- Store your `.env` file locally and never commit it to version control
- Pin to specific SHA digests for production deployments
- Test your devcontainer configuration before distributing to your team
- Follow Rise8's [AI-Generated Code Execution](https://delivery-playbooks.rise8.us/content/plays/engineering/ai-generated-code-execution/) playbook for safely using AI-generated code

### 7. Known Issues

- Zscaler internet security may cause pulling issues. See [issue #210](https://github.com/rise8-us/XPai/issues/210) for workarounds.

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

## Testing

The container includes a test script (`test.sh`) that validates container functionality. The script uses smart detection to automatically handle different image sources and supports both Docker and Podman runtimes.

### Smart Image Detection

The test script automatically determines how to obtain the image:

1. **Existing Local Image**: If the image exists locally, it uses it directly (no rebuild)
2. **Remote Registry Image**: If the image tag contains a registry domain (e.g., `ghcr.io/...`), it pulls from the registry
3. **Local Build**: For simple tags, it builds the container locally from the current directory

### Environment Variables

- `CONTAINER_RUNTIME`: Specify the container runtime to use (`docker` or `podman`). If not set, the script will auto-detect the available runtime, preferring Podman if available.
- `IMAGE_TAG`: Specify the image tag to use for testing (defaults to `test-migration`).

### Running Tests Locally

```shell
# Run with default settings (auto-detect runtime, build locally with test-migration tag)
./test.sh

# Run with specific runtime
CONTAINER_RUNTIME=docker ./test.sh

# Test a locally built image
IMAGE_TAG=my-custom-tag ./test.sh

# Test a remote registry image (automatically pulls if not found locally)
IMAGE_TAG=ghcr.io/rise8-us/xpai/ai-assistant-home:staging-abc123 ./test.sh

# Run with both custom runtime and tag
CONTAINER_RUNTIME=docker IMAGE_TAG=my-custom-tag ./test.sh
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
