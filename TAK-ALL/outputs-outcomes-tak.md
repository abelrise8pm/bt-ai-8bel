# TAK Outputs and Outcomes
---
## Definition of Done — Task 1: AI/ML Enabled GRG ATAK Plug-in Updated to v5.6
> SOW Reference: `4.3.1` | Core question answered: *What would we hand to SOCOM?*
---
### Theme 1: SDK Compatibility & Functional Correctness
*From: FigJam — "all existing modules function," "correct bugs that arise"; transcript line 26*

| Deliverable | Description |
|---|---|
| Module compatibility verified | All existing GRG plug-in modules confirmed functional under SDK v5.6 with no regressions. |
| Bug resolution log | All breaking changes from SDK update identified, triaged, and resolved before handover. |
| Crash-free workflow | Plugin installs, launches, and completes AI GRG generation on v5.6 without errors or crashes. |

---
### Theme 2: Device Verification (Beyond Emulator)
*From: FigJam — "tested, verified working on v5.6 across a couple of android devices"*

| Deliverable | Description |
|---|---|
| Multi-device test results | Plugin verified on at least two physical Android devices running ATAK v5.6; emulator-only is insufficient. |
| Test procedure document | Step-by-step test procedures tied to user story acceptance criteria, executable by SOCOM. |

---
### Theme 3: Security & TAK Forge Compliance
*From: FigJam — TAK Forge scan thresholds; SOW `4.4.3`; transcript line 29*

| Deliverable | Description |
|---|---|
| TAK Forge scan report | Static security scan via TAK Forge showing: 0 critical, 0 high, <10 moderate, <20 low findings. |
| CVE remediation record | Any identified CVEs addressed and documented; 48-hour resubmission window tracked if triggered. |

---
### Theme 4: Release Artifact & Delivery Package
*From: FigJam — "signed APK," "mil-label," "everything downstream would need"*

| Deliverable | Description |
|---|---|
| Signed .mil-tagged APK | Mil-tagged APK produced and signed per SOCOM program office requirements and MOA/MOU process. |
| Complete release package | Package includes APK, all dependencies, containerization config, and README per SOW `4.5.10`. |
| Software Bill of Materials (SBOM) | Full SBOM listing all software and open-source dependencies per SOW `4.5.14`. |

---
### Theme 5: Technical Documentation & Knowledge Transfer
*From: FigJam — "release notes," "architecture decisions table," "breaking changes/risk documented"*

| Deliverable | Description |
|---|---|
| SDK v5.6 release notes | Internal release notes documenting what changed, what broke, and how it was resolved. |
| Architecture decisions record | Table of key technical decisions made during update, including rationale and tradeoffs. |
| Breaking changes log | All breaking changes clearly documented for downstream developers and SOCOM maintainers. |

---
### Theme 6: Government Release Alignment
*From: FigJam — "consistent with TPC or SOCOM release schedule(s)"*

| Deliverable | Description |
|---|---|
| TPC schedule confirmation | Delivery date and artifact version confirmed compatible with TPC's established SDK release cadence. |
| SOCOM compatibility sign-off | Plugin version verified against active SOCOM release; no conflicts with SOCOM-specific builds. |

---
### Theme 7: Deployment & Handover Readiness
*From: SOW `4.5.15` — deployment instructions, 48-hour extension protocol*

| Deliverable | Description |
|---|---|
| Deployment instructions | Step-by-step deployment guide executable by SOCOM team without Rise8 present. |
| Failure fallback protocol | Error log intake path and resubmission process documented per `4.5.15` handover expectations. |

---
### Suggested Missing Themes (Not in FigJam — Supported by Evidence)

**Theme 8: Regression Test Coverage**
*Supported by: SOW `4.5.8` (80% unit test coverage), FigJam — "ensure all modules work"*

| Deliverable | Description |
|---|---|
| Unit test suite | Automated unit tests covering at least 80% of application code, executable in CI via TAK Forge pipeline. |

---
**Theme 9: Scope Boundary Documentation**
*Supported by: FigJam risk flag — "Clarify scope/client expectations for 'improve' vs 'convert / get existing working'"*

| Deliverable | Description |
|---|---|
| Scope boundary memo | Written confirmation from government PMO on whether "modernize" means update-only or partial rewrite. |

> **Why this matters:** If unresolved before handover, SOCOM may reject the deliverable as incomplete. This is a PM-level blocker to document and close before kickoff.

