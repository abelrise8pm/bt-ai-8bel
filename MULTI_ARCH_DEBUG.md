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

**Result**: Build workflows pass (QEMU masks issue), but software-update workflow still fails with exec format error.

### Fix 6: Explicit platform targeting in Dockerfile (PR #235)
Added `ARG TARGETPLATFORM` and `--platform=$TARGETPLATFORM` to FROM instructions:
```dockerfile
ARG TARGETPLATFORM
FROM --platform=$TARGETPLATFORM ubuntu:24.04@sha256:...
```
**Rationale**: Force buildx to use correct platform when pulling base image layers.

**Result**: ❌ FAILED - Warning still appears in build logs:
```
InvalidBaseImagePlatform: Base image ubuntu:24.04@sha256:... was pulled with platform "linux/arm64", expected "linux/amd64"
```
Build tests pass (QEMU emulation), but software-update workflow still fails with exec format error.

### Fix 7: AMD64-only builds (PR #236, merged Jan 21, 2026)
Changed all build workflows to only build AMD64:
```yaml
platforms: linux/amd64  # Was: linux/amd64,linux/arm64
```

**Result**: ✅ All build workflows pass. ❌ Software Update workflow still fails with `exec format error`.

### Fix 8: Extract script and add debug diagnostics (Jan 21, 2026, branch: fix/amd64-only-build)
Refactored software update workflow to isolate the problem:

1. **Extracted inline script to file**: `.github/scripts/update-software-versions.sh`
   - Eliminates YAML multi-line string issues
   - Git handles line endings properly
   - Script is testable locally

2. **Removed `container-script-executor` action** - inline docker commands are simpler

3. **Added debug diagnostics** to determine root cause:
   ```yaml
   # Container diagnostics - tests if container binaries work
   docker run --rm --platform linux/amd64 "$IMAGE" /bin/echo "Hello"
   docker run --rm --platform linux/amd64 "$IMAGE" file /bin/bash
   docker run --rm --platform linux/amd64 "$IMAGE" uname -m

   # Script diagnostics - checks for BOM/CRLF issues
   head -1 script.sh | xxd | head -2
   file script.sh
   ```

**Result**: 🔄 PENDING - needs merge to main and workflow trigger to test in GitHub Actions.

## Local Testing Results (Jan 21, 2026)

Tested on Apple Silicon Mac with Podman to isolate the issue:

```bash
NEW_IMAGE="ghcr.io/rise8-us/xpai-ai-assistant-container/project-container:latest"

# Test 1: Can container run commands?
podman run --rm --platform linux/amd64 "$NEW_IMAGE" /bin/echo "Hello"
# Result: ✅ "Hello from new image" - works via Rosetta 2 emulation

# Test 2: What architecture is the container?
podman run --rm --platform linux/amd64 "$NEW_IMAGE" uname -m
# Result: ❌ "aarch64" - CONTAINER HAS ARM64 BINARIES!

# Test 3: Does the extracted script run?
podman run --rm --platform linux/amd64 -v "$(pwd)":/workspaces/repo --workdir /workspaces/repo "$NEW_IMAGE" /workspaces/repo/.github/scripts/update-software-versions.sh
# Result: ✅ Script runs! Only fails at "Invalid API key" (expected - no ANTHROPIC_API_KEY)
```

### Conclusions from Local Testing

| Test | Result | Meaning |
|------|--------|---------|
| `/bin/echo` | ✅ Works | Rosetta 2 emulates ARM64 → AMD64 |
| `uname -m` | `aarch64` | **Container has ARM64 binaries** |
| Script execution | ✅ Runs | Script is valid, no BOM/CRLF issues |

**Root cause confirmed: Container has ARM64 binaries despite `--platform linux/amd64` and manifest saying `amd64`.**

- Works on Mac: Rosetta 2 transparently emulates ARM64
- Fails on GitHub Actions: Native AMD64 Linux has no emulation → `exec format error`

### Why Old Image Can't Be Tested
```bash
OLD_IMAGE="ghcr.io/rise8-us/xpai-ai-assistant-container/project-container@sha256:3728496243b1bd36ae2db4bf060bef1424c3adff66277df62995e9aeb5370ead"
# Result: "manifest unknown" - old images have been garbage collected
```

## Current Status

### 🎉 ROOT CAUSE FOUND AND FIXED (Jan 21, 2026)

**The Ubuntu base image SHA was architecture-specific (ARM64), not a multi-arch manifest digest.**

### The Actual Root Cause

The Dockerfile pinned Ubuntu with an **architecture-specific SHA**:
```dockerfile
FROM ubuntu:24.04@sha256:955364933d0d91afa6e10fb045948c16d2b191114aa54bed3ab5430d8bbc58cc
```

