# Multi-Arch Build Issue - Debug Analysis

## Problem Summary

GitHub Actions workflows fail with `exec format error` when running scripts inside containers built for multiple architectures. The image manifest reports `amd64` architecture, but the actual binary layers are `arm64`.

## Timeline

| Run # | Date | Status | Notes |
|-------|------|--------|-------|
| 13 | Jan 7, 2025 | ✅ Success | Last working build (run 20800268949) |
| 14 | Jan 14, 2025 | ❌ Failed | First failure (run 20983179897) |

## Quick Start for New Session

```bash
# Check recent workflow runs
gh run list --workflow="Software Update Container" --limit=5

# View logs from a failing run
gh run view <RUN_ID> --log-failed

# Check what changed between working and failing runs
git log --oneline 20800268949..20983179897

# Inspect current image manifest
docker buildx imagetools inspect ghcr.io/rise8-us/xpai-ai-assistant-container/project-container:latest
```

## Root Cause Analysis

### The Error
```
exec /tmp/script.sh: exec format error
```

This error occurs when trying to execute an ARM64 binary on an AMD64 GitHub Actions runner.

### Why Verification Passes But Execution Fails

1. **`docker inspect` reports manifest architecture, not layer architecture**
   - The multi-arch manifest correctly lists `amd64` variant
   - But the actual layers pulled may be `arm64`

2. **QEMU masks the issue in build workflows**
   - `setup-container-build` action installs QEMU for cross-arch emulation
   - Tests run via QEMU (slow but works), hiding the architecture mismatch
   - `software-update-container.yml` doesn't use QEMU, so it fails

3. **Docker caching behavior changed**
   - GitHub Actions runner image changed from `20251215.174.1` to `20260105.202.1`
   - Docker's platform selection behavior may have changed

## What Was Tried

### Fix 1: Add `--platform` to docker run (PR #221)
```yaml
docker run --platform linux/amd64 ...
```
**Result**: Didn't work. Docker still used cached ARM64 layers.

### Fix 2: Explicit pull before run (PR on fix/multi-arch-manifest)
```yaml
docker pull --platform linux/amd64 "$IMAGE"
ARCH=$(docker inspect "$IMAGE" --format '{{.Architecture}}')
# Verify ARCH == amd64
```
**Result**: Verification passes (manifest says amd64), but execution still fails (layers are arm64).

### Fix 3: Reorder platforms (AMD64 first)
```yaml
platforms: linux/amd64,linux/arm64  # Was: linux/arm64,linux/amd64
```
**Result**: No change. Buildx builds both architectures regardless of order.

### Fix 4: Update project-container base image (PR #227)
Updated pinned digest to latest ai-assistant-home base image.
**Result**: No change. Fresh build still has wrong layers.

### Fix 5: Remove registry caching entirely (Jan 21, 2026)
Removed `cache-from` and `cache-to` from all three build workflows:
- `build-project-container.yml`
- `build-ai-assistant-container.yml`
- `build-firewall-manager.yml`

**Rationale**: Registry caching for multi-arch builds is prone to cross-architecture contamination. The corrupted cache was serving ARM64 layers for AMD64 builds. Removing caching entirely trades slightly slower builds for reliability.

**Result**: ✅ SUCCESS - Build Project Container workflow passed with all tests succeeding (PR #229).

## Current Hypothesis

**Buildx registry cache is corrupted.**

The workflows use registry caching:
```yaml
cache-from: type=registry,ref=${{ env.IMAGE }}:buildcache
cache-to: type=registry,ref=${{ env.IMAGE }}:buildcache,mode=max
```

The cache may contain ARM64 layers that buildx incorrectly uses for AMD64 builds.

## Next Steps to Try

### Option 1: Disable build cache (quick test)
Add `no-cache: true` to docker/build-push-action:
```yaml
- name: Build and push test image
  uses: docker/build-push-action@v5
  with:
    context: project-container
    no-cache: true  # <-- Add this
    platforms: linux/amd64,linux/arm64
    ...
```

### Option 2: Delete and recreate cache
Delete the `buildcache` tag from the registry, then rebuild.

### Option 3: Build single architecture first
Build AMD64 only, verify it works, then add ARM64 back.

### Option 4: Inspect actual layers
```bash
# Check what layers are actually in the image
docker buildx imagetools inspect ghcr.io/rise8-us/xpai-ai-assistant-container/project-container:latest --raw | jq '.manifests'

# Pull and check actual binaries
docker pull --platform linux/amd64 ghcr.io/rise8-us/xpai-ai-assistant-container/project-container:latest
docker run --rm --entrypoint file ghcr.io/rise8-us/xpai-ai-assistant-container/project-container:latest /bin/bash
```

## Key Files

| File | Purpose |
|------|---------|
| `.github/workflows/build-project-container.yml` | Builds project container |
| `.github/workflows/build-ai-assistant-container.yml` | Builds base AI assistant container |
| `.github/actions/setup-container-build/action.yml` | Sets up QEMU + buildx |
| `.github/actions/container-script-executor/action.yml` | Runs scripts in containers |
| `.github/workflows/software-update-container.yml` | Uses container-script-executor (fails) |

## Relevant Commits

```bash
# View commits on fix/multi-arch-manifest branch
git log main..fix/multi-arch-manifest --oneline

# View the fix that was merged
git show 55c9c5b  # "fix(ci): ensure correct multi-arch image handling in CI workflows"
```

## Verification Commands

```bash
# Check if pulled image has correct architecture binaries
docker run --rm --platform linux/amd64 \
  ghcr.io/rise8-us/xpai-ai-assistant-container/project-container:latest \
  file /bin/bash

# Expected: ELF 64-bit LSB executable, x86-64
# Actual (broken): ELF 64-bit LSB executable, ARM aarch64
```
