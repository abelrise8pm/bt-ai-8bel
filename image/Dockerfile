# syntax=docker/dockerfile:1
# Red Hat UBI10 Minimal — FIPS 140-3 compliant base for CMMC Level 2 CUI boundary
#
# Multi-architecture support (ARM64 for M-series MacBook Pros, AMD64 for other systems)
#
# IMPORTANT: The SHA must be the MULTI-ARCH INDEX digest, NOT an architecture-specific digest.
# To get the correct SHA, run: skopeo inspect --format "{{.Digest}}" docker://registry.access.redhat.com/ubi10/ubi-minimal:latest
# This returns the index digest that works for ALL architectures.
#
# To verify a SHA is multi-arch: skopeo inspect --raw docker://registry.access.redhat.com/ubi10/ubi-minimal@sha256:<SHA> | jq .mediaType
# - Multi-arch (UBI10, OCI): "application/vnd.oci.image.index.v1+json"
# - Multi-arch (legacy Docker): "application/vnd.docker.distribution.manifest.list.v2+json"
# - Single-arch (WRONG): "application/vnd.oci.image.manifest.v1+json"
#
# TARGETPLATFORM is automatically set by buildx - explicitly use it to ensure correct platform layers are pulled
ARG TARGETPLATFORM
FROM --platform=$TARGETPLATFORM registry.access.redhat.com/ubi10/ubi-minimal:10.1@sha256:9f12217d6c94d0527c8e97d2a2a0d8de77f08276073b0c4226c07a973dc48eba

# Version definitions
# To check latest Claude Code version: curl -s https://storage.googleapis.com/claude-code-dist-86c565f3-f756-42ad-8dfa-d59b1c096819/claude-code-releases/latest
# Changelog: https://github.com/anthropics/claude-code/blob/main/CHANGELOG.md
ARG CLAUDE_CODE_VERSION=2.1.129
# curl https://github.com/anomalyco/opencode/releases for latest version and changelog
ARG OPENCODE_VERSION=1.14.39
# https://github.com/badlogic/pi-mono/releases for latest version and changelog
ARG PI_VERSION=0.73.0
# https://github.com/sharkdp/fd/releases for latest version and changelog
ARG FD_VERSION=10.4.2
# https://github.com/BurntSushi/ripgrep/releases for latest version and changelog
ARG RIPGREP_VERSION=15.1.0
# https://github.com/jqlang/jq/releases for latest version and changelog
ARG JQ_VERSION=1.7.1

# Copy certificate and install in single layer
COPY src/zscaler-root-ca.crt /etc/pki/ca-trust/source/anchors/zscaler-root-ca.crt

