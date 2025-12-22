# Plugin Changelog

All notable changes to the plugin marketplace will be documented in this file.

## 2025-12-22

### Breaking Change: Role-Based Plugin Restructure

The original plugins (cve-triage, gh-actions-triage, user-story) have been replaced with role-based plugins that better align with Rise8 practices. All new plugins are in beta while we iterate on them with users.

**New beta plugins:**
- **claude-whisperer-beta** v0.1.0-beta - Meta-skills for building your Iron Man suit
- **cybersecurity-engineer-beta** v0.1.0-beta - CVE triage, vulnerability assessment
- **platform-engineer-beta** v0.1.0-beta - CI/CD troubleshooting, infrastructure diagnostics
- **product-owner-beta** v0.1.0-beta - Story assessment and refinement
- **release-engineer-beta** v0.1.0-beta - Changelog and release management
- **software-engineer-beta** v0.1.0-beta - TDD implementation workflow

**Removed plugins:**
- cve-triage (replaced by cybersecurity-engineer-beta)
- gh-actions-triage (replaced by platform-engineer-beta)
- user-story (replaced by product-owner-beta)

### Migration Steps

**1. Remove old plugins (if installed):**
```bash
/plugin uninstall cve-triage
/plugin uninstall gh-actions-triage
/plugin uninstall user-story
```

**2. Refresh the marketplace:**
```bash
/plugin marketplace remove rise8-us/xpai-ai-assistant-container
/plugin marketplace add rise8-us/xpai-ai-assistant-container
```

**3. Install the beta plugins you need:**
```bash
/plugin install claude-whisperer-beta
/plugin install cybersecurity-engineer-beta
/plugin install platform-engineer-beta
/plugin install product-owner-beta
/plugin install release-engineer-beta
/plugin install software-engineer-beta
```

**4. Use plugins explicitly by name:**

Beta plugins require explicit invocation to prevent accidental use:
```
# Old way (no longer works)
"assess this story"

# New way
"use product-owner-beta to assess this story"
```

### Plugin Mapping

| Old Plugin | New Plugin | Skills |
|------------|------------|--------|
| cve-triage | cybersecurity-engineer-beta | triage-cve |
| gh-actions-triage | platform-engineer-beta | triage-gh-actions |
| user-story | product-owner-beta | assess-story, refine-story |
| (new) | claude-whisperer-beta | create-skill, fork-skill, contribute-skill |
| (new) | release-engineer-beta | update-changelog, update-versions, publish-release |
| (new) | software-engineer-beta | implement-story, review-pr |

### Building Your Iron Man Suit

These beta plugins follow the "Iron Man suit" philosophy - AI augmentation that fits your specific work, not autonomous robots.

**To iterate on plugins:**
1. Clone this repo
2. Edit plugins directly in `plugins/*-beta/`
3. Test locally: `/plugin marketplace add ./.claude`
4. Submit PRs with improvements

See [SKILL-DEVELOPMENT.md](../docs/SKILL-DEVELOPMENT.md) for the full guide.

## 2024-12-19

### cve-triage v1.0.0
- Initial release
- Investigate CVEs from security scans (Trivy, Grype, Snyk)
- Generate POA&M documentation
- Support for project-specific context via `.claude/cybersecurity/context.md`

### gh-actions-triage v1.0.0
- Initial release
- Diagnose GitHub Actions workflow failures
- Fetch and analyze run logs via `gh` CLI
- Provide remediation steps

### user-story v1.0.0
- Initial release
- Write user stories following INVEST principles
- Generate acceptance criteria
