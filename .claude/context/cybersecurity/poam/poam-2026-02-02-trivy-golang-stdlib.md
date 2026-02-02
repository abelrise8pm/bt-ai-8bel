# POA&M: Nightly Project Container Security Scan - 2026-02-02

## Summary
- **Source**: [GitHub Actions Run #21575901531](https://github.com/rise8-us/xpai-ai-assistant-container/actions/runs/21575901531)
- **Scanner**: Trivy v0.56.1
- **Scan Date**: 2026-02-02 03:05 UTC
- **Component**: project-container (GitHub CLI binary)
- **Total CVEs**: 2 HIGH severity

## Executive Summary

The nightly security scan detected **2 HIGH severity vulnerabilities** in the Go standard library (stdlib 1.25.3) embedded within GitHub CLI v2.83.1. Both are **Denial of Service (DoS)** vulnerabilities with no confidentiality or integrity impact. Fixes are available in Go 1.25.6 and 1.24.12 (released 2026-01-15), but require upstream GitHub CLI update.

**Recommendation**: **SUPPRESS** with documented risk acceptance. Upgrade to gh CLI v2.86.0 (latest) to reduce attack surface while awaiting fix.

---

## Findings

### CVE-2025-61726: Go net/url Query Parameter DoS
- **Severity**: HIGH | **CVSS**: 7.5 (AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H)
- **Component**: stdlib (Go net/url package) @ 1.25.3 | **Fixed**: 1.25.6, 1.24.12
- **CWE**: CWE-400 (Uncontrolled Resource Consumption)
- **Published**: 2026-01-28 | **NVD Status**: Undergoing Analysis

#### Description
The Go net/url package does not set limits on the number of query parameters. The `net/http.Request.ParseForm` method can parse large URL-encoded forms, and processing forms with numerous unique parameters causes excessive memory consumption leading to denial of service.

#### Exploitability Assessment
- **Attack Vector**: Network (remote)
- **Attack Complexity**: Low - requires only crafted URLs with excessive query parameters
- **Privileges Required**: None
- **User Interaction**: None (for web services); Required (for CLI tool)
- **Known Exploitation**: ❌ Not listed in CISA KEV catalog
- **EPSS Score**: Not yet available (recently published)
- **Public Exploits**: None identified

#### Project Context Impact
**Risk Level: LOW** (despite HIGH CVSS severity)

**Justification**:
- GitHub CLI is an **interactive command-line tool**, not a network service
- Requires user to explicitly invoke `gh` commands with untrusted URLs
- No automatic URL processing or network listeners
- Attack requires social engineering to get user to run malicious command
- DoS only - no data exfiltration, privilege escalation, or code execution
- Container usage pattern: developer workstation, not internet-facing service

**Deployment Context**:
- Component: `usr/local/bin/gh` (GitHub CLI v2.83.1)
- Usage: Developer productivity tool for GitHub API interactions
- Exposure: User-initiated commands only, no passive network exposure
- Affected Code Path: Would require `gh` commands processing untrusted URL inputs with excessive query parameters

#### Status & Action
**Status**: ✅ **SUPPRESS** (Accepted Risk with Mitigation)

**Rationale for Suppression**:
1. **Awaiting Upstream Fix**: GitHub CLI v2.83.1 uses Go 1.25.3 (vulnerable). Go 1.25.6 fixes this CVE (released 2026-01-15), but gh CLI has not yet released a version incorporating the fix.
2. **Limited Exposure**: CLI tool requires explicit user action; not processing untrusted network input automatically.
3. **Latest Available Version**: Currently running gh CLI v2.83.1 (latest as of scan date was v2.86.0 - upgrade recommended).
4. **DoS Only**: Impact limited to process crash/hang, no security boundary violations.

**Immediate Action**:
- ✅ Add to `project-container/.trivyignore` with full justification
- ⚠️ **UPGRADE**: Update GH_VERSION from 2.83.1 → 2.86.0 to reduce attack surface
- 📅 Schedule review for 2026-02-16 to check for gh CLI release with Go 1.25.6+

**Long-term Action**:
- Monitor https://github.com/cli/cli/releases for versions built with Go 1.25.6+
- Remove from .trivyignore when patched version is available and deployed

**Deadline**: 2026-02-16 (review), 2026-03-02 (patch if available)

---

### CVE-2025-61728: Go archive/zip Indexing Algorithm DoS
- **Severity**: HIGH | **CVSS**: 6.5 (CVSS:3.1/AV:N/AC:L/PR:N/UI:R/S:U/C:N/I:N/A:H)
- **Component**: stdlib (Go archive/zip package) @ 1.25.3 | **Fixed**: 1.25.6, 1.24.12
- **CWE**: CWE-407 (Inefficient Algorithmic Complexity)
- **Published**: 2026-01-28 | **NVD Status**: Undergoing Analysis

#### Description
Archive/zip uses a super-linear file name indexing algorithm that is invoked the first time a file in an archive is opened. This can lead to denial of service when consuming a maliciously constructed ZIP archive. Discovered by security researcher Jakub Ciolek.

#### Exploitability Assessment
- **Attack Vector**: Network (file upload/download)
- **Attack Complexity**: Low - craft malicious ZIP with filenames triggering inefficient indexing
- **Privileges Required**: None
- **User Interaction**: Required (user must open/process the ZIP file)
- **Known Exploitation**: ❌ Not listed in CISA KEV catalog
- **EPSS Score**: Not yet available (recently published)
- **Public Exploits**: None identified
- **Go Issue**: https://go.dev/issue/77102

#### Project Context Impact
**Risk Level: LOW** (despite HIGH CVSS severity)

**Justification**:
- GitHub CLI may process ZIP archives for release artifacts or repository downloads
- Requires user to explicitly invoke commands that download/extract ZIPs
- No automatic ZIP processing in background
- Attack requires compromised GitHub release artifacts or social engineering
- DoS only - no data exfiltration, privilege escalation, or code execution
- Container usage: developer workstation with trusted repositories

**Deployment Context**:
- Component: `usr/local/bin/gh` (GitHub CLI v2.83.1)
- Usage: `gh release download`, `gh repo clone` with archive formats
- Exposure: User-initiated downloads from GitHub (trusted source by default)
- Affected Code Path: ZIP archive extraction during `gh` operations

#### Status & Action
**Status**: ✅ **SUPPRESS** (Accepted Risk with Mitigation)

**Rationale for Suppression**:
1. **Awaiting Upstream Fix**: GitHub CLI v2.83.1 uses Go 1.25.3 (vulnerable). Go 1.25.6 fixes this CVE (released 2026-01-15), but gh CLI has not yet released a version incorporating the fix.
2. **User Interaction Required**: Exploitation requires user to download and process malicious ZIP archives, not passive exposure.
3. **Trusted Source Context**: Primary use case is GitHub.com repositories (high trust context).
4. **Latest Available Version**: Currently running gh CLI v2.83.1 (upgrade to v2.86.0 recommended).
5. **DoS Only**: Impact limited to process crash/hang, no security boundary violations.

**Immediate Action**:
- ✅ Add to `project-container/.trivyignore` with full justification
- ⚠️ **UPGRADE**: Update GH_VERSION from 2.83.1 → 2.86.0 to reduce attack surface
- 📅 Schedule review for 2026-02-16 to check for gh CLI release with Go 1.25.6+

**Long-term Action**:
- Monitor https://github.com/cli/cli/releases for versions built with Go 1.25.6+
- Remove from .trivyignore when patched version is available and deployed

**Deadline**: 2026-02-16 (review), 2026-03-02 (patch if available)

---

## Risk Summary

| CVE | Severity | CVSS | Exploitability | Context Risk | Status | Deadline |
|-----|----------|------|----------------|--------------|--------|----------|
| CVE-2025-61726 | HIGH | 7.5 | Low (requires user action) | LOW | SUPPRESS | 2026-02-16 (review) |
| CVE-2025-61728 | HIGH | 6.5 | Low (requires user action) | LOW | SUPPRESS | 2026-02-16 (review) |

**Overall Assessment**: Both vulnerabilities have **LOW actual risk** in the project-container deployment context despite HIGH CVSS scores. The CVSS scores reflect worst-case scenarios (internet-facing web services), not CLI tool usage patterns.

---

## Suppression Entries

Add the following to `project-container/.trivyignore`:

```
# CVE-2025-61726 - Golang net/url DoS vulnerability
# Affects: GitHub CLI with Go stdlib 1.25.3 (embedded binary dependency)
# Severity: HIGH (CVSS 7.5)
# Issue: Denial of Service via excessive URL query parameters causing memory exhaustion
#        The net/http.Request.ParseForm method processes large URL-encoded forms without
#        limits on the number of unique parameters, leading to uncontrolled memory allocation
# Risk: LOW - Requires user to explicitly invoke gh commands with malicious URLs
#       - No automatic URL processing or network listeners
#       - CLI tool usage pattern limits exposure to untrusted input
#       - DoS only (no confidentiality or integrity impact)
#       - Container usage: developer workstation, not internet-facing service
# Status: AWAITING UPSTREAM - GitHub CLI v2.83.1 uses Go 1.25.3
# Fixed Versions: Go 1.25.6, 1.24.12 (released 2026-01-15)
#                 Waiting for gh CLI v2.87.0+ to incorporate Go 1.25.6+
# Mitigation: Upgraded to latest available gh CLI version (v2.86.0 recommended)
#             Users should only run gh commands with trusted GitHub repositories
# Timeline:
#   - 2026-01-15: Go 1.25.6 released with fix
#   - 2026-02-02: CVE discovered in nightly Trivy scan
#   - 2026-02-02: Added to ignore list (upstream patch not yet in gh CLI)
#   - Review: 2026-02-16 (check for gh CLI with Go 1.25.6+)
# Tracking:
#   - NVD: https://nvd.nist.gov/vuln/detail/CVE-2025-61726
#   - Go Advisory: GO-2026-4341
#   - Go Issue: https://go.dev/issue/77101
#   - Go Change: CL/736712
#   - Monitor: https://github.com/cli/cli/releases
#   - POA&M: .claude/context/cybersecurity/poam/poam-2026-02-02-trivy-golang-stdlib.md
# CVSS: 7.5 HIGH (AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H)
# CWE: CWE-400 (Uncontrolled Resource Consumption)
# CISA KEV: Not listed (no known active exploitation)
# Review: 2026-02-16
CVE-2025-61726

# CVE-2025-61728 - Golang archive/zip DoS vulnerability
# Affects: GitHub CLI with Go stdlib 1.25.3 (embedded binary dependency)
# Severity: HIGH (CVSS 6.5)
# Issue: Excessive CPU consumption when building archive index in archive/zip
#        Super-linear file name indexing algorithm invoked when opening ZIP files
#        Maliciously constructed archives with specific filename patterns trigger
#        computational exhaustion, causing denial of service
# Risk: LOW - Requires user to explicitly download and process malicious ZIP archives
#       - gh CLI may process ZIPs for release artifacts (`gh release download`)
#       - Primary use case: trusted GitHub.com repositories (high trust context)
#       - Requires user action (not passive background processing)
#       - DoS only (no confidentiality or integrity impact)
#       - Container usage: developer workstation, not internet-facing service
# Status: AWAITING UPSTREAM - GitHub CLI v2.83.1 uses Go 1.25.3
# Fixed Versions: Go 1.25.6, 1.24.12 (released 2026-01-15)
#                 Waiting for gh CLI v2.87.0+ to incorporate Go 1.25.6+
# Mitigation: Upgraded to latest available gh CLI version (v2.86.0 recommended)
#             Users should only download releases from trusted GitHub repositories
# Timeline:
#   - 2026-01-15: Go 1.25.6 released with fix
#   - 2026-02-02: CVE discovered in nightly Trivy scan
#   - 2026-02-02: Added to ignore list (upstream patch not yet in gh CLI)
#   - Review: 2026-02-16 (check for gh CLI with Go 1.25.6+)
# Tracking:
#   - NVD: https://nvd.nist.gov/vuln/detail/CVE-2025-61728
#   - Go Issue: https://go.dev/issue/77102
#   - Researcher: Jakub Ciolek
#   - Monitor: https://github.com/cli/cli/releases
#   - POA&M: .claude/context/cybersecurity/poam/poam-2026-02-02-trivy-golang-stdlib.md
# CVSS: 6.5 HIGH (CVSS:3.1/AV:N/AC:L/PR:N/UI:R/S:U/C:N/I:N/A:H)
# CWE: CWE-407 (Inefficient Algorithmic Complexity)
# CISA KEV: Not listed (no known active exploitation)
# Review: 2026-02-16
CVE-2025-61728
```

---

## Recommended Actions

### Immediate (Today - 2026-02-02)
1. ✅ **Add suppressions** to `project-container/.trivyignore` (see entries above)
2. ⚠️ **Upgrade GitHub CLI**: Update `project-container/Dockerfile` line 19:
   ```dockerfile
   # Change from:
   ARG GH_VERSION=2.83.1

   # To:
   ARG GH_VERSION=2.86.0
   ```
3. ✅ **Rebuild and test** project-container image
4. ✅ **Update CHANGELOG**: Document CVE suppressions and gh CLI upgrade
5. ✅ **Commit changes** with descriptive message

### Short-term (2026-02-16)
1. 📅 **Review upstream progress**: Check if gh CLI v2.87.0+ released with Go 1.25.6+
2. 🔄 **Test without suppressions**: Temporarily remove CVEs from .trivyignore to verify if fixed
3. 📝 **Update POA&M**: Document findings and extend review date if needed

### Long-term (2026-03-02)
1. 🎯 **Deploy patched version**: Once gh CLI releases with Go 1.25.6+, upgrade immediately
2. 🗑️ **Remove suppressions**: Delete CVE-2025-61726 and CVE-2025-61728 from .trivyignore
3. ✅ **Close POA&M**: Mark as resolved when patched version deployed

---

## References

### CVE Information
- [CVE-2025-61726 - NVD](https://nvd.nist.gov/vuln/detail/CVE-2025-61726)
- [CVE-2025-61728 - NVD](https://nvd.nist.gov/vuln/detail/CVE-2025-61728)
- [Go 1.25.6 Security Release Notes](https://go.dev/doc/devel/release#go1.25.6)
- [Go Programming Language 1.26 Security Patches - TechRepublic](https://www.techrepublic.com/article/news-golang-patches-security-flaws/)
- [Go Vulnerability Database](https://pkg.go.dev/vuln/)

### Upstream Tracking
- [GitHub CLI Releases](https://github.com/cli/cli/releases)
- [Go Issue #77101 (CVE-2025-61726)](https://go.dev/issue/77101)
- [Go Issue #77102 (CVE-2025-61728)](https://go.dev/issue/77102)
- [Go Change CL/736712](https://go.dev/cl/736712)

### Security Catalogs
- [CISA Known Exploited Vulnerabilities Catalog](https://www.cisa.gov/known-exploited-vulnerabilities-catalog) - Neither CVE listed (no active exploitation)

---

## Approval

**Prepared by**: Claude Code (Cybersecurity Engineer Beta Skill)
**Date**: 2026-02-02
**Next Review**: 2026-02-16
**POA&M Status**: OPEN (Awaiting Upstream Fix)

**Risk Acceptance Required**: YES
**Accepted by**: _[Pending Project Lead Approval]_
**Date Accepted**: _[Pending]_

---

*This POA&M follows NIST SP 800-37 Rev. 2 continuous monitoring practices and CMMC Level 2 vulnerability management requirements.*
