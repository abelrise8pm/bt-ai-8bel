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

**Result**: 🔄 PENDING - needs merge to main and workflow trigger to test.

## Current Status

### What We Know
- All three container builds pass (AMD64-only)
- `docker inspect` reports `amd64` architecture
- Build logs show warning: `InvalidBaseImagePlatform: ... pulled with platform "linux/arm64"`
- Software Update workflow fails with `exec format error`

### Open Questions
The `exec format error` could be caused by:

| Hypothesis | Evidence For | Evidence Against |
|------------|--------------|------------------|
| ARM64 binaries in container | Build warning about wrong platform | `docker inspect` shows amd64 |
| Script file corruption (BOM/CRLF) | Inline YAML is fragile | Script looks correct in logs |
| Something else entirely | We haven't proven it's architecture | - |

### What the Debug Run Will Tell Us

| Diagnostic | If Passes | If Fails |
|------------|-----------|----------|
| `/bin/echo "Hello"` | Container can execute binaries | Container has wrong arch binaries |
| `file /bin/bash` | Shows actual binary architecture | - |
| `uname -m` | Shows kernel arch seen by container | - |
| Script hex dump | Shows if BOM (EF BB BF) or CRLF (0d 0a) present | - |

## Next Steps

1. **Merge fix/amd64-only-build to main** - includes debug diagnostics
2. **Trigger Software Update workflow** - `gh workflow run "AI Assistant Container Software Update"`
3. **Analyze debug output** to determine actual root cause
4. **If architecture issue confirmed**: Implement separate single-arch builds (see issue #243)
5. **If script issue**: Fix the script handling
6. **Clean up**: Remove debug steps once issue is resolved

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
