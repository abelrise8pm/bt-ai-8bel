# ==================================================================
# BASE IMAGE
# ==================================================================
# This container builds on the AI assistant base image which includes
# Claude Code CLI and common development tools.
#
# See https://github.com/rise8-us/xpai-ai-assistant-container/pkgs/container/xpai%2Fai-assistant-home
# Current base version: ai-assistant-home (digest pinned for reproducibility)
FROM ghcr.io/rise8-us/xpai/ai-assistant-home@sha256:4cf0f4b73d5a0262d90ac27e7ba8ca33b10967a8373e0f7ea4a048a9c1a07a35

# ==================================================================
# TOOL VERSIONS
# ==================================================================
# Pin specific versions for reproducibility. Update as needed.
# Instructions are included of where to find the latest versions.
# This helps both humans and AI assistants maintain the file.

# curl https://github.com/google/go-containerregistry/releases to get latest version
ARG CRANE_VERSION=0.20.6

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
        && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install crane (container image inspection tool)
# This is useful for working with container registries and inspecting images
RUN curl -fsSL -o /tmp/go-containerregistry.tar.gz \
        "https://github.com/google/go-containerregistry/releases/download/v${CRANE_VERSION}/go-containerregistry_Linux_x86_64.tar.gz" && \
    tar -xzf /tmp/go-containerregistry.tar.gz -C /usr/local/bin/ crane && \
    chmod +x /usr/local/bin/crane && \
    rm /tmp/go-containerregistry.tar.gz

# Switch back to non-root user to increase security.
USER aiAssistant
