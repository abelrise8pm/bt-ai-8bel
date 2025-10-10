#!/bin/bash
# Test script for validating project container build and functionality
# Returns 0 on success, 1 on any failure

set -e  # Exit on any error

# Use CONTAINER_RUNTIME environment variable, default to podman
CONTAINER_RUNTIME=${CONTAINER_RUNTIME:-podman}

# Check for container runtime
if ! command -v "$CONTAINER_RUNTIME" > /dev/null; then
    echo "❌ ERROR: $CONTAINER_RUNTIME not found. Please install $CONTAINER_RUNTIME."
    exit 1
fi

echo "Using container runtime: $CONTAINER_RUNTIME"
IMAGE_TAG=${IMAGE_TAG:-"test-project-container"}

# Always delete existing test-dev-container image to ensure fresh build
if $CONTAINER_RUNTIME image inspect $IMAGE_TAG >/dev/null 2>&1; then
    echo "🗑️ Deleting existing image: $IMAGE_TAG"
    $CONTAINER_RUNTIME rmi $IMAGE_TAG >/dev/null 2>&1 || true
fi

# Smart image resolution: pull remote image or build locally
if [[ "$IMAGE_TAG" =~ ^[^/]+\.[^/]+/.* ]]; then
    echo "🔄 Pulling remote image: $IMAGE_TAG"
    if ! $CONTAINER_RUNTIME pull $IMAGE_TAG; then
        echo "❌ ERROR: Failed to pull image $IMAGE_TAG"
        exit 1
    fi
    echo "✅ Remote image pulled successfully"
else
    echo "🔨 Building $IMAGE_TAG container locally with $CONTAINER_RUNTIME..."
    if ! $CONTAINER_RUNTIME build --no-cache -t $IMAGE_TAG . 2>&1; then
        echo "❌ ERROR: Container build failed"
        exit 1
    fi
    echo "✅ Container build successful"
fi

echo "🧪 Testing project container specific tools..."

# Test project container additions only (base image tools are tested separately)

# Test wget
echo "Testing wget..."
WGET_VERSION=$($CONTAINER_RUNTIME run --rm $IMAGE_TAG /bin/bash -c "wget --version | head -n 1" 2>&1) || {
    echo "❌ ERROR: wget not installed or not working: $WGET_VERSION"
    exit 1
}
echo "✅ wget: $WGET_VERSION"

echo "🎉 All tests passed! Project container is ready."
exit 0