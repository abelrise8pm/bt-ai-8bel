# Non-CUI Project Setup Guide

This guide is for projects that do not mount CUI data into the container via the project directory.


## Setup Steps

### 1. Configure DevContainer

Copy the non-CUI devcontainer template:

```bash
mv .devcontainer/devcontainer.no-cui.json .devcontainer/devcontainer.json
rm .devcontainer/devcontainer.cui.json
```

### 2. Set Up Environment Variables

Create your environment file from the example:

```bash
cp .env.example .env
```

Edit `.env` and:
1. Set `PROJECT_NAME` to your project directory name (e.g., `my-project`)
2. Uncomment the **Non-CUI Projects** section
3. Add your `ANTHROPIC_API_KEY` (file a #helpdesk ticket for keys)
4. Delete the section related to CUI data.

## Features

✅ **Simple setup** - Just copy files and add API keys
✅ **Codespaces compatible** - Works seamlessly in GitHub Codespaces
✅ **No AWS configuration** - Uses Anthropic API directly
✅ **Fast start** - Container ready in minutes