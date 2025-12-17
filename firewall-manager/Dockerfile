# syntax=docker/dockerfile:1
# Lightweight Alpine-based firewall manager for container egress filtering
# Use `skopeo inspect --format "{{.Digest}}" docker://docker.io/library/alpine:latest` to get sha256 digest
FROM alpine:latest@sha256:51183f2cfa6320055da30872f211093f9ff1d3cf06f39a0bdb212314c5dc7375

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
