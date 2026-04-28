# CUI Project Setup Guide

This guide is for projects that work with **sensitive or controlled data**.

## ⚠️ Important Security Requirements

- **Local development only** - Cannot use GitHub Codespaces
- **AWS Bedrock required** - FedRAMP High and DoD IL4/5 approved models
- **Firewall protection required** - CMMC Level 2 compliant network isolation mandatory for CUI data
- **Time-limited credentials** - 8-hour session expiration for security

## ❌ What Does NOT Work in CUI Containers

| Tool/Credential | Works in CUI? | Why |
|-----------------|---------------|-----|
| **Anthropic API Key** (`sk-ant-api03-...`) | ❌ No | Firewall blocks Anthropic API endpoints |
| **Gemini CLI** | ❌ No | Firewall blocks Google AI endpoints |
| **AWS Bedrock credentials** | ✅ Yes | GovCloud endpoints are whitelisted |
| **Claude Code with Bedrock** | ✅ Yes | Uses whitelisted Bedrock endpoints |

> **Got an Anthropic API key from #helpdesk?** That key is for **non-CUI projects only**. For CUI projects, you need AWS Bedrock access via a project-scoped permission set (see Prerequisites below).

See https://docs.google.com/document/d/1gtr62hDuvpnfzrc9Sqny4iYzHx_dBaGhpPcp4gRDUxk/edit?tab=t.0.

## Prerequisites

1. **AWS Bedrock Access**: You must be assigned to a `BedrockAccess-{YourProject}` permission set
   - Reach out to your **Delivery Lead** if you think you should have access — they'll submit the request
   - Each project has its own permission set (e.g., `BedrockAccess-KM`, `BedrockAccess-Torque`)

2. **AWS CLI installed** on your local machine via `brew install awscli`.

## Setup Steps

### 1. Configure AWS CLI

```bash
aws configure sso --profile bedrockaccess-yourproject

# When prompted, provide:
# SSO session name: rise8
# SSO start URL: https://start.us-gov-west-1.us-gov-home.awsapps.com/directory/rise8
# SSO region: us-gov-west-1
# SSO registration scopes: sso:account:access
# Role: Select your project's permission set (e.g., "BedrockAccess-KM")
# Default client Region [None]: us-gov-west-1
```

Or add this directly to `~/.aws/config`:

```ini
[profile bedrockaccess-yourproject]
sso_session = rise8
sso_account_id = 431331090492
sso_role_name = BedrockAccess-YourProject
region = us-gov-west-1

[sso-session rise8]
sso_start_url = https://start.us-gov-west-1.us-gov-home.awsapps.com/directory/rise8
sso_region = us-gov-west-1
sso_registration_scopes = sso:account:access
```

> **Replace `yourproject`/`YourProject`** with your actual project name in lowercase for the profile and matching case for the role (e.g., profile `bedrockaccess-tak`, role `BedrockAccess-TAK`).
>
> If you work on multiple projects, create one profile per project. They can share the same `[sso-session rise8]` block.

### 2. Configure DevContainer

Use the CUI devcontainer with mandatory firewall protection:

```bash
mv .devcontainer/devcontainer.cui.json .devcontainer/devcontainer.json
```

**Firewall Features (Required for CUI):**
- Deny-by-default iptables firewall
- Whitelist-based network access control
- Prevents data exfiltration via prompt injection attacks
- CMMC Level 2 compliant boundary protection

📖 **[Complete Firewall Documentation](firewall/README-FIREWALL.md)** - Setup, configuration, and troubleshooting

### 3. Configure Project Settings

Copy and configure the environment template:

```bash
cp .env.example .env
```

Edit `.env` and:
1. Uncomment the **CUI Projects** section
2. Delete the Non-CUI section

**Note:** If you need to run multiple CUI projects concurrently, edit `.devcontainer/docker-compose.firewall.yml` and change the `container_name` fields to unique names (e.g., `myproject-firewall-manager`, `myproject-ai-assistant`)

### 4. Daily Authentication Workflow

**Every 8 hours** (when starting work or when credentials expire):

