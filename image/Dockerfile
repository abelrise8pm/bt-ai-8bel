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
        bzip2 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

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
    echo 'export PATH=~/.npm-global/bin:$PATH' >> /home/aiAssistant/.bashrc



USER aiAssistant

# Configure npm to use user directory for global packages and install there
RUN npm config set prefix '~/.npm-global' && \
    npm install -g \
    @anthropic-ai/claude-code@1.0.51 \
    @google/gemini-cli@0.1.12 && \
    npm cache clean --force