# syntax=docker/dockerfile:1
# Pinned Ubuntu 24.04 LTS for multi-architecture support (ARM64 for M-series MacBook Pros, AMD64 for other systems)
#
# IMPORTANT: The SHA must be the MULTI-ARCH MANIFEST digest, NOT an architecture-specific digest.
# To get the correct SHA, run: skopeo inspect --format "{{.Digest}}" docker://docker.io/library/ubuntu:24.04
# This returns the manifest list digest that works for ALL architectures.
#
# DO NOT use `docker inspect` or `docker pull` + inspect - those return architecture-specific digests
# which will cause cross-platform builds to fail with "exec format error".
#
# To verify a SHA is multi-arch: skopeo inspect --raw docker://docker.io/library/ubuntu@sha256:<SHA> | jq .mediaType
# - Multi-arch: "application/vnd.oci.image.index.v1+json" or "application/vnd.docker.distribution.manifest.list.v2+json"
# - Single-arch (WRONG): "application/vnd.oci.image.manifest.v1+json"
#
# TARGETPLATFORM is automatically set by buildx - explicitly use it to ensure correct platform layers are pulled
ARG TARGETPLATFORM
FROM --platform=$TARGETPLATFORM ubuntu:24.04@sha256:cd1dba651b3080c3686ecf4e3c4220f026b521fb76978881737d24f200828b2b

# Version definitions
# To check latest Claude Code version: curl -s https://storage.googleapis.com/claude-code-dist-86c565f3-f756-42ad-8dfa-d59b1c096819/claude-code-releases/latest
# Changelog: https://github.com/anthropics/claude-code/blob/main/CHANGELOG.md
ARG CLAUDE_CODE_VERSION=2.1.23
# curl https://github.com/anomalyco/opencode/releases for latest version and changelog
ARG OPENCODE_VERSION=1.1.42

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
    SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt

# Install security-focused minimal utilities and tool dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        git \
        curl \
        jq \
        ca-certificates \
        openssh-client \
        gnupg2 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Dependencies explanation:
# git: Version control system (Claude Code)
# curl: HTTP client for downloads and API calls (Claude Code, system)
# jq: JSON processor for CLI operations (Claude Code)
# ca-certificates: SSL/TLS certificate bundle (all tools)
# openssh-client: SSH client for git operations (Claude Code)
# gnupg2: GPG cryptographic tools for verification (system security)

# Create aiAssistant user
RUN useradd -m -s /bin/bash aiAssistant && \
    mkdir -p /home/aiAssistant/.claude

# Setup Claude Code initialization and commands
COPY src/claude_code_init.sh /home/aiAssistant/.claude/claude_code_init.sh
COPY src/commands/ /home/aiAssistant/.claude/commands/
RUN chmod +x /home/aiAssistant/.claude/claude_code_init.sh && \
    chown -R aiAssistant:aiAssistant /home/aiAssistant/.claude

# Install Claude Code (binary distribution with checksum verification)
# Downloads from Anthropic's GCS bucket and verifies SHA256 checksum from manifest
ARG CLAUDE_GCS_BUCKET=https://storage.googleapis.com/claude-code-dist-86c565f3-f756-42ad-8dfa-d59b1c096819/claude-code-releases
RUN ARCH=$(dpkg --print-architecture) && \
    if [ "$ARCH" = "arm64" ]; then \
        CLAUDE_PLATFORM="linux-arm64"; \
    else \
        CLAUDE_PLATFORM="linux-x64"; \
    fi && \
    # Download manifest and extract checksum for platform
    MANIFEST=$(curl -fsSL "${CLAUDE_GCS_BUCKET}/${CLAUDE_CODE_VERSION}/manifest.json") && \
    CHECKSUM=$(echo "$MANIFEST" | jq -r ".platforms[\"$CLAUDE_PLATFORM\"].checksum") && \
    if [ -z "$CHECKSUM" ] || [ "$CHECKSUM" = "null" ]; then \
        echo "Platform $CLAUDE_PLATFORM not found in manifest" >&2; \
        exit 1; \
    fi && \
    # Download and verify binary
    curl -fsSL "${CLAUDE_GCS_BUCKET}/${CLAUDE_CODE_VERSION}/${CLAUDE_PLATFORM}/claude" -o /tmp/claude && \
    ACTUAL=$(sha256sum /tmp/claude | cut -d' ' -f1) && \
    if [ "$ACTUAL" != "$CHECKSUM" ]; then \
        echo "Checksum verification failed: expected $CHECKSUM, got $ACTUAL" >&2; \
        rm -f /tmp/claude; \
        exit 1; \
    fi && \
    mv /tmp/claude /usr/local/bin/claude && \
    chmod +x /usr/local/bin/claude

# Install OpenCode (AI-powered terminal coding assistant)
# OpenCode provides AI-assisted development workflows with support for multiple LLM providers
RUN ARCH=$(dpkg --print-architecture) && \
    if [ "$ARCH" = "arm64" ]; then \
        OPENCODE_ARCH="arm64"; \
    else \
        OPENCODE_ARCH="x64"; \
    fi && \
    curl -fsSL https://github.com/anomalyco/opencode/releases/download/v${OPENCODE_VERSION}/opencode-linux-${OPENCODE_ARCH}.tar.gz -o /tmp/opencode.tar.gz && \
    tar -xzf /tmp/opencode.tar.gz -C /tmp && \
    mv /tmp/opencode /usr/local/bin/opencode && \
    chmod +x /usr/local/bin/opencode && \
    rm -f /tmp/opencode.tar.gz

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

# ==================================================================
# CLAUDE CODE OPENTELEMETRY CONFIGURATION
# ==================================================================
# Disable non-essential traffic to Anthropic (Sentry, Statsig, /bug command)
# This does NOT affect API calls to Claude or Rise8's OTEL telemetry collection
# See https://code.claude.com/docs/en/data-usage
ENV CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC=1

# Enables telemetry export to Rise8's OTEL collector for monitoring
# Claude Code usage metrics (tokens, cost, sessions, commits, PRs).
# See https://docs.anthropic.com/en/docs/claude-code/telemetry
ENV CLAUDE_CODE_ENABLE_TELEMETRY=1
ENV OTEL_METRICS_EXPORTER=otlp
ENV OTEL_LOGS_EXPORTER=otlp
ENV OTEL_EXPORTER_OTLP_PROTOCOL=http/protobuf
ENV OTEL_EXPORTER_OTLP_ENDPOINT=https://grafana-otel.rise8.us:4318
ENV OTEL_METRIC_EXPORT_INTERVAL=45000
ENV OTEL_LOGS_EXPORT_INTERVAL=45000