This SHA (`955364933d...`) was an **ARM64-specific digest**, not the multi-arch manifest. When buildx tried to build for AMD64, it could only pull ARM64 layers because that's all the SHA pointed to.

**Evidence:**
```bash
# The pinned SHA returns ARM64
skopeo inspect docker://ubuntu@sha256:955364933d... | jq .Architecture
# Returns: "arm64"

# The correct multi-arch manifest SHA
skopeo inspect --format "{{.Digest}}" docker://ubuntu:24.04
# Returns: sha256:cd1dba651b3080c3686ecf4e3c4220f026b521fb76978881737d24f200828b2b
```

### Why Previous Fixes Didn't Work

All previous fixes (1-8) failed because they addressed the wrong problem:
- Adding `--platform` flags couldn't help - the SHA only had ARM64 layers
- Removing caches couldn't help - the SHA itself was wrong
- Adding `TARGETPLATFORM` couldn't help - still pulling from wrong SHA

### How the Wrong SHA Got There

The Dockerfile comment said to use `skopeo inspect --format "{{.Digest}}"` to get the SHA, but **all historical SHAs were ARM64-specific**. This suggests the automation (`release-engineer-beta:update-versions`) was getting the SHA incorrectly - likely via `docker pull` + `docker inspect` which returns the pulled architecture's digest, not the multi-arch manifest.

## Fix 9: Use Multi-Arch Manifest SHA (PR fix/ubuntu-multiarch-sha)

**The Fix:**
```dockerfile
# Old (ARM64-specific):
FROM ubuntu:24.04@sha256:955364933d0d91afa6e10fb045948c16d2b191114aa54bed3ab5430d8bbc58cc

# New (multi-arch manifest):
FROM ubuntu:24.04@sha256:cd1dba651b3080c3686ecf4e3c4220f026b521fb76978881737d24f200828b2b
```

**Also in this PR:**
- Re-enabled ARM64 builds (`platforms: linux/amd64,linux/arm64`)
- Removed debug diagnostic steps
- Added detailed comments to prevent future mistakes

**Local Testing Results:**
```bash
# AMD64 build
podman build --platform linux/amd64 --no-cache -t test:amd64 .
podman run --rm test:amd64 uname -m
# Returns: x86_64 ✅

# ARM64 build
podman build --platform linux/arm64 --no-cache -t test:arm64 .
podman run --rm test:arm64 uname -m
# Returns: aarch64 ✅
```

**Status:** ✅ CI passed - All three build workflows (ai-assistant-container, project-container, firewall-manager) completed successfully with multi-arch builds.

## Next Steps

1. ~~**Wait for CI** - Build workflows should pass with correct architectures~~ ✅ Done
2. **Merge PR and trigger Software Update workflow** - Should no longer fail with exec format error
3. **Delete this file** - Once Software Update workflow is green, this debug doc can be removed

## Changes Made in Fix

- [x] Updated Ubuntu SHA to multi-arch manifest digest
- [x] Added comments explaining multi-arch SHA requirements
- [x] Re-enabled ARM64 builds in all build workflows
- [x] Removed debug diagnostic steps from software-update workflow
- [x] Kept extracted script `.github/scripts/update-software-versions.sh` (useful refactor)
- [x] Updated project-container base image SHA to new multi-arch ai-assistant-home

## Key Files

| File | Purpose |
|------|---------|
| `.github/workflows/build-project-container.yml` | Builds project container |
| `.github/workflows/build-ai-assistant-container.yml` | Builds base AI assistant container |
| `.github/workflows/ai-assistant-container-software-version-update.yml` | Runs Claude Code to update versions (failing) |
| `.github/scripts/update-software-versions.sh` | Extracted script for version updates |
| `.github/actions/setup-container-build/action.yml` | Sets up QEMU + buildx |

## Related Issues & PRs

- **Issue #243**: Implement proper multi-architecture container builds (future work)
- **PR #236**: Temporarily disable ARM64 builds (merged)
- **docker/buildx#1044**: Known bug - registry cache only uploads from one node

## Relevant Commits

```bash
# AMD64-only fix
git show adc5554  # "fix(ci): temporarily disable ARM64 builds to fix exec format error"

# Debug diagnostics
git show dccfffc  # "refactor(ci): extract update script and add debug diagnostics"
```

## Verification Commands

```bash
# Trigger the debug run
gh workflow run "AI Assistant Container Software Update" --ref main

# Watch the run
gh run list --workflow="AI Assistant Container Software Update" --limit 1
gh run view <RUN_ID> --log

# Check debug output specifically
gh run view <RUN_ID> --log | grep -A20 "Container Diagnostics"
gh run view <RUN_ID> --log | grep -A20 "Script Diagnostics"
```
