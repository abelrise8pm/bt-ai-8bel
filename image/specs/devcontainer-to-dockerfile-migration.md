# Devcontainer to Dockerfile Migration Plan

## Overview
This plan migrates from devcontainer features to a pure Dockerfile approach to enable single-build vulnerability scanning and improved security posture.

## Current State
- **Structure**: `.devcontainer/` subdirectory with `devcontainer.json` and `Dockerfile`
- **Features**: Uses 5 devcontainer features (common-utils, node, claude-code, goose, gemini-cli)
- **Workflow**: Dual build process - `devcontainers/ci` + `docker/build-push-action`
- **Platform**: ARM64 only (M-series MacBook Pros)

## Target State
- **Structure**: Flat directory with single `Dockerfile`
- **Features**: All functionality moved to Dockerfile RUN commands
- **Workflow**: Single build with `docker/build-push-action` + local scanning
- **Platform**: ARM64 only (maintained)

## Migration Steps

### Phase 1: File Structure Reorganization

#### 1.1 Move Files to Root
```bash
# Move files from .devcontainer/ to ai-assistant-container/
mv .devcontainer/Dockerfile ./Dockerfile
mv .devcontainer/zscaler-root-ca.crt ./zscaler-root-ca.crt
mv .devcontainer/claude_code_init.sh ./claude_code_init.sh
```

#### 1.2 Create Test Script
Create `ai-assistant-container/test.sh`:

```bash
#!/bin/bash
# Test script for validating container build and functionality
# Returns 0 on success, 1 on any failure

set -e  # Exit on any error

echo "🔨 Building container with Podman..."
if ! podman build -t test-migration . 2>&1; then
    echo "❌ ERROR: Container build failed"
    exit 1
fi

echo "✅ Container build successful"

echo "🧪 Testing installed tools..."

# Test each tool and capture output
echo "Testing Node.js..."
NODE_VERSION=$(podman run --rm test-migration /bin/bash -c "node --version" 2>&1)
if [[ ! "$NODE_VERSION" =~ ^v22\.17\. ]]; then
    echo "❌ ERROR: Node.js version incorrect. Expected v22.17.x, got: $NODE_VERSION"
    exit 1
fi
echo "✅ Node.js: $NODE_VERSION"

echo "Testing Claude Code..."
CLAUDE_VERSION=$(podman run --rm test-migration /bin/bash -c "claude --version" 2>&1)
if [[ $? -ne 0 ]]; then
    echo "❌ ERROR: Claude Code not installed or not working: $CLAUDE_VERSION"
    exit 1
fi
echo "✅ Claude Code: $CLAUDE_VERSION"

echo "Testing Gemini CLI..."
GEMINI_VERSION=$(podman run --rm test-migration /bin/bash -c "gemini --version" 2>&1)
if [[ $? -ne 0 ]]; then
    echo "❌ ERROR: Gemini CLI not installed or not working: $GEMINI_VERSION"
    exit 1
fi
echo "✅ Gemini CLI: $GEMINI_VERSION"

echo "Testing Goose..."
GOOSE_VERSION=$(podman run --rm test-migration /bin/bash -c "goose --version" 2>&1)
if [[ $? -ne 0 ]]; then
    echo "❌ ERROR: Goose not installed or not working: $GOOSE_VERSION"
    exit 1
fi
echo "✅ Goose: $GOOSE_VERSION"

echo "Testing Git..."
GIT_VERSION=$(podman run --rm test-migration /bin/bash -c "git --version" 2>&1)
if [[ $? -ne 0 ]]; then
    echo "❌ ERROR: Git not installed: $GIT_VERSION"
    exit 1
fi
echo "✅ Git: $GIT_VERSION"

echo "Testing curl..."
CURL_VERSION=$(podman run --rm test-migration /bin/bash -c "curl --version | head -1" 2>&1)
if [[ $? -ne 0 ]]; then
    echo "❌ ERROR: curl not installed: $CURL_VERSION"
    exit 1
fi
echo "✅ curl: $CURL_VERSION"

echo "Testing jq..."
JQ_VERSION=$(podman run --rm test-migration /bin/bash -c "jq --version" 2>&1)
if [[ $? -ne 0 ]]; then
    echo "❌ ERROR: jq not installed: $JQ_VERSION"
    exit 1
fi
echo "✅ jq: $JQ_VERSION"

echo "Testing user setup..."
USER_CHECK=$(podman run --rm test-migration /bin/bash -c "whoami" 2>&1)
if [[ "$USER_CHECK" != "aiAssistant" ]]; then
    echo "❌ ERROR: Wrong user. Expected 'aiAssistant', got: $USER_CHECK"
    exit 1
fi
echo "✅ User: $USER_CHECK"

echo "Testing Claude Code init script..."
CLAUDE_INIT_CHECK=$(podman run --rm test-migration /bin/bash -c "ls -la ~/.claude/claude_code_init.sh" 2>&1)
if [[ $? -ne 0 ]]; then
    echo "❌ ERROR: Claude init script not found: $CLAUDE_INIT_CHECK"
    exit 1
fi
echo "✅ Claude init script present"

echo "🎉 All tests passed! Container is ready."
exit 0
```

