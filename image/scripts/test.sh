#!/bin/bash
# Test script for validating container build and functionality
# Returns 0 on success, 1 on any failure

set -e  # Exit on any error

# Determine script directory and project root
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
IMAGE_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
REPO_ROOT="$(cd "$IMAGE_DIR/.." && pwd)"

# Check for required environment variables
check_env_vars() {
    local missing_vars=()

    echo "🔍 Checking required environment variables..."

    # Check if variables are already set
    if [[ -z "${ANTHROPIC_API_KEY:-}" ]]; then
        missing_vars+=("ANTHROPIC_API_KEY")
    fi

    # If variables are missing, try to load from .env file
    if [[ ${#missing_vars[@]} -gt 0 ]]; then
        echo "⚠️  Some environment variables not found. Attempting to load from .env file..."

        # Look for .env in multiple locations (in order of precedence)
        ENV_FILE=""
        if [[ -f "$REPO_ROOT/.env" ]]; then
            ENV_FILE="$REPO_ROOT/.env"
        elif [[ -f "$IMAGE_DIR/.env" ]]; then
            ENV_FILE="$IMAGE_DIR/.env"
        elif [[ -f ".env" ]]; then
            ENV_FILE=".env"
        fi

        if [[ -n "$ENV_FILE" ]]; then
            echo "📁 Found .env file at: $ENV_FILE"
            echo "📁 Loading environment variables..."
            # Source the .env file to load variables
            set -a  # automatically export all variables
            source "$ENV_FILE"
            set +a  # turn off automatic export

            # Re-check if variables are now set
            missing_vars=()
            if [[ -z "${ANTHROPIC_API_KEY:-}" ]]; then
                missing_vars+=("ANTHROPIC_API_KEY")
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
            echo "  2. Or create a .env file with these variables"
            echo ""
            echo "This is required for testing Claude Code functionality."
            exit 1
        fi
    fi

    echo "✅ All required environment variables are set"
}

# Check environment variables before proceeding
check_env_vars

# Change to image directory for builds (after checking env vars)
cd "$IMAGE_DIR"

# Auto-detect container runtime or use environment variable
CONTAINER_RUNTIME=${CONTAINER_RUNTIME:-$(command -v podman > /dev/null && echo "podman" || echo "docker")}
if ! command -v "$CONTAINER_RUNTIME" > /dev/null; then
    echo "❌ ERROR: Container runtime '$CONTAINER_RUNTIME' not found. Please install 'podman' or 'docker'."
    exit 1
fi
IMAGE_TAG=${IMAGE_TAG:-"test-ai-assistant-container"}

# Helper: run a command in the container
run_container() { $CONTAINER_RUNTIME run --rm "$@" $IMAGE_TAG /bin/bash -c "$CONTAINER_CMD"; }

# Helper: run an interactive login shell in the container (for init script tests)
run_container_login() { $CONTAINER_RUNTIME run --rm "$@" $IMAGE_TAG /bin/bash -lic "$CONTAINER_CMD" 2>/dev/null; }

# Helper: check a tool version is installed
check_tool() {
    local name=$1 cmd=$2
    echo "Testing $name..."
    local version
    version=$(CONTAINER_CMD="$cmd" run_container 2>&1) || {
        echo "❌ ERROR: $name not installed or not working: $version"
        exit 1
    }
    echo "✅ $name: $version"
}

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

    # Build the container image
    if ! $CONTAINER_RUNTIME build --no-cache -t $IMAGE_TAG . 2>&1; then
        echo "❌ ERROR: Container build failed"
        exit 1
    fi

    echo "✅ Container build successful"
fi

echo "🧪 Testing installed tools..."

check_tool "Claude Code" "claude --version"
check_tool "OpenCode" "opencode --version"
check_tool "Pi" "pi --version"
check_tool "Git" "git --version"
check_tool "curl" "curl --version | head -1"
check_tool "jq" "jq --version"
check_tool "ripgrep" "rg --version | head -1"
check_tool "fd" "fd --version"

echo "Testing Claude Code functional integration..."
CLAUDE_FUNCTIONAL=$(CONTAINER_CMD="claude -p 'Say hello'" run_container -e ANTHROPIC_API_KEY="$ANTHROPIC_API_KEY" 2>&1) || {
    echo "❌ ERROR: Claude Code functional test failed: $CLAUDE_FUNCTIONAL"
    exit 1
}
echo "✅ Claude Code functional integration working"

echo "Testing OpenCode functional integration..."
OPENCODE_FUNCTIONAL=$(CONTAINER_CMD="opencode run 'Say hello'" run_container -e ANTHROPIC_API_KEY="$ANTHROPIC_API_KEY" 2>&1) || {
    echo "❌ ERROR: OpenCode functional test failed: $OPENCODE_FUNCTIONAL"
    exit 1
}
echo "✅ OpenCode functional integration working"

echo "Testing Pi functional integration..."
PI_FUNCTIONAL=$(CONTAINER_CMD="pi -p --provider anthropic --model claude-sonnet-4-20250514 'Say hello'" run_container -e ANTHROPIC_API_KEY="$ANTHROPIC_API_KEY" 2>&1) || {
    echo "❌ ERROR: Pi functional test failed: $PI_FUNCTIONAL"
    exit 1
}
echo "✅ Pi functional integration working"

echo "Testing user setup..."
USER_CHECK=$(CONTAINER_CMD="whoami" run_container 2>&1)
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

echo "Testing Claude Code init script location..."
CLAUDE_INIT_CHECK=$(CONTAINER_CMD="test -x /usr/local/bin/claude-code-init.sh && echo found" run_container 2>&1)
if [[ "$CLAUDE_INIT_CHECK" != "found" ]]; then
    echo "❌ ERROR: Claude init script not found at /usr/local/bin/claude-code-init.sh"
    exit 1
fi
echo "✅ Claude init script at /usr/local/bin/claude-code-init.sh"

TEST_API_KEY=sk-ant-test-ABCDEFGHIJKLMNOPQRST

echo "Testing init script creates ~/.claude.json with API key approval..."
INIT_API_CHECK=$(CONTAINER_CMD="cat ~/.claude.json 2>/dev/null" run_container_login -e ANTHROPIC_API_KEY=$TEST_API_KEY)
if ! echo "$INIT_API_CHECK" | jq -e '.hasTrustDialogAccepted == true' >/dev/null 2>&1; then
    echo "❌ ERROR: hasTrustDialogAccepted not set in ~/.claude.json"
    echo "$INIT_API_CHECK"
    exit 1
fi
if ! echo "$INIT_API_CHECK" | jq -e '.customApiKeyResponses.approved | index("ABCDEFGHIJKLMNOPQRST")' >/dev/null 2>&1; then
    echo "❌ ERROR: API key last 20 chars not approved in ~/.claude.json"
    echo "$INIT_API_CHECK"
    exit 1
fi
echo "✅ Init script creates ~/.claude.json with API key approval"

echo "Testing init script works without API key (Bedrock mode)..."
INIT_BEDROCK_CHECK=$(CONTAINER_CMD="cat ~/.claude.json 2>/dev/null" run_container_login)
if ! echo "$INIT_BEDROCK_CHECK" | jq -e '.hasTrustDialogAccepted == true' >/dev/null 2>&1; then
    echo "❌ ERROR: hasTrustDialogAccepted not set without API key"
    echo "$INIT_BEDROCK_CHECK"
    exit 1
fi
if echo "$INIT_BEDROCK_CHECK" | jq -e 'has("customApiKeyResponses")' >/dev/null 2>&1; then
    echo "❌ ERROR: customApiKeyResponses should not exist without API key"
    echo "$INIT_BEDROCK_CHECK"
    exit 1
fi
echo "✅ Init script works without API key (Bedrock mode)"

echo "Testing init script is idempotent (preserves existing state)..."
INIT_IDEMPOTENT_CHECK=$(CONTAINER_CMD='
    jq ".hasCompletedOnboarding = true" ~/.claude.json > /tmp/c.json && mv /tmp/c.json ~/.claude.json
    claude-code-init.sh 2>/dev/null
    cat ~/.claude.json 2>/dev/null
' run_container_login -e ANTHROPIC_API_KEY=$TEST_API_KEY)
if ! echo "$INIT_IDEMPOTENT_CHECK" | jq -e '.hasCompletedOnboarding == true' >/dev/null 2>&1; then
    echo "❌ ERROR: Init script overwrote existing state in ~/.claude.json"
    echo "$INIT_IDEMPOTENT_CHECK"
    exit 1
fi
if ! echo "$INIT_IDEMPOTENT_CHECK" | jq -e '.hasTrustDialogAccepted == true' >/dev/null 2>&1; then
    echo "❌ ERROR: Init script lost hasTrustDialogAccepted after re-run"
    echo "$INIT_IDEMPOTENT_CHECK"
    exit 1
fi
echo "✅ Init script is idempotent (preserves existing state)"

echo "Testing init script does not write ~/.claude/settings.json..."
SETTINGS_CHECK=$(CONTAINER_CMD="test -f ~/.claude/settings.json && echo EXISTS || echo NOT_CREATED" \
    run_container_login -e ANTHROPIC_API_KEY=$TEST_API_KEY)
if [[ "$SETTINGS_CHECK" != "NOT_CREATED" ]]; then
    echo "❌ ERROR: Init script should not create ~/.claude/settings.json (DISABLE_AUTOUPDATER is set via ENV)"
    exit 1
fi
echo "✅ Init script does not write ~/.claude/settings.json"

VOLUME_NAME="test-claude-config-$$"
trap '$CONTAINER_RUNTIME volume rm "$VOLUME_NAME" >/dev/null 2>&1 || true' EXIT

echo "Testing volume mount: init script not shadowed..."
VOLUME_INIT_CHECK=$(CONTAINER_CMD="cat ~/.claude.json 2>/dev/null" \
    run_container_login -v "$VOLUME_NAME:/home/aiAssistant/.claude" -e ANTHROPIC_API_KEY=$TEST_API_KEY)
if ! echo "$VOLUME_INIT_CHECK" | jq -e '.hasTrustDialogAccepted == true' >/dev/null 2>&1; then
    echo "❌ ERROR: Init script was shadowed by volume mount"
    echo "$VOLUME_INIT_CHECK"
    exit 1
fi
echo "✅ Init script runs correctly with volume mount"

echo "Testing volume mount: settings.json persists across rebuilds..."
CONTAINER_CMD='echo "{\"myCustomSetting\": true}" > ~/.claude/settings.json' \
    run_container -v "$VOLUME_NAME:/home/aiAssistant/.claude" >/dev/null 2>&1
PERSIST_CHECK=$(CONTAINER_CMD="cat ~/.claude/settings.json" \
    run_container -v "$VOLUME_NAME:/home/aiAssistant/.claude" 2>&1)
if ! echo "$PERSIST_CHECK" | jq -e '.myCustomSetting == true' >/dev/null 2>&1; then
    echo "❌ ERROR: Settings did not persist across container runs"
    echo "$PERSIST_CHECK"
    exit 1
fi
echo "✅ Settings persist across container rebuilds"

echo "Testing Claude Code slash commands..."
COMMAND_CHECK=$(CONTAINER_CMD="test -f ~/.claude/commands/commit.md && echo found" run_container 2>&1)
if [[ "$COMMAND_CHECK" != "found" ]]; then
    echo "❌ ERROR: Slash command file not found at ~/.claude/commands/commit.md"
    exit 1
fi
echo "✅ Claude Code slash commands installed"

echo "Testing clock skew script exists and is executable..."
CLOCK_SCRIPT_CHECK=$(CONTAINER_CMD="test -x /usr/local/bin/check-clock-skew.sh && echo found" run_container 2>&1)
if [[ "$CLOCK_SCRIPT_CHECK" != "found" ]]; then
    echo "❌ ERROR: Clock skew script not found at /usr/local/bin/check-clock-skew.sh"
    exit 1
fi
echo "✅ Clock skew script at /usr/local/bin/check-clock-skew.sh"

echo "Testing clock skew script exits cleanly when disabled..."
CLOCK_DISABLED_CHECK=$(CONTAINER_CMD="CLOCK_CHECK_DISABLED=1 check-clock-skew.sh && echo ok" run_container 2>&1)
if [[ "$CLOCK_DISABLED_CHECK" != "ok" ]]; then
    echo "❌ ERROR: Clock skew script failed when CLOCK_CHECK_DISABLED=1"
    echo "$CLOCK_DISABLED_CHECK"
    exit 1
fi
echo "✅ Clock skew script exits cleanly when disabled"

echo "Testing clock skew script exits cleanly when endpoint unreachable..."
CLOCK_UNREACHABLE_CHECK=$(CONTAINER_CMD="CLOCK_CHECK_URL=https://192.0.2.1:9999 check-clock-skew.sh && echo ok" run_container 2>&1)
if [[ "$CLOCK_UNREACHABLE_CHECK" != "ok" ]]; then
    echo "❌ ERROR: Clock skew script failed with unreachable endpoint"
    echo "$CLOCK_UNREACHABLE_CHECK"
    exit 1
fi
echo "✅ Clock skew script exits cleanly when endpoint unreachable"

echo "Testing date binary has cap_sys_time file capability..."
DATE_CAP_CHECK=$(CONTAINER_CMD="apt-get update -qq >/dev/null 2>&1 && apt-get install -y -qq libcap2-bin >/dev/null 2>&1 && getcap /usr/bin/date" run_container --user root 2>&1)
if [[ "$DATE_CAP_CHECK" != *"cap_sys_time"* ]]; then
    echo "❌ ERROR: /usr/bin/date missing cap_sys_time capability"
    echo "  Got: $DATE_CAP_CHECK"
    exit 1
fi
echo "✅ date binary has cap_sys_time file capability"

echo "Testing Claude Code OTEL configuration..."
OTEL_CHECK=$(CONTAINER_CMD='
    errors=0
    [ "$CLAUDE_CODE_ENABLE_TELEMETRY" = "1" ] || { echo "CLAUDE_CODE_ENABLE_TELEMETRY not set"; errors=1; }
    [ "$OTEL_METRICS_EXPORTER" = "otlp" ] || { echo "OTEL_METRICS_EXPORTER not set"; errors=1; }
    [ "$OTEL_LOGS_EXPORTER" = "otlp" ] || { echo "OTEL_LOGS_EXPORTER not set"; errors=1; }
    [ -n "$OTEL_EXPORTER_OTLP_ENDPOINT" ] || { echo "OTEL_EXPORTER_OTLP_ENDPOINT not set"; errors=1; }
    exit $errors
' run_container 2>&1) || {
    echo "❌ ERROR: OTEL environment variables not configured correctly"
    echo "$OTEL_CHECK"
    exit 1
}
echo "✅ Claude Code OTEL: configured"

echo "🎉 All tests passed! Container is ready."
exit 0