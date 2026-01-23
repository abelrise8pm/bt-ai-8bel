# syntax=docker/dockerfile:1
# Lightweight Alpine-based firewall manager for container egress filtering
# Use `skopeo inspect --format "{{.Digest}}" docker://docker.io/library/alpine:latest` to get sha256 digest
# TARGETPLATFORM is automatically set by buildx - explicitly use it to ensure correct platform layers are pulled
ARG TARGETPLATFORM
FROM --platform=$TARGETPLATFORM alpine:latest@sha256:865b95f46d98cf867a156fe4a135ad3fe50d2056aa3f25ed31662dff6da4eb62

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
