# AI Assistant Container

A monorepo containing the AI assistant base container and starter template for project teams.

## Projects

- [`image/`](image/) - Base container with pre-configured AI tools (Claude Code, Gemini CLI, Goose)
- [`starter/`](starter/) - Starter template for project teams
- [`plugins/`](plugins/) - Claude Code plugin marketplace ([skill development guide](docs/SKILL-DEVELOPMENT.md))

## Quick Start

1. Clone the repository:
   ```bash
   git clone https://github.com/rise8-us/xpai-ai-assistant-container.git
   cd xpai-ai-assistant-container
   ```

2. Copy the environment file and add your API key:
   ```bash
   cp .env.example .env
   # Edit .env and set ANTHROPIC_API_KEY
   ```

## Integrating AI Assistant into an Existing Repository

If you have an existing repository and want to add AI Assistant capabilities to it, use our integration script:

**Prerequisites:**
1. Clone this repository locally:
   ```bash
   git clone https://github.com/rise8-us/xpai-ai-assistant-container.git
   cd xpai-ai-assistant-container
   ```

2. Run the integration script with your target repository path:
   ```bash
   ./scripts/integrate-ai-assistant-no-cui.sh <path-to-your-repo>
   ```

**What the script does:**
- Copies necessary DevContainer configuration files
- Adds CLAUDE.md.example for reference (teams can create their own CLAUDE.md when ready)
- Sets up MCP configuration
- Optionally adds GitHub workflows for container CI/CD
- Updates .gitignore with AI Assistant files

**Note:** The script preserves existing files and creates backups where needed. Teams maintain full control over configuration customization.

## Why a Standalone Repository?

This AI Assistant container is maintained as a standalone repository (separate from the main XPai repository) to support **CMMC Level 2 compliance** requirements. This architectural decision provides several key benefits:

### Security Boundary Definition
- **Reduced Scope**: Creates a well-defined security boundary for systems that process Controlled Unclassified Information (CUI), separate from R&D and experimental projects
- **Simplified Asset Inventory**: Makes it clear which components are in-scope for CMMC assessment vs. experimental tooling
- **Easier C3PAO Assessment**: Third-party assessors can focus on a single, bounded system rather than determining which parts of a larger monorepo require evaluation

### Access Control (AC Family Controls)
- **Principle of Least Privilege**: Enables stricter access controls on production CUI-handling code while allowing more open collaboration on R&D projects
- **Role-Based Access Control**: Different teams can have appropriate permission levels without compromising CUI security

### Configuration & Change Management (CM Family Controls)
- **Baseline Configuration**: Easier to establish and maintain security baselines for a self-contained system
- **Configuration Change Control**: Simpler change management without interference from unrelated R&D changes
- **Least Functionality**: Can be deployed with only necessary dependencies, not an entire monorepo toolchain

### Supply Chain Risk Management (SR Family Controls)
- **Isolated Dependencies**: Clear separation of production dependencies from experimental tooling
- **Software Bill of Materials (SBOM)**: More accurate SBOM generation for compliance reporting
- **Vulnerability Tracking**: Focused security scanning on production components that handle CUI
- **Third-Party Component Tracking**: Clear understanding of which open-source components are in the CUI boundary

### System Security Plan Simplification
- **Architecture Documentation**: Self-contained documentation of data flows and security controls
- **CUI Data Flow Mapping**: Clear documentation of where CUI enters, flows through, and exits the system
- **Control Implementation**: Each NIST SP 800-171 control can reference specific components without confusion

### Compliance Evidence Collection
- **Cleaner Evidence**: Documentation, logs, scan reports, and test results are all relevant to the assessed system
- **Reduced Noise**: Assessors can focus on production system evolution without filtering experimental code
- **Version Control History**: Git history clearly shows the production system's security-relevant changes

This separation transforms the compliance story from *"Somewhere in this large repository is the AI Assistant that handles CUI"* to *"This is the AI Assistant repository—everything here is in-scope for CMMC L2, with clear security boundaries and targeted controls for CUI protection."*

## Architecture

```
┌─────────────────────────────────────────────────┐
│   xpai-ai-assistant-container (this repo)       │
│                                                  │
│  ┌─────────────────────────────────────────┐   │
│  │  image/                                  │   │
│  │  Builds: ghcr.io/.../ai-assistant-home  │   │
│  └──────────────┬──────────────────────────┘   │
│                 │ base image                    │
│                 ▼                               │
│  ┌─────────────────────────────────────────┐   │
│  │  starter/                                │   │
│  │  Publishes to external read-only repo   │   │
│  └─────────────────────────────────────────┘   │
│                                                  │
│  ┌─────────────────────────────────────────┐   │
│  │  plugins/                                │   │
│  │  Claude Code plugin marketplace         │   │
│  └─────────────────────────────────────────┘   │
└─────────────────────────────────────────────────┘
```

## Container Images

The base container is published to:
- **Registry:** GitHub Container Registry (GHCR)
- **Image:** `ghcr.io/rise8-us/xpai/ai-assistant-home`
- **Tags:** `latest`, `<version>`, `sha-<git-sha>`

## Publishing

The starter repository is automatically published to [xpai-ai-assistant-container-starter](https://github.com/rise8-us/xpai-ai-assistant-container-starter) as a read-only repository.

See [`starter/publish-to-external-repo.sh`](starter/publish-to-external-repo.sh) for the publishing process.

## Development

### Building the Base Container

```bash
cd image
docker build -t ai-assistant-home .
docker run -it ai-assistant-home bash
```

### Testing

```bash
cd image
./scripts/test.sh
```

### Security Scanning

```bash
cd image
./scripts/scan-locally.sh
```

## GitHub Actions

This repository includes automated workflows:

- **Build & Publish Base Container** - Builds and publishes `ai-assistant-home` to GHCR
- **Nightly Security Scan** - Daily vulnerability scanning with Trivy
- **Software Version Updates** - Automated updates for AI tools

## Contributing

See [CONTRIBUTING.md](image/CONTRIBUTING.md) for guidelines.

## License

See individual project directories for license information.
