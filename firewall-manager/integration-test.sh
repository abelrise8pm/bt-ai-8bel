#!/usr/bin/env bash
# Integration tests for firewall-manager container
#
# PURPOSE: Verify the firewall manager blocks outbound traffic from the AI container.
#
# ARCHITECTURE: Uses docker-compose.firewall.yml from starter/.devcontainer/
# with a test overlay to use locally built images.
#
# USAGE: ./integration-test.sh [IMAGE_TAG]
#   IMAGE_TAG: Optional image tag to test (default: firewall-manager:test)
#
# ENVIRONMENT:
#   CONTAINER_RUNTIME: docker or podman (auto-detected if not set)
#   IMAGE_TAG: Override the firewall-manager image to test

set -eu

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

TESTS_PASSED=0
TESTS_FAILED=0

# Image tag to test (allow override via command line argument or env var)
export IMAGE_TAG="${1:-${IMAGE_TAG:-firewall-manager:test}}"

# Test container names (defined in docker-compose.test.yml)
FIREWALL_CONTAINER="fwtest-firewall-manager"
AI_CONTAINER="fwtest-ai-assistant"

# Script directory for finding compose files
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
COMPOSE_FILE="$REPO_ROOT/starter/.devcontainer/docker-compose.firewall.yml"
COMPOSE_OVERRIDE="$SCRIPT_DIR/docker-compose.test.yml"

# Test helper functions
test_pass() {
    echo -e "${GREEN}✓${NC} $1"
    TESTS_PASSED=$((TESTS_PASSED + 1))
}

test_fail() {
    echo -e "${RED}✗${NC} $1"
    TESTS_FAILED=$((TESTS_FAILED + 1))
}

test_info() {
    echo -e "${YELLOW}ℹ${NC} $1"
}

# Get the working container runtime
get_runtime() {
    local runtime="${CONTAINER_RUNTIME:-}"

    # If CONTAINER_RUNTIME is explicitly set, validate and use it
    if [ "$runtime" = "podman" ]; then
        if command -v podman &> /dev/null && podman ps > /dev/null 2>&1; then
            echo "podman"
            return
        fi
    elif [ "$runtime" = "docker" ]; then
        if command -v docker &> /dev/null && docker ps > /dev/null 2>&1; then
            echo "docker"
            return
        fi
    fi

    # Auto-detect
    if command -v podman &> /dev/null && podman ps > /dev/null 2>&1; then
        echo "podman"
    elif command -v docker &> /dev/null && docker ps > /dev/null 2>&1; then
        echo "docker"
    else
        echo ""
    fi
}

# Get compose command (docker compose v2, podman-compose, or docker-compose v1)
get_compose_command() {
    local runtime="${CONTAINER_RUNTIME:-}"

    # If CONTAINER_RUNTIME is explicitly set, use matching compose command
    if [ "$runtime" = "podman" ]; then
        if command -v podman-compose &> /dev/null; then
            echo "podman-compose"
            return
        fi
    elif [ "$runtime" = "docker" ]; then
        if command -v docker &> /dev/null && docker compose version &> /dev/null; then
            echo "docker compose"
            return
        elif command -v docker-compose &> /dev/null; then
            echo "docker-compose"
            return
        fi
    fi

    # Auto-detect: prefer podman-compose if podman is the runtime
    if command -v podman-compose &> /dev/null && command -v podman &> /dev/null && podman ps > /dev/null 2>&1; then
        echo "podman-compose"
    # Check for Docker Compose V2 (docker compose plugin)
    elif command -v docker &> /dev/null && docker compose version &> /dev/null; then
        echo "docker compose"
    # Check for Docker Compose V1 (standalone docker-compose binary)
    elif command -v docker-compose &> /dev/null; then
        echo "docker-compose"
    else
        echo ""
    fi
}

# Cleanup function to stop and remove test containers
cleanup_test_containers() {
    local compose_cmd=$(get_compose_command)

    if [ -z "$compose_cmd" ]; then
        local runtime=$(get_runtime)
        if [ -z "$runtime" ]; then
            return 0
        fi

        echo "Cleaning up test containers..."
        "$runtime" stop "$AI_CONTAINER" >/dev/null 2>&1 || true
        "$runtime" rm "$AI_CONTAINER" >/dev/null 2>&1 || true
        "$runtime" stop "$FIREWALL_CONTAINER" >/dev/null 2>&1 || true
        "$runtime" rm "$FIREWALL_CONTAINER" >/dev/null 2>&1 || true
    else
        echo "Cleaning up test containers..."
        if [ -f "$COMPOSE_FILE" ] && [ -f "$COMPOSE_OVERRIDE" ]; then
            $compose_cmd -f "$COMPOSE_FILE" -f "$COMPOSE_OVERRIDE" down -v >/dev/null 2>&1 || true
        fi
    fi
}