---
### Summary: What Are We Handing to SOCOM?
A tested, signed, TAK Forge-compliant ATAK plug-in running on SDK v5.6, with full documentation, a deployment-ready release package, and enough context for SOCOM to operate, maintain, and extend it — without Rise8 in the room.

---

## Definition of SUCCESS — Task 1: AI/ML Enabled GRG ATAK Plug-in Updated to v5.6

> SOW Reference: `4.3.1` | Framing question: *What can SOCOM do today that they couldn't do last week?*

---

### Theme 1: Operational Stability in the Field
*Synthesized from: "new version demonstrates stability in Production" + crash-free workflow evidence*

**New operational capability:** SOCOM operators can run the GRG plug-in on ATAK v5.6 devices in the field without fear of mid-workflow crashes, failed installs, or broken AI generation — for the first time on this SDK version.

| Success Indicator | Description |
|---|---|
| Plugin runs end-to-end on v5.6 | Installs, launches, and completes AI GRG generation without a crash or build error on live devices. |
| Verified across device types | Stability confirmed on physical Android hardware, not just emulator — field-representative conditions. |

---

### Theme 2: Security Clearance for Deployment
*Synthesized from: "SOCOM's v5.6 SDK is secure compliant with TAK Forge standards" + SOW `4.4.3` thresholds*

**New operational capability:** SOCOM and downstream program offices can accept and distribute this plugin with confidence it has passed TAK Forge's security gate — removing a blocker that previously prevented compliant deployment.

| Success Indicator | Description |
|---|---|
| TAK Forge scan thresholds met | Zero critical, zero high, fewer than 10 moderate, fewer than 20 low security findings on submission. |
| Signed, mil-tagged APK ready | Artifact meets MOA/MOU signing requirements; cleared for SOCOM distribution and downstream use. |

---

### Theme 3: Ecosystem Fit & Gov Release Alignment
*Synthesized from: "latest version is consistent with the Gov Release Schedule" + TPC cadence dependency*

**New operational capability:** SOCOM program managers can slot this plugin into their existing TPC and SOCOM release trains — no version conflicts, no manual intervention, no schedule slippage caused by Rise8's deliverable.

| Success Indicator | Description |
|---|---|
| TPC release cadence matched | Plugin version aligns with TPC's established SDK release schedule; no blocking version conflicts exist. |
| SOCOM release compatibility confirmed | Verified against active SOCOM builds; no conflicts introduced to the broader TAK ecosystem. |

---

### Theme 4: Usable Interface on the Updated Platform
*Synthesized from: "intuitive user experience and UI" + risk flag on scope*

**New operational capability:** Operators who open the updated plugin for the first time on v5.6 encounter a UI that functions as expected — no broken icons, no degraded interactions introduced by the SDK update.

| Success Indicator | Description |
|---|---|
| UI functional parity maintained | Icons, workflows, and interactions behave consistently post-update; no visual regressions from SDK changes. |
| Scope boundary confirmed with PMO | Written PMO confirmation on whether UI "improvement" is in scope for this task or deferred to Task 2. |

> **Risk carried forward:** FigJam flagged — *"Clarify scope/client expectations for 'improve' vs 'convert / get existing working'"* — this is a PM-level action item before kickoff. Do not let Task 1 success criteria expand into Task 2 territory without explicit government direction.

---

### Implied Themes — Not in the FigJam, Supported by Transcript

**Theme 5: Forward Capability — Operators Can Make GRGs Faster**
*From: Jonathan's framing, transcript line 23 — "enabling people to make GRGs faster or better in the field"*

**New operational capability:** Even before direct user outcomes are measured in production, SOCOM now has a stable, compliant plugin that *enables* that future outcome — faster, more accurate GRG creation under time pressure in the field.

| Success Indicator | Description |
|---|---|
| AI GRG workflow intact and functional | The AI-assisted GRG generation flow still works end-to-end; no capability regression from the SDK update. |

---

**Theme 6: Program Continuity & Institutional Knowledge**
*From: Abel's takes, transcript line 24 — "compile all we know... user personas, pain-points, workflows"; line 30*

**New operational capability:** SOCOM program managers and follow-on teams receive not just the artifact, but the documentation needed to understand what changed, why, and how to maintain it — continuity that did not exist before this task.

| Success Indicator | Description |
|---|---|
| Breaking changes and decisions documented | SOCOM and successor contractors can trace every SDK-driven change; no tribal knowledge required. |
| Deployment instructions are self-sufficient | A SOCOM deployment team can execute the handover without Rise8 present; instructions are complete and tested. |

