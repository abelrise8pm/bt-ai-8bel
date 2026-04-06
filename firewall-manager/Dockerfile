# syntax=docker/dockerfile:1
# Lightweight Alpine-based firewall manager for container egress filtering
# Use `skopeo inspect --format "{{.Digest}}" docker://docker.io/library/alpine:latest` to get sha256 digest
# TARGETPLATFORM is automatically set by buildx - explicitly use it to ensure correct platform layers are pulled
ARG TARGETPLATFORM
FROM --platform=$TARGETPLATFORM alpine:latest@sha256:25109184c71bdad752c8312a8623239686a9a2071e8825f20acb8f2198c3f659

# 2026-04-06: Trigger rebuild to pick up patched bind-tools/bind-libs (CVE-2026-1519, CVE-2026-3104)

# Install required packages at build time
RUN apk add --no-cache \
    ca-certificates \
    iptables \
    bind-tools && \
    rm -rf /var/cache/apk/*

# Copy scripts into image
COPY init-firewall.sh /usr/local/bin/init-firewall.sh
COPY firewall-entrypoint.sh /usr/local/bin/firewall-entrypoint.sh
RUN chmod +x /usr/local/bin/init-firewall.sh /usr/local/bin/firewall-entrypoint.sh

ENTRYPOINT ["/usr/local/bin/firewall-entrypoint.sh"]
