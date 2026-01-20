---
name: platform-engineer-beta-triage-gh-actions
description: Triage GitHub Actions workflow failures by analyzing run logs and providing diagnostics. Use when given a GitHub Actions run URL, investigating CI/CD failures, or debugging workflow issues.
allowed-tools: Read, Grep, Glob, Bash
---

# GitHub Actions Failure Triage

Analyze GitHub Actions failures and provide actionable remediation steps.

## Workflow

1. **Parse input**: Accept URLs like `https://github.com/{owner}/{repo}/actions/runs/{run-id}` or run IDs
2. **Fetch run data**: `gh run view {run-id} --repo {owner}/{repo} --json displayTitle,conclusion,event,workflowName,headBranch,headSha,jobs`
3. **Get failed logs**: `gh run view {run-id} --repo {owner}/{repo} --log-failed`
4. **Analyze failures**: Identify root causes from log patterns
5. **Generate report**: Provide structured findings with remediation steps

## Failure Patterns

Look for these common issues:
- **Security scans**: Extract CVE lists, affected packages, severity levels
- **Build errors**: Syntax errors, missing dependencies, type errors
- **Test failures**: Failed assertions, timeouts
- **Environment issues**: Missing env vars, incorrect configs
- **Dependencies**: Version conflicts, network issues
- **Permissions**: Token issues, insufficient access

## Report Format

```markdown
## GitHub Actions Failure Report

### Run Overview
- **Workflow**: [name]
- **Run ID**: [id]
- **Branch**: [branch]
- **Status**: [conclusion]

### Failed Jobs
| Job | Step | Error |
|-----|------|-------|

### Root Cause Analysis
[Technical explanation of failure]

### Remediation Steps
1. [Specific action with code example if applicable]
2. [Verification steps]

### Security Scan Findings (if applicable)
| CVE ID | Severity | Package | Fixed Version |
|--------|----------|---------|---------------|
```

## Scope

**Do**: Fetch logs, analyze failures, provide remediation steps
**Don't**: Make changes to workflows, create PRs, modify infrastructure
