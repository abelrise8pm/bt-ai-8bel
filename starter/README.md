# AI Assistant Container Project Starter Repository

**NOTE: This repository is automatically synchronized from the [xpai-ai-assistant-container monorepo](https://github.com/rise8-us/xpai-ai-assistant-container/tree/main/starter) repository using Git subtree push.**

## Important Notes

- **This repository is READ-ONLY**
- All changes should be made in the [xpai-ai-assistant-container monorepo](https://github.com/rise8-us/xpai-ai-assistant-container)
- This repo is automatically updated when changes are pushed from the source

## Overview

This starter repository provides everything you need to quickly set up an AI assistant development environment using containers for your customer projects.

## Creating a new project repository from this template

*NOTE: If you or your team already has a project repository created from this template, skip this step.*

The AI assistant container requires a project git repository for use. To create your [project repository](https://docs.github.com/en/repositories/creating-and-managing-repositories/about-repositories), follow these steps.

**⚠️ IMPORTANT: Keep these instructions open!**

Before clicking "Use this template", open these instructions in a separate browser tab or window. Clicking "Use this template" will navigate away from this page, and you'll need to refer back to these instructions after creating your repository.

**To create your project repository:**

1. **Open these instructions in a new tab** (Right-click on this tab → select "Duplicate")
2. Return to this tab
3. Click **"Use this template"** → **"Create a new repository"** in the upper right hand corner
4. Fill in the repository details:
   - **Owner:** "rise8-us"
   - **Repository name:** Enter a descriptive name (e.g., "project-alpha-ai-assistant")
   - **Description:** Why does this repository exist? What does it do? Why should I care about it?
   - **Visibility:** **private** (required)
5. Click **"Create repository"**
6. **Switch to your instructions tab** to continue with the next section

## Getting Started on your laptop with an existing project repository

This guide walks you through setting up the project environment from scratch. Supported platforms:
- **ARM macOS** (Apple Silicon - M1, M2, M3, M4) - Full automated setup

### Step 1: Obtain Anthropic API Key

The AI assistant requires an Anthropic API key to access Claude.

- File a #helpdesk ticket requesting an Anthropic API key
- Key format: `sk-ant-api03-...` (starts with `sk-ant-api03-`)


### Step 2: Clone Your Project Repository to your laptop

**Option A: Using GitHub Desktop, recommended**
   - Install [GitHub Desktop](https://desktop.github.com/download/) if you don't already have it installed from [this link](https://desktop.github.com/download/).
   - Open GitHub Desktop
   - File → Clone Repository...
   - Fill in the repo name: "rise8-us/\<your repo name\>"
   - Choose where to clone the repository locally
   - Press "Clone"

**Option B: Using command line, advanced usage**
   ```bash
   git clone <repo-location>
   cd <your-repo-name>
   ```


### Step 3: Run Automated Onboarding

**⏱️ Expected Time: 10-20 minutes** (mostly automated, you'll respond to a few prompts)

**What This Script Does:**
- Installs required software (Homebrew, Podman, VSCode, GitHub CLI)
- Configures your development environment
- Sets up GitHub authentication
- Configures container access

**3.1 Enable Admin Privileges** (If using Rippling)
- Enable admin access for your device using the icon in the upper right corner of the screen
- Required for system software installation (Homebrew, Podman, etc.)

**3.2 Important Notes Before Starting**

**If you use Zscaler:**
- ✅ **Keep Zscaler ON during setup** - the script automatically detects and configures certificates
- If you accidentally run with Zscaler off, you may need certificate configuration later (contact #r-and-d)

**3.3 Open terminal window to project directory**
In the GitHub desktop application:
- Right click on repository name → "Open in Terminal"

**3.4 Run onboarding script**
In that terminal window, run:

```bash
./scripts/onboard.sh
```

**What to Expect During Setup:**

The script will prompt you for several inputs. Here's what to know:

1. **🔐 Your macOS Password** (appears 2-3 times)
   - ⚠️ **IMPORTANT: Your typing will be INVISIBLE** (normal security behavior)
   - This is your laptop login password
   - Type carefully even though you can't see it, then press Enter
   - If you make a mistake, the script will ask again

2. **🛠️ Xcode Command Line Tools** (if not already installed)
   - A system dialog will appear automatically asking you to install developer tools
   - Click "Install" when prompted
   - Wait 5-15 minutes for download and installation
   - You'll see progress dots in the terminal while it installs
   - The script will automatically continue when installation completes

3. **🔑 Anthropic API Key**
   - Format: `sk-ant-api03-...`
   - ⚠️ **Your typing will be INVISIBLE** (security feature)
   - Paste or type carefully, then press Enter

4. **🌐 GitHub Authentication** (browser-based)
   - Select **HTTPS** when prompted for protocol
   - Your browser will open automatically
   - Complete the GitHub login and authorization
   - Type **yes** when the terminal asks about authentication
   - Return to terminal after authorization

**Progress Indicators:**
- ✅ Green checkmarks indicate successful steps
- Status messages show current progress
- Some steps take several minutes (software downloads and installations)
- Don't close the terminal until you see "Setup Complete! ✅"

**The script installs and configures:**
- Homebrew (macOS package manager)
- Podman (container runtime)
- GitHub CLI (gh)
- VSCode (code editor)
- All necessary configuration files

### Step 4: Open in VSCode

**4.1 Restart Your Terminal**

**Why restart?** The onboarding script installed new software that needs a fresh terminal session to work correctly.

**How to restart:**
1. Close your current terminal window (Cmd+Q or click the red X)
2. Open GitHub Desktop
3. Right-click your repository → "Open in Terminal"
4. A fresh terminal opens with the correct environment

**4.2 Open VSCode**

Run this in the new terminal window:

```bash
code .
```

**4.3 Install Devcontainers extension**

If you are running VSCode for the first time, it will prompt you to install the Devcontainers extension in the lower right corner of the window.

**4.4 Open AI assistant container**

- VSCode will prompt: "Folder contains a Dev Container configuration file."
- Click **"Reopen in Container"** in the lower right corner of the screen.
- You can also type `command + shift p` then type "reopen in container" and select that menu item
- Container image will be downloaded on first use so may take a while
- Subsequent opens are much faster

### Step 5: Start Developing!

Once VSCode reopens in the container:

1. **Open a terminal in VSCode:**
   - **Terminal** menu → **New Terminal** (or press `` Ctrl + Shift+ ` ``)

2. **Start the AI assistant:**
   ```bash
   claude
   ```

That's it! You're ready to develop with AI assistance. 🎉

**Having issues?** See the [Troubleshooting](#troubleshooting) section below for common problems and solutions.

## Alternative: GitHub Codespaces Setup

For no CUI projects, you can use GitHub Codespaces instead of local setup:

1. **Configure environment variables** in GitHub:
   - Go to GitHub User Profile → Settings → Codespaces → Codespace user secrets
   - Add `ANTHROPIC_API_KEY` and grant access to your repositories

2. **Launch Codespace:**
   - Go to your repository on GitHub
   - Click "Code" button → Codespaces tab → "+"

3. **Start using Claude:**
   - Open terminal in Codespace
   - Type: `claude`

---

## Advanced Setup: CUI Data Projects

**NOTE:** The setup instructions above cover standard (No CUI) projects. If your project handles CUI data, use the specialized setup below.

**IMPORTANT:** The use of the AI assistant container for CUI data is still a work in progress and should not be used on a customer project.

### **CUI Data Requirements**

Projects that give the container access to CUI (Controlled Unclassified Information) data must use AWS Bedrock instead of the Anthropic API.

**Available Models:**
- [Haiku and Claude 3.5](https://aws.amazon.com/blogs/publicsector/accelerating-government-innovation-amazon-bedrock-models-get-fedramp-high-and-dod-il-4-5-approval-in-aws-govcloud-us/)
- [Claude 3.7](https://aws.amazon.com/about-aws/whats-new/2025/07/anthropics-claude-3-7-sonnet-available-amazon-bedrock-aws-govcloud-us-west/)

### **📖 [CUI Setup Guide](docs/SETUP-CUI.md)**

For CUI projects, follow the comprehensive CUI Setup Guide which includes:
- AWS Bedrock configuration with FedRAMP and IL4/5 compliance
- Local development only (no Codespaces support)
- Enhanced security requirements
- Required firewall protection for network isolation (CMMC Level 2)

## Customizing Your Container with Project-Specific Tools

Most projects need additional tools beyond what's in the base image (e.g., language runtimes, CLIs, build tools). To add these securely:

**Use a Project Container**: Build a custom container image that extends the base image with your project-specific tools. See the [project-container example](../project-container) in this monorepo for a complete reference implementation.

This approach:
- Ensures all team members use the same vetted, scanned image
- Uses GitHub workflows for automated builds and security scanning
- Prevents unauthorized or unvetted tool installations
- Enables compliance and audit trails
- Works seamlessly with CI/CD pipelines

**Pro Tip:** Use Claude Code to help customize your project container! Ask Claude to read the [project-container README](../project-container/README.md) and ask you questions to get what you need installed.

### Integrating a spec driven development workflow

Spec driven development is a powerful alternative to ad hoc prompting for getting better results out of AI assistants. Instead of providing informal instructions, you create structured specifications that guide the AI through your development process.

**Recommended Solutions:**

- **[Rise8 Solutions](https://github.com/rise8-us/solutions)** - Rise8's curated collection of spec-driven development patterns and practices
- **[GitHub spec-kit](https://github.com/github/spec-kit)** - Open-source toolkit for spec-driven development that works with Claude Code and other AI assistants. Provides a structured workflow from constitution and specification creation through technical planning and execution. Particularly useful for greenfield projects, exploring multiple technology approaches, or modernizing existing systems.

### Recruiting specialized agents for your team

Instead of relying on a single generalist AI, you can delegate specialized work to domain experts by recruiting agents from Rise8's curated library. Each agent is a specialist in their discipline—software engineering, platform engineering, cybersecurity, SRE, and more.

[8gents](https://github.com/rise8-us/8gents) provides tactical agents for hands-on implementation (TDD, infrastructure automation, security controls) and strategic agents for architecture and planning. Copy the agents you need to your project's `.claude/agents/` directory, update your `CLAUDE.md` with delegation guidance, and let Claude Code route specialized work to the right expert.


## GitHub Workflows for CI/CD pipelines

This starter includes automated CI/CD workflows for building, testing, and securing your project container:

- **Build & Publish** - Automatically builds and publishes container images when changes are pushed
- **Security Scanning** - Daily vulnerability scans with Trivy
- **Base Container Updates** - Monitors and updates AI assistant base container references

📖 **[Workflow Setup Guide](.github/workflows/README.md)** - Complete setup instructions and configuration options

---


## Getting started with the dev-commands flow

1. Type `claude` in a terminal window.

2. Type `/dev-commands:help`.

3. Follow the online instructions.

## Troubleshooting

This section covers common issues and their solutions. For CUI project-specific troubleshooting, see the [CUI Setup Guide](docs/SETUP-CUI.md).

### Onboarding script failures

**If the onboarding script fails:**

1. **Check the log file** for detailed error information:
   ```bash
   cat ./ai-assistant-onboard.log
   ```

2. **Common issues and solutions:**
   - **Xcode CLI Tools installation dialog** - Click 'Install' when prompted; script will wait for completion automatically
   - **Admin access denied** - Enable admin privileges in Rippling (see Prerequisites)
   - **Podman machine fails** - Check available disk space (requires ~20GB)
   - **GitHub authentication fails** - Verify network connectivity, try manual login: `gh auth login -s read:packages`
   - **Container registry access denied** - Contact administrator to request access to rise8-us/XPai organization

3. **Re-run the script** - Safe to re-run, it will skip already-completed steps:
   ```bash
   ./scripts/onboard.sh
   ```

4. **Need help?** Ask in #r-and-d Slack channel for assistance

### Common First-Time Setup Issues

**Issue: "Password not accepted" or stuck at password prompt**
- **Cause:** Hidden input - you can't see what you're typing
- **Solution:** Type your password carefully (even though invisible) and press Enter
- If you make a mistake, press Ctrl+C to cancel and re-run the script

**Issue: Script seems stuck with dots appearing**
- **Expected behavior:** This is normal during Xcode Command Line Tools installation
- **What to do:**
  1. Look for "Software Update" or "Install Command Line Tools" dialog
  2. Click "Install" if prompted
  3. Wait for completion (may take 10-15 minutes)
  4. Script continues automatically - do not close terminal

**Issue: Zscaler certificate errors after setup**
- **Cause:** Setup was run with Zscaler turned off
- **Solution:** Contact #r-and-d Slack channel for certificate configuration help
- **Prevention:** Keep Zscaler ON during setup (script auto-configures certificates)

**Issue: `code` command not found after setup**
- **Cause:** Terminal needs to be restarted to load new PATH
- **Solution:**
  1. Close terminal completely (Cmd+Q)
  2. Open GitHub Desktop
  3. Right-click repository → "Open in Terminal"
  4. Try `code .` again

### Authentication to pull containers

If your project team encounters authentication issues with `ghcr.io`, follow these steps on your host machine:

1. Log into GitHub CLI with package read permissions:
   ```bash
   gh auth logout
   gh auth login -s read:packages
   ```

2. Use your GitHub CLI token to authenticate with the container registry:
   ```bash
   podman logout ghcr.io
   gh auth token | podman login ghcr.io -u $(gh api user --jq .login) --password-stdin
   ```

3. Test pulling the image:
  ```bash
  podman pull ghcr.io/rise8-us/xpai/ai-assistant-home@sha:<digest>
  ```

### VSCode container detection issues

If VSCode doesn't automatically detect or prompt to reopen in the container:

1. Verify the [Dev Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) is installed
2. Check container runtime is configured in VSCode settings:
   ![devcontainer settings](docs/devcontainer-settings.png)
   ![container runtime](docs/container-runtime.png)
3. Manually trigger: Press `Cmd+Shift+P` → "Dev Containers: Reopen in Container"

### File permission issues in devcontainer

If you experience file permission problems inside the devcontainer (e.g., unable to create files/folders, files owned by 'root' or 'dialout' instead of 'aiAssistant', "Permission denied" errors), this is typically caused by running podman in rootful mode instead of rootless mode.

**Diagnosis:**

Check if your podman machine is running in rootless mode:
```bash
podman info --format '{{.Host.Security.Rootless}}'
```

This should return `true`. If it returns `false`, you are running in rootful mode.

**Solution:**

Rootless mode is the default for podman. If your machine is running in rootful mode, the recommended approach is to delete the podman machine and recreate it:

```bash
# Stop and delete the current machine
podman machine stop
podman machine rm

# Create and start a new machine (will default to rootless)
podman machine init
podman machine start
```

After recreating the machine, rebuild your devcontainer in VSCode.

**Note:** In some cases, even with rootless mode, files may still be owned by 'root'. If this occurs after recreating your podman machine, you can add the following to your `.devcontainer/devcontainer.json` `runArgs`:

```json
"runArgs": [
  "--userns=keep-id:uid=1001,gid=1001"
]
```

Then rebuild the devcontainer.

## Assistance

If you run into issues, please hit us up in the #r-and-d Slack channel.
