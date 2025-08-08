# Security Hardening Plan for AI Assistant Container

## Executive Summary

This document outlines a comprehensive security hardening plan for the AI Assistant Container infrastructure, addressing compliance requirements from NIST 800-218 (Secure Software Development Framework), CMMC Level 2, NIST 800-171, NIST 800-190 (Application Container Security), and NIST 800-204D (CI/CD Pipeline Security).

## 1. Current Security Posture Assessment

### 1.1 Strengths Identified
- **Base Image Security**: Uses pinned Ubuntu 24.04 LTS with SHA256 digest verification
- **Vulnerability Scanning**: Trivy scanner integrated into CI/CD pipeline
- **Dependency Management**: Pinned versions for Node.js and npm packages
- **Multi-layered Security**: Separate RUN instructions minimize attack surface
- **Non-root User**: Uses dedicated `aiAssistant` user account
- **Security Event Reporting**: SARIF results uploaded to GitHub Security tab

### 1.2 Security Gaps Identified
- **Secrets Management**: API keys stored in environment variables
- **Container Runtime Security**: Limited runtime security controls
- **Supply Chain Security**: Missing attestation and provenance verification
- **Certificate Management**: Corporate certificate handling needs enhancement
- **Security Testing**: Limited security testing beyond vulnerability scanning
- **Compliance Monitoring**: No continuous compliance validation

## 2. NIST Framework Compliance Requirements

### 2.1 NIST 800-218 (Secure Software Development Framework)
**Required Actions:**
- Implement build attestation and provenance tracking
- Establish secure coding standards and review processes
- Deploy automated security testing throughout SDLC
- Implement vulnerability response and remediation processes

### 2.2 CMMC Level 2 Requirements
**Required Controls (110 total):**
- Risk Assessment (RA.L2-3.11.1): Continuous vulnerability assessment
- Vulnerability Scanning (RA.L2-3.11.2): Enhanced scanning capabilities
- Vulnerability Remediation (RA.L2-3.11.3): Automated remediation workflows
- System Security Plans (CA.L2-3.12.4): Documented security architecture
- Security Control Monitoring (CA.L2-3.12.3): Continuous monitoring implementation

### 2.3 NIST 800-190 (Application Container Security)
**Required Implementations:**
- Container image security scanning and policy enforcement
- Runtime security monitoring and anomaly detection
- Secure container orchestration and network policies
- Container registry security and access controls

### 2.4 NIST 800-204D (CI/CD Pipeline Security)
**Required Controls:**
- Build environment security and isolation
- Artifact attestation and signing
- Secure deployment verification
- Supply chain security integration

## 3. Detailed Security Hardening Recommendations

### 3.1 CI/CD Pipeline Security Enhancements

#### 3.1.1 Build Security (`build-devcontainer.yml`)
```yaml
# Enhanced security controls to implement:
- name: Generate Build Attestation
  uses: actions/attest-build-provenance@v1
  with:
    subject-path: '${{ steps.meta.outputs.digest }}'

- name: Sign Container Image
  uses: sigstore/cosign-installer@v3
  with:
    cosign-release: 'v2.0.0'

- name: Enhanced Vulnerability Scanning
  uses: aquasecurity/trivy-action@master
  with:
    image-ref: '${{ steps.meta.outputs.image }}'
    format: 'sarif'
    severity: 'UNKNOWN,LOW,MEDIUM,HIGH,CRITICAL'
    security-checks: 'vuln,config,secret'
    exit-code: '1'
```

#### 3.1.2 Secrets Management
- **Immediate**: Replace environment variable API key storage with HashiCorp Vault or AWS Secrets Manager
- **Medium-term**: Implement OIDC authentication for GitHub Actions
- **Long-term**: Deploy secret rotation automation

#### 3.1.3 Supply Chain Security
- **Dependency Verification**: Implement npm audit and license scanning
- **SBOM Generation**: Generate Software Bill of Materials for each build
- **Provenance Tracking**: Implement SLSA Level 3 compliance

### 3.2 Container Security Hardening

#### 3.2.1 Dockerfile Security Improvements
```dockerfile
# Enhanced security measures to implement:

# 1. Multi-stage builds for reduced attack surface
FROM --platform=linux/arm64 ubuntu:24.04@sha256:... AS base
# ... base setup ...

FROM base AS security-tools
# Install security scanning tools
RUN apt-get update && apt-get install -y --no-install-recommends \
    trivy \
    clamav \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

FROM base AS production
# Copy only necessary files from security-tools stage

# 2. Enhanced user security
RUN useradd -m -s /bin/bash -u 1000 aiAssistant && \
    mkdir -p /home/aiAssistant/.claude && \
    chmod 700 /home/aiAssistant/.claude

# 3. File system security
RUN chmod 755 /home/aiAssistant && \
    chown -R aiAssistant:aiAssistant /home/aiAssistant

# 4. Security labels and metadata
LABEL security.scan.date="$(date -u +%Y-%m-%dT%H:%M:%SZ)" \
      security.compliance="NIST-800-190,CMMC-L2" \
      security.contact="security@xpai.ai"

# 5. Health checks for security monitoring
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
  CMD curl -f http://localhost:8080/health || exit 1
```

#### 3.2.2 Runtime Security Controls
- **Container Security Policies**: Implement OPA Gatekeeper policies
- **Network Segmentation**: Deploy network policies for container communication
- **Resource Limits**: Enforce CPU and memory limits
- **Security Contexts**: Implement non-root, read-only file systems