---

### The One-Line Answer to "What's the New Operational Capability?"

> SOCOM can now deploy a TAK Forge-compliant, device-tested ATAK GRG plugin on SDK v5.6 — aligned with the TPC release schedule — and hand it to their release chain.

---

## Definition of Done — Task 2: AI/ML Enabled GRG ATAK Plug-in TAK UI Migration Cost/Timeline Research

> SOW Reference: `4.3.2` | Core question answered: *What would we hand to SOCOM?*

---

### Theme 1: Framework Mapping Artifact
*From: FigJam — "Inventory of current UI components and patterns, Verify if equivalent exists in new framework, Decisions which framework component or pattern to adopt"; transcript line 35*

| Deliverable | Description |
|---|---|
| Current UI component inventory | Full catalog of existing GRG plug-in UI components and interaction patterns, structured and documented. |
| New framework equivalency map | Side-by-side mapping of current components to TAK UI framework equivalents; gaps clearly flagged. |
| Unsupported component decision log | For each component with no equivalent: adopt nearest pattern, custom build, or defer — decision recorded. |

---

### Theme 2: Module & Dependency Compatibility Audit
*From: FigJam — "Verify if any modules used have been updated or broken"; "outlined risks for some implications for migrating to TAK UI"*

| Deliverable | Description |
|---|---|
| Module compatibility matrix | Each plug-in module assessed against TAK UI framework; updated, broken, or deprecated status recorded. |
| Migration implications summary | Key risks and blockers from migrating to TAK UI documented concisely — part of this artifact, not a separate register. |

---

### Theme 3: Cross-Platform Compatibility Findings
*From: SOW `4.3.2` — "establish TAK UI Bridge language cross compatibility"; transcript line 38 — "consistent UI experience across Windows and Android"*

| Deliverable | Description |
|---|---|
| Bridge compatibility findings | Research confirms whether TAK UI framework achieves true cross-platform parity (Windows, Android) for this plugin. |
| Future feature extensibility validation | Confirmation that adding one new feature would not require a separate rewrite per platform — proving the framework's value. |

---

### Theme 4: Cost, Timeline & Roadmap Estimate
*From: FigJam — "An estimate with proposed milestones and estimate target dates"; SOW `4.3.2` — explicit contract requirement*

Themes 1-3 feed directly into this. It is both the contract deliverable and the decision-support package SOCOM needs to greenlight full migration.

> **Note:** The actual TAK UI migration is not a deliverable for this task. SOW `4.3.2` authorizes research and an estimate only. This estimate is what enables SOCOM to make a go/no-go decision on migration — either as an extension of this contract or the next one.

| Deliverable | Description |
|---|---|
| Level-of-effort estimate | Effort for full TAK UI migration, broken down by component and work type, grounded in Themes 1-3 findings. |
| Proposed milestone roadmap | Sequenced milestones with target dates, accounting for TPC SDK schedule and SOCOM release dependencies. |
| PMO briefing package | Findings, estimate, risks, and recommendation formatted for a management update presentation. |

---

### Risks & Assumptions

> **RISK:** SOW requires estimate; Kevan expects implementation. If unresolved at kickoff, iteration planning is undefined. → PM to get written PMO confirmation before iteration 1 begins.

> **ASSUMPTION:** TAK UI framework achieves Windows + Android cross-compatibility for this plugin. → Needs confirmation via TPC contact or a technical spike in iteration 1.

> **ASSUMPTION:** Framework mapping is scoped to research only, not design execution. → Confirm with Kevan and Jonathan before committing team capacity.

---

### Summary: What Are We Handing to SOCOM?

A framework mapping artifact, a module compatibility audit, cross-platform compatibility findings, and a PMO-ready cost/timeline estimate — giving SOCOM everything needed to make an informed go/no-go decision on full TAK UI migration, with or without Rise8 in the room.

---

## Definition of Success — Task 2: AI/ML Enabled GRG ATAK Plug-in TAK UI Migration Cost/Timeline Research

> SOW Reference: `4.3.2` | Framing question: *What can SOCOM do today that they couldn't do last week?*

---

### Theme 1: SOCOM Has the Ability to Make an Informed Migration Decision
*From: FigJam — "SOCOM can make a no go/yes go decision on funding a migration to TAK UI as part of the long term contract"; transcript line 32*

**New operational capability:** SOCOM/PMO can now decide whether to fund a full TAK UI migration as part of a long-term contract — backed by evidence from Rise8's research — where before, that decision had no foundation to stand on.

