# Compliance Requirements

**Version:** 1.0.0
**Last Updated:** 2025-10-30
**System:** AI Assistant Container (xpai-ai-assistant-container)

## 1. Overview

This document defines the compliance requirements for the AI Assistant Container system, which handles Controlled Unclassified Information (CUI) and must maintain CMMC Level 2 certification.

## 2. Applicable Compliance Frameworks

### CMMC Level 2 (Cybersecurity Maturity Model Certification)

**Status:** Required for DoD contracts
**Assessment Type:** Third-party C3PAO assessment
**Certification Validity:** 3 years
**Next Assessment:** [TBD]

**Key Requirements:**
- Implementation of NIST SP 800-171 controls
- Annual self-assessment
- Documented policies and procedures
- Evidence of control effectiveness
- POA&M for any deficiencies

### NIST SP 800-171 Rev 3

**Status:** Mandatory baseline for CMMC Level 2
**Control Families:** 14 families, 110 controls
**Scope:** All systems processing, storing, or transmitting CUI

**Relevant Control Families for Vulnerability Management:**

| Family | Code | Controls | Relevance |
|--------|------|----------|-----------|
| **Access Control** | AC | 22 | User authentication, least privilege |
| **Awareness & Training** | AT | 4 | Security awareness for vulnerability response |
| **Audit & Accountability** | AU | 9 | Logging vulnerability remediation actions |
| **Configuration Management** | CM | 11 | Baseline configs, patch management |
| **Identification & Authentication** | IA | 11 | Strong authentication for admin access |
| **Incident Response** | IR | 8 | Handling security incidents from exploits |
| **Maintenance** | MA | 6 | Maintenance tools and controls |
| **Media Protection** | MP | 8 | CUI storage and disposal |
| **Personnel Security** | PS | 8 | Background checks for access |
| **Physical Protection** | PE | 20 | Physical security (less relevant for containers) |
| **Risk Assessment** | RA | 5 | **Vulnerability scanning (RA-5)** |
| **Security Assessment** | CA | 9 | **Security control assessments** |
| **System & Communications Protection** | SC | 48 | Network segmentation, encryption |
| **System & Information Integrity** | SI | 21 | **Flaw remediation (SI-2)** |

### DFARS 252.204-7012

**Status:** DoD contract requirement
**Key Provisions:**
- Adequate security to protect CUI
- Rapid reporting of cyber incidents (72 hours)
- Flow-down requirements to subcontractors
- Malicious software protection
- Media sanitization

## 3. CUI Handling Requirements

### CUI Definition

**Controlled Unclassified Information (CUI)** is information that requires safeguarding or dissemination controls pursuant to federal law, regulation, or government-wide policy.

**Examples in AI Assistant Context:**
- Source code for DoD systems
- System architecture diagrams
- Configuration files with security settings
- Deployment credentials or API keys
- Technical specifications and designs
- Security scan results and vulnerability reports

### CUI Marking Requirements

All CUI must be marked appropriately:
- Banner marking: `CUI` or `CONTROLLED`
- Portion markings: `(CUI)` for each CUI paragraph
- Dissemination controls: e.g., `CUI//FED ONLY`

### CUI Storage Requirements

- **At Rest:** FIPS 140-2 validated encryption
- **In Transit:** TLS 1.2+ with approved cipher suites
- **Access Controls:** MFA required for CUI access
- **Audit Logging:** All CUI access logged and retained

### CUI Disposal Requirements

- **Electronic Media:** Cryptographic erasure or physical destruction
- **Backup Media:** Same as primary media
- **Logs:** Retain for 1 year minimum
- **Certificates of Destruction:** Required for physical media

## 4. Supply Chain Risk Management (CMMC SR Family)

### Software Bill of Materials (SBOM)

**Requirement:** Maintain SBOM for all container components
**Format:** SPDX or CycloneDX
**Update Frequency:** With each container build
**Location:** Published with container image metadata

**SBOM Contents:**
- All direct dependencies (npm packages, OS packages)
- All transitive dependencies
- Version numbers and licenses
- Known vulnerabilities (CVEs)
- Supplier/maintainer information

### Third-Party Component Vetting

**Approval Required For:**
- New open-source dependencies
- New AI model providers
- New container base images
- New third-party APIs or services

