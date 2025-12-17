#!/bin/sh
set -e

echo "[Firewall Manager] Starting initialization..."

# Execute firewall initialization script (baked into image)
# Reads whitelist from /firewall/whitelist.txt (mounted from host)
echo "[Firewall Manager] Configuring iptables rules..."
/usr/local/bin/init-firewall.sh

# Keep container running
echo "[Firewall Manager] Initialization complete. Firewall active."
exec sleep infinity
