# Testing Integration Plan - GitHub Issue #240

## Overview
Add a testing step to the CI/CD pipeline that validates container functionality using the existing `test.sh` script before running the Trivy security scan. The solution will support both Docker (CI) and Podman (local development) environments.

### Current Workflow
```
Build → Scan → Push
```

### New Workflow
```
Build → Test → Scan → Push
```

---

## Phase 1: Enhance test.sh for Multi-Runtime Support

### 1.1 Modify test.sh to Support Both Docker and Podman
- Add runtime detection logic to automatically use Docker or Podman
- Add environment variable override: `CONTAINER_RUNTIME` (docker/podman)
- Add environment variable for image tag: `IMAGE_TAG` (defaults to `test-migration`)
- Preserve existing behavior when run locally without environment variables

**Key Changes to test.sh:**
```bash
# Detect container runtime
CONTAINER_RUNTIME=${CONTAINER_RUNTIME:-$(command -v podman > /dev/null && echo "podman" || echo "docker")}
IMAGE_TAG=${IMAGE_TAG:-"test-migration"}

# Replace all "podman" commands with "$CONTAINER_RUNTIME"
```

### 1.2 Update Local Build Instructions
- Update `ai-assistant-container/README.md` to document the new environment variables
- Ensure local workflow remains unchanged by default

---

## Phase 2: Integrate Testing into CI/CD Pipeline

### 2.1 Update GitHub Actions Workflow
**File:** `.github/workflows/build-devcontainer.yml`

**Current job structure:**
```yaml
build-and-scan:
  - Build Docker image
  - Run Trivy scan
  - Push on success
```

**New job structure:**
```yaml
build-test-and-scan:
  - Set up QEMU (for multi-architecture builds)
  - Build Docker image (ARM64 + AMD64)
  - Run functionality tests (AMD64 on GitHub runners)
  - Run Trivy scan
  - Push on success
```

### 2.2 Add Multi-Architecture Build Support
Add QEMU emulation to enable building ARM64 images on AMD64 GitHub runners:

```yaml
- name: Set up QEMU
  uses: docker/setup-qemu-action@v3

- name: Set up Docker Buildx
  uses: docker/setup-buildx-action@v3
```

Update build step to support both architectures:
```yaml
- name: Build Docker image
  uses: docker/build-push-action@v5
  with:
    platforms: linux/arm64,linux/amd64  # Build both architectures
    # ... rest of config
```

### 2.3 Add Test Step to Workflow
Insert new step between "Build Docker image" and "Run Trivy vulnerability scanner":

```yaml
- name: Test container functionality
  id: test
  run: |
    cd ai-assistant-container
    # Test AMD64 variant on GitHub runners (which are AMD64)
    export DOCKER_DEFAULT_PLATFORM=linux/amd64
    CONTAINER_RUNTIME=docker IMAGE_TAG="${{ fromJSON(steps.meta.outputs.json).tags[0] }}" ./test.sh
```

### 2.4 Update Job Outputs and Conditions
- Add `test-passed` output to job
- Make scan step conditional on test success
- Make push step conditional on both test and scan success

---

## Phase 3: Error Handling and Reporting

### 3.1 Test Failure Handling
- Ensure test failures properly fail the CI job
- Provide clear error messages for debugging
- Maintain existing exit codes and error handling from test.sh

### 3.2 Documentation Updates
- Update `ai-assistant-container/README.md` with new testing workflow
- Document environment variables for both local and CI use
- Add troubleshooting section for test failures

---

## Phase 4: Validation and Rollout

### 4.1 Testing Strategy
- Test locally with both Podman
- Test in CI with pull request
- Verify all existing functionality remains intact

### 4.2 Rollout Plan
- Create feature branch for changes
- Test with sample PR
- Merge to main after validation
- Monitor first few builds for issues

---

## Technical Implementation Details

