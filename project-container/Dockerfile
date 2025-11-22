# ==================================================================
# BASE IMAGE
# ==================================================================
# This container builds on the AI assistant base image which includes
# Claude Code CLI and common development tools.
#
# See https://github.com/rise8-us/xpai-ai-assistant-container/pkgs/container/xpai%2Fai-assistant-home
# Current base version: ai-assistant-home (digest pinned for reproducibility)
FROM ghcr.io/rise8-us/xpai/ai-assistant-home@sha256:179f0024131b091ef8d48e98a52a60f5e9bdeb60ca2aa8c2da62e1c445c4ef50

# ==================================================================
# TOOL VERSIONS
# ==================================================================
# Pin specific versions for reproducibility. Update as needed.
# Instructions are included of where to find the latest versions.
# This helps both humans and AI assistants maintain the file.

# curl https://github.com/cli/cli/releases to get latest version
ARG GH_VERSION=2.83.0

USER root
# Fix /tmp permissions after USER switch - required even though base image has this fix
# When switching USER contexts, /tmp permissions can be reset due to runc v1.1.8 and crun v1.11+ bugs
# This chmod must be present before any apt-get commands in each USER root context
# See: https://github.com/opencontainers/runc/issues/3952
#
# Install additional tools here as needed.
# The goal is to give the AI assistant all the tools that it needs to be productive.
# Keep the image as small as possible while still being useful to reduce CVE surface area.
# When possible, install tools as the non-root aiAssistant user.
# See https://docs.docker.com/build/building/best-practices/ for guidelines.
# ==================================================================
RUN chmod 1777 /tmp && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
        curl \
        ca-certificates \
        skopeo \
        && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install additional tools:
# - gh: GitHub CLI for interacting with GitHub issues, PRs, and repositories
#
# NOTE: skopeo is installed via apt above from Ubuntu repos (actively maintained by Red Hat/Canonical)
# NOTE: gh CLI uses dpkg architecture naming (amd64/arm64)
RUN ARCH=$(dpkg --print-architecture) && \
    # Install GitHub CLI
    curl -fsSL -o /tmp/gh.tar.gz \
        "https://github.com/cli/cli/releases/download/v${GH_VERSION}/gh_${GH_VERSION}_linux_${ARCH}.tar.gz" && \
    tar -xzf /tmp/gh.tar.gz -C /tmp && \
    mv /tmp/gh_${GH_VERSION}_linux_${ARCH}/bin/gh /usr/local/bin/gh && \
    chmod +x /usr/local/bin/gh && \
    # Cleanup
    rm -rf /tmp/*

# Use `skopeo inspect docker://ghcr.io/astral-sh/uv:latest | jq -r .Digest` to get the sha256 digest for the latest version.
# Version 0.9.7 (Update this with the `org.opencontainers.image.version` annotation from `skopeo inspect docker://ghcr.io/astral-sh/uv@sha256:<latest digest>`)
# Can not use ARG here because of variable expansion problems.
COPY --from=ghcr.io/astral-sh/uv@sha256:ba4857bf2a068e9bc0e64eed8563b065908a4cd6bfb66b531a9c424c8e25e142 /uv /uvx /bin/

# Switch back to non-root user to increase security.
USER aiAssistant