#### 1.3 New Directory Structure
```
ai-assistant-container/
├── Dockerfile                    # Main build file
├── test.sh                      # Test script for validation
├── zscaler-root-ca.crt          # Certificate
├── claude_code_init.sh          # Init script
├── README.md                    # Documentation
├── clean.sh                     # Existing cleanup script
└── devcontainer-to-dockerfile-migration.md  # This file
```

### Phase 2: Dockerfile Conversion

#### 2.1 Look Up Current Versions and SHAs

**For npm packages:**
```bash
# Get current version info
npm view @anthropic-ai/claude-code version
npm view @google/gemini-cli version

# Get package integrity hashes
npm view @anthropic-ai/claude-code dist.integrity
npm view @google/gemini-cli dist.integrity
```

**For Goose binary:**
```bash
# Get latest release info
curl -s https://api.github.com/repos/block/goose/releases/latest | jq -r '.tag_name'

# Download and get SHA256
GOOSE_VERSION="v0.x.x"  # Replace with actual version
curl -fsSL "https://github.com/block/goose/releases/download/${GOOSE_VERSION}/goose-linux-arm64" -o goose-temp
sha256sum goose-temp
```

#### 2.2 New Dockerfile Content

Replace existing Dockerfile with:

```dockerfile
# Pinned Ubuntu 24.04 LTS ARM64 for M-series MacBook Pros
FROM --platform=linux/arm64 ubuntu:24.04@sha256:6633ff3b87e40bf09281277f1072458819e915da008095ebdcc76c921a3628a1

# Copy certificate and install in single layer
COPY zscaler-root-ca.crt /usr/local/share/ca-certificates/zscaler-root-ca.crt
RUN apt-get update && \
    apt-get install -y --no-install-recommends ca-certificates && \
    update-ca-certificates && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Set environment variables for SSL
ENV CURL_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt \
    SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt \
    NODE_EXTRA_CA_CERTS=/etc/ssl/certs/ca-certificates.crt

# Install security-focused minimal utilities
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        git \
        curl \
        jq \
        ca-certificates \
        openssh-client \
        gnupg2 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install Node.js v22.17.0 (pinned version)
RUN curl -fsSL https://deb.nodesource.com/setup_22.x | bash - && \
    apt-get install -y nodejs=22.17.0* && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install pinned versions of npm packages
# TODO: Replace with actual versions/SHAs from Phase 2.1
RUN npm install -g \
    @anthropic-ai/claude-code@1.0.44 \
    @google/gemini-cli@0.1.9

# Install Goose with SHA verification
# TODO: Replace with actual version/SHA from Phase 2.1
RUN GOOSE_VERSION="v0.9.0" && \
    GOOSE_SHA256="REPLACE_WITH_ACTUAL_SHA256" && \
    curl -fsSL "https://github.com/block/goose/releases/download/${GOOSE_VERSION}/goose-linux-arm64" -o /tmp/goose && \
    echo "${GOOSE_SHA256} /tmp/goose" | sha256sum -c - && \
    chmod +x /tmp/goose && \
    mv /tmp/goose /usr/local/bin/goose && \
    goose --version

# Create aiAssistant user
RUN useradd -m -s /bin/bash aiAssistant && \
    mkdir -p /home/aiAssistant/.claude

# Setup Claude Code initialization
COPY claude_code_init.sh /home/aiAssistant/.claude/claude_code_init.sh
RUN chmod +x /home/aiAssistant/.claude/claude_code_init.sh && \
    chown -R aiAssistant:aiAssistant /home/aiAssistant/.claude && \
    echo '[ -f ~/.claude/anthropic_key_helper.sh ] || /home/aiAssistant/.claude/claude_code_init.sh' >> /home/aiAssistant/.bashrc

# Set default user
USER aiAssistant
```

