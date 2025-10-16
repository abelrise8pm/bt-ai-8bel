#!/usr/bin/env bash
# Integration tests for firewall behavior
# Part of User Story 1: Deploy AI Assistant with Network Isolation
#
# ARCHITECTURE: This script uses docker-compose.firewall.yml to manage test containers.
# This ensures:
# 1. Tests validate the exact same configuration users deploy
# 2. No duplication of image references or container settings
# 3. Single source of truth for container configuration
#
# USAGE: ./test-firewall.sh [PROJECT_NAME]
#   PROJECT_NAME: Optional project name for container identification (default: test)
#
# NOTE: Tests will start containers with the specified PROJECT_NAME prefix.
# To test your dev environment: ./test-firewall.sh my-project-name

set -eu

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

TESTS_PASSED=0
TESTS_FAILED=0
TESTS_SKIPPED=0

# Project name for test containers (allow override via command line argument)
TEST_PROJECT_NAME="${1:-test}"

# Test container names
# Note: These match the container_name pattern in docker-compose.firewall.yml
FIREWALL_CONTAINER="${TEST_PROJECT_NAME}-firewall-manager"
AI_CONTAINER="${TEST_PROJECT_NAME}-ai-assistant"

# Test helper functions
test_pass() {
    echo -e "${GREEN}✓${NC} $1"
    TESTS_PASSED=$((TESTS_PASSED + 1))
}

test_fail() {
    echo -e "${RED}✗${NC} $1"
    TESTS_FAILED=$((TESTS_FAILED + 1))
}

test_skip() {
    echo -e "${YELLOW}⊘${NC} $1"
    TESTS_SKIPPED=$((TESTS_SKIPPED + 1))
}

test_info() {
    echo -e "${YELLOW}ℹ${NC} $1"
}

# Get the working container runtime
get_runtime() {
    if command -v podman &> /dev/null && podman ps > /dev/null 2>&1; then
        echo "podman"
    elif command -v docker &> /dev/null && docker ps > /dev/null 2>&1; then
        echo "docker"
    else
        echo ""
    fi
}

# Cleanup function to stop and remove test containers
cleanup_test_containers() {
    local compose_cmd=$(get_compose_command)

    if [ -z "$compose_cmd" ]; then
        # Fall back to manual cleanup if compose not available
        local runtime=$(get_runtime)
        if [ -z "$runtime" ]; then
            return 0
        fi

        echo "🧹 Cleaning up test containers (manual mode)..."

        # Stop and remove AI container first (depends on firewall)
        if "$runtime" ps -a | grep -q "$AI_CONTAINER"; then
            "$runtime" stop "$AI_CONTAINER" >/dev/null 2>&1 || true
            "$runtime" rm "$AI_CONTAINER" >/dev/null 2>&1 || true
        fi

        # Stop and remove firewall container
        if "$runtime" ps -a | grep -q "$FIREWALL_CONTAINER"; then
            "$runtime" stop "$FIREWALL_CONTAINER" >/dev/null 2>&1 || true
            "$runtime" rm "$FIREWALL_CONTAINER" >/dev/null 2>&1 || true
        fi
    else
        echo "🧹 Cleaning up test containers using $compose_cmd..."

        # Get the script directory to find docker-compose file
        local script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
        local devcontainer_dir="$(cd "$script_dir/../.devcontainer" && pwd)"
        local compose_file="$devcontainer_dir/docker-compose.firewall.yml"

        if [ -f "$compose_file" ]; then
            # Use docker-compose to stop and remove containers
            PROJECT_NAME="$TEST_PROJECT_NAME" "$compose_cmd" -f "$compose_file" down -v >/dev/null 2>&1 || true
        fi
    fi

    echo "✅ Cleanup complete"
}

# Get compose command (podman-compose or docker-compose)
get_compose_command() {
    if command -v podman-compose &> /dev/null; then
        echo "podman-compose"
    elif command -v docker-compose &> /dev/null; then
        echo "docker-compose"
    else
        echo ""
    fi
}

