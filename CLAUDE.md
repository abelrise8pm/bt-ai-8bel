# AI Assistant Container - Claude Code Instructions

## Development Environment

You are running inside a Podman container. You do NOT have access to `podman` or `docker` commands.

When you need to run container commands (build, test, scan):
1. Provide the exact command for the human to run on their host machine
2. Format commands in a code block for easy copy-paste
3. Explain what output to expect
4. Ask them to paste the results back

Example workflow:
```
Please run this on your host machine:

cd /path/to/xpai-ai-assistant-container/image && ./scripts/test.sh

This will build and test the container. Paste the output back here so I can help troubleshoot any issues.
```

## Project Overview

Container infrastructure monorepo providing secure, CMMC Level 2 compliant AI development environments. Contains base container images, firewall isolation, and starter templates.

## Project Structure

```
image/              # Base AI assistant container (Claude Code, Gemini CLI, Goose)
firewall-manager/   # Alpine-based iptables firewall for CUI/CMMC compliance
starter/            # Template for project teams (published to external repo)
project-container/  # Extended container with additional tools (gh, skopeo, uv)
.github/            # CI/CD workflows and custom actions
scripts/            # Integration scripts for existing repos
```

## Technology Stack

- **Language**: Bash shell scripts (no compiled languages)
- **Container runtimes**: Docker and Podman (both supported)
- **Architectures**: ARM64 (Apple Silicon) and AMD64
- **Base images**: Ubuntu 24.04 LTS with pinned SHA digests

## Build Commands

```bash
# Base container
cd image && podman build -t ai-assistant-home:latest .

# Firewall manager
cd firewall-manager && docker build -t firewall-manager:test .

# Project container
cd project-container && docker build -t project-container:latest .
```

## Test Commands

```bash
# Base container tests (requires ANTHROPIC_API_KEY, GEMINI_API_KEY)
cd image && ./scripts/test.sh

# Firewall integration tests
cd firewall-manager && ./integration-test.sh

# With specific runtime
CONTAINER_RUNTIME=docker ./scripts/test.sh
```

## Security Scanning

```bash
cd image && ./scripts/scan-locally.sh
SEVERITY=LOW,MEDIUM,HIGH,CRITICAL ./scripts/scan-locally.sh
```

## Shell Script Standards

### Required Headers
```bash
#!/usr/bin/env bash
set -eu  # Exit on error, fail on undefined variables
```

### Test Helper Pattern
Use consistent test output functions:
```bash
test_pass() { echo -e "${GREEN}✓${NC} $1"; TESTS_PASSED=$((TESTS_PASSED + 1)); }
test_fail() { echo -e "${RED}✗${NC} $1"; TESTS_FAILED=$((TESTS_FAILED + 1)); }
test_info() { echo -e "${YELLOW}ℹ${NC} $1"; }
```

### Runtime Detection
Always auto-detect container runtime:
```bash
CONTAINER_RUNTIME=${CONTAINER_RUNTIME:-$(command -v podman > /dev/null && echo "podman" || echo "docker")}
```

## Dockerfile Standards

### Pinned Base Images
Always use SHA digests for reproducibility:
```dockerfile
FROM ubuntu:24.04@sha256:c35e29c9450151419d9448b0fd75374fec4fff364a27f176fb458d472dfc9e54
```

### Version Management
Use ARG for pinned versions with update instructions:
```dockerfile
# curl https://www.npmjs.com/package/@anthropic-ai/claude-code for latest version
ARG CLAUDE_CODE_VERSION=2.0.71
```

### Security Requirements
- Run as non-root user (aiAssistant)
- Clean up apt lists and npm cache
- Remove credentials files (.npmrc) after installs

## Testing Philosophy

### Integration Testing
This project uses integration tests via shell scripts, not unit test frameworks. Tests validate:
- Container functionality (tool versions, user setup)
- Network isolation (firewall blocking)
- Security (credential cleanup, OCI metadata)

### Test Structure
Each test script should:
1. Check prerequisites (env vars, runtime availability)
2. Build or pull the image
3. Run individual test cases with clear pass/fail output
4. Print summary with counts
5. Return non-zero exit code on any failure

### Writing New Tests
- Test observable behavior, not implementation details
- Include both positive tests (whitelisted domains work) and negative tests (blocked domains fail)
- Use timeouts to prevent hanging on network tests
- Provide debug output on failures

## CI/CD Pipeline

### Staging + Promotion Pattern
```
Build staging → Test → Scan → Promote to production
```

Tests run against staging images before promotion to production tags.

### Image Tags
- `latest` - Most recent main branch build
- `sha-<commit>` - Specific commit builds
- `staging-<sha>` - Pre-promotion testing

## Common Tasks

### Update AI Tool Versions
1. Check for new versions (see comments in `image/Dockerfile`)
2. Update ARG values in Dockerfile
3. Run `./scripts/test.sh` to verify
4. Update CHANGELOG if in starter/

### Add New Integration Test
1. Add test function following `test_*()` naming pattern
2. Use test_pass/test_fail helpers for output
3. Call new function from main execution section
4. Test locally before committing

### Debug Failing CI
1. Check workflow logs in GitHub Actions
2. For container issues: `docker logs <container>`
3. For firewall issues: `docker exec <firewall> iptables -L OUTPUT -n -v`

## Security Considerations

- Never commit API keys or credentials
- Use .env files locally (auto-loaded by test scripts)
- Document CVE exceptions in .trivyignore with rationale
- Follow principle of least privilege in containers

## Environment Variables

### Required for Testing
- `ANTHROPIC_API_KEY` - Claude Code and Goose tests
- `GEMINI_API_KEY` - Gemini CLI tests

### Optional
- `CONTAINER_RUNTIME` - Force docker or podman
- `IMAGE_TAG` - Override default image tag for testing
- `SEVERITY` - Trivy scan severity levels