| Success Indicator | Description |
|---|---|
| PMO briefing delivered and accepted | Government PMO has received, reviewed, and acknowledged the cost/timeline estimate and research findings. |
| Migration decision on record | A go/no-go on funding TAK UI migration — tied to long-term contract planning — is documented by PMO. |
| Options clearly presented | Briefing presents migration paths with tradeoffs: stop at estimate, partial execution, or full rewrite. |

---

### Theme 2: GRG Plugin Verified Compatible Across All TAK Clients via the TAK UI Framework
*From: FigJam — "same UI components render and function correctly across key platforms," "deploy across all TAK clients since it uses the TAK UI standard," "future platform additions require no UI rewrite," "plugin can survive future updates"; transcript line 38*

**New operational capability:** SOCOM can demonstrate — with evidence — that the GRG plugin built on the TAK UI framework renders and functions correctly across all TAK clients, and that future platform additions require no UI rewrite.

| Success Indicator | Description |
|---|---|
| UI components render correctly across all TAK clients | Same components confirmed functioning across key platforms via the TAK UI framework — no platform-specific forks required. |
| Existing plugin experience not broken | Post-migration verification confirms the plugin does not regress or disrupt any currently working functionality. |
| Future platform additions require no UI rewrite | Research validates that adding a new TAK client would not require a separate UI rewrite — confirmed at code and data level. |
| Plugin compatible with future TAK updates | TAK UI framework compatibility confirmed such that future SDK or TAK releases do not require migration rework. |

> **Risk:** Rise8 does not control deploy or access to mil users. Full production verification of cross-platform UI experience requires mil TAK user access that cannot be guaranteed within this contract period. This caps how far success can be verified.

---

### Theme 3: Rise8 and Government PMO Hold a Documented, Aligned View of Migration Scope
*From: transcript line 35 — "inventory the current UI, identify equivalent components, flag necessary decisions for unsupported components"; implied by FigJam cross-platform findings*

**New operational capability:** SOCOM and Rise8 have moved from working off assumptions about migration scope to a documented, PMO-acknowledged view of what migration entails — components, complexity, decisions, and open questions included.

| Success Indicator | Description |
|---|---|
| Framework mapping reviewed with government team | Component inventory and equivalency map presented to and acknowledged by the government team; no major surprises remain. |
| Unsupported component decisions on record | For components with no TAK UI equivalent, decisions are documented and government-acknowledged — not Rise8's call alone. |

---

### The One-Line Answer to "What Does Success Look Like Once We Deliver It?"

> With cross-platform UI compatibility findings across Android and Windows, a cost estimate, and a migration roadmap, SOCOM can now make an evidence-backed funding decision on full TAK UI migration — and communicate that decision to a long-term contract.

---

## Definition of Done — Task 3: AI/ML Enabled GRG ATAK Plug-in Model Improvements (and Research)

> SOW Reference: `4.3.3` | Core question answered: *What would we hand to SOCOM — a file? a document? a passing test? a working demo?*

---

> **PM Prerequisite:** Scope for model improvements is undefined as of kickoff. SOW `4.3.3` says "make improvements to the model" but does not specify whether the focus is architecture, training data, or inference strategy. → PM must define improvement scope with the client before iteration 1. Without this, no Definition of Done can be finalized.

---

### Theme 1: Documented Performance Baselines
*From: FigJam — "Documented baselines for all relevant metrics for the specific use cases"; transcript line 46; lines 151, 153*

You cannot demonstrate improvement without a documented starting point. Known baselines from the competition are the current reference.

**What SOCOM gets:** A metrics document.

| Deliverable | Description |
|---|---|
| Baseline metrics report | Detection accuracy documented per scan method: ~80-90% section-based, ~60% AOI-wide; latency ~30s for 10 sections. |
| Use case coverage map | Each baseline tied to a specific use case and terrain type (e.g., urban, desert, forested AOI) — not a generic aggregate. |
| Data provenance note | Explicit statement that all baselines are competition/test-derived from Philippines and California AOIs — not production data. |

---

### Theme 2: Measurable Model Performance Improvements on Targeted AOIs and Terrain Types
*From: FigJam — "better detection and inference on certain AOIs/terrain types"; transcript lines 48-49, 151, 153; lines 144, 149*

**What SOCOM gets:** An updated ONNX model artifact with a performance comparison report showing gains against the documented baseline on client-specified terrain types.