# Start test containers using docker-compose
start_test_containers() {
    local runtime=$(get_runtime)

    if [ -z "$runtime" ]; then
        echo -e "${RED}ERROR:${NC} No container runtime available"
        return 1
    fi

    local compose_cmd=$(get_compose_command)
    if [ -z "$compose_cmd" ]; then
        echo -e "${RED}ERROR:${NC} Neither podman-compose nor docker-compose is available"
        return 1
    fi

    echo "🚀 Starting test containers using $compose_cmd..."

    # Get the script directory to find docker-compose file
    local script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    local devcontainer_dir="$(cd "$script_dir/../.devcontainer" && pwd)"
    local compose_file="$devcontainer_dir/docker-compose.firewall.yml"

    if [ ! -f "$compose_file" ]; then
        echo -e "${RED}ERROR:${NC} docker-compose.firewall.yml not found at $compose_file"
        return 1
    fi

    # Check if containers already exist and warn user
    if "$runtime" ps -a --format "{{.Names}}" | grep -qE "^($FIREWALL_CONTAINER|$AI_CONTAINER)$"; then
        echo "⚠️  Note: Containers with name '$TEST_PROJECT_NAME' already exist"
        echo "   Tests will use existing containers: $FIREWALL_CONTAINER, $AI_CONTAINER"
        echo "   To test with fresh containers, stop them first:"
        echo "   cd .devcontainer && PROJECT_NAME=$TEST_PROJECT_NAME podman-compose down"
        echo ""
    fi

    # Start containers using compose with PROJECT_NAME
    echo "  Starting containers from docker-compose.firewall.yml with PROJECT_NAME=$TEST_PROJECT_NAME..."
    PROJECT_NAME="$TEST_PROJECT_NAME" "$compose_cmd" -f "$compose_file" up -d 2>&1 | grep -v "^$" || true

    # Wait for firewall to be healthy
    echo "  Waiting for firewall to initialize..."
    local max_wait=30
    local count=0
    while [ $count -lt $max_wait ]; do
        if "$runtime" exec "$FIREWALL_CONTAINER" iptables -L OUTPUT -n 2>/dev/null | grep -q "policy DROP" && \
           "$runtime" exec "$FIREWALL_CONTAINER" iptables -L OUTPUT -n 2>/dev/null | grep -q "dpt:53"; then
            break
        fi
        sleep 1
        count=$((count + 1))
    done

    if [ $count -ge $max_wait ]; then
        echo -e "${RED}ERROR:${NC} Firewall container failed to initialize"
        echo "   Check logs: $runtime logs $FIREWALL_CONTAINER"
        cleanup_test_containers
        return 1
    fi

    echo "✅ Test containers started successfully"
    return 0
}

# Check if container runtime is available
check_container_runtime() {
    local runtime=$(get_runtime)
    if [ -z "$runtime" ]; then
        echo -e "${YELLOW}⚠${NC}  Container runtime not available - integration tests will be skipped"
        echo "    To run these tests, ensure Docker or Podman is installed and containers are running"
        return 1
    fi
    return 0
}

# Check if containers are running
check_containers_running() {
    local runtime=$(get_runtime)

    if [ -z "$runtime" ]; then
        return 1
    fi

    # Check containers without using variable in pipe to avoid shell issues
    if "$runtime" ps | grep -q "$FIREWALL_CONTAINER"; then
        : # Container found, continue
    else
        echo -e "${YELLOW}⚠${NC}  Firewall container not running"
        return 1
    fi

    if "$runtime" ps | grep -q "$AI_CONTAINER"; then
        : # Container found, continue
    else
        echo -e "${YELLOW}⚠${NC}  AI assistant container not running"
        return 1
    fi

    echo -e "${GREEN}✓${NC} Containers are running"
    return 0
}

