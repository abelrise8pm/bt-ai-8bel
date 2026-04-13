# syntax=docker/dockerfile:1
# Lightweight Alpine-based firewall manager for container egress filtering
# Use `skopeo inspect --format "{{.Digest}}" docker://docker.io/library/alpine:latest` to get sha256 digest
# TARGETPLATFORM is automatically set by buildx - explicitly use it to ensure correct platform layers are pulled
ARG TARGETPLATFORM
FROM --platform=$TARGETPLATFORM alpine:latest@sha256:25109184c71bdad752c8312a8623239686a9a2071e8825f20acb8f2198c3f659

# 2026-04-06: Trigger rebuild to pick up patched bind-tools/bind-libs (CVE-2026-1519, CVE-2026-3104)
# 2026-04-13: apk upgrade added to pick up patched libssl3/libcrypto3 (CVE-2026-28390)
# before Alpine publishes a new base image digest.

# Install required packages at build time. `apk upgrade` ensures base image
# packages (e.g. libssl3, libcrypto3) are pulled at their latest patched
# versions rather than whatever shipped in the pinned base image layer.
RUN apk upgrade --no-cache && \
    apk add --no-cache \
    ca-certificates \
    iptables \
    bind-tools && \
    rm -rf /var/cache/apk/*

# Copy scripts into image
COPY init-firewall.sh /usr/local/bin/init-firewall.sh
COPY firewall-entrypoint.sh /usr/local/bin/firewall-entrypoint.sh
RUN chmod +x /usr/local/bin/init-firewall.sh /usr/local/bin/firewall-entrypoint.sh

ENTRYPOINT ["/usr/local/bin/firewall-entrypoint.sh"]
