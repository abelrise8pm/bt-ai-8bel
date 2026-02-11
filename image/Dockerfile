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
ARG CLAUDE_CODE_VERSION=2.1.39
# curl https://github.com/anomalyco/opencode/releases for latest version and changelog
ARG OPENCODE_VERSION=1.1.56
# https://github.com/BurntSushi/ripgrep/releases for latest version and changelog
ARG RIPGREP_VERSION=15.1.0

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
# libcap2-bin: installed transiently to setcap on /usr/bin/date, then purged
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        git \
        curl \
        jq \
        ca-certificates \
        openssh-client \
        gnupg2 \
        libcap2-bin && \
    setcap cap_sys_time+eip /usr/bin/date && \
    apt-get purge -y libcap2-bin && apt-get autoremove -y && \
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
    mkdir -p /home/aiAssistant/.claude /home/aiAssistant/.local/bin

# Setup Claude Code initialization script (in system path so volume mounts don't shadow it)
COPY src/claude_code_init.sh /usr/local/bin/claude-code-init.sh
RUN chmod +x /usr/local/bin/claude-code-init.sh

# Setup clock skew detection and auto-fix script
# Detects Podman VM clock drift from macOS sleep/wake and corrects it when
# the container has SYS_TIME capability. Falls back to a warning otherwise.
COPY src/check_clock_skew.sh /usr/local/bin/check-clock-skew.sh
RUN chmod +x /usr/local/bin/check-clock-skew.sh

# Setup Claude Code custom commands
COPY src/commands/ /home/aiAssistant/.claude/commands/
RUN chown -R aiAssistant:aiAssistant /home/aiAssistant/.claude /home/aiAssistant/.local

# Install Claude Code (binary distribution with checksum verification)
# Downloads from Anthropic's GCS bucket and verifies SHA256 checksum from manifest
#
# IMPORTANT: Install to /usr/local/bin, NOT user home directories (~/.local/bin, ~/.npm-global/bin, etc.)
# User home directories are often mounted as persistent volumes in devcontainers.
# If a tool is installed to a home directory and later moved to a system path,
# the old version in the persistent volume will shadow the new system version
# (home paths typically come before system paths in $PATH).
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

# Install ripgrep (fast recursive search tool used by Claude Code's Grep tool)
RUN ARCH=$(dpkg --print-architecture) && \
    if [ "$ARCH" = "arm64" ]; then \
        RG_ARCH="aarch64-unknown-linux-gnu"; \
    else \
        RG_ARCH="x86_64-unknown-linux-musl"; \
    fi && \
    curl -fsSL "https://github.com/BurntSushi/ripgrep/releases/download/${RIPGREP_VERSION}/ripgrep-${RIPGREP_VERSION}-${RG_ARCH}.tar.gz" -o /tmp/ripgrep.tar.gz && \
    tar -xzf /tmp/ripgrep.tar.gz -C /tmp && \
    mv "/tmp/ripgrep-${RIPGREP_VERSION}-${RG_ARCH}/rg" /usr/local/bin/rg && \
    chmod +x /usr/local/bin/rg && \
    rm -rf /tmp/ripgrep.tar.gz "/tmp/ripgrep-${RIPGREP_VERSION}-${RG_ARCH}"

# Symlink Claude Code into ~/.local/bin so the native install self-check passes
# (Claude Code verifies: directory exists, binary present, directory in PATH)
RUN ln -s /usr/local/bin/claude /home/aiAssistant/.local/bin/claude

USER aiAssistant

# Run Claude Code initialization on every login
# The init script is idempotent: it merges keys into ~/.claude.json (ephemeral,
# outside the persisted volume) and only writes ~/.claude/settings.json if it
# doesn't already exist (preserving user customizations in the volume).
# Runs every login because ~/.claude.json needs to be recreated after rebuilds
# and ANTHROPIC_API_KEY is only available at runtime, not build time.
# Add ~/.local/bin to PATH so Claude Code's native install self-check passes.
# Without this, Claude Code warns: "~/.local/bin is not in your PATH"
RUN echo 'export PATH="$HOME/.local/bin:$PATH"' >> /home/aiAssistant/.bashrc && \
    echo '# Clock skew detection and auto-fix (silent on failure)' >> /home/aiAssistant/.bashrc && \
    echo 'check-clock-skew.sh || true' >> /home/aiAssistant/.bashrc && \
    echo '# Claude Code initialization (idempotent)' >> /home/aiAssistant/.bashrc && \
    echo 'claude-code-init.sh' >> /home/aiAssistant/.bashrc

# ==================================================================
# CLAUDE CODE OPENTELEMETRY CONFIGURATION
# ==================================================================
# Disable non-essential traffic to Anthropic (Sentry, Statsig, /bug command)
# This does NOT affect API calls to Claude or Rise8's OTEL telemetry collection
# See https://code.claude.com/docs/en/data-usage
ENV CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC=1
# Explicitly disable the auto-updater as a secondary control
# CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC should cover this, but has had
# reliability issues across versions — belt and suspenders
ENV DISABLE_AUTOUPDATER=1

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
