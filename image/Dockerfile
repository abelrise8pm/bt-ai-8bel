# Pinned Ubuntu 24.04 LTS for multi-architecture support (ARM64 for M-series MacBook Pros, AMD64 for other systems)
FROM ubuntu:24.04@sha256:6633ff3b87e40bf09281277f1072458819e915da008095ebdcc76c921a3628a1

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

# Install security-focused minimal utilities
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        git \
        curl \
        jq \
        ca-certificates \
        openssh-client \
        gnupg2 \
        bzip2 \
        libxcb1 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# libxcb1: X11 client library required by Goose v1.1.4+ (GUI framework dependency)

# Install Node.js v22.17.0 (pinned version)
RUN curl -fsSL https://deb.nodesource.com/setup_22.x | bash - && \
    apt-get install -y nodejs=22.17.0* && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Create aiAssistant user and setup npm user-global directory
RUN useradd -m -s /bin/bash aiAssistant && \
    mkdir -p /home/aiAssistant/.claude /home/aiAssistant/.npm-global

# Setup Claude Code initialization
COPY claude_code_init.sh /home/aiAssistant/.claude/claude_code_init.sh
RUN chmod +x /home/aiAssistant/.claude/claude_code_init.sh && \
    chown -R aiAssistant:aiAssistant /home/aiAssistant/.claude /home/aiAssistant/.npm-global && \
    echo '[ -f ~/.claude.json ] || /home/aiAssistant/.claude/claude_code_init.sh' >> /home/aiAssistant/.bashrc && \
    echo 'export PATH=/home/aiAssistant/.npm-global/bin:$PATH' >> /home/aiAssistant/.bashrc

# Set PATH environment variable for the container
ENV PATH="/home/aiAssistant/.npm-global/bin:$PATH"

# Install Goose v1.1.4 (AI-powered developer toolkit)
# Goose provides AI-assisted development workflows and integrates with Claude
RUN ARCH=$(dpkg --print-architecture) && \
    if [ "$ARCH" = "arm64" ]; then \
        GOOSE_ARCH="aarch64"; \
    else \
        GOOSE_ARCH="x86_64"; \
    fi && \
    curl -fsSL https://github.com/block/goose/releases/download/v1.1.4/goose-${GOOSE_ARCH}-unknown-linux-gnu.tar.bz2 -o /tmp/goose.tar.bz2 && \
    tar -xjf /tmp/goose.tar.bz2 -C /tmp && \
    mv /tmp/goose /usr/local/bin/goose && \
    chmod +x /usr/local/bin/goose && \
    rm -f /tmp/goose.tar.bz2

USER aiAssistant

# Configure npm to use user directory for global packages and install there
RUN npm config set prefix '~/.npm-global' && \
    npm install -g \
    @anthropic-ai/claude-code@1.0.51 \
    @google/gemini-cli@0.1.12 && \
    npm cache clean --force