### Modified Workflow Structure
```yaml
build-test-and-scan:
  steps:
    - name: Set up QEMU  # NEW STEP
      uses: docker/setup-qemu-action@v3

    - name: Set up Docker Buildx
      uses: docker/setup-buildx-action@v3

    - name: Build Docker image  # UPDATED
      uses: docker/build-push-action@v5
      with:
        platforms: linux/arm64,linux/amd64  # Multi-architecture build
        # ... rest of existing config

    - name: Test container functionality  # NEW STEP
      id: test
      run: |
        cd ai-assistant-container
        # Test AMD64 variant on GitHub runners (which are AMD64)
        export DOCKER_DEFAULT_PLATFORM=linux/amd64
        CONTAINER_RUNTIME=docker IMAGE_TAG="${{ fromJSON(steps.meta.outputs.json).tags[0] }}" ./test.sh

    - name: Run Trivy vulnerability scanner
      # ... existing scan step

    - name: Push Docker image
      if: github.event_name == 'push' && steps.test.conclusion == 'success' && steps.scan.conclusion == 'success'
      # ... existing push step
```

### Enhanced test.sh Structure
```bash
#!/bin/bash
# Auto-detect or use environment variable
CONTAINER_RUNTIME=${CONTAINER_RUNTIME:-$(command -v podman > /dev/null && echo "podman" || echo "docker")}
IMAGE_TAG=${IMAGE_TAG:-"test-migration"}

echo "🔨 Building container with $CONTAINER_RUNTIME..."
if ! $CONTAINER_RUNTIME build -t $IMAGE_TAG . 2>&1; then
    echo "❌ ERROR: Container build failed"
    exit 1
fi

# ... rest of tests using $CONTAINER_RUNTIME and $IMAGE_TAG
```

---

## Benefits

1. **Early Failure Detection**: Catch functional issues before security scanning
2. **Consistent Testing**: Same test suite runs locally and in CI
3. **Multi-Runtime Support**: Works with both Docker and Podman
4. **Multi-Architecture Support**: Builds for both ARM64 (M-series Macs) and AMD64 (other systems)
5. **Native Performance**: ARM64 images provide native performance on M-series MacBooks
6. **Backward Compatible**: Existing local workflows unchanged
7. **Security-First**: Only scan containers that pass functional tests
8. **Clear Feedback**: Developers get immediate feedback on container functionality
9. **Architecture Flexibility**: Automatic architecture selection when pulling images

---

## Risks and Mitigation

1. **Risk**: Docker/Podman behavioral differences
   - **Mitigation**: Comprehensive testing in both environments

2. **Risk**: Architecture mismatch errors (ARM64 vs AMD64)
   - **Mitigation**: Added QEMU emulation and explicit platform selection for testing

3. **Risk**: CI runtime increase (multi-architecture builds take longer)
   - **Mitigation**: Tests are designed to run quickly (< 2 minutes), only test one architecture in CI

4. **Risk**: False positives blocking deployments
   - **Mitigation**: Thorough testing and clear error messages

5. **Risk**: QEMU emulation performance overhead during builds
   - **Mitigation**: Only affects CI build time, not runtime performance for end users

---

## Implementation Steps

### Step 1: Modify test.sh
- Add runtime detection logic
- Add environment variable support
- Test locally with both Docker and Podman

### Step 2: Update CI/CD Pipeline
- Add QEMU setup for multi-architecture builds
- Update build step to support ARM64 and AMD64
- Add test step to workflow with explicit AMD64 platform selection
- Update job conditions
- Test with pull request

### Step 3: Update Documentation
- Update README.md
- Document new environment variables
- Add troubleshooting guide

### Step 4: Validate and Deploy
- Test failure scenarios
- Monitor initial deployments
- Gather feedback and iterate

This plan addresses GitHub issue #240 by adding the requested testing step between build and scan while maintaining support for both local development (Podman) and CI environments (Docker).