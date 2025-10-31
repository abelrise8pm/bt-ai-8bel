# Non-CUI Project Setup Guide

This guide is for projects that **do not** handle CUI (Controlled Unclassified Information).

**Important:** Non-CUI projects do not require any CUI-related directories, firewall configurations, or AWS Bedrock setup. This is a simpler configuration using the Anthropic API directly.

## Setup Steps

### 1. Remove CUI-Specific Files and Directories

Non-CUI projects do not need the firewall infrastructure or CUI-specific configurations. Remove them:

```bash
# Remove firewall directory and all its contents
rm -rf firewall/

# Remove firewall documentation
rm -rf docs/firewall/

# Remove CUI devcontainer configuration
rm -f .devcontainer/devcontainer.cui.json

# Remove firewall docker-compose file
rm -f .devcontainer/docker-compose.firewall.yml
```

### 2. Configure DevContainer

Copy the non-CUI devcontainer template:

```bash
# If you are developing on your laptop.
mv .devcontainer/devcontainer.no-cui.json .devcontainer/devcontainer.json

# If you are using codespaces.
rm .devcontainer/devcontainer.no-cui.json
```

### 3. Set Up Environment Variables

Create your environment file from the example:

```bash
cp .env.example .env
```

Edit `.env` and:
1. Set `PROJECT_NAME` to your project directory name (e.g., `my-project`)
2. Uncomment the **Non-CUI Projects** section
3. Add your `ANTHROPIC_API_KEY` (file a #helpdesk ticket for keys)
4. Delete the section related to CUI projects.

## Features

✅ **Simple setup** - Just copy files and add API keys
✅ **Codespaces compatible** - Works seamlessly in GitHub Codespaces
✅ **No AWS configuration** - Uses Anthropic API directly
✅ **No CUI infrastructure** - No firewall, no AWS Bedrock, no special directories required
✅ **Fast start** - Container ready in minutes