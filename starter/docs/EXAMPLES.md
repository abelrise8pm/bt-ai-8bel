# Devcontainer Setup Examples

This document provides links to real-world devcontainer implementations that demonstrate various configurations and patterns.

## Example Repositories

### Multi-Language Development Environment with PostgreSQL

**Repository:** [penava-devcontainer](https://github.com/rise8-us/penava-devcontainer)

A comprehensive devcontainer setup demonstrating:
- **Language Runtimes:**
  - Elixir 1.19.5 with Erlang OTP 28.3 (Phoenix framework ready)
  - Node.js 24 LTS with npm (React/frontend development)
- **Database Services:**
  - PostgreSQL 18 via Docker Compose with persistent volumes
- **Architecture:**
  - Multi-architecture support (ARM64/AMD64)
  - Automated CI/CD builds with GitHub Actions
  - Security scanning integration
  - Automated digest updates
- **Development Tools:**
  - PostgreSQL client (psql)
  - Claude Code CLI integration
  - UTF-8 locale configuration
- **Best Practices:**
  - Version pinning for reproducibility
  - Automated testing via test.sh script
  - Non-root user execution for security
  - Clear separation of base image and customizations

This example shows how to build a full-featured development environment that supports both backend (Elixir/Phoenix) and frontend (React/Node.js) development with database services orchestrated through Docker Compose.
