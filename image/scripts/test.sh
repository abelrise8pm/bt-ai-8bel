#!/bin/bash
# Test script for validating container build and functionality
# Returns 0 on success, 1 on any failure

set -e  # Exit on any error

# Check for required environment variables
check_env_vars() {
    local missing_vars=()

    echo "🔍 Checking required environment variables..."

    # Check if variables are already set
    if [[ -z "${ANTHROPIC_API_KEY:-}" ]]; then
        missing_vars+=("ANTHROPIC_API_KEY")
    fi

    if [[ -z "${GEMINI_API_KEY:-}" ]]; then
        missing_vars+=("GEMINI_API_KEY")
    fi

    if [[ -z "${GITHUB_PACKAGE_READ_TOKEN:-}" ]]; then
        missing_vars+=("GITHUB_PACKAGE_READ_TOKEN")
    fi

    # If variables are missing, try to load from .env file
    if [[ ${#missing_vars[@]} -gt 0 ]]; then
        echo "⚠️  Some environment variables not found. Attempting to load from .env file..."

        if [[ -f ".env" ]]; then
            echo "📁 Found .env file. Loading environment variables..."
            # Source the .env file to load variables
            set -a  # automatically export all variables
            source .env
            set +a  # turn off automatic export

            # Re-check if variables are now set
            missing_vars=()
            if [[ -z "${ANTHROPIC_API_KEY:-}" ]]; then
                missing_vars+=("ANTHROPIC_API_KEY")
            fi

            if [[ -z "${GEMINI_API_KEY:-}" ]]; then
                missing_vars+=("GEMINI_API_KEY")
            fi

            if [[ -z "${GITHUB_PACKAGE_READ_TOKEN:-}" ]]; then
                missing_vars+=("GITHUB_PACKAGE_READ_TOKEN")
            fi
        fi

        # If still missing after trying .env file, fail
        if [[ ${#missing_vars[@]} -gt 0 ]]; then
            echo "❌ ERROR: Missing required environment variables:"
            for var in "${missing_vars[@]}"; do
                echo "  - $var"
            done
            echo ""
            echo "Please either:"
            echo "  1. Set environment variables directly:"
            echo "     export ANTHROPIC_API_KEY=your_anthropic_key_here"
            echo "     export GEMINI_API_KEY=your_gemini_key_here"
            echo "     export GITHUB_PACKAGE_READ_TOKEN=your_github_token_here"
            echo "  2. Or create a .env file with these variables"
            echo ""
            echo "These are required for testing Claude Code, Goose, and Gemini CLI functionality."
            echo ""
            echo "For GITHUB_PACKAGE_READ_TOKEN: This token needs 'read:packages' permission"
            echo "to access @rise8-us/dev-commands-mcp-server from GitHub Packages."
            echo "See: /workspaces/XPai/mcp/dev-commands/README.md#authentication-for-github-packages"
            exit 1
        fi
    fi

    echo "✅ All required environment variables are set"
}

# Check environment variables before proceeding
check_env_vars

# Auto-detect container runtime or use environment variable
CONTAINER_RUNTIME=${CONTAINER_RUNTIME:-$(command -v podman > /dev/null && echo "podman" || echo "docker")}
if ! command -v "$CONTAINER_RUNTIME" > /dev/null; then
    echo "❌ ERROR: Container runtime '$CONTAINER_RUNTIME' not found. Please install 'podman' or 'docker'."
    exit 1
fi
IMAGE_TAG=${IMAGE_TAG:-"test-ai-assistant-container"}

# Always delete existing test-ai-assistant-container image to ensure fresh build
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

    # Create a temporary file for the GitHub token (more compatible with both Docker and Podman)
    TOKEN_FILE=$(mktemp)
    echo "$GITHUB_PACKAGE_READ_TOKEN" > "$TOKEN_FILE"

    # Use BuildKit secrets to pass the GitHub token securely
    if ! $CONTAINER_RUNTIME build --no-cache --secret id=github_token,src="$TOKEN_FILE" -t $IMAGE_TAG . 2>&1; then
        rm -f "$TOKEN_FILE"
        echo "❌ ERROR: Container build failed"
        exit 1
    fi

    # Clean up the temporary file
    rm -f "$TOKEN_FILE"
    echo "✅ Container build successful"
fi

echo "🧪 Testing installed tools..."

# Test each tool and capture output
echo "Testing Node.js..."
NODE_VERSION=$($CONTAINER_RUNTIME run --rm $IMAGE_TAG /bin/bash -c "node --version" 2>&1)
if [[ ! "$NODE_VERSION" =~ ^v22\. ]]; then
    echo "❌ ERROR: Node.js version incorrect. Expected v22.x, got: $NODE_VERSION"
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
GOOSE_INFO=$($CONTAINER_RUNTIME run --rm -e ANTHROPIC_API_KEY="$ANTHROPIC_API_KEY" $IMAGE_TAG /bin/bash -c "goose run -t 'Say hello'" 2>&1) || {
    echo "❌ ERROR: Goose run command failed: $GOOSE_INFO"
    exit 1
}
echo "✅ Goose run command working. Configuration file tested."

echo "Testing Claude Code functional integration..."
CLAUDE_FUNCTIONAL=$($CONTAINER_RUNTIME run --rm -e ANTHROPIC_API_KEY="$ANTHROPIC_API_KEY" $IMAGE_TAG /bin/bash -c "claude -p 'Say hello'" 2>&1) || {
    echo "❌ ERROR: Claude Code functional test failed: $CLAUDE_FUNCTIONAL"
    exit 1
}
echo "✅ Claude Code functional integration working."

echo "Testing Gemini CLI functional integration..."
GEMINI_FUNCTIONAL=$($CONTAINER_RUNTIME run --rm -e GEMINI_API_KEY="$GEMINI_API_KEY" $IMAGE_TAG /bin/bash -c "gemini -p 'Say hello'" 2>&1) || {
    echo "❌ ERROR: Gemini CLI functional test failed: $GEMINI_FUNCTIONAL"
    exit 1
}
echo "✅ Gemini CLI functional integration working."


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

echo "Testing OCI metadata labels for container provenance..."

# Skip OCI metadata check for local builds (only check for remote registry images)
if [[ "$IMAGE_TAG" =~ ^(ghcr\.io/|[^/]+\.[^/]+/) ]]; then
    # Get image metadata in JSON format and check for required OCI labels
    IMAGE_LABELS=$($CONTAINER_RUNTIME inspect $IMAGE_TAG --format='{{json .Config.Labels}}' 2>&1)
    if [[ $? -ne 0 ]]; then
        echo "❌ ERROR: Failed to inspect image labels: $IMAGE_LABELS"
        exit 1
    fi

    # Check for required OCI metadata labels
    REQUIRED_LABELS=("org.opencontainers.image.revision" "org.opencontainers.image.created" "org.opencontainers.image.source" "org.opencontainers.image.url")
    MISSING_LABELS=()

    for label in "${REQUIRED_LABELS[@]}"; do
        if ! echo "$IMAGE_LABELS" | jq -e --arg label "$label" 'has($label)' >/dev/null 2>&1; then
            MISSING_LABELS+=("$label")
        fi
    done

    if [[ ${#MISSING_LABELS[@]} -gt 0 ]]; then
        echo "❌ ERROR: Missing required OCI metadata labels:"
        for label in "${MISSING_LABELS[@]}"; do
            echo "  - $label"
        done
        echo ""
        echo "Current labels:"
        echo "$IMAGE_LABELS" | jq -r 'to_entries[] | "  \(.key): \(.value)"'
        exit 1
    fi

    # Display the provenance metadata labels
    echo "✅ OCI metadata labels present:"
    for label in "${REQUIRED_LABELS[@]}"; do
        VALUE=$(echo "$IMAGE_LABELS" | jq -r --arg label "$label" '.[$label] // "null"')
        echo "  $label: $VALUE"
    done
else
    echo "⏭️ Skipping OCI metadata label check for local build (labels are added by CI process)"
fi

echo "Testing security: .npmrc credentials not persisted..."
NPMRC_CHECK=$($CONTAINER_RUNTIME run --rm $IMAGE_TAG /bin/bash -c "ls -la ~/.npmrc 2>/dev/null || echo 'file not found'" 2>&1)
if [[ "$NPMRC_CHECK" != "file not found" ]]; then
    echo "❌ ERROR: Security issue - .npmrc file with GitHub token still present in container:"
    echo "$NPMRC_CHECK"
    echo "This could leak the GITHUB_PACKAGE_READ_TOKEN. The Dockerfile should remove .npmrc after npm install."
    exit 1
fi
echo "✅ Security: .npmrc credentials properly cleaned up"

echo "Testing Claude Code init script..."
CLAUDE_INIT_CHECK=$($CONTAINER_RUNTIME run --rm $IMAGE_TAG /bin/bash -c "ls -la ~/.claude/claude_code_init.sh" 2>&1)
if [[ $? -ne 0 ]]; then
    echo "❌ ERROR: Claude init script not found: $CLAUDE_INIT_CHECK"
    exit 1
fi
echo "✅ Claude init script present"

echo "Testing MCP dev-commands server installation..."
MCP_SERVER_CHECK=$($CONTAINER_RUNTIME run --rm $IMAGE_TAG /bin/bash -c "ls -la ~/.npm-global/lib/node_modules/@rise8-us/dev-commands-mcp-server/dist/index.js" 2>&1)
if [[ $? -ne 0 ]]; then
    echo "❌ ERROR: MCP dev-commands server not found at expected path: $MCP_SERVER_CHECK"
    exit 1
fi
echo "✅ MCP dev-commands server installed"

echo "🎉 All tests passed! Container is ready."
exit 0