# Setup test environment
setup_test_env() {
    local temp_dir=$(mktemp -d)
    export TEST_TEMP_DIR="$temp_dir"
    export TEST_WHITELIST_PATH="$temp_dir/whitelist.txt"

    # Create whitelist with only specific test domains
    cat > "$TEST_WHITELIST_PATH" << 'EOF'
# Test whitelist - only these domains should be accessible
bedrock-runtime.us-gov-east-1.amazonaws.com:443
EOF
    echo "  Created test whitelist at $TEST_WHITELIST_PATH"

    if [ ! -f "$COMPOSE_FILE" ]; then
        echo -e "${RED}ERROR:${NC} docker-compose.firewall.yml not found at $COMPOSE_FILE"
        return 1
    fi

    # IMAGE_TAG is passed via environment variable to docker-compose.test.yml
    # which overrides the image in docker-compose.firewall.yml
    echo "  Using IMAGE_TAG=$IMAGE_TAG (via compose override)"

    # Create empty env files that compose expects
    local starter_dir="$REPO_ROOT/starter"
    touch "$starter_dir/.env" "$starter_dir/.env.bedrock"
}

# Cleanup function for temp files
cleanup_temp_files() {
    if [ -n "${TEST_TEMP_DIR:-}" ]; then
        rm -rf "$TEST_TEMP_DIR" 2>/dev/null || true
    fi
}

# Start test containers
start_test_containers() {
    local runtime=$(get_runtime)
    local compose_cmd=$(get_compose_command)

    if [ -z "$runtime" ]; then
        echo -e "${RED}ERROR:${NC} No container runtime available"
        return 1
    fi

    if [ -z "$compose_cmd" ]; then
        echo -e "${RED}ERROR:${NC} No compose command available (docker compose, podman-compose, or docker-compose)"
        return 1
    fi

    echo "Starting test containers..."
    echo "  Runtime: $runtime"
    echo "  Compose: $compose_cmd"
    echo "  IMAGE_TAG=$IMAGE_TAG"

    # Clean up existing containers
    if "$runtime" ps -a --format "{{.Names}}" | grep -qE "^($FIREWALL_CONTAINER|$AI_CONTAINER)$"; then
        cleanup_test_containers
    fi

    # Start containers
    $compose_cmd -f "$COMPOSE_FILE" -f "$COMPOSE_OVERRIDE" up -d 2>&1 | grep -v "^$" || true

    # Wait for firewall to initialize (DROP policy applied)
    echo "  Waiting for firewall to initialize..."
    local max_wait=30
    local count=0
    while [ $count -lt $max_wait ]; do
        if "$runtime" exec "$FIREWALL_CONTAINER" iptables -L OUTPUT -n 2>/dev/null | grep -q "policy DROP"; then
            break
        fi
        sleep 1
        count=$((count + 1))
    done

    if [ $count -ge $max_wait ]; then
        echo -e "${RED}ERROR:${NC} Firewall container failed to initialize"
        echo ""
        echo "=== Firewall container logs ==="
        "$runtime" logs "$FIREWALL_CONTAINER" 2>&1 || true
        echo "=== End firewall container logs ==="
        echo ""
        echo "=== Firewall container iptables (if accessible) ==="
        "$runtime" exec "$FIREWALL_CONTAINER" iptables -L -n -v 2>&1 || echo "  (iptables not accessible)"
        echo "=== End iptables ==="
        return 1
    fi

    # Wait for AI container's curl to be available (test overlay installs it)
    echo "  Waiting for AI container to be ready..."
    count=0
    while [ $count -lt $max_wait ]; do
        if "$runtime" exec "$AI_CONTAINER" sh -c "command -v curl" >/dev/null 2>&1; then
            break
        fi
        sleep 1
        count=$((count + 1))
    done

    if [ $count -ge $max_wait ]; then
        echo -e "${RED}ERROR:${NC} AI container curl not available"
        return 1
    fi

    echo "  Containers ready"
    return 0
}

