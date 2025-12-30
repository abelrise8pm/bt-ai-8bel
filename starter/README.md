# AI Assistant Container Project Starter Repository

**NOTE: This repository is automatically synchronized from the [xpai-ai-assistant-container monorepo](https://github.com/rise8-us/xpai-ai-assistant-container/tree/main/starter) repository using Git subtree push.**

## Important Notes

- **This repository is READ-ONLY**
- All changes should be made in the [xpai-ai-assistant-container monorepo](https://github.com/rise8-us/xpai-ai-assistant-container)
- This repo is automatically updated when changes are pushed from the source

## Overview

This starter repository provides everything you need to quickly set up an AI assistant development environment using containers for your customer projects.

### Why Use This? (10-20 min setup saves hours)

| Benefit | Impact |
|---------|--------|
| **Faster onboarding** | New team members make their first commit in hours, not days |
| **Instant codebase knowledge** | Ask Claude about any part of the codebase without reading every file |
| **Secure by default** | Reduces blast radius when something goes wrong; limits agent access to sensitive local files |
| **Pre-configured environment** | No "works on my machine" issues - same setup for everyone |

> *"I don't know anything about our codebase, but I was able to do a ticket pretty quick without knowing how the Helm charts are structured or anything like that."* — New team member after first day with AI assistant

---

## 🔒 Security: Why Use the Container?

> **Do NOT run Claude Code directly on your laptop.** Always use this container.
>
> **Why?** A recent CVE demonstrated that compromised npm packages can exploit locally-installed AI CLI tools to execute attacks on developer machines. The container provides:
> - **Sandboxed execution** - Claude can only access your mounted project directory
> - **Limited attack surface** - Minimal tools installed, no access to your full filesystem
> - **No host machine access** - Even with `--dangerously-skip-permissions`, damage is contained
>
> See [TROUBLESHOOTING.md](docs/TROUBLESHOOTING.md#why-use-the-container-instead-of-local-cli) for details.

---

## ⚠️ CUI Data Warning

> **STOP: Does your project handle CUI (Controlled Unclassified Information)?**
>
> If YES → **Do NOT follow this guide.** Use the [CUI Setup Guide](docs/SETUP-CUI.md) instead.
>
> If NO or UNSURE → Continue with this guide. Ask your project lead if you're unsure.
>
> **Note:** Your Anthropic API key (`sk-ant-api03-...`) from #helpdesk only works for non-CUI projects. CUI projects require AWS Bedrock credentials instead.

---

## 🧭 Navigation - Start Here

Choose your path:

- **🆕 First time setup?** → Follow Steps 1-5 below
- **✅ Already set up?** → Jump to [Step 5: Start Developing](#step-5-start-developing)
- **📊 Context running low?** → See [Managing Context](#-managing-context-in-long-sessions)
- **🆘 Having issues?** → See [TROUBLESHOOTING.md](docs/TROUBLESHOOTING.md)
- **👤 Non-technical user?** → See [docs/QUICK-START-BY-ROLE.md](docs/QUICK-START-BY-ROLE.md)
- **🔧 Advanced setup?** → See [docs/ADVANCED-TOPICS.md](docs/ADVANCED-TOPICS.md)
- **🔒 CUI project?** → See [CUI Setup Guide](docs/SETUP-CUI.md)
- **🛡️ Security & permissions?** → See [Security Model](docs/security-model.md)

---

## 🛠️ Tools Overview - When to Use What

| Tool | Primary Use | When to Use |
|------|-------------|-------------|
| **GitHub Desktop** | Clone repos, view changes | Starting new projects, reviewing what changed |
| **VS Code** | Write code, run Claude | Daily development (inside container) |
| **Terminal** | Run scripts, troubleshooting | Setup, diagnostics, advanced git |

**Typical Daily Workflow:**
1. **Open GitHub Desktop** → Right-click your repo → "Open in Terminal"
2. **Run `code .`** → Opens VS Code at the correct directory
3. **Click "Reopen in Container"** → You're now in the AI assistant environment
4. **Develop** using Claude inside the container

> **Tip:** Once you're comfortable, you can open VS Code directly via Spotlight (Cmd+Space → "Visual Studio Code") and use File → Open Recent to access your project.

---

## Creating a new project repository from this template

*NOTE: If you or your team already has a project repository created from this template, skip this step.*

The AI assistant container requires a project git repository for use. To create your [project repository](https://docs.github.com/en/repositories/creating-and-managing-repositories/about-repositories), follow these steps.

**⚠️ IMPORTANT: Keep these instructions open!**

Before clicking "Use this template", open these instructions in a separate browser tab or window. Clicking "Use this template" will navigate away from this page, and you'll need to refer back to these instructions after creating your repository.

**To create your project repository:**

1. **Open these instructions in a new tab** (Right-click on this tab → select "Duplicate")
2. Return to this tab
3. **Cmd-click** on **"Use this template"** → **"Create a new repository"** to open in a new tab
4. Fill in the repository details:
   - **Owner:** Select **"rise8-us"** from the dropdown (**NOT your personal account** - personal repos can't access the container registry)
   - **Repository name:** Enter a descriptive name (e.g., "project-alpha-ai-assistant" or "yourname-playground")
   - **Description:** Why does this repository exist? What does it do? Why should I care about it?
   - **Visibility:** **private** (required)
   - **Repository apps:** Leave unchecked (no apps needed)
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

**Prerequisites Check:**
- If you don't have GitHub Desktop installed, download it from [GitHub Desktop](https://desktop.github.com/download/) before proceeding

**Option A: Using GitHub Desktop, recommended**
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

**⚠️ BEFORE YOU START: You will need your Anthropic API key during this process.**
- If you don't have your API key yet, wait for it to arrive before running the script
- **The script will prompt you to enter your API key approximately halfway through the installation** (after software installation, before environment configuration)
- Your key will be stored securely in a local `.env` file
- Format: `sk-ant-api03-...`

**What This Script Does:**
- Installs required software (Homebrew, Podman, VSCode, GitHub CLI)
- Configures your development environment
- Sets up GitHub authentication
- Configures container access

**3.1 Enable Admin Privileges** (If using Rippling)
- Enable admin access for your device using the icon in the upper right corner of the screen
- Required for system software installation (Homebrew, Podman, etc.)
- **Keep admin privileges active for the entire setup** (15-20 minutes). If they expire mid-setup, re-enable and re-run the script - it will continue where it left off.

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
   - **Return to your terminal - you'll see a one-time code displayed**
   - **Enter that one-time code** when the terminal prompts you
   - Type **yes** when the terminal asks about authentication confirmation

**Progress Indicators:**
- ✅ Green checkmarks indicate successful steps
- Status messages show current progress
- Some steps take several minutes (software downloads and installations)

**⚠️ IMPORTANT: Do NOT close the terminal window until you see "Setup Complete! ✅"**
- The script may appear idle during long operations (showing progress dots)
- This is normal - installations can take several minutes
- Closing early will interrupt the setup process

**The script installs and configures:**
- Homebrew (macOS package manager)
- Podman (container runtime)
- GitHub CLI (gh)
- VSCode (code editor)
- All necessary configuration files

### Step 4: Open in VSCode

---
**⚠️ CRITICAL STEP: You MUST restart your terminal first**
---

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

> **⚠️ IMPORTANT: You must open the repository ROOT directory**
>
> The container only works when you open the **root** of your repository (where the `.devcontainer/` folder exists).
>
> **How to verify you're at the right level:**
> - In VS Code's Explorer panel (left sidebar), you should see a `.devcontainer` folder
> - If you don't see `.devcontainer`, you've opened the wrong directory
>
> **If "Reopen in Container" doesn't appear:**
> 1. Close VS Code completely
> 2. In GitHub Desktop, right-click your repository → "Open in Terminal"
> 3. Run `code .` again (this opens the correct directory)

**4.3 Install Devcontainers extension**

When you first open VSCode, you'll see a notification in the lower right corner:

**ACTION REQUIRED:** Click **"Install"** when prompted to install the Dev Containers extension.

If you miss this notification:
- Press `Cmd + Shift + P`
- Type "Extensions: Install Extensions"
- Search for "Dev Containers" and install it

**4.4 Open AI assistant container**

- VSCode will prompt: "Folder contains a Dev Container configuration file."
- Click **"Reopen in Container"** in the lower right corner of the screen.
- You can also type `command + shift p` then type "reopen in container" and select that menu item
- Container image will be downloaded on first use so may take a while
- Subsequent opens are much faster

### Step 5: Start Developing!

Once VSCode reopens in the container:

1. **Open the Claude Code plugin:**

   The Claude Code extension is automatically installed in the container. You can access it in two ways:

   - Press `Cmd + Shift + P`
   - Type "Claude Code" and select **"Claude Code: Open"**

2. **Alternative: Use the terminal command:**

   You can also interact with Claude via terminal:
   - **Terminal** menu → **New Terminal** (or press `` Ctrl + Shift + ` ``)
   - Type `claude` and press Enter

That's it! You're ready to develop with AI assistance. 🎉

> **Pro Tip:** Now that Claude is running, you have an infinitely patient tutor that can teach you terminal commands, git workflows, or anything else you want to learn!

**Having issues?** See the [TROUBLESHOOTING.md](docs/TROUBLESHOOTING.md) or check [Quick Help](#-quick-help---common-issues) for common errors.

---

## 📊 Managing Context in Long Sessions

Claude Code has a limited context window (~200k tokens). When context fills up, **auto-compaction** automatically summarizes the conversation to make room.

### Should Your Team Disable Auto-Compact?

Auto-compact works well for exploratory sessions, but some teams prefer to disable it because:
- **Reserves 22.5% buffer** (~45k tokens) whether used or not
- **Can lose context** - variable names get generalized, error messages become vague
- **May forget CLAUDE.md rules** after compaction

**Recommended for**: Teams doing discrete, task-oriented work (implement story → PR → done).

**To disable**: Run `/config` and toggle "Auto-compact when context is full" off.

> **Note**: This is a per-user setting stored in `~/.claude.json`. There's currently no project-level override, so each team member must configure this individually.

### Context Management Commands

| Command | What It Does |
|---------|--------------|
| `/compact` | Manually summarize conversation |
| `/compact [focus]` | Summarize with focus on specific topic (e.g., `/compact authentication`) |
| `/clear` | Start fresh session (clears all context) |
| `/context` | Check current context usage |
| `/config` | Toggle auto-compact on/off for your session |

**Note:** GitHub Codespaces support has been removed from this starter template. For cloud-based development, please contact #r-and-d.

## 🆘 Quick Help - Common Issues

**Something not working?** Run the diagnostic script first:
```bash
./scripts/diagnose.sh
```
This checks your entire environment and shows exactly what's wrong with fix commands.

| Error Message | Solution |
|--------------|----------|
| `x509: certificate signed by unknown authority` | [Zscaler Certificate Fix](docs/TROUBLESHOOTING.md#zscaler-certificate-errors-when-pulling-containers) |
| `Permission denied` in container | [File Permissions Fix](docs/TROUBLESHOOTING.md#file-permission-issues-in-devcontainer) |
| Container won't start / rebuild fails | [Devcontainer Troubleshooting](docs/TROUBLESHOOTING.md#devcontainer-fails-to-open-or-rebuild) |
| `code` command not found | [Restart terminal](docs/TROUBLESHOOTING.md#code-command-not-found-after-setup) |
| Can't pull container images | [Authentication Fix](docs/TROUBLESHOOTING.md#authentication-to-pull-containers) |

**Still stuck?** Run `./scripts/diagnose.sh`, copy the output, and share it in **#r-and-d** Slack channel.

## 📚 Additional Resources

Want to learn more or customize your setup?

- **[docs/TROUBLESHOOTING.md](docs/TROUBLESHOOTING.md)** - Detailed troubleshooting guide for common issues
- **[docs/ADVANCED-TOPICS.md](docs/ADVANCED-TOPICS.md)** - Advanced configuration, CUI projects, custom containers, CI/CD workflows
- **[docs/security-model.md](docs/security-model.md)** - Security layers, permissions deny list, MCP guidance, and provider differences
- **[docs/PLUGIN-DEVELOPMENT.md](docs/PLUGIN-DEVELOPMENT.md)** - Developing and contributing Claude Code plugins
- **[docs/QUICK-START-BY-ROLE.md](docs/QUICK-START-BY-ROLE.md)** - Role-specific quick start guides (coming soon)
- **[docs/KEY-CONCEPTS.md](docs/KEY-CONCEPTS.md)** - Understanding key concepts (coming soon)

---

**Need help?** Reach out in the **#r-and-d** Slack channel.
