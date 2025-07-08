# Make sure we are using a pinned version of Ubuntu 24.04 LTS ARM64 for Apple M series chips
# This ensures consistent, reproducible development environments across ARM64 platforms
FROM --platform=linux/arm64 ubuntu:24.04@sha256:6633ff3b87e40bf09281277f1072458819e915da008095ebdcc76c921a3628a1

# Copy certificate and install in single layer
COPY zscaler-root-ca.crt /usr/local/share/ca-certificates/zscaler-root-ca.crt
RUN apt-get update && \
    apt-get install -y --no-install-recommends ca-certificates && \
    update-ca-certificates && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Set environment variables for SSL
ENV CURL_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt \
    SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt \
    NODE_EXTRA_CA_CERTS=/etc/ssl/certs/ca-certificates.crt

# Create aiAssistant user
RUN useradd -m -s /bin/bash aiAssistant && \
    mkdir -p /home/aiAssistant/.claude

# Setup Claude Code scripts for later, Claude Code installed by feature
COPY claude_code_init.sh /home/aiAssistant/.claude/claude_code_init.sh

# Only run init script for new containers
RUN chmod +x /home/aiAssistant/.claude/claude_code_init.sh && \
    chown -R aiAssistant:aiAssistant /home/aiAssistant/.claude && \
    echo '[ -f ~/.claude/anthropic_key_helper.sh ] || /home/aiAssistant/.claude/claude_code_init.sh' >> /home/aiAssistant/.bashrc

# Set default user
USER aiAssistant