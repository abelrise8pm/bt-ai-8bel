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

## Beta Plugin Usage

Auto-invoke beta plugins based on context without requiring explicit mention:

- **software-engineer-beta:implement-story**: Use automatically when implementing GitHub issues or building features
- **software-engineer-beta:review-pr**: Use automatically when analyzing or responding to PR feedback
- **product-owner-beta:assess-story**: Use automatically when evaluating story readiness or INVEST criteria
- **product-owner-beta:refine-story**: Use automatically when clarifying requirements or improving story quality
- **release-engineer-beta**: Use automatically for version updates, changelogs, or release preparation
- **platform-engineer-beta:triage-gh-actions**: Use automatically when given GitHub Actions run URLs or CI/CD failures
- **cybersecurity-engineer-beta:triage-cve**: Use automatically when triaging CVEs or analyzing vulnerability scans

The beta designation indicates active iteration, not that explicit invocation is required.

## Design Philosophy

### Separation of Concerns

Keep components focused on a single responsibility. When building skills, plugins, or scripts:

- **Decouple data sources from logic**: Fetching data (GitHub, GitLab, Jira) should be separate from processing it. Define clean interfaces between components so swapping implementations only requires changing one piece.
- **Prefer composition over monoliths**: Small, focused components that can be combined are better than large all-in-one solutions.
- **Design for change**: Assume external dependencies (APIs, platforms, tools) will change. Isolate integration points behind stable interfaces.

Example: A story assessment skill should accept a standardized story format, not call GitHub directly. A separate fetch skill handles the platform-specific API, outputting the common format.

### High Cohesion, Low Coupling

Apply this principle to all artifacts - code, documentation, and configuration:

- **High cohesion**: Each module/file/section should focus on one clear purpose. Everything inside should be closely related.
- **Low coupling**: Components should have minimal dependencies on each other. Changes in one area shouldn't ripple through unrelated areas.

This applies beyond code: documentation sections should be self-contained, scripts should do one thing well, and configuration should be modular.

## Project Structure

```
image/              # Base AI assistant container (Claude Code, OpenCode)
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
# Base container tests (requires ANTHROPIC_API_KEY)
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

### Principle of Least Access

Apply principle of least access (least privilege) to all generated code:

- **Request minimum permissions**: Only request the permissions, scopes, or access levels actually needed for the task
- **Limit scope of variables and functions**: Prefer local over global, private over public, const over let
- **Restrict file and network access**: Only open files/connections that are required; close them promptly
- **Narrow API access**: When creating tokens, keys, or service accounts, grant only necessary permissions
- **Validate at boundaries**: Check inputs at system entry points rather than trusting all data

### General Security Practices

- Never commit API keys or credentials
- Use .env files locally (auto-loaded by test scripts)
- Document CVE exceptions in .trivyignore with rationale
- Follow principle of least privilege in containers

## Environment Variables

### Required for Testing
- `ANTHROPIC_API_KEY` - Claude Code tests

### Optional
- `CONTAINER_RUNTIME` - Force docker or podman
- `IMAGE_TAG` - Override default image tag for testing
- `SEVERITY` - Trivy scan severity levels
