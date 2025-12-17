# Security Policy

**Version:** 1.0.0
**Last Updated:** 2025-10-30
**Compliance Framework:** CMMC Level 2 / NIST SP 800-171
**Scope:** AI Assistant Container (xpai-ai-assistant-container)

## 1. Overview

This security policy defines vulnerability management, risk acceptance criteria, and remediation timelines for the AI Assistant Container system, which processes Controlled Unclassified Information (CUI) and requires CMMC Level 2 compliance.

## 2. System Classification

| Attribute | Value |
|-----------|-------|
| **Data Classification** | Controlled Unclassified Information (CUI) |
| **Compliance Requirement** | CMMC Level 2, NIST SP 800-171 |
| **Deployment Model** | Mixed (local development + CI/CD pipelines) |
| **Network Exposure** | Processes external input from public registries and APIs |
| **Risk Posture** | Conservative (CUI-handling system) |

## 3. Vulnerability Severity Classification

Vulnerability severity is determined by the **highest applicable** criterion:

### CRITICAL Severity

**Criteria:**
- CVSS Base Score ≥ 9.0
- Active exploitation in the wild (KEV catalog, public exploits)
- Direct CUI confidentiality/integrity impact
- Remote code execution (RCE) with no authentication required
- Authentication bypass in CUI-handling components

**Examples:**
- Unauthenticated RCE in container runtime
- SQL injection allowing CUI exfiltration
- Authentication bypass in identity provider

**Remediation SLA:** 7 days

---

### HIGH Severity

**Criteria:**
- CVSS Base Score 7.0 - 8.9
- Requires authentication OR user interaction for exploitation
- Potential CUI exposure under specific conditions
- Privilege escalation vulnerabilities
- Known exploits available (even if not widely exploited)

**Examples:**
- Authenticated RCE in development tools
- Directory traversal allowing file access
- Go standard library vulnerabilities with proof-of-concept exploits

**Remediation SLA:** 30 days

---

### MEDIUM Severity

**Criteria:**
- CVSS Base Score 4.0 - 6.9
- Denial of Service (DoS) vulnerabilities
- Information disclosure (non-CUI)
- Requires significant preconditions for exploitation

**Examples:**
- DoS via resource exhaustion
- Memory leak vulnerabilities
- Information disclosure of system metadata

**Remediation SLA:** 90 days

---

### LOW Severity

**Criteria:**
- CVSS Base Score < 4.0
- Minimal security impact
- Requires highly unlikely attack scenarios
- Theoretical vulnerabilities without practical exploitation

**Examples:**
- Minor information disclosure
- Timing attacks requiring local access
- Deprecated cryptographic algorithms in non-critical paths

**Remediation SLA:** 180 days (or next major release)

---

## 4. Remediation Timelines

| Severity | Discovery → Fix Available | Fix Available → Deployed | Total Maximum |
|----------|---------------------------|--------------------------|---------------|
| **CRITICAL** | 3 days | 4 days | **7 days** |
| **HIGH** | 15 days | 15 days | **30 days** |
| **MEDIUM** | 45 days | 45 days | **90 days** |
| **LOW** | 90 days | 90 days | **180 days** |

### Clock Start Rules

- Remediation clock starts when **vulnerability is identified** (scan date, advisory publication, or disclosure)
- For nightly scans: Clock starts at 2:00 AM UTC on scan date
- For zero-day disclosures: Clock starts at advisory publication time

### Expedited Timelines

The following conditions trigger **CRITICAL severity timelines** regardless of CVSS score:

- CVE appears in CISA KEV (Known Exploited Vulnerabilities) catalog
- Active exploitation confirmed by security intelligence
- Direct impact to CUI confidentiality or integrity
- Component is internet-exposed and processes untrusted input

---

## 5. Risk Acceptance Criteria

Risk acceptance (deviation from remediation timeline) requires documented justification and approval.

### Acceptable Risk Acceptance Scenarios

✅ **May be accepted with proper documentation:**

1. **Compensating Controls Exist**
   - Vulnerability requires network access, but component is air-gapped
   - Attack requires authentication, and MFA is enforced
   - Vulnerability is in unused code path (verified via code coverage)

2. **False Positive After Analysis**
   - Vulnerability does not affect the deployed configuration
   - Attack prerequisites are impossible in our environment
   - Vendor confirmed vulnerability does not apply to our use case

3. **No Fix Available**
   - Vendor has not released a patch
   - Workarounds or mitigations are in place
   - Alternative components are not feasible

4. **Upgrade Risk Exceeds Vulnerability Risk**
   - Upgrade causes breaking changes to CUI-handling workflows
   - Upgrade introduces new dependencies with worse security posture
   - Regression testing requirements exceed available resources

### Unacceptable Risk Acceptance Scenarios

❌ **May NOT be accepted under any circumstances:**

