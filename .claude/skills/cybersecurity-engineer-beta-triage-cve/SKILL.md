---
name: cybersecurity-engineer-beta-triage-cve
description: Triage CVEs from security scans and recommend remediation. Use when triaging CVEs, analyzing vulnerability scan results (Trivy, Grype, Snyk), assessing exploitability, or creating POA&M documentation.
allowed-tools: Read, Grep, Glob, Bash, WebFetch, WebSearch
---

# CVE Triage

Triage CVEs from security scans, assess risk in project context, and propose remediation status.

## Workflow

1. **Load project context**: Read `.claude/cybersecurity/context.md` if it exists (component risk levels, timelines)
2. **Accept CVE input**: Scan output, CVE list, or GitHub Actions URL (use `gh run view --log`)
3. **Research each CVE**: Query NVD, check for fixed versions, assess exploitability
4. **Apply project context**: Adjust severity based on component exposure (if context exists)
5. **Propose status**: Patch, suppress (with justification), or escalate
6. **Generate POA&M**: Save to `.claude/cybersecurity/poam/`

## Project Context (Optional)

If `.claude/cybersecurity/context.md` exists, use it for:
- **Component risk levels**: Which components process untrusted input (elevate severity)
- **Remediation timelines**: Project-specific deadlines by severity
- **Suppression file location**: Where to add CVE suppressions

If no context file exists, use standard CVSS-based severity assessment.

## CVE Research

For each CVE, fetch from authoritative sources:
- **NVD**: `https://nvd.nist.gov/vuln/detail/CVE-XXXX-XXXXX`
- **Vendor advisories**: GitHub Security Advisories, upstream issues

Key questions:
- Is a fixed version available?
- Is there active exploitation (CISA KEV)?
- Does the attack vector apply to our deployment?

## Status Recommendations

| Status | When to Use |
|--------|-------------|
| **Patch** | Fixed version available, upgrade is safe |
| **Suppress** | False positive, not exploitable in context, or accepted risk with justification |
| **Escalate** | No fix available + actively exploited, or requires architectural change |

## POA&M Output Format

```markdown
# POA&M: [Source] - [Date]

## Summary
- **Source**: [GitHub Actions URL / scan file]
- **Scanner**: [Trivy / Grype / etc.]
- **Total CVEs**: [count by severity]

## Findings

### CVE-XXXX-XXXXX
- **Severity**: [CRITICAL/HIGH/MEDIUM/LOW] | CVSS: [score]
- **Component**: [package@version] | Fixed: [version or "None"]
- **Exploitability**: [Attack vector, complexity, known exploits]
- **Project Impact**: [Based on component risk level]
- **Status**: [Patch / Suppress / Escalate]
- **Action**: [Specific remediation step or suppression justification]
- **Deadline**: [Date based on severity timeline]

## Suppression Entries
[If applicable, exact entries for .trivyignore with justification]
```

## Scope

**Do**: Research CVEs, assess risk, recommend status, generate POA&M
**Don't**: Implement fixes directly, create PRs, modify production systems
