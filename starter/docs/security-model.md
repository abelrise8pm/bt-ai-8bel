# Security Model and Permissions Guide

**[← Back to Main README](../README.md)**

This guide explains the security model, how to customize your team's security posture, and guidance on provider-specific considerations.

## Table of Contents

- [Three Layers of Protection](#three-layers-of-protection)
- [Permissions Deny List](#permissions-deny-list)
- [Why No Company-Wide Command Blocklist](#why-no-company-wide-command-blocklist)
- [MCP (Model Context Protocol) Guidance](#mcp-model-context-protocol-guidance)
- [Data Retention by Provider](#data-retention-by-provider)
- [Quick Reference](#quick-reference)

---

## Three Layers of Protection

The AI Assistant Container uses a defense-in-depth approach with three complementary security layers:

| Layer | What it does | Scope | Can teams modify? |
|-------|--------------|-------|-------------------|
| **Firewall** | Blocks network access to unauthorized hosts | Company-wide (infrastructure) | No - this is the hard security boundary |
| **Container contents** | Controls what tools are available | Base image + project-container | Teams can add tools but not remove base restrictions |
| **Permissions deny list** | Blocks Claude from specific file/command patterns | Project-level | Yes - teams own their policies |

### How the Layers Work Together

1. **Firewall (Infrastructure Layer)**: The deny-by-default firewall blocks all network traffic except explicitly whitelisted endpoints. This is the hard security boundary that protects against data exfiltration, even if other controls fail. See [Firewall Documentation](firewall/README-FIREWALL.md) for details.

2. **Container Contents (Image Layer)**: The base container includes only necessary tools. Tools like `nslookup`, `dig`, or `mvn` aren't installed unless teams explicitly add them via a project container.

3. **Permissions Deny List (Project Layer)**: Claude Code respects deny rules configured at the project level. Teams can customize which files Claude can read and which commands it can execute.

---

## Permissions Deny List

Teams can configure project-level deny rules in `.claude/settings.json` to control what Claude can access.

### Configuration File

Create `.claude/settings.json` in your project root:

```json
{
  "permissions": {
    "deny": [
      "Read(./.env)",
      "Read(**/*.pem)",
      "Read(**/*.key)",
      "Bash(git commit:*)",
      "Bash(git push:*)"
    ]
  }
}
```

### Recommended Defaults

These rules protect sensitive files that should never be read by Claude:

| Pattern | Purpose |
|---------|---------|
| `Read(./.env)` | Prevent reading environment files with secrets |
| `Read(**/*.pem)` | Prevent reading SSL/TLS certificates |
| `Read(**/*.key)` | Prevent reading private keys |
| `Read(**/*.p12)` | Prevent reading PKCS#12 keystores |
| `Read(**/*credentials*)` | Prevent reading credential files |

### Optional Workflow Controls

These are team preferences, not security controls. Use them to enforce human review points:

| Pattern | Purpose |
|---------|---------|
| `Bash(git commit:*)` | Require human review of commits |
| `Bash(git push:*)` | Require human to push changes |
| `Bash(git rebase:*)` | Prevent automated rebasing |
| `Bash(npm publish:*)` | Prevent automated npm publishing |

### Pattern Syntax

- `Read(<glob>)` - Block reading files matching the glob pattern
- `Bash(<command>:*)` - Block bash commands matching the pattern
- `mcp__.*` - Block all MCP tool calls (see [MCP section](#mcp-model-context-protocol-guidance))

### Deny List vs Security Controls

| Type | Examples | Purpose |
|------|----------|---------|
| **Security controls** | Firewall rules, container isolation | Protect against malicious actions; cannot be bypassed |
| **Workflow preferences** | Git commit deny, file read deny | Enforce team processes; can be overridden if needed |

The deny list is a **workflow preference** layer. It helps teams enforce consistent practices but is not a substitute for infrastructure-level security controls like the firewall.

---

## Why No Company-Wide Command Blocklist

You might wonder why we don't maintain a company-wide list of blocked commands. Here's the reasoning:

### 1. Firewall handles network risks

Commands like `curl`, `wget`, `npm install`, and `git push` are "neutered" by the firewall - they can't reach external hosts. The network layer provides stronger protection than command blocking.

### 2. Container contents handle tool availability

Tools that aren't needed shouldn't be installed. If your project doesn't need `mvn`, don't add it to your project container. This is more secure than trying to block it at runtime.

### 3. One-size-fits-all is too rigid

Different projects have different needs:
- A Java project might want `mvn` blocked but allow `npm`
- A Node project is the opposite
- Some teams want Claude to commit; others don't

### 4. Deny lists are preferences, not security

"Don't let Claude git commit" is a workflow choice, not a security control. The firewall prevents the real risks (data exfiltration, unauthorized network access).

---

## MCP (Model Context Protocol) Guidance

### What is MCP?

MCP allows Claude to connect to external tools and services (databases, APIs, file systems) via configured servers. It enables powerful integrations but introduces risk if misconfigured.

### Current State

- **MCP is NOT enabled by default** - requires explicit configuration via `.mcp.json` or settings
- **Firewall blocks external MCP connections** - MCP servers that connect to external services are blocked by the firewall
- **Local MCP servers are possible** - filesystem or local database access would work if configured

### Risk Assessment

| Risk | Mitigation |
|------|------------|
| MCP server connects to external service | Firewall blocks this |
| MCP server accesses local resources | Possible if configured |
| Prompt injection exploits MCP tools | Risk exists for configured MCP servers |

### Team Options

| Risk tolerance | Configuration |
|----------------|---------------|
| **Disable MCP entirely** | Add `"mcp__.*"` to permissions deny list |
| **Allow read-only MCP** | Configure specific MCP servers, deny write operations |
| **Allow specific MCP servers** | Configure only approved servers in `.mcp.json` |

### Disabling MCP

To disable all MCP tools, add to `.claude/settings.json`:

```json
{
  "permissions": {
    "deny": [
      "mcp__.*"
    ]
  }
}
```

### High-Security Environments

For high-security environments, teams can deploy a managed MCP configuration that prevents users from adding their own servers. See the [Claude Code documentation on managed-mcp.json](https://docs.anthropic.com/en/docs/agents-and-tools/claude-code/settings#managed-mcp-settings) for details.

---

## Data Retention by Provider

### Provider Differences

Data handling varies significantly depending on which API provider you use:

| Provider | Data flows to | Compliance framework | ZDR applies? |
|----------|---------------|---------------------|--------------|
| **Anthropic API** | Anthropic's servers | Anthropic's policies | Yes (if in contract) |
| **AWS Bedrock** | AWS infrastructure | AWS compliance | No - AWS policies apply |
| **AWS GovCloud Bedrock** | AWS GovCloud | FedRAMP High, ITAR, CMMC | No - AWS GovCloud policies apply |

### When Zero Data Retention (ZDR) Matters

**ZDR is an Anthropic contract term** that prevents Anthropic from retaining your prompts/responses. It only applies when using the Anthropic API directly.

| Scenario | ZDR Relevant? | Why |
|----------|---------------|-----|
| CUI projects on GovCloud Bedrock | No | Data handled by AWS GovCloud, not Anthropic |
| Non-CUI projects on Anthropic API | Check contract | ZDR is a contract-level setting |
| Non-CUI projects on commercial Bedrock | No | Data handled by AWS, not Anthropic |

### Nonessential Traffic by Provider

Claude Code sends telemetry to Anthropic's services (Statsig, Sentry) by default, but this varies by provider:

| Provider | Statsig (telemetry) | Sentry (errors) | `/bug` command |
|----------|--------------------|-----------------| ---------------|
| Anthropic API | On by default | On by default | On by default |
| AWS Bedrock | **Off by default** | **Off by default** | **Off by default** |
| Google Vertex | **Off by default** | **Off by default** | **Off by default** |

**For CUI projects on GovCloud Bedrock**: Nonessential traffic is already disabled by default. No additional configuration needed.

**For non-CUI projects on Anthropic API**: The base image sets `CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC=1` to disable this traffic.

---

## Quick Reference

### Example `.claude/settings.json`

```json
{
  "permissions": {
    "deny": [
      "Read(./.env)",
      "Read(**/*.pem)",
      "Read(**/*.key)",
      "Read(**/*.p12)",
      "Read(**/*credentials*)"
    ]
  }
}
```

### Adding Workflow Controls

```json
{
  "permissions": {
    "deny": [
      "Read(./.env)",
      "Read(**/*.pem)",
      "Read(**/*.key)",
      "Bash(git commit:*)",
      "Bash(git push:*)"
    ]
  }
}
```

### Disabling MCP

```json
{
  "permissions": {
    "deny": [
      "mcp__.*"
    ]
  }
}
```

### Common Deny Patterns

| Pattern | Blocks |
|---------|--------|
| `Read(./.env)` | Reading .env file in project root |
| `Read(**/*.env)` | Reading any .env file in project |
| `Read(**/*.pem)` | Reading PEM certificate files |
| `Read(**/*.key)` | Reading private key files |
| `Read(**/*secret*)` | Reading files with "secret" in name |
| `Bash(git push:*)` | Git push commands |
| `Bash(git commit:*)` | Git commit commands |
| `Bash(rm -rf:*)` | Recursive delete commands |
| `Bash(curl:*)` | Curl commands (already blocked by firewall) |
| `mcp__.*` | All MCP tool calls |
| `mcp__filesystem.*` | Filesystem MCP tools only |

---

## Related Documentation

- [Firewall Overview](firewall/README-FIREWALL.md) - Network security layer
- [Firewall Architecture](firewall/FIREWALL-ARCHITECTURE.md) - Technical design
- [CUI Setup Guide](SETUP-CUI.md) - Setup for CUI projects
- [Advanced Topics](ADVANCED-TOPICS.md) - Additional configuration options

---

**[← Back to Main README](../README.md)**
