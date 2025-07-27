#!/bin/bash
# Test script for validating container build and functionality
# Returns 0 on success, 1 on any failure

set -e  # Exit on any error

# Auto-detect container runtime or use environment variable
CONTAINER_RUNTIME=${CONTAINER_RUNTIME:-$(command -v podman > /dev/null && echo "podman" || echo "docker")}
if ! command -v "$CONTAINER_RUNTIME" > /dev/null; then
    echo "❌ ERROR: Container runtime '$CONTAINER_RUNTIME' not found. Please install 'podman' or 'docker'."
    exit 1
fi
IMAGE_TAG=${IMAGE_TAG:-"test-migration"}

# Always delete existing test-migration image to ensure fresh build
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
    echo "🔨 Building container locally with $CONTAINER_RUNTIME..."
    if ! $CONTAINER_RUNTIME build -t $IMAGE_TAG . 2>&1; then
        echo "❌ ERROR: Container build failed"
        exit 1
    fi
    echo "✅ Container build successful"
fi

echo "🧪 Testing installed tools..."

# Test each tool and capture output
echo "Testing Node.js..."
NODE_VERSION=$($CONTAINER_RUNTIME run --rm $IMAGE_TAG /bin/bash -c "node --version" 2>&1)
if [[ ! "$NODE_VERSION" =~ ^v22\.17\. ]]; then
    echo "❌ ERROR: Node.js version incorrect. Expected v22.17.x, got: $NODE_VERSION"
    exit 1
fi
echo "✅ Node.js: $NODE_VERSION"

echo "Testing Claude Code..."
CLAUDE_VERSION=$($CONTAINER_RUNTIME run --rm $IMAGE_TAG /bin/bash -c "claude --version" 2>&1) || {
    echo "❌ ERROR: Claude Code not installed or not working: $CLAUDE_VERSION"
    exit 1
}
echo "✅ Claude Code: $CLAUDE_VERSION"

echo "Testing Gemini CLI..."
GEMINI_VERSION=$($CONTAINER_RUNTIME run --rm $IMAGE_TAG /bin/bash -c "gemini --version" 2>&1) || {
    echo "❌ ERROR: Gemini CLI not installed or not working: $GEMINI_VERSION"
    exit 1
}
echo "✅ Gemini CLI: $GEMINI_VERSION"

echo "Testing Goose..."
GOOSE_VERSION=$($CONTAINER_RUNTIME run --rm $IMAGE_TAG /bin/bash -c "goose --version" 2>&1) || {
    echo "❌ ERROR: Goose not installed or not working: $GOOSE_VERSION"
    exit 1
}
echo "✅ Goose: $GOOSE_VERSION"

echo "Testing Goose configuration..."
GOOSE_INFO=$($CONTAINER_RUNTIME run --rm --env-file ../.env $IMAGE_TAG /bin/bash -c "goose run -t 'Say hello'" 2>&1) || {
    echo "❌ ERROR: Goose run command failed: $GOOSE_INFO"
    exit 1
}
echo "✅ Goose run command working. Configuration file tested."


echo "Testing Git..."
GIT_VERSION=$($CONTAINER_RUNTIME run --rm $IMAGE_TAG /bin/bash -c "git --version" 2>&1)
if [[ $? -ne 0 ]]; then
    echo "❌ ERROR: Git not installed: $GIT_VERSION"
    exit 1
fi
echo "✅ Git: $GIT_VERSION"

echo "Testing curl..."
CURL_VERSION=$($CONTAINER_RUNTIME run --rm $IMAGE_TAG /bin/bash -c "curl --version | head -1" 2>&1)
if [[ $? -ne 0 ]]; then
    echo "❌ ERROR: curl not installed: $CURL_VERSION"
    exit 1
fi
echo "✅ curl: $CURL_VERSION"

echo "Testing jq..."
JQ_VERSION=$($CONTAINER_RUNTIME run --rm $IMAGE_TAG /bin/bash -c "jq --version" 2>&1)
if [[ $? -ne 0 ]]; then
    echo "❌ ERROR: jq not installed: $JQ_VERSION"
    exit 1
fi
echo "✅ jq: $JQ_VERSION"

echo "Testing user setup..."
USER_CHECK=$($CONTAINER_RUNTIME run --rm $IMAGE_TAG /bin/bash -c "whoami" 2>&1)
if [[ "$USER_CHECK" != "aiAssistant" ]]; then
    echo "❌ ERROR: Wrong user. Expected 'aiAssistant', got: $USER_CHECK"
    exit 1
fi
echo "✅ User: $USER_CHECK"

echo "Testing Claude Code init script..."
CLAUDE_INIT_CHECK=$($CONTAINER_RUNTIME run --rm $IMAGE_TAG /bin/bash -c "ls -la ~/.claude/claude_code_init.sh" 2>&1)
if [[ $? -ne 0 ]]; then
    echo "❌ ERROR: Claude init script not found: $CLAUDE_INIT_CHECK"
    exit 1
fi
echo "✅ Claude init script present"

echo "🎉 All tests passed! Container is ready."
exit 0