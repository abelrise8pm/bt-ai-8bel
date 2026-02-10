#!/usr/bin/env bash
# Clock skew detection and auto-fix for Podman VM clock drift
#
# When macOS laptops sleep and wake, the Podman VM's clock drifts from
# wall-clock time. Containers inherit the stale clock, causing SSL/TLS
# certificate validation failures that break curl, git, and API calls.
#
# This script runs at login and:
# 1. Fetches a Date header from the OTEL endpoint (or CLOCK_CHECK_URL)
# 2. Compares server time to local time
# 3. If skew > 30s: attempts auto-fix via `date -s` (requires SYS_TIME capability)
# 4. If auto-fix fails: prints a warning with host-side remediation commands
#
# The --insecure flag on curl is intentional: if the clock is severely skewed,
# SSL validation itself fails - the exact condition we're detecting.
#
# CUI containers: The OTEL endpoint is blocked by the firewall. The 2-second
# timeout means curl fails quickly and the check silently skips.
#
# Environment variables:
#   CLOCK_CHECK_DISABLED=1  - Skip the check entirely
#   CLOCK_CHECK_URL         - Override the endpoint used for time comparison
#                             (defaults to OTEL_EXPORTER_OTLP_ENDPOINT)

set -eu

# Allow opt-out
if [[ "${CLOCK_CHECK_DISABLED:-}" == "1" ]]; then
    exit 0
fi

# Determine URL to fetch Date header from
CHECK_URL="${CLOCK_CHECK_URL:-${OTEL_EXPORTER_OTLP_ENDPOINT:-}}"
if [[ -z "$CHECK_URL" ]]; then
    exit 0
fi

# Fetch Date header from server (2-second timeout, insecure to handle skewed certs)
SERVER_DATE_HEADER=$(curl --head --insecure --max-time 2 --silent "$CHECK_URL" 2>/dev/null \
    | grep -i '^date:' | sed 's/^[Dd]ate: *//' | tr -d '\r') || exit 0

if [[ -z "$SERVER_DATE_HEADER" ]]; then
    exit 0
fi

# Convert to epoch seconds for comparison
SERVER_EPOCH=$(date -d "$SERVER_DATE_HEADER" +%s 2>/dev/null) || exit 0
LOCAL_EPOCH=$(date +%s)

# Calculate absolute skew
SKEW=$(( SERVER_EPOCH - LOCAL_EPOCH ))
if [[ $SKEW -lt 0 ]]; then
    SKEW=$(( -SKEW ))
fi

# Threshold: 30 seconds
if [[ $SKEW -le 30 ]]; then
    exit 0
fi

# Clock is skewed - attempt auto-fix
if date -s "$SERVER_DATE_HEADER" >/dev/null 2>&1; then
    echo "[Clock Sync] Corrected container clock (was off by ${SKEW}s)"
    exit 0
fi

# Auto-fix failed (no SYS_TIME capability) - warn the user
echo ""
echo "================================================================"
echo "  WARNING: Container clock is off by ${SKEW} seconds"
echo "================================================================"
echo ""
echo "  This causes SSL/TLS certificate errors that break curl, git,"
echo "  Claude Code API calls, and telemetry."
echo ""
echo "  Cause: Podman VM clock drifted while your Mac was asleep."
echo ""
echo "  Fix: Run on your host machine (outside this container):"
echo ""
echo "    podman machine stop && podman machine start"
echo ""
echo "  Then reopen this terminal."
echo ""
echo "  To suppress this warning: set CLOCK_CHECK_DISABLED=1 in .env"
echo ""
echo "================================================================"
echo ""
exit 0
