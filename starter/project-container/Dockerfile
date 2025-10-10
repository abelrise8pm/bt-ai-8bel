# ==================================================================
# BASE IMAGE
# ==================================================================
# This container builds on the AI assistant base image which includes
# Claude Code CLI and common development tools.
#
# See https://github.com/rise8-us/XPai/pkgs/container/xpai%2Fai-assistant-home
# Current base version: ai-assistant-home (digest pinned for reproducibility)
FROM ghcr.io/rise8-us/xpai/ai-assistant-home@sha256:689a7449a65d981b8eca3ab8955c32b052a28eb47bccecaf0f4d4fcb3a440d9b

# ==================================================================
# TOOL VERSIONS
# ==================================================================
# Pin specific versions for reproducibility. Update as needed.
# Instructions are included of where to find the latest versions.
# This helps both humans and AI assistants maintain the file.

# curl https://github.com/cli/cli/releases to get latest version
ARG GH_CLI_VERSION=2.81.0
# curl https://www.npmjs.com/package/@mermaid-js/mermaid-cli to get latest version
ARG MERMAID_CLI_VERSION=11.12.0
# curl https://github.com/google/go-containerregistry/releases to get latest version
ARG CRANE_VERSION=0.20.6
# curl https://pypi.org/project/llm/ to get latest version
ARG LLM_VERSION=0.27.1
# curl https://pypi.org/project/yamllint/ to get latest version
ARG YAMLLINT_VERSION=1.37.1

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
    apt-get install -y --no-install-recommends wget && \
    apt-get clean

# Switch back to non-root user to increase security.
USER aiAssistant