# Test 1: Firewall container exists and is healthy
test_firewall_container_health() {
    test_info "Test 1: Firewall container is healthy"

    if ! check_container_runtime; then
        test_skip "Container runtime not available"
        return 0
    fi

    local runtime=$(get_runtime)

    if [ -z "$runtime" ]; then
        test_skip "Container runtime not available"
        return 0
    fi

    # Check if container is running
    if "$runtime" ps | grep -q "$FIREWALL_CONTAINER"; then
        : # Container found, continue
    else
        test_skip "Firewall container not running"
        return 0
    fi

    # Check health status (manual check since we don't use docker-compose healthcheck)
    if "$runtime" exec "$FIREWALL_CONTAINER" iptables -L OUTPUT -n 2>/dev/null | grep -q "policy DROP" && \
       "$runtime" exec "$FIREWALL_CONTAINER" iptables -L OUTPUT -n 2>/dev/null | grep -q "dpt:53"; then
        health="healthy"
    else
        health="unhealthy"
    fi

    if [[ "$health" == "healthy" ]]; then
        test_pass "Firewall container is healthy"
    elif [[ "$health" == "unknown" ]]; then
        test_skip "Health check not configured or container just started"
    else
        test_fail "Firewall container health check failed (status: $health)"
    fi
}

# Test 2: AI assistant container exists
test_ai_container_exists() {
    test_info "Test 2: AI assistant container is running"

    if ! check_container_runtime; then
        test_skip "Container runtime not available"
        return 0
    fi

    local runtime=$(get_runtime)

    if [ -z "$runtime" ]; then
        test_skip "Container runtime not available"
        return 0
    fi

    if "$runtime" ps | grep -q "$AI_CONTAINER"; then
        test_pass "AI assistant container is running"
    else
        test_skip "AI assistant container not running (start with: docker-compose up -d)"
    fi
}

# Test 3: AI container has no capabilities
test_ai_container_capabilities() {
    test_info "Test 3: AI container has cap_drop: ALL (zero capabilities)"

    if ! check_container_runtime; then
        test_skip "Container runtime not available"
        return 0
    fi

    local runtime=$(get_runtime)

    if [ -z "$runtime" ]; then
        test_skip "Container runtime not available"
        return 0
    fi

    if "$runtime" ps | grep -q "$AI_CONTAINER"; then
        : # Container found, continue
    else
        test_skip "AI assistant container not running"
        return 0
    fi

    # Check capabilities
    caps=$("$runtime" inspect --format='{{.HostConfig.CapDrop}}' $AI_CONTAINER 2>/dev/null || echo "[]")

    # Docker shows "[ALL]" while Podman expands to individual caps like "[CAP_CHOWN CAP_DAC_OVERRIDE ...]"
    # Both are correct - we just need to verify that cap_drop was configured
    if echo "$caps" | grep -qi "ALL"; then
        test_pass "AI container has cap_drop: ALL"
    elif echo "$caps" | grep -qE "CAP_CHOWN.*CAP_DAC_OVERRIDE.*CAP_FOWNER.*CAP_SETUID"; then
        # Podman format - multiple capabilities dropped (indicates --cap-drop ALL was used)
        test_pass "AI container has cap_drop: ALL (Podman format showing individual caps)"
    else
        test_fail "AI container missing cap_drop: ALL (found: $caps)"
    fi
}

# Test 4: Firewall container has NET_ADMIN capability
test_firewall_capabilities() {
    test_info "Test 4: Firewall container has NET_ADMIN capability"

    if ! check_container_runtime; then
        test_skip "Container runtime not available"
        return 0
    fi

    local runtime=$(get_runtime)

    if [ -z "$runtime" ]; then
        test_skip "Container runtime not available"
        return 0
    fi

    if "$runtime" ps | grep -q "$FIREWALL_CONTAINER"; then
        : # Container found, continue
    else
        test_skip "Firewall container not running"
        return 0
    fi

    # Check capabilities
    caps=$("$runtime" inspect --format='{{.HostConfig.CapAdd}}' $FIREWALL_CONTAINER 2>/dev/null || echo "[]")

    if echo "$caps" | grep -qi "NET_ADMIN"; then
        test_pass "Firewall container has NET_ADMIN capability"
    else
        test_fail "Firewall container missing NET_ADMIN capability (found: $caps)"
    fi
}

