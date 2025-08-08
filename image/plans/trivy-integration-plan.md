# Trivy Integration Plan

## Current Build Configuration

### Branch: add-trivvy-scan
**Base commit**: 94c009d Plan with Claude for fixing the build

### Current Workflow Structure
The workflow (`.github/workflows/build-devcontainer.yml`) has 4 jobs:
1. **build** - Builds devcontainer image but doesn't push (`push: never`)
2. **scan** - Tries to scan image from registry (fails - image not there)
3. **push** - Pushes image to registry (only on push events)
4. **provenance** - Generates SLSA attestation

### Current Build Process
- **Image**: `ghcr.io/rise8-us/xpai/ai-assistant-home:${{ github.sha }}`
- **Platform**: `linux/arm64`
- **Base**: Ubuntu 24.04 LTS ARM64 (`ubuntu:24.04@sha256:6633ff3b87e40bf09281277f1072458819e915da008095ebdcc76c921a3628a1`)
- **Build Tool**: `devcontainers/ci@a56d055efecd725e8cfe370543b6071b79989cc8`
- **Context**: `ai-assistant-container/` subfolder

### Devcontainer Configuration
- **File**: `ai-assistant-container/.devcontainer/devcontainer.json`
- **Dockerfile**: `ai-assistant-container/.devcontainer/Dockerfile`
- **Features**:
  - `ghcr.io/devcontainers/features/common-utils:2`
  - `ghcr.io/devcontainers/features/node:1` (v22.17.0)
  - `ghcr.io/anthropics/devcontainer-features/claude-code:1.0`
  - `ghcr.io/mikegehard/ai-assistants-devcontainer-feature/goose:1.0`
  - `ghcr.io/mikegehard/ai-assistants-devcontainer-feature/gemini-cli:1.0`

### Security Configuration
- **Trivy Action**: `aquasecurity/trivy-action@915b19bbe73b92a6cf82a1bc12b087c9a19a5fe2`
- **Severity**: `CRITICAL,HIGH,MEDIUM`
- **Exit Code**: `1` (fail on vulnerabilities)
- **Output**: SARIF format uploaded to GitHub Security tab
- **Cosign Signing**: Enabled for pushed images
- **SLSA Provenance**: Generated for pushed images

## Problem Analysis

The current workflow fails because:
1. **Build job**: Uses `devcontainers/ci` with `push: never` - image exists only locally
2. **Scan job**: Tries to scan image from registry but it was never pushed
3. **Root cause**: Image built in build job isn't available to scan job

## Solution: Combine Build and Scan

### Current Structure (Broken)
```
build (push: never) → scan (can't find image) → push → provenance
```

### New Structure (Fixed)
```
build-and-scan (build + scan locally) → push → provenance
```

## Implementation Steps

### 1. Create Combined `build-and-scan` Job

Replace separate `build` and `scan` jobs with single job that:
- Builds image locally using `docker/build-push-action`
- Scans the local image with Trivy
- Outputs image reference and scan status

```yaml
build-and-scan:
  runs-on: ubuntu-latest
  permissions:
    contents: read
    packages: write
    security-events: write
  outputs:
    image-ref: ${{ env.REGISTRY }}/${{ env.IMAGE_NAME }}:${{ github.sha }}
    scan-passed: ${{ steps.scan.conclusion == 'success' }}
```

### 2. Update Build Step

Use `docker/build-push-action` instead of `devcontainers/ci`:
- Set `load: true` to load image into local Docker daemon
- Set `push: false` to not push to registry
- Build from devcontainer context

### 3. Update Scan Step

Scan the locally built image:
- Use `image-ref` pointing to local image
- Continue uploading SARIF results to GitHub Security tab
- Set `exit-code: 1` to fail job on vulnerabilities

### 4. Update Push Job

Modify push job to:
- Depend on `build-and-scan` instead of separate `build` and `scan`
- Only run if scan passed: `needs.build-and-scan.outputs.scan-passed == 'true'`
- Rebuild and push image (or use registry cache)

### 5. Update Provenance Job

Update dependencies:
- Change `needs: [build, scan, push]` to `needs: [build-and-scan, push]`
- Keep same conditions for push events

## Benefits

1. **Single Build**: No duplicate image builds
2. **Local Scanning**: Scan works on local image without registry push
3. **Security-First**: Only push images that pass security scans
4. **Faster**: Single job instead of separate build/scan jobs
5. **Reliable**: Eliminates image availability issues

## Migration Notes

- Maintains all existing security features
- Compatible with existing devcontainer setup
- Can be implemented independently of other changes
- Preserves SARIF upload and GitHub Security integration

## Alternative Approach

If maintaining separate jobs is preferred:
1. Build job: Push to temporary tag
2. Scan job: Scan temporary tag
3. Push job: Re-tag and push to final location
4. Cleanup: Remove temporary tag

However, the combined approach is simpler and more efficient.