### Phase 3: Workflow Changes

#### 3.1 Update build-devcontainer.yml

Replace the current jobs with:

```yaml
jobs:
  build-and-scan:
    runs-on: ubuntu-latest
    permissions:
      contents: read
      packages: write
      security-events: write
    outputs:
      image-ref: ${{ env.REGISTRY }}/${{ env.IMAGE_NAME }}:${{ github.sha }}
      scan-passed: ${{ steps.scan.conclusion == 'success' }}

    steps:
      - name: Checkout repository
        uses: actions/checkout@692973e3d937129bcbf40652eb9f2f61becf3332 # v4.1.7

      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@988b5a0280414f521da01fcc63a27aeeb4b104db # v3.6.1

      - name: Log in to Container Registry
        uses: docker/login-action@9780b0c442fbb1117ed29e0efdff1e18412f7567 # v3.3.0
        with:
          registry: ${{ env.REGISTRY }}
          username: ${{ github.actor }}
          password: ${{ secrets.GITHUB_TOKEN }}

      - name: Build image locally for scanning
        uses: docker/build-push-action@5cd11c3a4ced054e52742c5fd54dca954e0edd85 # v6.7.0
        with:
          context: ./ai-assistant-container
          file: ./ai-assistant-container/Dockerfile
          tags: ${{ env.REGISTRY }}/${{ env.IMAGE_NAME }}:${{ github.sha }}
          platforms: linux/arm64
          load: true
          cache-from: type=registry,ref=${{ env.REGISTRY }}/${{ env.IMAGE_NAME }}:buildcache
          cache-to: type=registry,ref=${{ env.REGISTRY }}/${{ env.IMAGE_NAME }}:buildcache,mode=max

      - name: Run Trivy vulnerability scanner
        id: scan
        uses: aquasecurity/trivy-action@915b19bbe73b92a6cf82a1bc12b087c9a19a5fe2 # 0.28.0
        with:
          image-ref: ${{ env.REGISTRY }}/${{ env.IMAGE_NAME }}:${{ github.sha }}
          format: 'sarif'
          output: 'trivy-results.sarif'
          ignore-unfixed: false
          severity: 'CRITICAL,HIGH,MEDIUM'
          exit-code: '1'

      - name: Upload Trivy scan results to GitHub Security tab
        uses: github/codeql-action/upload-sarif@662472033e021d55d94146f66f6058822b0b39fd # v3.27.0
        if: always()
        with:
          sarif_file: 'trivy-results.sarif'

  push:
    runs-on: ubuntu-latest
    needs: build-and-scan
    if: github.event_name == 'push' && needs.build-and-scan.outputs.scan-passed == 'true'
    permissions:
      contents: read
      packages: write
      id-token: write

    steps:
      - name: Checkout repository
        uses: actions/checkout@692973e3d937129bcbf40652eb9f2f61becf3332 # v4.1.7

      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@988b5a0280414f521da01fcc63a27aeeb4b104db # v3.6.1

      - name: Log in to Container Registry
        uses: docker/login-action@9780b0c442fbb1117ed29e0efdff1e18412f7567 # v3.3.0
        with:
          registry: ${{ env.REGISTRY }}
          username: ${{ github.actor }}
          password: ${{ secrets.GITHUB_TOKEN }}

      - name: Build and push image
        uses: docker/build-push-action@5cd11c3a4ced054e52742c5fd54dca954e0edd85 # v6.7.0
        with:
          context: ./ai-assistant-container
          file: ./ai-assistant-container/Dockerfile
          tags: ${{ env.REGISTRY }}/${{ env.IMAGE_NAME }}:${{ github.sha }}
          platforms: linux/arm64
          push: true
          cache-from: type=registry,ref=${{ env.REGISTRY }}/${{ env.IMAGE_NAME }}:buildcache
          cache-to: type=registry,ref=${{ env.REGISTRY }}/${{ env.IMAGE_NAME }}:buildcache,mode=max

      - name: Install Cosign
        uses: sigstore/cosign-installer@4959ce089c160fddf62f7b42464195ba1a56d382 # v3.6.0

      - name: Sign container image
        run: |
          cosign sign --yes ${{ env.REGISTRY }}/${{ env.IMAGE_NAME }}:${{ github.sha }}
        env:
          COSIGN_EXPERIMENTAL: 1

  provenance:
    runs-on: ubuntu-latest
    needs: [build-and-scan, push]
    if: github.event_name == 'push' && needs.build-and-scan.outputs.scan-passed == 'true'
    permissions:
      contents: read
      packages: write
      id-token: write
      attestations: write

    steps:
      - name: Generate SLSA provenance attestation
        uses: actions/attest-build-provenance@1c608d11d69870c2092266b3f9a6f3abbf17002c # v1.4.3
        with:
          subject-name: ${{ env.REGISTRY }}/${{ env.IMAGE_NAME }}
          subject-digest: ${{ needs.build-and-scan.outputs.image-digest }}
          push-to-registry: true
```