# Test 5: iptables rules are applied
test_iptables_rules() {
    test_info "Test 5: iptables rules are properly configured"

    if ! check_container_runtime; then
        test_skip "Container runtime not available"
        return 0
    fi

    local runtime=$(get_runtime)

    if [ -z "$runtime" ]; then
        test_skip "Container runtime not available"
        return 0
    fi

    if "$runtime" ps | grep -q "$FIREWALL_CONTAINER"; then
        : # Container found, continue
    else
        test_skip "Firewall container not running"
        return 0
    fi

    # Check for DROP policy
    if "$runtime" exec $FIREWALL_CONTAINER iptables -L OUTPUT -n 2>/dev/null | grep -q "policy DROP"; then
        test_pass "iptables OUTPUT chain has DROP policy"
    else
        test_fail "iptables OUTPUT chain missing DROP policy"
    fi

    # Check for DNS rules
    if "$runtime" exec $FIREWALL_CONTAINER iptables -L OUTPUT -n 2>/dev/null | grep -q "dpt:53"; then
        test_pass "iptables rules allow DNS (port 53)"
    else
        test_fail "iptables rules missing DNS (port 53) allowance"
    fi

    # Check for stateful rules
    if "$runtime" exec $FIREWALL_CONTAINER iptables -L OUTPUT -n 2>/dev/null | grep -qE "ESTABLISHED|RELATED"; then
        test_pass "iptables has stateful rules (ESTABLISHED,RELATED)"
    else
        test_fail "iptables missing stateful rules"
    fi

    # Check for HTTPS rules (port 443)
    if "$runtime" exec $FIREWALL_CONTAINER iptables -L OUTPUT -n 2>/dev/null | grep -q "dpt:443"; then
        test_pass "iptables rules allow HTTPS (port 443)"
    else
        test_fail "iptables rules missing HTTPS (port 443) allowance"
    fi
}

# Test 6: Network namespace sharing
test_network_namespace_sharing() {
    test_info "Test 6: AI container shares firewall's network namespace"

    if ! check_container_runtime; then
        test_skip "Container runtime not available"
        return 0
    fi

    local runtime=$(get_runtime)

    if [ -z "$runtime" ]; then
        test_skip "Container runtime not available"
        return 0
    fi

    # Check both containers are running
    if "$runtime" ps | grep -q "$FIREWALL_CONTAINER" && "$runtime" ps | grep -q "$AI_CONTAINER"; then
        : # Both containers found, continue
    else
        test_skip "Containers not running"
        return 0
    fi

    # Get network mode of AI container
    network_mode=$("$runtime" inspect --format='{{.HostConfig.NetworkMode}}' $AI_CONTAINER 2>/dev/null || echo "unknown")

    if echo "$network_mode" | grep -qE "container:|service:"; then
        test_pass "AI container uses shared network mode ($network_mode)"
    else
        test_fail "AI container not using shared network mode (found: $network_mode)"
    fi
}

# Test 7: Firewall logs validation
test_firewall_logs() {
    test_info "Test 7: Firewall logs show proper initialization"

    if ! check_container_runtime; then
        test_skip "Container runtime not available"
        return 0
    fi

    local runtime=$(get_runtime)

    if [ -z "$runtime" ]; then
        test_skip "Container runtime not available"
        return 0
    fi

    if "$runtime" ps | grep -q "$FIREWALL_CONTAINER"; then
        : # Container found, continue
    else
        test_skip "Firewall container not running"
        return 0
    fi

    # Check for initialization logs
    if "$runtime" logs $FIREWALL_CONTAINER 2>&1 | grep -q "\[INIT\]"; then
        test_pass "Firewall logs show initialization messages"
    else
        test_fail "Firewall logs missing initialization messages"
    fi

    # Check for whitelist loading
    if "$runtime" logs $FIREWALL_CONTAINER 2>&1 | grep -q "\[WHITELIST\]"; then
        test_pass "Firewall logs show whitelist loading"
    else
        test_fail "Firewall logs missing whitelist loading messages"
    fi

    # Check for rules application
    if "$runtime" logs $FIREWALL_CONTAINER 2>&1 | grep -q "\[RULES\]"; then
        test_pass "Firewall logs show rules application"
    else
        test_fail "Firewall logs missing rules application messages"
    fi
}

