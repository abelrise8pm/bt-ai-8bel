# Advanced Topics

**[← Back to Main README](../README.md)**

This guide covers advanced configuration and customization options for the AI Assistant Container.

## Table of Contents

- [CUI Data Projects](#cui-data-projects)
- [GovCloud Infrastructure Setup](#govcloud-infrastructure-setup)
- [Customizing Your Container with Project-Specific Tools](#customizing-your-container-with-project-specific-tools)
- [Working with Multiple Git Repositories](#working-with-multiple-git-repositories)
- [Integrating Spec Driven Development Workflow](#integrating-spec-driven-development-workflow)
- [Recruiting Specialized Agents](#recruiting-specialized-agents-for-your-team)
- [GitHub Workflows for CI/CD Pipelines](#github-workflows-for-cicd-pipelines)
- [Using Claude Code Commands](#using-claude-code-commands)

---

## CUI Data Projects

**NOTE:** The setup instructions in the main README cover standard (No CUI) projects. If your project handles CUI data, use the specialized setup below.

**IMPORTANT:** The use of the AI assistant container for CUI data is still a work in progress and should not be used on a customer project.

### CUI Data Requirements

Projects that give the container access to CUI (Controlled Unclassified Information) data must use AWS Bedrock instead of the Anthropic API.

**Available Models:**
- [Haiku and Claude 3.5](https://aws.amazon.com/blogs/publicsector/accelerating-government-innovation-amazon-bedrock-models-get-fedramp-high-and-dod-il-4-5-approval-in-aws-govcloud-us/)
- [Claude Sonnet 4.5](https://www.anthropic.com/news/claude-sonnet-4-5)

### 📖 [CUI Setup Guide](SETUP-CUI.md)

For CUI projects, follow the comprehensive CUI Setup Guide which includes:
- AWS Bedrock configuration with FedRAMP and IL4/5 compliance
- Local development only (no Codespaces support)
- Enhanced security requirements
- Required firewall protection for network isolation (CMMC Level 2)

---

## GovCloud Infrastructure Setup

### 🏗️ [GovCloud Infrastructure Repository](https://github.com/rise8-us/XPai/tree/main/govcloud-infrastructure)

For projects requiring FedRAMP or DoD IL4/5 compliance, the GovCloud infrastructure repository provides:
- Terraform configurations for AWS GovCloud deployment
- Anthropic Bedrock API integration setup
- Network architecture and security controls
- Compliance-ready infrastructure templates

**Prerequisites:**
- AWS GovCloud account access
- Appropriate security clearances
- Coordination with platform engineering team

**Note:** GovCloud infrastructure setup requires specialized configuration and should be coordinated with the #r-and-d team before deployment.

---

## Customizing Your Container with Project-Specific Tools

Most projects need additional tools beyond what's in the base image (e.g., language runtimes, CLIs, build tools). To add these securely:

**Use a Project Container**: Build a custom container image that extends the base image with your project-specific tools. See the [project-container example](../project-container) in this repository for a complete reference implementation.

This approach:
- Ensures all team members use the same vetted, scanned image
- Uses GitHub workflows for automated builds and security scanning
- Prevents unauthorized or unvetted tool installations
- Enables compliance and audit trails
- Works seamlessly with CI/CD pipelines

**Pro Tip:** Use Claude Code to help customize your project container! Ask Claude to read the [project-container README](../project-container/README.md) and ask you questions to get what you need installed.

---

## Working with Multiple Git Repositories

The container is designed to work with a single git repository by default. However, you can mount additional repositories into the same container to enable the AI assistant to work across multiple codebases simultaneously.

**Use Case Example:** You might want to:
- Migrate code from one repository to another
- Reference shared libraries or utilities from another project
- Work on dependent services that live in separate repositories
- Access documentation or configuration from a related repository

### How to Mount Additional Repositories

Add additional mount points to your `.devcontainer/devcontainer.json` file:

```json
{
  "name": "AI Assistant Container",
  // ... other configuration ...
  "mounts": [
    "source=/Users/your-username/workspace/other-repo,target=/workspaces/other-repo,type=bind"
  ]
}
```

**Configuration Details:**
- `source`: Absolute path to the repository on your host machine
- `target`: Path where the repository will appear inside the container (typically under `/workspaces/`)
- `type`: Use `bind` for direct filesystem mounting

**Example - Multiple Mounts:**

```json
"mounts": [
  "source=/Users/mike/workspace/tracer,target=/workspaces/tracer,type=bind",
  "source=/Users/mike/workspace/shared-lib,target=/workspaces/shared-lib,type=bind"
]
```

**Access Pattern:**

Once configured, you can reference the additional repositories in Claude Code:
- Primary repository: `/workspaces/xpai-ai-assistant-container` (your main project)
- Additional repositories: `/workspaces/tracer`, `/workspaces/shared-lib`, etc.

**Important Notes:**
- Changes made in mounted repositories will affect the actual repository on your host machine
- The AI assistant will have access to all mounted repositories
- Each repository maintains its own git state and history
- You can use standard git commands in each repository independently

---

## Integrating Spec Driven Development Workflow

Spec driven development is a powerful alternative to ad hoc prompting for getting better results out of AI assistants. Instead of providing informal instructions, you create structured specifications that guide the AI through your development process.

**Recommended Solutions:**

- **[Rise8 Solutions](https://github.com/rise8-us/solutions)** - Rise8's curated collection of spec-driven development patterns and practices
- **[GitHub spec-kit](https://github.com/github/spec-kit)** - Open-source toolkit for spec-driven development that works with Claude Code and other AI assistants. Provides a structured workflow from constitution and specification creation through technical planning and execution. Particularly useful for greenfield projects, exploring multiple technology approaches, or modernizing existing systems.

---

## Recruiting Specialized Agents for Your Team

Instead of relying on a single generalist AI, you can delegate specialized work to domain experts by recruiting agents from Rise8's curated library. Each agent is a specialist in their discipline—software engineering, platform engineering, cybersecurity, SRE, and more.

[8gents](https://github.com/rise8-us/8gents) provides tactical agents for hands-on implementation (TDD, infrastructure automation, security controls) and strategic agents for architecture and planning. Copy the agents you need to your project's `.claude/agents/` directory, update your `CLAUDE.md` with delegation guidance, and let Claude Code route specialized work to the right expert.

---

## GitHub Workflows for CI/CD Pipelines

This starter includes automated CI/CD workflows for building, testing, and securing your project container:

- **Build & Publish** - Automatically builds and publishes container images when changes are pushed
- **Security Scanning** - Daily vulnerability scans with Trivy
- **Base Container Updates** - Monitors and updates AI assistant base container references

📖 **[Workflow Setup Guide](../.github/workflows/README.md)** - Complete setup instructions and configuration options

---

## Using Claude Code Commands

The base container includes helpful slash commands available in Claude Code. These commands provide structured workflows for common development tasks.

### Available Commands

- **`/commit`** - Creates a conventional commit based on your staged files
  - Automatically analyzes staged changes
  - Generates commit messages following Conventional Commit standard
  - Asks for context if needed to explain the "why" and "what"

### Using the Commit Command

1. Stage your changes: `git add <files>`
2. In Claude Code, type: `/commit`
3. Claude will analyze your changes and create a proper commit message
4. If needed, Claude will ask you for additional context

### Customizing Commands for Your Project

You can override any base command or create new project-specific commands:

1. **Create the commands directory** in your project root:
   ```bash
   mkdir -p .claude/commands
   ```

2. **Create or override a command** by adding a markdown file:
   ```bash
   # Override the commit command
   echo "Your custom commit instructions here" > .claude/commands/commit.md

   # Or create a new command
   echo "Your custom command instructions" > .claude/commands/my-command.md
   ```

3. **Use your command** in Claude Code:
   ```
   /commit          # Uses your custom version if it exists
   /my-command      # Your custom command
   ```

**Command Resolution Priority:**
1. Project-level `.claude/commands/` (highest priority)
2. Base container commands at `~/.claude/commands/`

This allows teams to:
- Standardize workflows across the team (commit via base image)
- Customize for specific project needs (project-level overrides)
- Share and version control custom commands (in project repo)

---

**[← Back to Main README](../README.md)**
