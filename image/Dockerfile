# syntax=docker/dockerfile:1
# Pinned Ubuntu 24.04 LTS for multi-architecture support (ARM64 for M-series MacBook Pros, AMD64 for other systems)
# Use `skopeo inspect --format "{{.Digest}}" docker://docker.io/library/ubuntu:24.04` to get the sha256 digest.
FROM ubuntu:24.04@sha256:c35e29c9450151419d9448b0fd75374fec4fff364a27f176fb458d472dfc9e54

# Version definitions
# curl https://www.npmjs.com/package/@anthropic-ai/claude-code for latest version
# curl https://github.com/anthropics/claude-code/blob/main/CHANGELOG.md for changelog information.
ARG CLAUDE_CODE_VERSION=2.0.57
# curl https://www.npmjs.com/package/@google/gemini-cli for latest version
# curl https://github.com/google-gemini/gemini-cli/releases for changelog information
ARG GEMINI_CLI_VERSION=0.19.1
# curl https://github.com/block/goose/releases for latest version
# curl https://github.com/block/goose/releases for changelog information
ARG GOOSE_VERSION=1.15.0

# Copy certificate and install in single layer
COPY src/zscaler-root-ca.crt /usr/local/share/ca-certificates/zscaler-root-ca.crt

# Fix /tmp permissions for container runtime compatibility
# Background: Both runc v1.1.8 and crun v1.11+ introduced regressions where the sticky bit
# on /tmp is not properly set (missing from tmpfs mounts). This causes APT and other tools
# to fail with "Couldn't create temporary file /tmp/apt.conf.*" errors.
#
# Technical details:
# - Expected permissions: 1777 (drwxrwxrwt) - the leading 1 is the sticky bit
# - Without fix: 777 (drwxrwxrwx) - missing sticky bit causes security checks to fail
# - runc bug: https://github.com/opencontainers/runc/issues/3952 (fixed in v1.1.9)
# - crun bug: Changed behavior in v1.11+ to use underlying directory permissions
#
# Impact: Affects both Docker (typically uses runc) and Podman (typically uses crun)
# Solution: Explicitly set /tmp permissions to ensure correct behavior across all runtimes
RUN chmod 1777 /tmp && \
    apt-get update && \
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

# Install Node.js v22.21.0 (pinned version for Claude Code and Gemini CLI)
# To update: Check NodeSource repo for latest 22.21.x patch before bumping minor version
# Verify availability: curl -s https://deb.nodesource.com/node_22.x/dists/nodistro/main/binary-amd64/Packages | grep "Version: 22.21"
RUN curl -fsSL https://deb.nodesource.com/setup_22.x | bash - && \
    apt-get install -y nodejs=22.21.0* && \
    rm -f /etc/apt/sources.list.d/nodesource.list && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Create aiAssistant user and setup npm user-global directory
RUN useradd -m -s /bin/bash aiAssistant && \
    mkdir -p /home/aiAssistant/.claude /home/aiAssistant/.npm-global

# Setup Claude Code initialization and commands
COPY src/claude_code_init.sh /home/aiAssistant/.claude/claude_code_init.sh
COPY src/commands/ /home/aiAssistant/.claude/commands/
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

# Install AI development tools via npm
# @anthropic-ai/claude-code: Official Anthropic CLI for Claude AI assistant
# @google/gemini-cli: Google's CLI for Gemini AI models
RUN npm config set prefix /home/aiAssistant/.npm-global && \
    npm install -g \
        @anthropic-ai/claude-code@${CLAUDE_CODE_VERSION} \
        @google/gemini-cli@${GEMINI_CLI_VERSION} && \
    # Clean up npm cache
    rm -rf /root/.npm && \
    rm -rf /tmp/* /var/tmp/*

# Set proper ownership and switch to aiAssistant user
RUN chown -R aiAssistant:aiAssistant /home/aiAssistant/.config /home/aiAssistant/.npm-global

USER aiAssistant

# Set up first-login initialization for Claude Code
# Note: We run this at first login rather than build time because the ANTHROPIC_API_KEY
# environment variable is not available during the build process - it's only available
# at runtime when the container starts. The initialization script needs this API key
# to configure Claude Code's authentication and approve the API key for use.
RUN echo '# Run Claude Code initialization once at first login' >> /home/aiAssistant/.bashrc && \
    echo 'if [ ! -f ~/.claude_code_initialized ]; then' >> /home/aiAssistant/.bashrc && \
    echo '  /home/aiAssistant/.claude/claude_code_init.sh && touch ~/.claude_code_initialized' >> /home/aiAssistant/.bashrc && \
    echo 'fi' >> /home/aiAssistant/.bashrc