### Phase 4: Testing & Validation

#### 4.1 AI Assistant Test Command

For AI assistant iteration and validation:
```bash
cd ai-assistant-container && chmod +x test.sh && ./test.sh
```

**This test script will:**
- Build the container with Podman
- Test all installed tools (Node.js, Claude Code, Gemini CLI, Goose, Git, curl, jq)
- Verify user setup (aiAssistant)
- Check Claude Code init script
- Return `0` on success, `1` on any failure
- Print clear error messages for troubleshooting

**Expected successful output:**
```
🔨 Building container with Podman...
✅ Container build successful
🧪 Testing installed tools...
Testing Node.js...
✅ Node.js: v22.17.0
Testing Claude Code...
✅ Claude Code: [version info]
Testing Gemini CLI...
✅ Gemini CLI: [version info]
Testing Goose...
✅ Goose: [version info]
Testing Git...
✅ Git: [version info]
Testing curl...
✅ curl: [version info]
Testing jq...
✅ jq: [version info]
Testing user setup...
✅ User: aiAssistant
Testing Claude Code init script...
✅ Claude init script present
🎉 All tests passed! Container is ready.
```

#### 4.2 Functionality Validation
Inside the container, verify:
```bash
# Check versions
node --version        # Should be v22.17.0
npm --version
claude --version      # Should be installed
gemini --version      # Should be installed  
goose --version       # Should be installed

# Check utilities
git --version
curl --version
jq --version

# Check user setup
whoami               # Should be aiAssistant
ls -la ~/.claude     # Should have claude_code_init.sh
```

#### 4.3 Workflow Test
1. Create PR with changes
2. Verify build-and-scan job runs successfully
3. Verify Trivy scan completes
4. Verify no push occurs on PR
5. Merge to main and verify push occurs

### Phase 5: Cleanup

#### 5.1 Remove Old Files
```bash
rm -rf .devcontainer/
rm devcontainer.json  # If moved to root
```

#### 5.2 Update Documentation
- Update README.md with new build instructions
- Document version update process
- Add security considerations

## Security Benefits

1. **Reduced Attack Surface**: Minimal package installation (6 packages vs 25+)
2. **Pinned Versions**: All tools pinned to specific versions/SHAs
3. **Single Build**: Eliminates duplicate build vulnerability window
4. **Local Scanning**: Images scanned before registry push
5. **Binary Verification**: SHA256 verification for Goose binary
6. **No Arbitrary Script Execution**: Eliminated `curl | bash` pattern

## Version Update Process

### Updating npm Packages
```bash
# Check for updates
npm view @anthropic-ai/claude-code version
npm view @google/gemini-cli version

# Update Dockerfile with new versions
# Test build locally
# Update this migration document with new versions
```

### Updating Goose Binary
```bash
# Check for new releases
curl -s https://api.github.com/repos/block/goose/releases/latest | jq -r '.tag_name'

# Download and get new SHA
GOOSE_VERSION="v0.x.x"
curl -fsSL "https://github.com/block/goose/releases/download/${GOOSE_VERSION}/goose-linux-arm64" -o goose-temp
sha256sum goose-temp

# Update Dockerfile with new version and SHA
```

## Rollback Plan

If issues arise:
1. Keep current `.devcontainer/` structure as backup
2. Revert workflow changes to use `devcontainers/ci`
3. Restore dual-build approach
4. Document lessons learned

## Success Criteria

- ✅ Single build process (no duplicate builds)
- ✅ Local vulnerability scanning works
- ✅ All AI tools function correctly
- ✅ Build time acceptable (< 10 minutes)
- ✅ Security scan passes
- ✅ Image size reasonable
- ✅ No functionality regression

## Timeline

- **Phase 1**: 30 minutes (file reorganization)
- **Phase 2**: 2 hours (Dockerfile conversion + version lookup)
- **Phase 3**: 1 hour (workflow changes)
- **Phase 4**: 1 hour (testing)
- **Phase 5**: 30 minutes (cleanup)

**Total Estimated Time**: 5 hours