### 3.3 Certificate and PKI Management

#### 3.3.1 Corporate Certificate Security
```bash
# Enhanced certificate management
# Replace current certificate handling with:
COPY --chown=root:root zscaler-root-ca.crt /usr/local/share/ca-certificates/
RUN chmod 644 /usr/local/share/ca-certificates/zscaler-root-ca.crt && \
    update-ca-certificates && \
    # Verify certificate installation
    openssl verify -CAfile /etc/ssl/certs/ca-certificates.crt /usr/local/share/ca-certificates/zscaler-root-ca.crt
```

#### 3.3.2 Certificate Rotation
- **Automated Rotation**: Implement certificate rotation automation
- **Monitoring**: Deploy certificate expiration monitoring
- **Validation**: Continuous certificate validation processes

### 3.4 Security Testing and Monitoring

#### 3.4.1 Comprehensive Security Testing
```yaml
# Additional security testing stages
- name: Static Application Security Testing (SAST)
  uses: github/super-linter@v4
  env:
    VALIDATE_ALL_CODEBASE: true
    DEFAULT_BRANCH: main

- name: Dynamic Application Security Testing (DAST)
  uses: zaproxy/action-full-scan@v0.4.0
  with:
    target: 'http://localhost:8080'

- name: Container Security Scanning
  uses: anchore/scan-action@v3
  with:
    image: '${{ steps.meta.outputs.image }}'
    severity-cutoff: 'medium'
    fail-build: true
```

#### 3.4.2 Runtime Security Monitoring
- **Behavioral Analysis**: Deploy runtime behavior monitoring
- **Anomaly Detection**: Implement machine learning-based anomaly detection
- **Incident Response**: Automated incident response workflows

### 3.5 Compliance and Governance

#### 3.5.1 Continuous Compliance Monitoring
- **Policy as Code**: Implement compliance policies as code
- **Automated Auditing**: Deploy continuous compliance auditing
- **Reporting**: Generate compliance reports for CMMC Level 2

#### 3.5.2 Documentation and Training
- **Security Playbooks**: Develop incident response playbooks
- **Training Programs**: Implement security awareness training
- **Documentation**: Maintain security architecture documentation

## 4. Implementation Roadmap

### Phase 1: Critical Security Fixes (Weeks 1-2)
1. **Secrets Management**: Implement secure API key management
2. **Enhanced Scanning**: Deploy comprehensive vulnerability scanning
3. **User Security**: Harden container user configuration
4. **Certificate Security**: Improve certificate management

### Phase 2: Advanced Security Controls (Weeks 3-6)
1. **Build Attestation**: Implement build provenance and attestation
2. **Container Signing**: Deploy container image signing
3. **Runtime Security**: Implement runtime security monitoring
4. **Network Security**: Deploy network segmentation policies

### Phase 3: Compliance and Governance (Weeks 7-12)
1. **CMMC Level 2**: Achieve full CMMC Level 2 compliance
2. **NIST 800-218**: Implement SSDF compliance
3. **Continuous Monitoring**: Deploy continuous compliance monitoring
4. **Documentation**: Complete security documentation

## 5. Success Metrics and KPIs

### 5.1 Security Metrics
- **Vulnerability Remediation Time**: < 24 hours for critical vulnerabilities
- **Security Test Coverage**: > 90% code coverage for security tests
- **Compliance Score**: 100% CMMC Level 2 compliance
- **Incident Response Time**: < 4 hours for security incidents

### 5.2 Operational Metrics
- **Build Security**: 100% builds with security attestation
- **Container Security**: Zero high/critical vulnerabilities in production
- **Certificate Management**: 100% certificate rotation automation
- **Security Training**: 100% team completion of security training

## 6. Risk Assessment and Mitigation

### 6.1 High-Risk Areas
1. **API Key Exposure**: High risk of credential compromise
2. **Container Runtime**: Risk of container escape attacks
3. **Supply Chain**: Risk of dependency compromise
4. **Certificate Management**: Risk of certificate expiration

### 6.2 Mitigation Strategies
- **Defense in Depth**: Multiple layers of security controls
- **Zero Trust Architecture**: Assume breach mentality
- **Continuous Monitoring**: Real-time security monitoring
- **Automated Response**: Automated incident response

## 7. Conclusion

This security hardening plan provides a comprehensive approach to securing the AI Assistant Container infrastructure in compliance with NIST frameworks and CMMC Level 2 requirements. Implementation of these recommendations will significantly improve the security posture while maintaining operational efficiency and development velocity.

The plan emphasizes automation, continuous monitoring, and defense-in-depth strategies to create a robust security framework that protects against current and emerging threats while meeting regulatory compliance requirements.

## 8. References

- NIST Special Publication 800-218: Secure Software Development Framework
- NIST Special Publication 800-190: Application Container Security Guide
- NIST Special Publication 800-204D: Strategies for DevSecOps CI/CD Pipeline Security
- CMMC Level 2 Assessment Guide
- NIST Special Publication 800-171: Protecting Controlled Unclassified Information
- NIST Special Publication 800-53: Security and Privacy Controls
- NIST Special Publication 800-204C: DevSecOps for Microservices Implementation

---

**Document Version**: 1.0  
**Last Updated**: 2025-07-09  
**Next Review**: 2025-10-09  
**Classification**: Internal Use Only