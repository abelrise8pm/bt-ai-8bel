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

### Confirmed Facts
- ✅ Script is valid (runs locally, no BOM/CRLF)
- ✅ Container can execute commands (via emulation)
- ❌ Container has ARM64 binaries (`uname -m` = `aarch64`)
- ❌ Build warning confirms: `InvalidBaseImagePlatform: ... pulled with platform "linux/arm64"`
- ❌ `docker inspect` is misleading - reports manifest arch, not actual binary arch

### Root Cause
**Buildx is producing ARM64 binaries when targeting AMD64.** The manifest metadata says `amd64`, but the actual layers contain ARM64 binaries. This is a buildx bug, not a workflow or script issue.

## Next Steps

1. **Merge fix/amd64-only-build to main** - includes debug diagnostics (will confirm in CI)
2. **Fix the build process** - the issue is in buildx, not the workflow:
   - Option A: Try separate single-arch builds with `imagetools create` (see issue #243)
   - Option B: Try different buildx driver (`docker-container` with fresh builder)
   - Option C: Investigate why buildx pulls wrong base image platform
3. **Clean up**: Remove debug steps once build is fixed

## Changes to Undo After Resolution

Once the issue is fixed, consider reverting:
- [ ] Debug diagnostic steps in `ai-assistant-container-software-version-update.yml`
- [ ] (Maybe) Re-enable ARM64 builds once proper multi-arch solution is implemented (issue #243)

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