```bash
# 1. Authenticate with AWS SSO
aws sso login --profile bedrockaccess-yourproject

# 2. Export credentials for container use
aws configure export-credentials --profile bedrockaccess-yourproject --format env-no-export > .env.bedrock

# 3. Rebuild the container to load new credentials
# In VSCode: Cmd/Ctrl + Shift + P → "Dev Containers: Rebuild Container"
```

**⚠️ IMPORTANT:** You **must rebuild the container** after refreshing credentials. The container only reads `.env.bedrock` during startup. If you don't rebuild, you'll get authentication errors even though your credentials are fresh.

## Troubleshooting

### "403 The security token included in the request is expired" error:

This is the most common error and means your AWS credentials have expired (8-hour limit).

**Solution:**
```bash
# 1. Refresh your AWS credentials
aws sso login --profile bedrockaccess-yourproject
aws configure export-credentials --profile bedrockaccess-yourproject --format env-no-export > .env.bedrock

# 2. Rebuild the container
# In VSCode: Cmd/Ctrl + Shift + P → "Dev Containers: Rebuild Container"
```

**Why this happens:** The container reads `.env.bedrock` only at startup. Even if you refresh credentials, the running container still has the old expired tokens. Rebuilding loads the fresh credentials.

### "No credentials found" error:
```bash
# Re-authenticate and export fresh credentials
aws sso login --profile bedrockaccess-yourproject
aws configure export-credentials --profile bedrockaccess-yourproject --format env-no-export > .env.bedrock

# Then rebuild the container
# In VSCode: Cmd/Ctrl + Shift + P → "Dev Containers: Rebuild Container"
```

### "Access denied" for Bedrock:
- Verify `sso_role_name` in your `~/.aws/config` matches the permission set you were assigned (e.g., `BedrockAccess-TAK`)
- If you don't see your permission set listed when running `aws configure sso`, reach out to your **Delivery Lead** to confirm your access
- Confirm you're in the correct AWS account (`431331090492`)

### "Profile not found" error:
```bash
# Reconfigure your AWS profile
aws configure sso --profile bedrockaccess-yourproject
```

### Explore tool fails with "model identifier is invalid":

Claude Code's Explore tool uses a small/fast model (Haiku) for subagent tasks. Haiku is not available as an inference profile in AWS GovCloud, so you must point the small model to Sonnet instead.

**Solution:** Ensure your `.env` has both lines uncommented:
```bash
ANTHROPIC_SMALL_FAST_MODEL=us-gov.anthropic.claude-sonnet-4-5-20250929-v1:0
ANTHROPIC_DEFAULT_HAIKU_MODEL=us-gov.anthropic.claude-sonnet-4-5-20250929-v1:0
```

Both variables are set for compatibility across Claude Code versions (`ANTHROPIC_SMALL_FAST_MODEL` is deprecated but still read by older versions).

Then rebuild the container to apply the change.

### API Error: 400 "x-anthropic-billing-header is a reserved keyword"

Claude Code injects an `x-anthropic-billing-header` text block into the system prompt. Bedrock rejects this as a reserved keyword, causing a `400 Bad Request` error. This is an upstream bug ([anthropics/claude-code#24168](https://github.com/anthropics/claude-code/issues/24168)) introduced in Claude Code v2.1.36.

**Solution:** Ensure your `.env` has this line uncommented:
```bash
CLAUDE_CODE_ATTRIBUTION_HEADER=0
```

Then rebuild the container to apply the change.

> **Note:** This uses an undocumented env var as a workaround. It will be removed once the upstream bug is fixed.

## Features

🔒 **Security Compliance** - Meets CMMC Level 2 and government security standards
🛡️ **Network Firewall** - Deny-by-default iptables firewall prevents data exfiltration
🔄 **Automatic refresh** - 8-hour credential rotation for security
🏠 **Local only** - No cloud development environments
🔐 **Minimal permissions** - Only Bedrock model access, zero container capabilities
⚡ **Prompt Caching** - Enabled by default (FedRAMP High authorized); disable by adding `DISABLE_PROMPT_CACHING=1` to `.env` if needed