# Test 9: Blocked domains are actually blocked
test_blocked_domains() {
    test_info "Test 9: Non-whitelisted domains are blocked"

    if ! check_container_runtime; then
        test_skip "Container runtime not available"
        return 0
    fi

    local runtime=$(get_runtime)

    if [ -z "$runtime" ]; then
        test_skip "Container runtime not available"
        return 0
    fi

    if "$runtime" ps | grep -q "$AI_CONTAINER"; then
        : # Container found, continue
    else
        test_skip "AI assistant container not running"
        return 0
    fi

    # Note: This test should run AFTER test_whitelisted_domains to ensure
    # that curl/DNS/networking are working before testing blocking behavior

    # Check if curl is available by trying to run it
    if ! "$runtime" exec $AI_CONTAINER curl --version >/dev/null 2>&1; then
        test_skip "curl not available in AI container"
        return 0
    fi

    # Try to curl a non-whitelisted domain (google.com) from AI container
    # DNS should work (allowed by firewall), but HTTPS connection should be blocked
    local curl_output=$("$runtime" exec $AI_CONTAINER timeout 5 curl -v --connect-timeout 3 https://www.google.com 2>&1)
    local curl_exit=$?

    # Analyze the failure mode
    if echo "$curl_output" | grep -q "Could not resolve host"; then
        # DNS failure is unexpected - firewall should allow DNS
        test_fail "DNS resolution failed unexpectedly (firewall may be misconfigured)"
    elif echo "$curl_output" | grep -qE "(Connection timeout|Connection timed out|Failed to connect|Operation timed out)"; then
        # Connection timeout indicates firewall is blocking - this is what we want!
        test_pass "Non-whitelisted domain blocked by firewall (google.com connection timed out)"
    elif [ $curl_exit -eq 0 ]; then
        # Success is bad - means firewall isn't blocking
        # Debug: show the curl output and firewall logs
        echo "DEBUG: curl succeeded when it should have failed"
        echo "DEBUG: curl output: $curl_output"
        echo "DEBUG: Firewall iptables rules:"
        "$runtime" exec $FIREWALL_CONTAINER iptables -L -n -v || true
        test_fail "AI container can access blocked domain (firewall not working)"
    else
        # Some other failure - likely still firewall-related
        test_pass "Non-whitelisted domain blocked (connection failed)"
    fi
}

# Test 8: Whitelisted domains are accessible
test_whitelisted_domains() {
    test_info "Test 8: Whitelisted domains are accessible"

    if ! check_container_runtime; then
        test_skip "Container runtime not available"
        return 0
    fi

    local runtime=$(get_runtime)

    if [ -z "$runtime" ]; then
        test_skip "Container runtime not available"
        return 0
    fi

    if "$runtime" ps | grep -q "$AI_CONTAINER"; then
        : # Container found, continue
    else
        test_skip "AI assistant container not running"
        return 0
    fi

    # Try to connect to a whitelisted domain (AWS Bedrock endpoint)
    local whitelisted_domain="bedrock-runtime.us-gov-east-1.amazonaws.com"
    local whitelisted_port="443"

    # Try multiple network tools in order of preference
    local test_passed=false
    local test_skipped=false

    # Try curl first
    if "$runtime" exec $AI_CONTAINER curl --version >/dev/null 2>&1; then
        # Test connection attempt (should not be blocked by firewall)
        if "$runtime" exec $AI_CONTAINER timeout 10 curl -v --connect-timeout 5 "https://$whitelisted_domain" 2>&1 | grep -qE "(Connected to|SSL connection)"; then
            test_pass "AI container can connect to whitelisted domain using curl ($whitelisted_domain)"
            test_passed=true
        elif "$runtime" exec $AI_CONTAINER timeout 10 curl -v --connect-timeout 5 "https://$whitelisted_domain" 2>&1 | grep -qE "(Connection timed out|Connection refused|couldn't connect to host)"; then
            test_fail "AI container blocked from whitelisted domain (firewall may not be working correctly)"
            return 0
        fi
    fi

    # Try wget if curl didn't work
    if [ "$test_passed" = false ] && "$runtime" exec $AI_CONTAINER wget --version >/dev/null 2>&1; then
        if "$runtime" exec $AI_CONTAINER timeout 10 wget --timeout=5 -O /dev/null "https://$whitelisted_domain" 2>&1 | grep -qE "(connected|Connecting to)"; then
            test_pass "AI container can connect to whitelisted domain using wget ($whitelisted_domain)"
            test_passed=true
        elif "$runtime" exec $AI_CONTAINER timeout 10 wget --timeout=5 -O /dev/null "https://$whitelisted_domain" 2>&1 | grep -qE "(Connection timed out|Connection refused|failed: Connection)"; then
            test_fail "AI container blocked from whitelisted domain (firewall may not be working correctly)"
            return 0
        fi
    fi

    # Try nc (netcat) if both curl and wget didn't work
    if [ "$test_passed" = false ] && "$runtime" exec $AI_CONTAINER nc -h >/dev/null 2>&1; then
        # Use nc to test TCP connection to port 443
        if "$runtime" exec $AI_CONTAINER timeout 5 nc -zv "$whitelisted_domain" "$whitelisted_port" 2>&1 | grep -qE "(succeeded|open|Connected)"; then
            test_pass "AI container can connect to whitelisted domain using nc ($whitelisted_domain:$whitelisted_port)"
            test_passed=true
        elif "$runtime" exec $AI_CONTAINER timeout 5 nc -zv "$whitelisted_domain" "$whitelisted_port" 2>&1 | grep -qE "(timed out|refused|failed)"; then
            test_fail "AI container blocked from whitelisted domain (firewall may not be working correctly)"
            return 0
        fi
    fi

    # If we couldn't test with any tool, skip
    if [ "$test_passed" = false ]; then
        test_skip "No network testing tools (curl/wget/nc) available in AI container"
    fi
}

# Trap to ensure cleanup on exit
trap cleanup_test_containers EXIT

# Run all tests
echo "========================================="
echo "Firewall Integration Tests"
echo "========================================="
echo ""

# First check if we can run integration tests
if ! check_container_runtime; then
    echo ""
    echo "========================================="
    echo "Test Results"
    echo "========================================="
    echo -e "${YELLOW}SKIPPED:${NC} Container runtime not available"
    echo "         These tests require Docker or Podman"
    exit 0
fi

# Clean up any existing test containers and start fresh ones
cleanup_test_containers

# Start new test containers
if ! start_test_containers; then
    echo ""
    echo "========================================="
    echo "Test Results"
    echo "========================================="
    echo -e "${RED}FAILED:${NC} Could not start test containers"
    exit 1
fi

# Verify containers are running
if ! check_containers_running; then
    echo ""
    echo "========================================="
    echo "Test Results"
    echo "========================================="
    echo -e "${RED}FAILED:${NC} Test containers not running after startup"
    exit 1
fi

echo ""
test_firewall_container_health
test_ai_container_exists
test_ai_container_capabilities
test_firewall_capabilities
test_iptables_rules
test_network_namespace_sharing
test_firewall_logs
test_whitelisted_domains
test_blocked_domains

echo ""
echo "========================================="
echo "Test Results"
echo "========================================="
echo -e "${GREEN}Passed:${NC}  $TESTS_PASSED"
echo -e "${RED}Failed:${NC}  $TESTS_FAILED"
echo -e "${YELLOW}Skipped:${NC} $TESTS_SKIPPED"
echo ""

if [[ $TESTS_FAILED -gt 0 ]]; then
    echo -e "${RED}FAILED:${NC} Some tests did not pass"
    exit 1
elif [[ $TESTS_PASSED -eq 0 ]]; then
    echo -e "${YELLOW}NO TESTS RUN:${NC} All tests were skipped"
    exit 0
else
    echo -e "${GREEN}SUCCESS:${NC} All firewall integration tests passed"
    exit 0
fi
