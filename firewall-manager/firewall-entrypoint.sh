#!/bin/sh
set -e

echo "[Firewall Manager] Starting initialization..."

# Sync system clock before firewall rules lock down network
# This fixes Podman VM clock drift from macOS sleep/wake cycles
# Uses busybox ntpd (built into Alpine) for a one-shot NTP sync
echo "[Firewall Manager] Syncing system clock..."
ntpd -n -q -p pool.ntp.org 2>/dev/null \
    && echo "[Firewall Manager] Clock synchronized" \
    || echo "[Firewall Manager] Clock sync skipped (non-critical)"

# Execute firewall initialization script (baked into image)
# Reads whitelist from /firewall/whitelist.txt (mounted from host)
echo "[Firewall Manager] Configuring iptables rules..."
/usr/local/bin/init-firewall.sh

# Keep container running
echo "[Firewall Manager] Initialization complete. Firewall active."
exec sleep infinity