**Vetting Criteria:**
- Security track record (vulnerability history)
- Maintenance status (last commit, active maintainers)
- License compatibility
- Community reputation
- Vendor security practices

### Dependency Update Policy

| Dependency Type | Update Frequency | Approval Required |
|----------------|------------------|-------------------|
| **Critical Security Patches** | Within 7 days | Security Lead |
| **OS Base Image** | Monthly | Development Lead |
| **AI Tool Versions** | Quarterly | Product Owner |
| **Development Libraries** | Quarterly | Development Lead |

## 5. Vulnerability Management Requirements

### Scanning Requirements (NIST 800-171 RA-5)

**Frequency:**
- **Production Images:** Daily (nightly scans)
- **Development Builds:** On every pull request
- **Base Image Updates:** Before deployment
- **Ad-Hoc:** On CVE disclosure affecting our stack

**Tools:**
- Primary: Trivy (container scanning)
- Secondary: GitHub Dependabot (dependency alerts)
- Supplemental: Snyk or similar (optional)

**Scan Scope:**
- Operating system packages
- Language runtimes (Node.js, Go binaries)
- Application dependencies (npm packages)
- Embedded binaries (crane, gh, goose)

### Remediation Requirements (NIST 800-171 SI-2)

**Flaw Remediation Process:**
1. **Identification:** Automated scans, vendor advisories, threat intel
2. **Classification:** Severity assignment per security policy
3. **Analysis:** Exploitability and impact assessment
4. **Remediation:** Patch, update, configure, or mitigate
5. **Verification:** Re-scan to confirm resolution
6. **Documentation:** POA&M for tracking and compliance

**Remediation Timelines:** See Security Policy Section 4

### POA&M Requirements

**Mandatory POA&M Creation:**
- All vulnerabilities with remediation > 30 days
- Any CRITICAL or HIGH severity findings
- Any finding requiring risk acceptance
- Any finding with compliance impact

**POA&M Update Frequency:**
- CRITICAL: Daily updates until resolved
- HIGH: Weekly updates
- MEDIUM/LOW: Monthly updates

**POA&M Contents:** See Security Policy Section 9

## 6. Incident Response Requirements (NIST 800-171 IR Family)

### Incident Definitions

**Security Incident:** Any event that threatens CUI confidentiality, integrity, or availability

**Examples:**
- Exploitation of a known vulnerability in production
- Unauthorized access to CUI
- Malware detection in container environment
- Data breach or exfiltration
- Insider threat activity

### Reporting Timelines

| Incident Type | Internal Reporting | External Reporting (DoD) |
|--------------|-------------------|-------------------------|
| **CUI Breach** | Immediate | **72 hours** (DFARS) |
| **Cyber Incident** | Immediate | **72 hours** (DFARS) |
| **Security Control Failure** | 24 hours | If CUI affected: 72 hours |
| **Vulnerability Exploitation** | 24 hours | If CUI at risk: 72 hours |

### Incident Response Plan

**Phases:**
1. **Detection & Analysis:** Identify incident scope and impact
2. **Containment:** Isolate affected systems, prevent spread
3. **Eradication:** Remove malware, patch vulnerabilities
4. **Recovery:** Restore systems from clean backups
5. **Post-Incident:** Lessons learned, control improvements

**Roles:**
- **Incident Commander:** Security Lead
- **Technical Lead:** DevOps/Platform Team
- **Communications:** System Owner
- **Legal/Compliance:** CISO or external counsel

## 7. Configuration Management (NIST 800-171 CM Family)

### Baseline Configuration

**Requirement:** Establish and maintain security baseline for containers

**Baseline Components:**
- Approved base image (Ubuntu 24.04 LTS with digest pin)
- Approved software versions (documented in Dockerfile)
- Security hardening settings (least privilege, no unnecessary services)
- Approved network configurations (firewall rules, allowed registries)

**Baseline Documentation:** Dockerfile + README.md

### Configuration Change Control

**Change Approval Required:**
- Base image updates
- Security-critical dependency updates
- Changes to authentication/authorization
- Network configuration changes
- Addition of new third-party components

**Change Control Process:**
1. Pull request with justification
2. Security review (if security-impacted)
3. Approval by Development Lead or Security Lead
4. Testing in non-production environment
5. Deployment with rollback plan
6. Post-deployment verification