> **Note:** Without new client-provided AOI data, improvements are limited to inference strategy optimization on existing datasets — not full retraining. Scope of improvement must be confirmed at kickoff.

| Deliverable | Description |
|---|---|
| Improved ONNX model artifact | Updated model file exported in ONNX format; ready for on-device deployment in ATAK under DDIL network conditions. |
| Performance comparison report | Side-by-side metrics: new model vs baseline on targeted AOIs/terrain types — accuracy, recall, detection rate. |
| Model vs algorithm scope boundary | Written record distinguishing what was improved in the model vs what belongs to algorithm or UI/UX — prevents scope creep. |
| Approach documentation | Confirms YOLO hybrid section-based detection as the active approach; YOLT deprecated due to Java conversion failure. |

---

### Theme 3: Codified Model Training Pipeline
*From: FigJam — "A codified model training pipeline, end to end from Data Collection to Evals and Validation to Monitoring in Prod"; transcript line 41; lines 142, 144, 147, 149*

**What SOCOM gets:** A documented, reproducible process — not just a one-time trained model, but the pipeline that produced it, including the tools, dependencies, and decisions that underpin it.

| Deliverable | Description |
|---|---|
| Pipeline documentation | End-to-end process documented: data collection → CVAT labeling → preparation → training → evaluation → validation → ONNX export. |
| Reproducibility record | Steps and configurations needed to re-run training; not dependent on any one person's institutional knowledge. |
| Infrastructure reference | IaC config location for SageMaker reconstruction documented; cloud platform noted as TBD pending team/client confirmation. |
| Labeling tool dependency note | CVAT identified as the labeling tool; backup currently on Mise's local machine — provisioning steps documented before training begins. |
| Evaluation and validation criteria | Defined thresholds and test conditions used to validate model performance before any artifact is considered production-ready. |

---

### Theme 4: Improvement Metrics Against Competition/Test Baselines
*From: FigJam — "We have improvement metrics from existing (real-world) baselines"; transcript line 52; line 155*

> **Note:** The team currently has no real-world production data. All metrics are competition/test-derived. This theme documents that improvement happened against those test baselines — and makes the provenance explicit so SOCOM is not misled.

**What SOCOM gets:** A results report that shows the model improved, grounded in honest data sourcing.

| Deliverable | Description |
|---|---|
| Improvement delta report | Quantified improvement against competition/test baselines per targeted AOI and terrain type. |
| Latency vs accuracy tradeoff note | Customer priority is detection rate over speed; documented rationale for any tradeoffs made during optimization. |
| Production data gap statement | Explicit acknowledgment that real-world usage data does not yet exist; these metrics represent the best available baseline. |

---

### Risks & Assumptions

> **RISK:** Scope of model improvements is undefined. Architecture? Training data? Inference strategy? Without client alignment, the team cannot set a meaningful Definition of Done. → PM must resolve with government team at or before kickoff.

> **RISK:** Further model retraining requires new AOI data from the client. Without it, improvement scope is limited to inference optimization on existing datasets — not full retraining. → PM must confirm data availability with government team at kickoff.

> **RISK:** CVAT labeling tool backup exists only on Mise's local machine. If unavailable, re-labeling from scratch would be required before any training run. → Engineering to confirm CVAT can be provisioned before iteration 1 begins.

> **RISK:** All current performance baselines are competition/test-derived (Philippines, California AOIs) — not production data. Improvement metrics will be measured against these. → State this explicitly in all deliverables to avoid overstating claims to SOCOM.

> **RISK:** YOLT approach is deprecated due to Java conversion failure. Prior YOLT-era metrics are not a valid baseline for this work. → Engineering to confirm YOLO hybrid as the only active approach before pipeline is documented.

> **ASSUMPTION:** ONNX remains the target export format for on-device DDIL deployment. → Confirm with Kevan before training pipeline is documented or any model artifact is produced.

> **ASSUMPTION:** The team will not use SageMaker again during this contract period unless new data or specific client feedback justifies it. → Confirm cloud training platform decision with Kevan at kickoff.
---
### Summary: What Are We Handing to SOCOM?

A documented performance baseline report, an improved ONNX model artifact with measurable gains on targeted terrain types, a codified and reproducible training pipeline, and an improvement metrics report — all with explicit sourcing so SOCOM knows exactly what the numbers mean and how to continue improving the model after Rise8 is done.

---

## Definition of Success — Task 3: AI/ML Enabled GRG ATAK Plug-in Model Improvements (and Research)

> SOW Reference: `4.3.3` | Framing question: *What can SOCOM and other entities do today that they couldn't do last week?*

