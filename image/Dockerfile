# syntax=docker/dockerfile:1
# Pinned Ubuntu 24.04 LTS for multi-architecture support (ARM64 for M-series MacBook Pros, AMD64 for other systems)
FROM ubuntu:24.04@sha256:a08e551cb33850e4740772b38217fc1796a66da2506d312abe51acda354ff061

# Version definitions
ARG CLAUDE_CODE_VERSION=1.0.69
ARG GEMINI_CLI_VERSION=0.1.18
ARG GOOSE_VERSION=1.2.0
ARG MCP_DEV_COMMANDS_VERSION=1.0.1

# Copy certificate and install in single layer
COPY src/zscaler-root-ca.crt /usr/local/share/ca-certificates/zscaler-root-ca.crt
RUN apt-get update && \
    apt-get install -y --no-install-recommends ca-certificates && \
    update-ca-certificates && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Set SSL certificate environment variables for all tools
ENV CURL_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt \
    SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt \
    NODE_EXTRA_CA_CERTS=/etc/ssl/certs/ca-certificates.crt

# Install security-focused minimal utilities and tool dependencies
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

# Dependencies explanation:
# git: Version control system (Claude Code, Goose)
# curl: HTTP client for downloads and API calls (Claude Code, Goose, system)
# jq: JSON processor for CLI operations (Claude Code, Goose)
# ca-certificates: SSL/TLS certificate bundle (all tools)
# openssh-client: SSH client for git operations (Claude Code, Goose)
# gnupg2: GPG cryptographic tools for verification (system security)
# bzip2: Compression utility for Goose installation archive (Goose)
# libxcb1: X11 client library required by Goose (Goose GUI framework dependency)

# Install Node.js v22.17.0 (pinned version for Claude Code and Gemini CLI)
RUN curl -fsSL https://deb.nodesource.com/setup_22.x | bash - && \
    apt-get install -y nodejs=22.17.0* && \
    rm -f /etc/apt/sources.list.d/nodesource.list && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Create aiAssistant user and setup npm user-global directory
RUN useradd -m -s /bin/bash aiAssistant && \
    mkdir -p /home/aiAssistant/.claude /home/aiAssistant/.npm-global

# Setup Claude Code initialization
COPY src/claude_code_init.sh /home/aiAssistant/.claude/claude_code_init.sh
RUN chmod +x /home/aiAssistant/.claude/claude_code_init.sh && \
    chown -R aiAssistant:aiAssistant /home/aiAssistant/.claude /home/aiAssistant/.npm-global && \
    echo 'export PATH=/home/aiAssistant/.npm-global/bin:$PATH' >> /home/aiAssistant/.bashrc

# Set PATH environment variable for the container
ENV PATH="/home/aiAssistant/.npm-global/bin:$PATH"

# Install Goose (AI-powered developer toolkit)
# Goose provides AI-assisted development workflows and integrates with Claude
RUN ARCH=$(dpkg --print-architecture) && \
    if [ "$ARCH" = "arm64" ]; then \
        GOOSE_ARCH="aarch64"; \
    else \
        GOOSE_ARCH="x86_64"; \
    fi && \
    curl -fsSL https://github.com/block/goose/releases/download/v${GOOSE_VERSION}/goose-${GOOSE_ARCH}-unknown-linux-gnu.tar.bz2 -o /tmp/goose.tar.bz2 && \
    tar -xjf /tmp/goose.tar.bz2 -C /tmp && \
    mv /tmp/goose /usr/local/bin/goose && \
    chmod +x /usr/local/bin/goose && \
    rm -f /tmp/goose.tar.bz2

# Set up Goose configuration
RUN mkdir -p /home/aiAssistant/.config/goose
COPY src/goose-config.yaml /home/aiAssistant/.config/goose/config.yaml

# Install AI development tools via npm using BuildKit secrets (as root to access secrets)
# @anthropic-ai/claude-code: Official Anthropic CLI for Claude AI assistant
# @google/gemini-cli: Google's CLI for Gemini AI models
# @rise8-us/dev-commands-mcp-server: MCP server for structured development workflows
RUN --mount=type=secret,id=github_token \
    echo "@rise8-us:registry=https://npm.pkg.github.com" > /tmp/.npmrc && \
    echo "//npm.pkg.github.com/:_authToken=$(cat /run/secrets/github_token)" >> /tmp/.npmrc && \
    # Install packages globally to /home/aiAssistant/.npm-global
    npm --userconfig=/tmp/.npmrc config set prefix /home/aiAssistant/.npm-global && \
    npm --userconfig=/tmp/.npmrc install -g \
        @anthropic-ai/claude-code@${CLAUDE_CODE_VERSION} \
        @google/gemini-cli@${GEMINI_CLI_VERSION} \
        @rise8-us/dev-commands-mcp-server@${MCP_DEV_COMMANDS_VERSION} && \
    npm cache clean --force && \
    # Clean up npm credentials
    rm -f /tmp/.npmrc

# Set proper ownership and switch to aiAssistant user
RUN chown -R aiAssistant:aiAssistant /home/aiAssistant/.config /home/aiAssistant/.npm-global

USER aiAssistant

# Run Claude Code initialization at build time to configure MCP
RUN /home/aiAssistant/.claude/claude_code_init.sh