### Least Functionality (NIST 800-171 CM-7)

**Requirement:** Only install necessary software and services

**Approved Components:**
- Essential: git, curl, jq, ssh-client
- AI Tools: Claude Code, Gemini CLI, Goose
- Container Tools: crane, gh
- Runtime: Node.js (required for AI tools)

**Prohibited:**
- Unnecessary network services (no web servers, databases)
- Development tools in production images (compilers, debuggers)
- Unnecessary privileges (no sudo, no root after setup)

## 8. System & Information Integrity (NIST 800-171 SI Family)

### Security Alerts & Advisories (SI-5)

**Sources:**
- CISA Known Exploited Vulnerabilities (KEV)
- GitHub Security Advisories
- NVD (National Vulnerability Database)
- Vendor security bulletins (Anthropic, Google, Ubuntu)
- npm security advisories

**Monitoring Frequency:** Daily automated checks

**Response SLA:**
- KEV additions: Review within 24 hours
- CRITICAL advisories: Review within 24 hours
- HIGH advisories: Review within 1 week

### Security Function Verification (SI-6)

**Requirement:** Verify security functions are operating correctly

**Verification Methods:**
- Automated: Nightly security scans pass/fail
- Automated: Container image signature verification
- Manual: Monthly security control review
- Manual: Quarterly penetration testing (optional)

### Software Updates (SI-2)

**Update Policy:**
- Security patches: Expedited timeline per Security Policy
- Feature updates: Quarterly release cycle
- Major version updates: Annual with thorough testing

**Testing Requirements:**
- Security patches: Smoke testing only (if time-critical)
- Minor updates: Full regression testing
- Major updates: Full regression + security testing

## 9. Audit & Accountability (NIST 800-171 AU Family)

### Audit Logging Requirements

**Events to Log:**
- Container build events (who, what, when)
- Security scan results (pass/fail, CVEs found)
- Vulnerability remediation actions (what fixed, when)
- Configuration changes (what changed, who approved)
- Access to CUI (who accessed, when, what actions)

**Log Retention:** 1 year minimum (3 years recommended)

**Log Protection:**
- Stored in immutable location (GitHub Actions logs, CloudWatch)
- Access restricted to authorized personnel
- Integrity verification (checksums or signatures)

### Audit Review & Analysis

**Review Frequency:**
- Security scan logs: Daily (automated)
- Build logs: On failure or incident
- Access logs: Monthly (manual review)

**Anomaly Detection:**
- Unexpected build failures
- Scan results with new CRITICAL CVEs
- Unauthorized configuration changes

## 10. Assessment Requirements (NIST 800-171 CA Family)

### Self-Assessment

**Frequency:** Annually (CMMC requirement)
**Scope:** All 110 NIST 800-171 controls
**Output:** Completed self-assessment report, POA&M for deficiencies

### Third-Party Assessment (C3PAO)

**Frequency:** Every 3 years (CMMC certification validity)
**Scope:** Full CMMC Level 2 assessment
**Preparation:**
- Update System Security Plan (SSP)
- Prepare evidence packages (policies, logs, scan reports)
- Resolve all open POA&Ms (or document approved exceptions)
- Conduct mock assessment

### Continuous Monitoring

**Automated Monitoring:**
- Daily: Container vulnerability scans
- Weekly: Dependency update checks
- Monthly: Configuration drift detection

**Manual Monitoring:**
- Monthly: Security control effectiveness review
- Quarterly: Risk register review
- Annually: Full compliance assessment

## 11. Subcontractor & Supply Chain Requirements

### Flow-Down Clauses

If this container is used in a DoD contract, the following clauses flow down to subcontractors:
- DFARS 252.204-7012 (Safeguarding CUI)
- CMMC certification requirements
- Incident reporting obligations

### Subcontractor Vetting

**Required Due Diligence:**
- CMMC certification status (if handling CUI)
- Security questionnaire completion
- Right to audit clause in contract
- Incident notification requirements

## 12. Documentation Requirements

### Required Documentation

