# Pinned Ubuntu 24.04 LTS ARM64 for M-series MacBook Pros
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

# Install pinned versions of npm packages
RUN npm install -g \
    @anthropic-ai/claude-code@1.0.44 \
    @google/gemini-cli@0.1.9

# Install Goose with SHA verification (skip version check during build)
RUN GOOSE_VERSION="v1.0.35" && \
    GOOSE_SHA256="57c7ee011e7fa51a680defae5b7bdd1f8315647e0593dea2a93440fb75a365e3" && \
    curl -fsSL "https://github.com/block/goose/releases/download/${GOOSE_VERSION}/goose-aarch64-unknown-linux-gnu.tar.bz2" -o /tmp/goose.tar.bz2 && \
    cd /tmp && tar -xjf goose.tar.bz2 && \
    echo "${GOOSE_SHA256} goose" | sha256sum -c - && \
    chmod +x goose && \
    mv goose /usr/local/bin/goose && \
    rm -f goose.tar.bz2

# Create aiAssistant user
RUN useradd -m -s /bin/bash aiAssistant && \
    mkdir -p /home/aiAssistant/.claude && \
    mkdir -p /home/aiAssistant/.config/goose

# Setup Claude Code initialization
COPY claude_code_init.sh /home/aiAssistant/.claude/claude_code_init.sh
RUN chmod +x /home/aiAssistant/.claude/claude_code_init.sh && \
    chown -R aiAssistant:aiAssistant /home/aiAssistant/.claude && \
    echo '[ -f ~/.claude/anthropic_key_helper.sh ] || /home/aiAssistant/.claude/claude_code_init.sh' >> /home/aiAssistant/.bashrc

# Setup Goose configuration
COPY goose-config.yaml /home/aiAssistant/.config/goose/config.yaml
RUN chown -R aiAssistant:aiAssistant /home/aiAssistant/.config

# Set default user
USER aiAssistant