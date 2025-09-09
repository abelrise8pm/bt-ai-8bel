# CUI Project Setup Guide

This guide is for projects that work with **sensitive or controlled data**.

## ⚠️ Important Security Requirements

- **Local development only** - Cannot use GitHub Codespaces
- **AWS Bedrock required**
- **Time-limited credentials** - 8-hour session expiration for security

## Prerequisites

1. **AWS Bedrock Access**: You must be assigned to the `ClaudeBedrock` permission set
   - Contact your admin for assignment via a #helpdesk ticket

2. **AWS CLI installed** on your local machine via ` brew install awscli`.

## Setup Steps

### 1. Configure AWS CLI

```bash
aws configure sso --profile claude-bedrock

# When prompted, provide:
# SSO session name: bedrock-session
# SSO start URL: https://start.us-gov-home.awsapps.com/directory/d-c2670a94b1
# SSO region: us-gov-east-1
# SSO registration scopes: sso:account:access
# Role: Select "ClaudeBedrock"
# Default client Region [None]: us-gov-east-1
```

### 2. Configure DevContainer

Copy the CUI devcontainer template:

```bash
mv .devcontainer/devcontainer.cui.json .devcontainer/devcontainer.json
rm .devcontainer/devcontainer.no-cui.json
```

### 3. Configure Claude Code Settings

Copy the CUI environment template:

```bash
cp .env.cui.example .env.claude
```

### 4. Daily Authentication Workflow

**Every 8 hours** (when starting work or when credentials expire):

```bash
# 1. Authenticate with AWS SSO
aws sso login --profile claude-bedrock

# 2. Export credentials for container use
aws configure export-credentials --profile claude-bedrock --format env-no-export > .env.bedrock
```

**NOTE:** You must rebuild the container every time you log back in again.

## Troubleshooting

### "No credentials found" error:
```bash
# Re-authenticate and export fresh credentials
aws sso login --profile claude-bedrock
aws configure export-credentials --profile claude-bedrock --format env-no-export > .env.bedrock
```

### "Access denied" for Bedrock:
- Verify you selected **ClaudeBedrock** permission set during setup
- Check with admin that you're assigned to ClaudeBedrock permission set
- Confirm you're in the correct AWS account (`431331090492`)

### "Profile not found" error:
```bash
# Reconfigure your AWS profile
aws configure sso --profile claude-bedrock
```

## Features

🔒 **Security Compliance** - Meets government security standards
🔄 **Automatic refresh** - 8-hour credential rotation for security
🏠 **Local only** - No cloud development environments
🛡️ **Minimal permissions** - Only Bedrock model access