| Document | Owner | Update Frequency | Location |
|----------|-------|------------------|----------|
| **System Security Plan (SSP)** | System Owner | Annually | `.claude/cybersecurity/ssp.md` (TBD) |
| **Security Policy** | Security Lead | Quarterly | `.claude/cybersecurity/security-policy.md` |
| **Incident Response Plan** | Security Lead | Annually | `.claude/cybersecurity/incident-response.md` (TBD) |
| **POA&Ms** | Security Lead | Per-finding | `.claude/context/cybersecurity/poam/*.md` |
| **SBOM** | DevOps | Per-build | Container metadata |
| **Configuration Baseline** | DevOps | Per-change | `image/Dockerfile` |
| **Risk Register** | Security Lead | Monthly | `.claude/cybersecurity/risk-register.md` (TBD) |

### Evidence Collection

**Compliance Evidence Types:**
- **Policies:** This document, security policy, procedures
- **Technical:** Scan reports, container images, SBOMs
- **Procedural:** Audit logs, change requests, approvals
- **Assessment:** Self-assessment results, C3PAO reports

**Evidence Retention:** 3 years minimum (full CMMC certification cycle)

## 13. Training Requirements (NIST 800-171 AT Family)

### Security Awareness Training

**Audience:** All personnel with access to CUI
**Frequency:** Annually (initial + refresher)
**Topics:**
- CUI identification and handling
- Phishing and social engineering
- Password security and MFA
- Incident reporting procedures
- Vulnerability management basics

### Role-Based Training

| Role | Additional Training |
|------|---------------------|
| **Developers** | Secure coding, dependency management |
| **DevOps** | Container security, supply chain risk |
| **Security Team** | Vulnerability triage, POA&M creation |
| **System Owner** | Risk acceptance, compliance obligations |

## 14. Physical Security (NIST 800-171 PE Family)

**Applicability:** Primarily for systems processing CUI

**Container-Specific Considerations:**
- **Developer Workstations:** Encrypted drives, screen locks, MFA
- **CI/CD Infrastructure:** Physical or logical access controls
- **Backup Media:** Secure storage, controlled access

**Note:** This container is primarily digital infrastructure, so physical security focuses on underlying systems (laptops, servers).

## 15. Compliance Monitoring & Reporting

### Key Compliance Metrics

| Metric | Target | Reporting Frequency |
|--------|--------|---------------------|
| **% Controls Implemented** | 100% | Monthly |
| **# Open POA&Ms** | < 10 | Monthly |
| **Mean POA&M Age** | < 60 days | Monthly |
| **% Vulnerabilities Remediated On-Time** | > 95% | Monthly |
| **Incident Response Time** | < 72 hours | Per-incident |

### Reporting Cadence

- **Weekly:** Security scan results to DevOps team
- **Monthly:** Compliance dashboard to System Owner
- **Quarterly:** Executive summary to CISO
- **Annually:** Self-assessment report to Authorizing Official

## 16. Non-Compliance Consequences

### Internal Consequences

- Loss of authorization to process CUI
- Suspension of system operations
- Disciplinary action for responsible personnel
- Increased audit and monitoring requirements

### External Consequences

- Loss of CMMC certification
- Contract non-performance (potential termination)
- Financial penalties (DFARS violations)
- Debarment from future DoD contracts
- Reputational damage

## 17. Compliance Contacts

| Compliance Area | Contact | Escalation |
|----------------|---------|------------|
| **CMMC Certification** | Security Lead | CISO |
| **NIST 800-171 Controls** | Security Lead | System Owner |
| **Incident Reporting** | @mikegehard-rise8 | CISO |
| **C3PAO Coordination** | CISO | Authorizing Official |

## 18. References

- [CMMC Model](https://www.acq.osd.mil/cmmc/)
- [NIST SP 800-171 Rev 3](https://csrc.nist.gov/publications/detail/sp/800-171/rev-3/final)
- [DFARS 252.204-7012](https://www.acquisition.gov/dfars/252.204-7012-safeguarding-covered-defense-information-and-cyber-incident-reporting)
- [CUI Registry](https://www.archives.gov/cui)
- [CISA KEV Catalog](https://www.cisa.gov/known-exploited-vulnerabilities-catalog)

---

**Document Approval:**

- [ ] System Owner: _________________ Date: _______
- [ ] Security Lead: _________________ Date: _______
- [ ] CISO: _________________ Date: _______

---

*This document reflects the compliance requirements as of 2025-10-30 and will be updated as regulations evolve.*