# Trap to ensure cleanup on exit
trap 'cleanup_test_containers; cleanup_temp_files' EXIT

#############################################################################
# TESTS: Verify firewall blocks traffic
#############################################################################

# Test 1: iptables has default DROP policy (blocks all outbound by default)
test_default_deny_policy() {
    test_info "Test 1: Firewall has default-deny policy"

    local runtime=$(get_runtime)

    if "$runtime" exec $FIREWALL_CONTAINER iptables -L OUTPUT -n 2>/dev/null | grep -q "policy DROP"; then
        test_pass "iptables OUTPUT chain has DROP policy (default deny)"
    else
        test_fail "iptables OUTPUT chain missing DROP policy"
    fi
}

# Test 2: Non-whitelisted domains are actually blocked
test_blocked_domain() {
    test_info "Test 2: Non-whitelisted domain is blocked"

    local runtime=$(get_runtime)

    # Try to connect to google.com (not in whitelist)
    # DNS should resolve (port 53 allowed), but HTTPS connection should be blocked
    echo "  Attempting connection to google.com (should be blocked)..."

    local curl_output
    curl_output=$("$runtime" exec $AI_CONTAINER timeout 10 curl -v --connect-timeout 5 https://www.google.com 2>&1) || true
    local curl_exit=$?

    if echo "$curl_output" | grep -q "Could not resolve host"; then
        # DNS failed - unexpected, firewall allows DNS
        test_fail "DNS resolution failed (port 53 may be blocked)"
    elif echo "$curl_output" | grep -qE "(Connection timeout|Connection timed out|Failed to connect|Operation timed out)"; then
        # Connection timed out - firewall is blocking. This is what we want!
        test_pass "Non-whitelisted domain blocked (google.com connection timed out)"
    elif [ $curl_exit -eq 0 ]; then
        # Connection succeeded - firewall is NOT blocking!
        echo "  DEBUG: curl succeeded when it should have been blocked"
        echo "  DEBUG: iptables rules:"
        "$runtime" exec $FIREWALL_CONTAINER iptables -L OUTPUT -n -v || true
        test_fail "Connection to google.com succeeded (firewall not blocking!)"
    else
        # Some other connection failure - likely firewall blocking
        test_pass "Non-whitelisted domain blocked (connection failed: exit $curl_exit)"
    fi
}

# Test 3: Whitelisted domain is accessible (proves firewall is selective, not broken)
test_whitelisted_domain() {
    test_info "Test 3: Whitelisted domain is accessible"

    local runtime=$(get_runtime)
    local whitelisted_domain="bedrock-runtime.us-gov-east-1.amazonaws.com"

    echo "  Attempting connection to $whitelisted_domain (should be allowed)..."

    local curl_output
    curl_output=$("$runtime" exec $AI_CONTAINER timeout 10 curl -v --connect-timeout 5 "https://$whitelisted_domain" 2>&1) || true

    # Check if we got a TCP connection (SSL handshake or connected message)
    if echo "$curl_output" | grep -qE "(Connected to|SSL connection|TLS handshake)"; then
        test_pass "Whitelisted domain accessible ($whitelisted_domain)"
    elif echo "$curl_output" | grep -qE "(Connection timed out|Failed to connect)"; then
        test_fail "Whitelisted domain blocked (firewall may be misconfigured)"
    else
        # Got some response - connection worked at network level
        test_pass "Whitelisted domain accessible (connection established)"
    fi
}

# Test 4: Direct IP connection is blocked (can't bypass firewall by skipping DNS)
test_blocked_direct_ip() {
    test_info "Test 4: Direct IP connection is blocked"

    local runtime=$(get_runtime)

    # Try to connect directly to Google's DNS IP (8.8.8.8) on port 443
    # This proves you can't bypass the whitelist by using IP addresses directly
    echo "  Attempting direct IP connection to 8.8.8.8:443 (should be blocked)..."

    local curl_output
    curl_output=$("$runtime" exec $AI_CONTAINER timeout 10 curl -v --connect-timeout 5 https://8.8.8.8 2>&1) || true
    local curl_exit=$?

    if echo "$curl_output" | grep -qE "(Connection timeout|Connection timed out|Failed to connect|Operation timed out)"; then
        test_pass "Direct IP connection blocked (8.8.8.8:443 timed out)"
    elif [ $curl_exit -eq 0 ]; then
        test_fail "Direct IP connection succeeded (firewall bypass possible!)"
    else
        test_pass "Direct IP connection blocked (connection failed)"
    fi
}

# Test 5: HTTP (port 80) is blocked, not just HTTPS
test_blocked_http_port() {
    test_info "Test 5: HTTP port 80 is blocked"

    local runtime=$(get_runtime)

    echo "  Attempting HTTP connection to example.com:80 (should be blocked)..."

    local curl_output
    curl_output=$("$runtime" exec $AI_CONTAINER timeout 10 curl -v --connect-timeout 5 http://example.com 2>&1) || true
    local curl_exit=$?

    if echo "$curl_output" | grep -qE "(Connection timeout|Connection timed out|Failed to connect|Operation timed out)"; then
        test_pass "HTTP port 80 blocked (example.com:80 timed out)"
    elif [ $curl_exit -eq 0 ]; then
        test_fail "HTTP connection succeeded (port 80 not blocked!)"
    else
        test_pass "HTTP port 80 blocked (connection failed)"
    fi
}

# Test 6: Multiple domains are blocked (not just google.com)
test_blocked_multiple_domains() {
    test_info "Test 6: Multiple non-whitelisted domains are blocked"

    local runtime=$(get_runtime)
    local domains=("github.com" "microsoft.com" "amazon.com")
    local all_blocked=true

    for domain in "${domains[@]}"; do
        echo "  Testing $domain (should be blocked)..."

        local curl_output
        curl_output=$("$runtime" exec $AI_CONTAINER timeout 8 curl -v --connect-timeout 3 "https://$domain" 2>&1) || true

        # Check output for signs of blocking (timeout/connection failure)
        if echo "$curl_output" | grep -qE "(Connection timeout|Connection timed out|Failed to connect|Operation timed out)"; then
            echo "    Blocked (timed out)"
        elif echo "$curl_output" | grep -qE "(Connected to|SSL connection|TLS handshake)"; then
            echo "    WARNING: $domain connection succeeded!"
            all_blocked=false
        else
            echo "    Blocked (connection failed)"
        fi
    done

    if [ "$all_blocked" = true ]; then
        test_pass "All tested domains blocked (${domains[*]})"
    else
        test_fail "Some domains were accessible (firewall not blocking correctly)"
    fi
}

# Test 7: Firewall manager attempted NTP clock sync at startup
test_clock_sync_attempted() {
    test_info "Test 7: Firewall manager attempted NTP clock sync at startup"

    local runtime=$(get_runtime)

    local logs
    logs=$("$runtime" logs "$FIREWALL_CONTAINER" 2>&1)

    if echo "$logs" | grep -q "\[Firewall Manager\] Clock synchronized"; then
        test_pass "NTP clock sync succeeded at startup"
    elif echo "$logs" | grep -q "\[Firewall Manager\] Clock sync skipped"; then
        test_pass "NTP clock sync attempted but skipped (non-critical)"
    elif echo "$logs" | grep -q "\[Firewall Manager\] Syncing system clock"; then
        test_pass "NTP clock sync was attempted"
    else
        test_fail "No clock sync log messages found in firewall-manager startup"
    fi
}

#############################################################################
# Main execution
#############################################################################

echo "========================================="
echo "Firewall Blocking Integration Tests"
echo "========================================="
echo ""

# Check prerequisites
runtime=$(get_runtime)
if [ -z "$runtime" ]; then
    echo -e "${RED}ERROR:${NC} No container runtime (docker/podman) available"
    exit 1
fi

# Setup and start containers
setup_test_env
cleanup_test_containers
if ! start_test_containers; then
    echo -e "${RED}FAILED:${NC} Could not start test containers"
    exit 1
fi

echo ""

# Run tests
test_default_deny_policy
test_blocked_domain
test_whitelisted_domain
test_blocked_direct_ip
test_blocked_http_port
test_blocked_multiple_domains
test_clock_sync_attempted

echo ""
echo "========================================="
echo "Test Results"
echo "========================================="
echo -e "${GREEN}Passed:${NC}  $TESTS_PASSED"
echo -e "${RED}Failed:${NC}  $TESTS_FAILED"
echo ""

if [[ $TESTS_FAILED -gt 0 ]]; then
    echo -e "${RED}FAILED:${NC} Firewall is not blocking traffic correctly"
    exit 1
else
    echo -e "${GREEN}SUCCESS:${NC} Firewall correctly blocks non-whitelisted traffic"
    exit 0
fi