# Fix /tmp permissions for container runtime compatibility
# Background: Both runc v1.1.8 and crun v1.11+ introduced regressions where the sticky bit
# on /tmp is not properly set (missing from tmpfs mounts). This causes tools
# to fail with temporary file creation errors.
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
    microdnf install -y --nodocs ca-certificates && \
    update-ca-trust extract && \
    microdnf clean all && \
    rm -rf /var/cache/yum /tmp/* /var/tmp/*

# Set SSL certificate environment variables for all tools
ENV CURL_CA_BUNDLE=/etc/pki/tls/certs/ca-bundle.crt \
    SSL_CERT_FILE=/etc/pki/tls/certs/ca-bundle.crt

# Install security-focused minimal utilities and tool dependencies
# tzdata: pre-installed to prevent failures in derived container builds.
#   The setcap cap_sys_time on /usr/bin/date causes tzdata's postinst to fail
#   in Docker build environments lacking SYS_TIME capability. Installing here
#   ensures derived containers skip tzdata configuration.
# libcap: provides setcap utility for /usr/bin/date capability
#   (kept installed — coreutils-single depends on libcap.so.2)
#
# jq was not available in the default UBI9 free repos and we have not yet
# verified its availability in UBI10 (ubi-10-baseos, ubi-10-appstream).
# We continue to download a static binary, SHA256-verify it, and install it
# directly — robust regardless of repo availability and gives reproducible
# version pinning. Re-evaluate during a future cleanup pass.
# Note: curl-minimal is pre-installed in ubi-minimal and conflicts with full curl.
# curl-minimal provides the curl binary and is sufficient for our download needs.
RUN microdnf install -y --nodocs \
        git \
        ca-certificates \
        openssh-clients \
        gnupg2 \
        tzdata \
        tar \
        gzip \
        shadow-utils \
        libcap && \
    setcap cap_sys_time+eip /usr/bin/date && \
    microdnf clean all && \
    rm -rf /var/cache/yum /tmp/* /var/tmp/*

# Install jq — static binary with SHA256 verification
# Download from upstream releases (see comment block above re: UBI repo availability)
RUN ARCH=$(uname -m) && \
    if [ "$ARCH" = "aarch64" ]; then \
        JQ_ARCH="arm64"; \
        JQ_SHA256="4dd2d8a0661df0b22f1bb9a1f9830f06b6f3b8f7d91211a1ef5d7c4f06a8b4a5"; \
    else \
        JQ_ARCH="amd64"; \
        JQ_SHA256="5942c9b0934e510ee61eb3e30273f1b3fe2590df93933a93d7c58b81d19c8ff5"; \
    fi && \
    curl -fsSL "https://github.com/jqlang/jq/releases/download/jq-${JQ_VERSION}/jq-linux-${JQ_ARCH}" -o /tmp/jq && \
    ACTUAL=$(sha256sum /tmp/jq | cut -d' ' -f1) && \
    if [ "$ACTUAL" != "$JQ_SHA256" ]; then \
        echo "jq checksum verification failed: expected $JQ_SHA256, got $ACTUAL" >&2; \
        rm -f /tmp/jq; \
        exit 1; \
    fi && \
    mv /tmp/jq /usr/local/bin/jq && \
    chmod +x /usr/local/bin/jq

# Dependencies explanation:
# git: Version control system (Claude Code)
# curl-minimal: HTTP client for downloads and API calls (pre-installed in ubi-minimal)
# jq: JSON processor for CLI operations (Claude Code) — installed from static binary above
# ca-certificates: SSL/TLS certificate bundle (all tools)
# openssh-clients: SSH client for git operations (Claude Code)
# gnupg2: GPG cryptographic tools for verification (system security)
# tzdata: Timezone data (pre-installed to avoid postinst failures in derived builds)
# tar, gzip: Archive extraction for tool installs
# shadow-utils: User management (useradd)

# ==================================================================
# FIPS 140-3 CONFIGURATION
# ==================================================================
# Force OpenSSL FIPS provider active regardless of host kernel fips_enabled state.
# This ensures FIPS-validated cryptography is used on developer laptops (macOS)
# where the host kernel does not set fips_enabled=1, as well as in GovCloud
# where it does.
#
# CMMC control: SC.L2-3.13.11 — Employ FIPS-validated cryptography when used
# to protect the confidentiality of CUI.
#
# RHEL 10 OpenSSL FIPS Provider certificate: CMVP #TBD
#   TODO: replace with the RHEL 10 CMVP cert number once Red Hat publishes it
#   on https://csrc.nist.gov/projects/cryptographic-module-validation-program
#   (RHEL 9 used CMVP #4857). The provider activation here is unchanged and
#   continues to enforce FIPS-validated crypto regardless of the cert lookup.
# ==================================================================
RUN microdnf install -y --nodocs openssl && \
    microdnf clean all && \
    rm -rf /var/cache/yum
COPY src/openssl-fips.cnf /etc/pki/tls/openssl.cnf

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
RUN ARCH=$(uname -m) && \
    if [ "$ARCH" = "aarch64" ]; then \
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
RUN ARCH=$(uname -m) && \
    if [ "$ARCH" = "aarch64" ]; then \
        OPENCODE_ARCH="arm64"; \
    else \
        OPENCODE_ARCH="x64"; \
    fi && \
    curl -fsSL https://github.com/anomalyco/opencode/releases/download/v${OPENCODE_VERSION}/opencode-linux-${OPENCODE_ARCH}.tar.gz -o /tmp/opencode.tar.gz && \
    mkdir -p /tmp/opencode-extract && \
    tar -xzf /tmp/opencode.tar.gz -C /tmp/opencode-extract && \
    mv /tmp/opencode-extract/opencode /usr/local/bin/opencode && \
    chmod +x /usr/local/bin/opencode && \
    rm -rf /tmp/opencode.tar.gz /tmp/opencode-extract

# Install Pi coding agent (terminal-based AI coding agent supporting 15+ providers)
# Pi ships as a Bun-compiled standalone binary with companion assets (themes, docs, etc.)
# The binary resolves package.json relative to its own path, so the full distribution
# must be kept together. Install to /usr/local/lib/pi and symlink the binary.
RUN ARCH=$(uname -m) && \
    if [ "$ARCH" = "aarch64" ]; then \
        PI_ARCH="arm64"; \
    else \
        PI_ARCH="x64"; \
    fi && \
    curl -fsSL "https://github.com/badlogic/pi-mono/releases/download/v${PI_VERSION}/pi-linux-${PI_ARCH}.tar.gz" -o /tmp/pi.tar.gz && \
    tar -xzf /tmp/pi.tar.gz -C /tmp && \
    mv /tmp/pi /usr/local/lib/pi && \
    chmod +x /usr/local/lib/pi/pi && \
    ln -s /usr/local/lib/pi/pi /usr/local/bin/pi && \
    rm -f /tmp/pi.tar.gz

# Install ripgrep (fast recursive search tool used by Claude Code's Grep tool)
RUN ARCH=$(uname -m) && \
    if [ "$ARCH" = "aarch64" ]; then \
        RG_ARCH="aarch64-unknown-linux-gnu"; \
    else \
        RG_ARCH="x86_64-unknown-linux-musl"; \
    fi && \
    curl -fsSL "https://github.com/BurntSushi/ripgrep/releases/download/${RIPGREP_VERSION}/ripgrep-${RIPGREP_VERSION}-${RG_ARCH}.tar.gz" -o /tmp/ripgrep.tar.gz && \
    tar -xzf /tmp/ripgrep.tar.gz -C /tmp && \
    mv "/tmp/ripgrep-${RIPGREP_VERSION}-${RG_ARCH}/rg" /usr/local/bin/rg && \
    chmod +x /usr/local/bin/rg && \
    rm -rf /tmp/ripgrep.tar.gz "/tmp/ripgrep-${RIPGREP_VERSION}-${RG_ARCH}"

# Install fd (fast filesystem search tool, used by Pi coding agent)
# Pre-installed to prevent Pi from downloading it at runtime, which would
# fail behind the firewall and write to the user's home directory.
RUN ARCH=$(uname -m) && \
    if [ "$ARCH" = "aarch64" ]; then \
        FD_ARCH="aarch64-unknown-linux-gnu"; \
    else \
        FD_ARCH="x86_64-unknown-linux-gnu"; \
    fi && \
    curl -fsSL "https://github.com/sharkdp/fd/releases/download/v${FD_VERSION}/fd-v${FD_VERSION}-${FD_ARCH}.tar.gz" -o /tmp/fd.tar.gz && \
    tar -xzf /tmp/fd.tar.gz -C /tmp && \
    mv "/tmp/fd-v${FD_VERSION}-${FD_ARCH}/fd" /usr/local/bin/fd && \
    chmod +x /usr/local/bin/fd && \
    rm -rf /tmp/fd.tar.gz "/tmp/fd-v${FD_VERSION}-${FD_ARCH}"

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