---

### Theme 1: SOCOM/SOFMC Has an Independent Capability to Run the Model Training Pipeline
*From: FigJam — "SOCOM and or SOFMC can independently run their own model training pipeline - has the capability"; Abel's takes line 42*

**New operational capability:** SOCOM/SOFMC now has a documented, reproducible training pipeline they can execute without Rise8 present — the capability to improve the model is no longer dependent on a single vendor or contractor.

| Success Indicator | Description |
|---|---|
| Pipeline successfully run by non-Rise8 team member | A SOCOM/SOFMC team member or follow-on contractor executes at least one pipeline stage using Rise8's documentation — without Rise8 guidance. |
| Pipeline produces a valid ONNX artifact | Running the documented pipeline end-to-end outputs a functional ONNX model file deployable on device. |
| No single-person dependency | Pipeline steps are not gated by any one individual's knowledge — any engineer with the documentation can execute it. |

> **Risk:** Whether SOCOM/SOFMC has the internal technical staff to operate a model training pipeline is an open question. Jonathan clarified stakeholders are under SoftMC; their capacity to independently run ML infrastructure is unconfirmed. → PM must validate with government team at kickoff whether this outcome is in scope or aspirational.

---

### Theme 2: Operators Produce More Accurate GRGs in Less Time
*From: FigJam — "more accurate GRGs created in short time frames, model better identifies buildings across AOIs compared to previous version"; line 114 — "mil TAK user must create complex GRGs in less time than with the previous version"; transcript lines 48, 51-52*

**New operational capability:** Operators now spend less time manually correcting building detections because the model identifies buildings more accurately across AOIs — the gap between AI-generated output and an accurate map is smaller than it was before this task.

| Success Indicator | Description |
|---|---|
| Improved detection accuracy on targeted AOIs | New model demonstrates measurably higher accuracy than the documented baseline on at least one client-specified terrain type. |
| Reduced manual correction steps | Operator correction time or number of manual edits required to reach a completed GRG is lower than with the prior model version. |
| Faster time-to-accurate-map | End-to-end workflow — from launching the plugin to a completed, accurate GRG — is demonstrably faster than the previous version baseline. |

> **Risk:** No real-world production data exists (line 155). "Faster" and "more accurate" can only be demonstrated against competition/test baselines — not real field use. Success indicators here are validated in a test environment until production deployment occurs.

---

### Theme 3: Model Performance is Measurably Better on Previously Challenging Terrain Types
*From: transcript line 44 — "challenges across various terrain types...clear desert images versus areas with tree cover, or complex urban environments"; transcript line 48 — "preventing negative outcomes during missions"*

**New operational capability:** The team now has evidence — not assumptions — about where the model performs well and where it still struggles, and has moved the needle on at least one previously identified weak terrain type.

| Success Indicator | Description |
|---|---|
| Terrain-specific performance delta documented | Improvement on at least one challenging terrain type (e.g., forested, complex urban) compared to baseline — or confirmed limitation documented. |
| Failure modes documented | Known terrain types or image conditions where the model still underperforms are explicitly recorded — giving SOCOM an honest picture. |
| Mission risk reduction framed | Improvement on challenging AOIs is connected to reducing operator error or mission risk — not just an abstract accuracy number. |

---

### Implied Theme — Supported by Evidence, Not Yet in FigJam

**Medium Confidence Tags Enable Smarter Operator Correction**
*From: transcript line 54 — Zach's suggestion: displaying a "medium confidence" tag (30-70% confidence range) reduces operator workload by focusing correction on uncertain detections only*

**New operational capability:** If implemented, operators no longer have to scan an entire section for possible omissions — they focus only on buildings the model flagged as uncertain, reducing cognitive load.

| Success Indicator | Description |
|---|---|
| Medium confidence detections surfaced in UI | Plugin surfaces buildings in the 30-70% confidence range distinctly from high-confidence detections. |
| Operator correction focused on uncertain detections | Operators engage primarily with medium-confidence flags rather than scanning full sections manually. |

> **Note:** This is Zach's suggestion from a single transcript comment (line 54). Include only if government team confirms interest at kickoff — do not scope unilaterally.

---

### The One-Line Answer to "What Does Success Look Like Once We Deliver It?"

> Operators can now create more accurate GRGs faster — with a model that better identifies buildings across challenging AOIs — and SOCOM/SOFMC has the documented pipeline and knowledge to continue improving it after Rise8 is done.

---