1. **CRITICAL severity with active exploitation**
2. **Direct CUI confidentiality or integrity impact**
3. **Authentication bypass in production systems**
4. **RCE vulnerabilities in internet-exposed components**
5. **CVEs in CISA KEV catalog without compensating controls**

### Risk Acceptance Approval Process

| Severity | Approver Required | Documentation Required |
|----------|-------------------|------------------------|
| **CRITICAL** | CISO + System Owner | POA&M, risk analysis, C3PAO notification |
| **HIGH** | System Owner + Security Lead | POA&M, risk analysis, mitigation plan |
| **MEDIUM** | Security Lead | POA&M, justification |
| **LOW** | Development Lead | Brief justification in issue tracker |

---

## 6. Deployment Context & Risk Modifiers

### Component Risk Classification

Different components in the container have different exposure levels:

| Component | Risk Level | Justification |
|-----------|------------|---------------|
| **crane** | HIGH | Processes external input from public container registries |
| **gh** | MEDIUM-HIGH | Interacts with GitHub APIs (public/private repos) |
| **Node.js runtime** | HIGH | Executes untrusted code in AI assistant workflows |
| **AI tools (Claude, Gemini)** | MEDIUM | Processes user prompts but not untrusted external input |
| **Base OS utilities** | MEDIUM | Indirect exposure through tool dependencies |

### Network Exposure Assessment

**External Input Processing:**
- `crane` pulls/pushes container images from public registries (Docker Hub, GHCR, Quay.io)
- `gh` interacts with GitHub APIs and repositories
- AI assistants may process user-provided URLs, code, or commands

**Trusted Internal Processing:**
- Local development workflows
- CI/CD pipeline execution with approved configurations
- Configuration files from version-controlled sources

### Environment-Specific Risk Levels

| Environment | Base Risk | Adjustments |
|-------------|-----------|-------------|
| **Production/CI-CD** | HIGH | No reduction - handles CUI, automated workflows |
| **Local Development** | MEDIUM-HIGH | Minor reduction - manual oversight, controlled inputs |
| **Isolated Testing** | MEDIUM | Can reduce by 1 severity level if air-gapped |

---

## 7. Compliance Mappings

### NIST SP 800-171 Rev 3 Control Mappings

| Control Family | Control ID | Relevance to Vulnerability Management |
|----------------|------------|---------------------------------------|
| **Risk Assessment (CA)** | 3.11.2 | Vulnerability scanning requirements |
| **Configuration Management (CM)** | 3.4.8 | Security flaw remediation |
| **System & Information Integrity (SI)** | 3.14.1 | Timely flaw identification |
| **System & Information Integrity (SI)** | 3.14.2 | Security alerts & advisories |
| **System & Information Integrity (SI)** | 3.14.4 | Software updates and patches |

### CMMC Level 2 Practice Mappings

| Practice | ID | Description |
|----------|-----|-------------|
| **Manage Security Vulnerabilities** | CA.L2-3.11.2 | Scan for vulnerabilities and remediate |
| **Remediate Flaws** | SI.L1-3.14.4 | Update vulnerable software and patches |
| **Identify & Manage Risk** | RM.L2-3.11.1 | Assess and respond to security risks |

---

## 8. Exception & Deviation Process

### Temporary Risk Acceptance (TRA)

**When to Use:** Fix is available but deployment is temporarily blocked

**Process:**
1. Create TRA issue in GitHub with label `security-exception`
2. Document compensating controls in place
3. Set expiration date (max 90 days for HIGH, 30 days for CRITICAL)
4. Obtain required approvals (see Section 5)
5. Add entry to POA&M with "Risk Accepted" status
6. Schedule remediation before expiration

**Review Cadence:** TRAs reviewed bi-weekly in security sync

### Permanent Risk Acceptance (PRA)

**When to Use:** No fix available, or fix introduces unacceptable risk

**Process:**
1. Create detailed risk analysis document
2. Document all compensating controls
3. Obtain CISO approval (required for all PRAs)
4. Add to persistent risk register
5. Annual re-evaluation required

**Review Cadence:** PRAs reviewed quarterly

### Trivy Ignore Files

**Purpose:** Suppress false positives and accepted risks from security scans

**Location:** `image/.trivyignore`

**Format:**
```
# CVE-YYYY-XXXXX - Brief reason (link to GitHub issue)
CVE-2024-12345  # False positive: feature not compiled in our build
CVE-2024-67890  # Risk accepted: TRA #123, expires 2025-12-31
```

**Requirements:**
- Every ignored CVE MUST have a comment explaining why
- TRAs MUST reference GitHub issue number and expiration date
- PRAs MUST reference risk acceptance approval document
- File is reviewed monthly to remove expired exceptions

---

## 9. POA&M (Plan of Action and Milestones) Process

### When to Create POA&M

POA&Ms are required for:
- All CRITICAL and HIGH severity vulnerabilities
- Any vulnerability with remediation timeline > 30 days
- Any vulnerability with risk acceptance or deviation
- CMMC assessment preparation

