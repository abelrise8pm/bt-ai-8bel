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
CLAUDE_VERSION=$(podman run --rm test-migration /bin/bash -c "claude --version" 2>&1) || {
    echo "❌ ERROR: Claude Code not installed or not working: $CLAUDE_VERSION"
    exit 1
}
echo "✅ Claude Code: $CLAUDE_VERSION"

echo "Testing Gemini CLI..."
GEMINI_VERSION=$(podman run --rm test-migration /bin/bash -c "gemini --version" 2>&1) || {
    echo "❌ ERROR: Gemini CLI not installed or not working: $GEMINI_VERSION"
    exit 1
}
echo "✅ Gemini CLI: $GEMINI_VERSION"

echo "Testing Goose..."
GOOSE_VERSION=$(podman run --rm test-migration /bin/bash -c "timeout 10 goose --help 2>&1 | head -1 || echo 'timeout or error'")
if [[ "$GOOSE_VERSION" == *"timeout or error"* ]]; then
    echo "❌ ERROR: Goose not working (timeout or error): $GOOSE_VERSION"
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