### POA&M Template Location

- **Template:** `.claude/templates/cybersecurity/poam-template.md`
- **Storage:** `.claude/context/cybersecurity/poam/YYYY-MM-DD-[scan-type]-poam.md`
- **Naming:** Date of scan + scan type (e.g., `2025-10-30-trivy-nightly-poam.md`)

### POA&M Contents (NIST-Compliant)

1. **Executive Summary** - High-level overview for leadership
2. **Vulnerability Details** - CVE IDs, CVSS scores, affected components
3. **Exploitability Assessment** - Real-world risk analysis
4. **Impact Analysis** - Business and technical impact
5. **Remediation Plan** - Specific steps and timelines
6. **Milestones** - Key dates and responsible parties
7. **Deviation Justification** - If applicable
8. **Approval** - Signatures and approval dates

### POA&M Lifecycle

```
[Scan Identifies CVE]
    ↓
[CVE Triage Agent Creates POA&M]
    ↓
[Tactical Agent Implements Fix] ← You are here
    ↓
[Verification Scan Confirms Resolution]
    ↓
[POA&M Marked Complete, Moved to Archive]
```

---

## 10. Roles & Responsibilities

| Role | Responsibilities |
|------|------------------|
| **System Owner** | Final approval authority, risk acceptance decisions, resource allocation |
| **Security Lead** | Vulnerability triage, POA&M creation, compliance reporting |
| **Development Lead** | Remediation implementation, testing, deployment |
| **DevOps/Platform Team** | Container builds, CI/CD pipeline updates, scanning infrastructure |
| **CISO** | CRITICAL severity approvals, PRA approvals, C3PAO liaison |

---

## 11. Automation & Tooling

### Nightly Security Scans

- **Tool:** Trivy (container vulnerability scanner)
- **Schedule:** Daily at 2:00 AM UTC
- **Scope:** All published container images (`:latest` tag)
- **Action on Failure:** GitHub issue created, assignees notified

### CVE Triage Automation

- **Agent:** `cve-triage` (Claude Agent System)
- **Trigger:** GitHub Actions scan failure
- **Deliverable:** NIST-compliant POA&M document
- **Output Location:** `.claude/context/cybersecurity/poam/`

### Tactical Remediation

- **Agent:** `tactical-cybersecurity` (Claude Agent System)
- **Input:** POA&M recommendations
- **Actions:** Dependency updates, configuration changes, patching
- **Verification:** Re-run security scan to confirm resolution

---

## 12. Monitoring & Metrics

### Key Performance Indicators (KPIs)

| Metric | Target | Measurement Frequency |
|--------|--------|----------------------|
| **Mean Time to Detect (MTTD)** | < 24 hours | Daily (nightly scans) |
| **Mean Time to Remediate (MTTR) - CRITICAL** | < 7 days | Weekly |
| **Mean Time to Remediate (MTTR) - HIGH** | < 30 days | Monthly |
| **% Vulnerabilities Remediated On-Time** | > 95% | Monthly |
| **# Active Risk Acceptances** | < 5 | Monthly |

### Reporting Cadence

- **Weekly:** Security scan results, new vulnerabilities identified
- **Monthly:** Remediation status, KPI dashboard, risk register review
- **Quarterly:** PRA reviews, policy effectiveness assessment
- **Annually:** Comprehensive security posture review, C3PAO audit prep

---

## 13. Policy Review & Updates

### Review Schedule

- **Quarterly:** Policy effectiveness review
- **Annually:** Full policy revision and approval
- **Ad-Hoc:** After significant security incidents or compliance changes

### Version History

| Version | Date | Changes | Approver |
|---------|------|---------|----------|
| 1.0.0 | 2025-10-30 | Initial CMMC L2 security policy | [Pending] |

---

## 14. References

- NIST SP 800-171 Rev 3: *Protecting Controlled Unclassified Information in Nonfederal Systems and Organizations*
- CMMC Level 2 Requirements: *Cybersecurity Maturity Model Certification*
- CISA KEV Catalog: https://www.cisa.gov/known-exploited-vulnerabilities-catalog
- NVD (National Vulnerability Database): https://nvd.nist.gov/
- GitHub Security Advisories: https://github.com/advisories

---

## 15. Contact Information

| Role | Contact | Escalation Path |
|------|---------|-----------------|
| **Security Issues** | @mikegehard-rise8 | System Owner |
| **CVE Triage Questions** | Security team | Security Lead → CISO |
| **Policy Clarifications** | Compliance team | CISO → Authorizing Official |

---

**Policy Approval:**

- [ ] System Owner Approval: _________________ Date: _______
- [ ] Security Lead Approval: _________________ Date: _______
- [ ] CISO Approval: _________________ Date: _______

---

*This policy is a living document and will be updated as our security posture matures and compliance requirements evolve.*
