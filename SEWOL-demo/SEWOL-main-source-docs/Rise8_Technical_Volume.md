# Rise8 — SEWOL Framework & Mission Applications
## Technical Volume | SPEC RPP No. 2607

> **Source:** `Rise8__SPEC_RPP_2607__Technical_Volume.pdf`
> This document was transcribed from a 31-page PDF via AI vision. Pages containing UI screenshots, architecture diagrams, and formatted backlog/roadmap layouts are flagged with image callouts below. For those pages, AI-transcribed text is provided as a best-effort summary — **refer to the original PDF for authoritative visual content.**

---

## Cover Page

> ⚠️ **Image Callout — Cover Page (PDF p. 1)**
> The cover page contains the Rise8 logo, Space Force emblem, and decorative binary-code visual design. Contact information and administrative details are transcribed below.
> **Reference `Rise8__SPEC_RPP_2607__Technical_Volume.pdf` page 1 for the original layout.**

![Technical Volume Cover](./assets/techvol-page-01.png)

**Notice ID:** SPEC RPP No. 2607
**Program:** SEWOL Framework & Mission Applications
**Customer:** Space Systems Command

**Rise8 Codes:** CAGE-8C8E8 | DUNS-117100499 | UEI-FZG5H96FF1V4
**Business Size:** SDVOSB | NAICS-541511 | FCL: TS (NON-POSSESSING)
**Ownership:** U.S. Owned and Controlled
**Eligibility Criteria:** (B) NTDC
**Submission Date:** 1 June 2026

**Technical Contact:** Clayton Spakes, Growth Manager — cspakes@rise8.us | c.937.694.95894
**Contracting Contact:** Jeffrey Muller, Chief Operating Officer — jmuller@rise8.us | c.727.560.2223
**PEO Contacts:**
- Paul Contoveros, Chief, Combat Force Enhancement Division — paul.contoveros.2@spaceforce.mil | c.719.554.2825
- Lt Ian Chun, Deputy Chief Engineer — ian.chun.1@spaceforce.mil | c.571.423.9456

---

## Executive Summary

**Who We Are.** Rise8 is a Service-Disabled Veteran-Owned Small Business and Non-Traditional Defense Contractor that ships production software for hard government missions up to 25x faster than the traditional model, combining lean product management, user-centered design, extreme programming, and continuous authorization. Our delivery track record runs deep across the Space Force (FORGE, EM&C, Kobayashi Maru, Space Operations Command, Space Launch Delta 45, 15th Space Surveillance Squadron), the Air Force (Kessel Run, ABMS, Unified Platform, AFWERX), and the Department of Veterans Affairs. Rise8 is the prime and sole performer on this effort.

**Compliance Statements.** No Organizational Conflict of Interest is present; Rise8 will notify the Agreements Officer and NSTXL immediately if one is identified. Rise8 will not provide covered telecommunications equipment or services in performance of any resulting agreement (Section 889(a)(1)(B), FY19 NDAA) and is CMMC-aligned and compliant with NIST SP 800-171, ITAR (22 C.F.R. §§ 120-130), NISPOM (DoD 5220.22-M), and EAR (15 C.F.R. §§ 730-774).

**What We Will Deliver in Phase I.** A working SEWOL Minimum Viable Product (MVP) on Mission O/S Core, Rise8's new productized path-to-production that codifies the platform engineering, security, and Continuous Authority to operate (cATO) practices based on Rise8's prior experience with USSF programs (Kobayashi Maru at IL4/IL5/IL6, EM&C in IL6). Phase I MVP establishes cATO posture from sprint one and delivers STO ingest, GEO target management, automated weapon-target pairing across the MD3 fleet, a COA development panel for SIFE engagement, a deconflicted enterprise schedule export, and a versioned SDK ready for downstream EW C2 adapter performers. This is the Crawl phase of the OVD's Crawl-Walk-Run vision, scoped to the MVP defined in OVD §5.1.

**What Sets Us Apart:**
- A working prototype that already implements the Plan-Pair-Schedule workflow with score-weighted COA generation against a representative GEO target set (Figures 1-4)
- Deep Space Force domain credibility from prior delivery inside Kobayashi Maru (USSF, May 2020 to present), EM&C (USSF, April 2025 to present, three balanced product teams), FORGE, and Space Operations Command
- A continuous Authority to Operate path Rise8 has executed across IL4, IL5, and IL6 boundaries on Kobayashi Maru, with the same RMF, SecRel, and controls inheritance practices codified into Mission O/S Core and extended to TS/SCI in Phase II
- An AI-accelerated engineering practice that speeds requirements refinement, code authoring, test generation, and compliance artifact production under the same review, scanning, and human-accountability gates that govern all Rise8 software, with no AI-generated code reaching production without engineer review and CI/CD validation

> **Solution.** Rise8 will deliver the SEWOL Framework and Mission Applications as a Phase I MVP on Mission O/S Core, Rise8's productized path-to-production, built from the platform engineering patterns we have already delivered and operated for Space Force customers at IL4/IL5/IL6, staffed by a Task 4 Large balanced product team (1 PM, 1 UX Designer, 6 Software Engineers) running on a single-week PI Planning plus four 3-week sprints. The architecture maps directly to SOO §2.1–§2.8 and is engineered for the Walk and Run phases without rework. See accompanying Product Roadmap for full PI-by-PI schedule.

---

## Section I — Team Overview

**Team Overview and Composition.** Rise8 is the prime and sole performer. No subcontractors are proposed for Phase I; if specialized expertise is needed in later phases, Rise8 will propose subcontractor additions through the agreement modification process with AOR approval.

Phase I is staffed by a single balanced product team modeled on our AFWERX SDO IDIQ Task 4 Large pattern: one Product Manager, one UX Designer, six Software Engineers, all dedicated full-time. The team will also include a quarter time Customer Success Manager to facilitate alignment across teams and the government. As scope expands through Phase II and Phase III, MVCR with live RMT integration, broader external interfaces, AI/ML enhancements, additional weapon systems, Rise8 scales by adding additional balanced product teams against the same Mission O/S Core platform, not by reshuffling Phase I roles.

| Key Role | Primary Responsibility | Relevant Prior Delivery |
|---|---|---|
| Program Manager / Product Lead | RWG engagement, backlog, value reporting, sprint cadence, AOR interface | Prior Space Force product delivery (FORGE, EM&C, Kobayashi Maru); SAFe-aligned cadence proven across multi-year programs |
| Chief Engineer / Architect | Mission O/S Core platform, MOSA enforcement, cATO posture, technical authority across all topics | Designed and operated the IL4/IL5/IL6 path-to-production on Kobayashi Maru; led architecture on EM&C AI/ML production system |
| Security Lead | RMF execution, SSP/POAM lifecycle, Zero Trust controls, DD-254 administration | Continuous ATO operations on Kobayashi Maru tenants; CMMC 2.0 Level 2 program management |
| Scheduling Engine Lead | Planning and pairing algorithms, constraint-satisfaction performance, score-rationale design | Built the prototype pairing engine demonstrated in Figures 2–5; constraint-optimization delivery across prior Space Force programs |

**2.3 Clearance Posture.** Rise8 commits that 100% of staff assigned will hold an active Secret clearance at a minimum, with TS/SCI clearance counts defined with the Government in coordination with Phase II demonstration and operations requirements. Rise8 holds an active Top Secret Facility Clearance through existing DoD work.

---

## Section II — Solution Narrative

Rise8's Phase I solution is organized into three integrated topics mapped to the SEWOL Statement of Objectives and the Capability Needs Statement: **(1) Integrated Application and Microservices Platform** (SOO §2.2, §2.4, §2.6); **(2) End-to-End Mission Capability** (SOO §2.3, §2.1); and **(3) System Integration, Interfaces, and User Support** (SOO §2.5, §2.7, §2.8). Subsections cite the specific SOO and CNS sections they address so the evaluator has direct line-of-sight from objective to approach. PI-level schedule detail lives in the accompanying Product Roadmap.

---

### Topic 1 — Integrated Application and Microservices Platform *(SOO §2.2, §2.4, §2.6 · CNS §4, §6, §7)*

**Cloud-Native Microservices and MOSA.** SEWOL is built as containerized microservices on Kubernetes. Each capability (Target Discovery, Mission Planning, Scheduling, COP, Remote EW C2) is an independent service owning a well-scoped functional domain and exposing functionality only through versioned, government-owned APIs. Module boundaries are defined by function, dependencies are explicitly mapped, and inter-module coupling is enforced through automated dependency analysis in the CI/CD pipeline. This is the direct implementation of MOSA required by SOO §2.2: independent deployment of new capabilities, a unified operator experience, and the technical foundation that lets third-party performers extend SEWOL through the SDK. The platform deploys without modification across unclassified, classified, and air-gapped environments through one consistent architecture, with domain-specific configuration managed as versioned infrastructure-as-code.

**Mission O/S Core — Pre-Built Path to Production.** Most government programs spend 12 to 18 months building environments, pipelines, security controls, and compliance artifacts before delivering any operational value. Mission O/S Core eliminates that delay. It is Rise8's productized path-to-production, assembled from the platform engineering patterns we have already built and operated for Space Force customers: Kobayashi Maru at IL4/IL5/IL6 (USSF, May 2020 to present, $19.8M FFP) and EM&C in IL6 (USSF, April 2025 to present, $25.4M FFP, three balanced product teams on continuous sprint cadence). The platform is packaged so a new program inherits a working delivery, compliance, and operations stack on Day 1 instead of standing one up from scratch. SEWOL is the first SEW C2 application Rise8 will deploy on Mission O/S Core. The underlying delivery pipelines, security controls, and cATO patterns are not new; they are the same ones Rise8 has operated in classified Space Force environments for the past several years.

---

#### Mission O/S Core Architecture Diagram

> ⚠️ **Image Callout — Mission O/S Core Architecture (PDF p. 3, Figure 1)**
> The diagram below shows Rise8's production-ready control plane integrating delivery, compliance, and operations as one system. It is a visual layout with layered boxes showing Applications, Developer Experience (Backstage Portal, AI-Native Engineering), Build & Release Pipeline (GitLab → Shipwright/Buildpacks → SecRel Pipeline → ArgoCD GitOps), Platform Services (Tracer, Grafana Stack, Keycloak/IAM, Istio Service Mesh, AWS Secrets Manager, ECR/Artifactory), and Infrastructure (Red Hat OpenShift/Kubernetes, AWS GovCloud/Terraform/Crossplane).
> **Reference `Rise8__SPEC_RPP_2607__Technical_Volume.pdf` page 3 (Figure 1) for the original diagram.**

![Mission O/S Core Architecture — Figure 1](./assets/techvol-page-04.png)

*Figure 1. Mission O/S Core architecture, a production-ready control plane integrating delivery, compliance, and operations as one system. Productized from the IL4/IL5/IL6 delivery patterns Rise8 has built and operated on Kobayashi Maru and EM&C; available Day 1 of Phase I.*

**How Mission O/S Core Meets SOO §2.2/§2.4/§2.6 Requirements:**

- **Cloud-Native Microservices and MOSA.** The prototype provides independent services for Target Discovery, Mission Planning, Scheduling, COP, and Remote EW C2, with functionality exposed through versioned, government-owned APIs. Automated dependency analysis enforces module boundaries in CI/CD, enabling third-party performers to extend SEWOL through the SDK without coupling to Rise8 release cycles.
- **Deploy-on-Demand Pipeline (SOO §2.6).** Code merges to main → SecRel pipeline runs validation and scans → ArgoCD promotes the signed artifact. Compliance artifacts (SSP, SCA, ConMon) are generated directly from pipeline data by Tracer, removing the manual documentation work that traditionally blocks RMF authorization.
- **Zero Trust and cATO (SOO §2.4, CNS §7).** Rise8 applies NIST SP 800-207 at the application and data layers. Container security follows NIST SP 800-190: minimal bases, scanned at build, signed via Cosign, rebuilt on cadence. Rise8 has operated this cATO posture on IL4/IL5/IL6 Kobayashi Maru tenants and productized it through Bifrost with SYD85; Mission O/S Core extends the same machinery to TS/SCI in Phase II.
- **Data-Centric Architecture (CNS §6).** We provide a common operational data repository that serves as the single source of truth for VAULTIS and exposes data through government-owned APIs. This same architecture establishes the governed semantic layer required for OVD §4.1 agentic capabilities, building on patterns Rise8 operates today in SYD88 and SYD85 using OPA/Rego, Decision Artifact Manifests, and HOTL validation.
- **Configurable Dashboards and UX Standards (SOO §2.2).** The prototype provides configurable dashboards with multiple visualization types, drag-and-drop composition, role-based customization, documented UX standards, and a reusable component library. Phase I extends, rather than introduces, this framework (Figures 2–4).

---

### Topic 2 — End-to-End Mission Capability *(SOO §2.3, §2.1 · CNS §3, Att. 1, Att. 2 · OVD §3, §5, App. A)*

Rise8 has already built a working SEWOL prototype implementing the core MVP planning workflow against representative GEO target data. The screenshots that follow are from that prototype, running today against simulated MD3 data; Phase I integrates against live data sources as Project 7 and other interface specifications stabilize.

---

#### Figure 2 — Plan-Pair-Schedule Workflow Screenshot

> ⚠️ **Image Callout — Prototype Screenshot (PDF p. 4, Figure 2)**
> This page contains a screenshot of the working SEWOL prototype showing the Plan → Pair → Schedule workflow. The UI shows a mission planning panel on the left (task list with asset/target assignments and scores), a geospatial globe view in the center, and a score breakdown panel on the right. The Sync Matrix timeline is visible at the bottom.
> **Reference `Rise8__SPEC_RPP_2607__Technical_Volume.pdf` page 4 for the original screenshot.**

![Prototype — Plan-Pair-Schedule (Figure 2)](./assets/techvol-page-05.png)

---

#### Figure 3 — COA Development & Figures 4–5 Screenshots

> ⚠️ **Image Callout — Prototype Screenshots (PDF pp. 5–6, Figures 3–5)**
> These pages contain screenshots of the COA Development panel (three weighting presets run in parallel — Maximize Coverage, Balanced, Minimize Asset Risk), the Asset OPSCAP dashboard (Green/Amber/Red fleet health), and the Unassignable STO transparency view. Each figure caption is preserved below.
> **Reference `Rise8__SPEC_RPP_2607__Technical_Volume.pdf` pages 5–6 for the original screenshots.**

![COA Development and OPSCAP Figures 3-5](./assets/techvol-page-06.png)
![COP and Unassignable STO Figures 4-5](./assets/techvol-page-07.png)

*Figure 3. COA Development — three weighting presets run in parallel against the current STO list, each returning a scored, side-by-side schedule preview. Operators choose based on commander's intent, not on solver mechanics.*

*Figure 4. Asset OPSCAP dashboard — real-time fleet health (Green/Amber/Red) drives both situational awareness and pairing eligibility in the scheduling engine.*

*Figure 5. Unassignable STO transparency — when the engine cannot assign an STO, it surfaces the count, the specific STOs affected, and the precise reason. The operator can re-task, request maintenance, or send the COA request back to the SIFE.*

---

**Mission Planning Workflow (CNS Mission Planning Capability).** Rise8 delivers the Plan-Pair-Schedule loop for GEO targets in the MVP per OVD §5.1. The Mission Planning service ingests STOs/MTOs from Project 7 (and accepts manual creation when the P7 link is degraded), accepts SPINS and CDA inputs, and exposes the structured target model required by Combat ID and Find-Fix. Rise8 integrates against the P7 spec as it stabilizes and runs against manual STO/MTO entry in the meantime, eliminating P7 readiness as a Phase I schedule risk. CNS Att. 1 threshold (5 MTOs / 3 users) is met at delivery; Mission O/S Core scales the data tier horizontally toward the 75 MTOs / 20 users objective without service redesign.

**Dynamic Mission Scheduling and the Pairing Engine (CNS Mission Scheduling Capability).** Rise8 demonstrates the workflow and score-rationale architecture at representative GEO scale in Phase I; objective-scale solver work progresses across Phase I (algorithm selection and benchmark), Phase II (validation against full RMT integration load), and Phase III (objective-scale optimization). The solver design combines CP-SAT-class constraint programming for hard constraints with weighted heuristic scoring for soft constraints, surfacing three pre-configured presets (Maximize Coverage, Balanced, Minimize Asset Risk) so the operator sees and can override the tradeoffs.

**Course of Action Development (OVD §3.4).** Rise8 implements the OVD §3.4 COA workflow as a P7-Inbound COA Request panel in the Phase I prototype: receive a Space Support Request from Project 7, generate multiple weighted COAs, push the selected COA back to the SIFE. Each COA carries its weighting preset, scheduled-vs-unassignable count, average pairing score, solve time, and full schedule preview. Satisfies the OVD's "exceeding the baseline" criterion for P7 COA development.

**Target Discovery / OPE Analytics (CNS Target Discovery Capability).** The MVP target service implements the hierarchical UOI/NOI/SOI data model from CNS §3 and OVD §2.3, supports both M2M ingest from Project 7 and manual operator entry, and pulls missing critical parameters (TLEs, transponder beam footprints) from connected sources as those integrations come online. Mission O/S Core provides vertical and horizontal scaling at the relational and vector-search data tier to meet the performance requirements outlined in CNS Attachment 1.

**Dynamic Battlespace Management / COP (CNS COP Capability).** The MVP delivers the geospatial COP, the Sync Matrix timeline visible at the bottom of every prototype view, and the configurable asset and STO detail panels required by OVD §3.2 and §5.1. The COP renders the current EW fleet with OPSCAP status (Green/Amber/Red), the active enterprise schedule, and target visibility ranges. Assets in Red state are automatically excluded from pairing candidates; Amber generates operator-visible warnings. Per CNS Attachment 1, threshold is 50 assets / 100 simultaneous missions with 25 concurrent users; objective is 500 assets / 1,500 missions with 300+ users, addressed through the same horizontal scaling model that backs the planning service.

**Resilient, DDIL-Aware, and Low-Latency Operation.** Per CNS §4 and OVD §5.1, Rise8's MVP planning workflow keeps working when Project 7 connectivity is lost; operators continue creating STOs/MTOs/SPINS locally, with state synchronizing on reconnect. The architecture supports the SEWTOC disaggregation plan by deploying the same containerized services to regional and edge configurations. Rise8 minimizes SEWOL's contribution to end-to-end latency through three design choices: push-based gRPC streaming to EW systems (not polling); regional placement of the orchestration layer; message batching and prioritization at the orchestrator.

**AI/ML Decision Support, Human-on-the-Loop.** Per CNS §8 and OVD §4.1/§4.3, Rise8 builds the system as a collaborative partner with the human on the loop. The Phase I MVP grounds this through transparent, inspectable AI: every recommendation carries a score breakdown, an explicit rationale, and a complete evidence trail. Phase II adds richer AI/ML services (auto-TTP selection, predictive COA analysis, chat-based orchestration for Combat ID with Chatsurfer integration) using the closed-loop pattern Rise8 has validated on EM&C: structured filter pipeline on prompts and tool calls, OPA/Rego policy enforcement at sub-2ms latency, pre-HOTL groundedness validation, Decision Artifact Manifests on every AI-assisted output.

**AI-accelerated engineering.** Rise8 uses AI coding tools across requirements refinement, code authoring, test generation, and compliance artifact production to compress delivery cycle times. No AI-generated code reaches production without engineer review, SAST/DAST scanning, dependency analysis, and the same CI/CD gates applied to all Rise8 code.

---

### Topic 3 — System Integration, Interfaces, and User Support *(SOO §2.5, §2.7, §2.8 · CNS §5, App. 2)*

**Government-Owned API Strategy and Data Models (SOO §2.5).** Rise8 delivers all SEWOL APIs, data models, and schemas government-owned under Data Rights Category C, matching the Government's desired posture. APIs follow REST and gRPC patterns, are documented in OpenAPI, and conform to the DoW API Technical Guidance. Rise8 produces Interface Control Documents before development begins for every external interface and version-controls them aligned to the software baseline. This MOSA discipline is what lets the SDK delivery enable downstream EW C2 adapter performers.

**Lead Systems Integrator Role (SOO §2.7).** Rise8 serves as the Lead Systems Integrator from Day 1: leading planning and prioritization with the government-led RWG, running design reviews and technical exchanges with associate contractors, executing end-to-end integration testing, and coordinating information exchange with external stakeholders. The Phase I SDK delivery (versioned API docs, code samples, testing tools, onboarding guides, Mission Framework access) gives the RMT, Bounty Hunter, and Meadowlands adapter performers a clean entry point in Phase II without coupling them to Rise8 release cycles.

**External Interface Integration (CNS §5).** Phase I builds the live M2M interface to Project 7 (STO/MTO ingest and COA response), paced to P7 spec stability with manual-entry fallback to protect schedule, and validates UDL connectivity for TLE retrieval. Phase II extends to Surefire and Shotfire (via Warpcore) for CDA ingest and deconfliction, Ion Trail / MIDB / MARS for target intelligence, Globalview for transponder beam data, and Chatsurfer for tipping and cueing during Combat ID. Engineers interface with an Interface Adapter pattern that isolates external dependencies from Rise8 business logic, minimizing blast radius as external systems change.

**Cross-Domain Architecture (CNS §4, OVD §2.4).** Per CNS §4 (Multi-Level Security Operations) and the OVD's TS/SCI operational target, the platform supports development primarily in the unclassified environment with promotion to SIPR and TS/SCI via Government-approved cross-domain transfer mechanisms. Each transferred package includes signed binaries, SBOMs, deployment guides, and verification checksums. Rise8 has delivered on TS/SCI accreditations on other Space Force programs and operated IL4/IL5/IL6 boundaries on Kobayashi Maru using this same pattern, including air-gapped delivery to classified environments. Mission O/S Core is new, so Phase II includes the work to validate Mission O/S Core deployment to TS/SCI as part of the move into the operational environment.

**Comprehensive User Support Solution (SOO §2.8).** Phase I delivers a baseline Digital Documentation and Support Center modeled on Shopify's Help Center: web-based, searchable, updated alongside software releases. Training materials and train-the-trainer curriculum live in the same repository, with help desk support during Government test events. At IOC, Rise8 operates 24/7 help desk support with a 2-hour maximum response time per SOO §2.8, staffed through an on-call rotation with SME-bench escalation. Training and exercise environments run as a separate Mission O/S Core tenant, isolated from production, configured identically.

**RWG Partnership and Value Measurement (SOO §2.1, §3).** Rise8 partners with the government-led RWG to refine the CNS into a prioritized product backlog (RWG holds final priority authority). Per SOO §3 and DoDI 5000.87, Rise8 works with the Government at the start of each PI to define KPIs and value metrics (task completion time, System Usability Scale targeting 75+ threshold / 85+ objective, NASA-TLX cognitive load targeting Medium-Low / Low, data accuracy, EW systems supported, Mission Task Effectiveness) and reports progress every sprint. Value, measured in warfighter outcomes, is what Rise8 expects to be measured on.

---

## Section III — Management Approach

Rise8's management approach is sequenced to the OVD's Crawl-Walk-Run vision and traceable to the RPP's three phases.

| Phase | Period (from ATP) | Key Deliverables |
|---|---|---|
| **Phase I (Crawl, ATP+3mo)** | ATP – ATP+3 mo | Delivers the Plan-Pair-Schedule MVP for GEO targets, the P7 ingest path with manual fallback, the COA development workflow, an OPSCAP-aware COP, the versioned SDK v1, and Mission O/S Core stood up with cATO posture established. |
| **Phase II (Walk, ATP+9mo)** | ATP+3 – ATP+12 mo | Adds live M2M to the first weapon system (RMT/NARWOL), the end-to-end mission execution loop, the Combat ID workflow with chat-based tipping, TS/SCI deployment with cATO continuation, MVCR operational acceptance; 24/7 help desk stand-up. |
| **Phase III (Run, ATP+36mo)** | ATP+12 – ATP+48 mo | Delivers live C2 to Bounty Hunter and Meadowlands, MEO/LEO target support, coordinated engagements with split uplink/downlink, AI/ML decision-support enhancements, full agentic workflow orchestration, and JWICS deployment. Full per-PI detail in the Roadmap. |

**Agile Execution Model.** Phase I follows the Government-specified 13-week Program Increment: a 1-week PI Planning event where Phase I scope and the Outcome Oriented Roadmap are baselined with the Government, followed by four 3-week sprints. Each sprint opens with planning, runs mid-sprint synchronization with Government stakeholders, and closes with a Sprint Review (working software demo) and Retrospective. Once per sprint, Rise8 conducts Backlog Refinement with the integrated Government team. Phase II and III sprint cadence may be adjusted per the RPP; Phase I follows the prescribed structure exactly.

**Risk Management.** Rise8 maintains a continuously updated risk register reviewed every sprint, with risks categorized by type, scored on a 5x5 probability/consequence matrix, and assigned a named owner. High-impact risks escalate to the AOR within three business days. Top Phase I risks at proposal time: Project 7 spec stability (mitigated by manual-entry fallback and early integration); CNS performance attribute validation (mitigated by per-sprint benchmarking); RWG availability for sprint demos (mitigated by proactive scheduling).

**Project Deliverables and Schedule Trace.** Rise8 will deliver all 16 RPP project deliverables on the specified cadence; Progress Reports, Increment Planning Summary and Increment Report, Software Demonstrations, Product Roadmap and Backlog, Product Releases, Source Code / IDE / DevSecOps Environment access, Framework Architecture and Operational Artifacts, the versioned SDK, API Specifications and Data Schema, the Digital Documentation Center, the cATO Package, and operational and system data. Per-PI and per-sprint detail lives in the accompanying 2-page Product Roadmap.

**Data Rights Posture.** Rise8 delivers all SEWOL-developed software, APIs, data models, and operational data under Data Rights Category C, consistent with the Government's desired posture. Pre-existing Rise8 IP in Mission O/S Core is delivered under Category A (commercial); the Cat A/Cat C boundary is documented in the accompanying Level of Data Rights submission. MOSA is the primary structural mitigation against vendor lock-in: government-owned APIs and the SDK let third parties extend SEWOL without Rise8 involvement.

**Government Furnished Support.** Phase I depends on three Government-furnished items:
- Project 7 interface specification access and a P7 test endpoint for M2M integration
- CAC issuance for all Rise8 personnel
- Platform One IL5 Confluence licenses. Phase II adds SIPR access, eventual TS/SCI environment access, and Authorizing Official coordination for the SEWOL ATO.

Full details in the accompanying 1-page GFS submission.

---

## Section IV — Demonstrated Experience

Rise8's prior experience traces directly to every SEWOL Statement of Objectives requirement. The table below maps each SOO objective to specific programs Rise8 has delivered, with the capability or outcome that demonstrates pertinence. All examples are within the past five years; USSF customers are used wherever possible. Two items deserve particular attention: (1) Rise8 built **SureFire** on Kobayashi Maru, the exact system SEWOL's Phase II roadmap will integrate with via Warpcore for CDA ingest, giving Rise8 first-hand knowledge of both sides of that interface; and (2) Rise8's **EM&C** delivery is an active, in-flight USSF AI/ML production system using the same closed-loop ML governance pattern (OPA/Rego, Decision Artifact Manifests, override-fed retraining) SEWOL will inherit.

| SOO § | SEWOL Req | Program | Demonstrated Experience |
|---|---|---|---|
| 2.1 | Lead Enterprise Systems Engineering | USSF Kobayashi Maru (SYD85); USSF EM&C (SYD88) | Led discovery, inception, and iterative DevOps for multiple balanced product teams across Section 31 portfolios. SAFe-aligned cadence proven across multi-year delivery; same model running today across three EM&C balanced teams on continuous sprint cadence. |
| 2.2 | Integrated Application and Microservices Platform | USSF Bifrost (SYD85); USSF Kobayashi Maru Platform | Built and operate Bifrost's secure enterprise gateway and Path to Production: automated release-verification pipeline, containerized app support without refactoring, cross-domain deployment. Kobayashi Maru, operated PaaS on Azure Government IL4/IL6 plus on-premise vSphere using Tanzu and AKS, supporting 35+ application teams with operational parity across classification levels. |
| 2.3 | End-to-End Mission Capability | USSF Kobayashi Maru (SYD85); USSF EM&C (SYD88) | Built **SureFire** — the deconfliction tool SEWOL must consume via Warpcore (Palantir Foundry-based) — so Rise8 knows both sides of the interface and the Palantir data ontology it lives in. SEWOL-analogous tasking workflows (Relay Tasks/Plans/Strat; SOD production from 8 hours to under 5; CSTO time halved). EM&C: active USSF AI/ML production delivery using the same closed-loop ML governance Rise8 proposes for SEWOL. |
| 2.4 | Security Accreditation and Continuous Authority to Operate (cATO) across IL4 to IL6 | USSF Bifrost (SYD85); USSF Kobayashi Maru Platform | Bifrost productized the STIG-to-ATO pipeline that took SureFire from months to under two weeks. On Kobayashi Maru, operated cATO across IL4, IL6, and on-premise; 64-day average time-to-initial-capability for greenfield apps; ATO obtained within three weeks using Azure Blueprints and Azure Policy. Tracer (Rise8's compliance automation) provides the same OSCAL-aligned, eMASS-integrated control inheritance proposed for SEWOL. |
| 2.5 | Government-owned APIs, data models, vendor-agnostic interoperability, cross-classification on interface delivery | USSF Bifrost (SYD85); USSF Kobayashi Maru Platform (SYD85) | Bifrost's Secure Enterprise Data Gateway provides standardized access to the Apollo platform (Palantir ecosystem) for consistent data ontology and interoperability. Kobayashi Maru, delivered a portfolio-wide NATS messaging service letting any Section 31 application publish key data and integrate without point-to-point builds. First KM portfolio to operate at JWICS; SpaceBoard supports 1,600+ coalition users (US, UK, CA, AU). |
| 2.6 | DevSecOps platform | USSF Bifrost (SYD85); USSF Kobayashi Maru Platform | Bifrost's automated release-verification pipeline blocks releases with critical vulnerabilities and generates security documentation for rapid authorization. On Kobayashi Maru: SecRel pipeline meeting cATO requirements with IaC (Terraform) and GitOps (ArgoCD); standardized GitLab CI across IL4/IL6/on-premise; SAST, SCA, container scanning; Sigstore image signing; Istio/Calico micro-segmentation. DORA Elite: 5.8% change failure rate, 2-hour MTTR, 88.4% automated test coverage. |
| 2.7 | Lead System Integrator | USAF ABMS; USSF Bifrost (SYD85) | ABMS, led the Application Portfolio Team integrating software from government factories, labs, academia, and industry into a unified "Team of Teams" model: portfolio-level intake, onboarding, mission-thread mapping, integration governance for JADC2. Bifrost extends this integrator role to third-party containerized apps across the System Delta 85 enterprise. |
| 2.8 | Digital Documentation Center, train-the-trainer curriculum, help desk support | USSF 15 SPSS (MOSS) | Delivered Mount Official Scheduling System with full operator training and documentation lifecycle. Operator workflows mirrored familiar tools (Outlook, Google Calendar) for zero-onboarding adoption; embedded Supra Coder pairing enabled Guardian-led communication channel; centralized communication channel reduced six disconnected tools to one. Scheduling errors fell from 5–10 per month to zero. |

**Why Rise8 for Down-Select.** Phase I awards up to three performers; Phase II goes to one. Five things distinguish Rise8:

- **Lowest standup risk:** IL4/IL5/IL6 platform engineering, security, and cATO practices Mission O/S Core codifies are executed today by Rise8 at SYD84 (FORGE), SYD85 (Space C2/Kobayashi Maru) and SYD88 (EM&C). We don't spend 12 to 18 months on standing up infrastructure; we start delivering Sprint 1.
- **Demonstrated capability:** The working prototype in Figures 2–5 is real software that we have built with our knowledge of space operations across multiple Systems Deltas. Developed using AI-native engineering practices, automated testing, and continuous delivery, it demonstrates how small teams can deliver mission software faster without sacrificing quality, security, or maintainability.
- **Space Force domain credibility:** Rise8 has shipped software to production, continuously across Space Systems Command and Combined Forces Command. We support SYD84, SYD85, SYD88, SYD89 (Space Based-Interceptors), MD2, SLD45, and CFC's Combined Force Enhancement Division. We understand both acquisitions and operations and can be the partner for MD3 that bridges the gap between the two.
- **Software Factory Expertise & cATO from Day 1:** No other performer combines Rise8's experience building and operating software factories both inside and outside the government. Mission O/S Core enables cATO and unlocks continuous delivery.
- **Scalable delivery model:** Phase II growth is one more Task-4-Large team plus targeted additions, not a re-staffing exercise. The path from MVP through MVCR to the Objective State is engineered in from the first commit.

> Rise8 offers MD3 the shortest path from prototype to operational capability, delivering an integrated SEW C2 system that can adapt as missions, threats, and operators evolve.

---

## Product Roadmap

> ⚠️ **Image Callout — Product Roadmap Pages (PDF pp. 17–18, Product Roadmap pp. 1–2 of 2)**
> These two pages are formatted Rise8 brand documents showing the SEWOL Product Roadmap in swimlane table format (p.1) and a narrative phase summary (p.2). They are high-information visual layouts.
> **Reference `Rise8__SPEC_RPP_2607__Technical_Volume.pdf` pages 17–18 for the authoritative roadmap layout.**

![Product Roadmap — Page 1 of 2](./assets/techvol-page-18.png)
![Product Roadmap — Page 2 of 2 (Phase Narrative)](./assets/techvol-page-19.png)

### Roadmap Summary — "Crawl, Walk, Run"

A single, cloud-native C2 application delivered in incremental, operator-validated releases on a 13-week Program Increment cadence. **MVP at ATP+3 months;** MVCR with end-to-end RMT mission execution by ATP+9 months; full BH and MDLS integration by Year 3. Every PI ships working software to operators — no big-bang delivery.

| | PI-01 (MO 0–3) | PI-02 (MO 3–6) | PI-03 (MO 6–9) | PI-04 (MO 9–12) | Year 2 (PI 05–08) | Year 3 (PI 09–12) |
|---|---|---|---|---|---|---|
| **Phase** | I — Competitive MVP | II — Down-Select & Operational MVCR | ← | ← | III — Full SEWOL BH & MDLS End-to-End | ← |
| **Milestones** | Mission App MVP & Down Select | | MVCR / RMT Remote C2 | | BH Remote C2 | MDLS Remote C2 |
| **Infra/Platform** | Framework, Infra/Platform; Developer SDK; App & Data APIs; Mission Framework; UI/UX Standards | JWICS Deployment; CDS Data Transfer | BH Mission Framework Support | | | MDLS Mission Framework Support |
| **Mission Apps** | Target Data Mgmt; Mission Planning; Mission Scheduling; Basic COP/MAP; SEW Control Panel; UDL | P7 Integration Enhancements; CID Support; Scheduling Enhancements; P7 Planning Integration; Ion Trail/Surefire/Globalview | COA Development; Chat-Based Orchestration; Auto TTP Selection | M2M Orchestration; Chat Reports | M2M Reporting; Automation/AI/ML | AI/ML Continuous Improvement |
| **Remote EW C2** | | RMT Connect; RMT C2 | | BH Connect | BH C2 | MDLS Connect; MDLS C2 |

### Phase Narratives

**01 / Crawl — Stand up the platform. Ship the MVP. Win the down-select.**
Phase I is competitive. The MVP delivers the full Plan → Pair → Schedule workflow for GEO-only targets, a resilient live M2M interface with Project 7, a geospatial COP and Sync Matrix timeline, the Asset Status Dashboard, and the Developer SDK that downstream performers will use for remote C2 adapter development. The platform stands up on Mission O/S Core at IL4 from Sprint 1, with a SecRel pipeline, signed artifacts, and structured cATO evidence generation from day one. We exceed the OVD's MVP baseline with P7 COA development, an initial Digital Support Center, and a documented path to cATO by Day 180.

**02 / Walk — Close the loop. Connect the brain to the arms.**
Phase II closes the end-to-end mission cycle for the first weapon system. The MVCR delivers M2M command and control of RMT Block 0 and Block 1, JWICS deployment, CDS data transfer, tactical battle management improvements, P7 integration enhancements, CID support, and the start of M2M reporting back from tipped assets. Operators take a generated plan and, with a single click, send tasks to RMT for automated execution. The MVP is deployed to the classified operational environment; remote EW C2 adapters built against the SDK by third-party performers begin integration through the Rise8-led System Integrator role.

**03 / Run — Scale to the full enterprise. Agentic operations.**
Phase III extends end-to-end mission execution to Bounty Hunter (Year 2) and MDLS (Year 3), with mission framework support, ECPs, and Connect/C2 capabilities delivered for each. AI/ML capabilities mature against the data-centric foundation laid in Phase I: chat-based orchestration, Auto TTP selection, automated COA development, and chat-report generation operate against a governed semantic layer with structured human-on-the-loop validation. Integration with Ion Trail, Surefire, Globalview, UDL, and Warpcore reaches operational steady state. The cATO posture is sustained continuously — no full reauthorization cycles, no point-in-time compliance theater.

---

## PI-01 Product Backlog

> ⚠️ **Image Callout — PI-01 Backlog Pages (PDF pp. 19–23, Backlog pp. 1–5 of 5)**
> These five pages are formatted Rise8 brand documents containing the full PI-01 product backlog with epics, user stories, and acceptance criteria. The layout uses branded typography, color coding (red for DONE WHEN criteria, epic category headers), and structured tables. The text content is fully transcribed below, but **reference `Rise8__SPEC_RPP_2607__Technical_Volume.pdf` pages 19–23 for the original formatted backlog.**

![PI-01 Backlog — Overview Page (p. 1/5)](./assets/techvol-page-20.png)
![PI-01 Backlog — E1 & E2 (p. 2/5)](./assets/techvol-page-21.png)
![PI-01 Backlog — E3 (p. 3/5)](./assets/techvol-page-22.png)
![PI-01 Backlog — E4 & E5 (p. 4/5)](./assets/techvol-page-23.png)
![PI-01 Backlog — E6, E7 & Risks (p. 5/5)](./assets/techvol-page-24.png)

### PI-01 Overview

**PI-01 delivers the Phase I MVP:** a working Plan → Pair → Schedule workflow for GEO targets, the P7 M2M interface with DDIL-resilient manual fallback, OPSCAP-aware COP, the COA development workflow (exceeding the OVD baseline), versioned SDK v1, and Mission O/S Core stood up with cATO posture established. Backlog reflects the Government-led Requirements Working Group's co-prioritization authority — every item is a candidate for RWG re-prioritization at PI Planning and at each Backlog Refinement session.

**Cadence:** 1 week PI Planning + four 3-week sprints (WK 1 Plan, WK 2–4 Sprint 1, WK 5–7 Sprint 2, WK 8–10 Sprint 3, WK 11–13 Sprint 4)

**Team:** 1 Product Manager | 1 UX Designer | 6 Software Engineers | 8 FTE Sprint 1

**Capacity Math:**
- Engineering FTE × Sprints: 6 × 4 = 24 sprint-units
- Velocity target per sprint-unit (after ramp): ~7 pts
- Capacity reserved for spikes, defects, refinement: -25%
- **Targeted PI-01 throughput: ~130 pts**

**Story-Point Scale (Fibonacci):** 1 = Trivial (<½ day) | 2 = Small (~1 day) | 3 = Standard (2–3 days) | 5 = Complex (~1 sprint) | 8 = Large (multi-slice)

**PI-01 Epics Summary:**

| ID | Epic | Stories | Points |
|---|---|---|---|
| E1 | Platform Foundation & cATO Path | 4 | 21 |
| E2 | Target Discovery & OPE Analytics | 3 | 15 |
| E3 | Mission Planning & P7 Integration | 4 | 23 |
| E4 | Mission Scheduling & Pairing Engine | 4 | 26 |
| E5 | Battlespace Mgmt & COP | 3 | 16 |
| E6 | COA Development — *exceeds OVD baseline* | 2 | 13 |
| E7 | SDK v1 & Digital Support Center | 3 | 18 |
| **TOTAL PI-01** | | **23** | **132** |

---

### E1 — Platform Foundation & cATO Path
**21 pts | 4 stories**
*SOO 2.2, 2.6 · CNS 4, 7 · OVD 4.5, 4.6 · Mission O/S Core Operational Day 1*

| ID | User Story | Points | Sprint |
|---|---|---|---|
| S1.1 | As a Rise8 platform engineer, I provision SEWOL's IL4 namespace on Mission O/S Core so that engineers can deploy on Day 1 of Sprint 1. **DONE WHEN:** SEWOL namespace exists in the Mission O/S Core IL4 tenant · SecRel pipeline executes end-to-end on a "hello world" service · Cosign image signing and OPA admission policies enforced · ArgoCD promotion gates configured for staging → prod · Govt has read access to the pipeline dashboard | 3 | S1 |
| S1.2 | As the SEWOL AO, I receive a continuously-generated cATO evidence package so that authorization is built throughout Phase I, not deferred to the end. **DONE WHEN:** SSP draft generated from pipeline data via Tracer · SCA control mapping covers NIST 800-53 Moderate baseline · ConMon evidence (vuln scans, SBOM, image signing logs) auto-attached to every release · Govt-accessible evidence repo updated on every merge | 5 | S1–S2 |
| S1.3 | As any SEWOL user, I authenticate via Government IdP with Zero Trust controls so that least-privilege access is enforced at the application and data layer (NIST SP 800-207). **DONE WHEN:** SAML/OIDC integration with Govt-provided IdP · RBAC enforced at API gateway with role-aware claims · Service-to-service mTLS via Istio service mesh · Audit log for every auth + authz decision retained per ConMon policy | 5 | S1–S2 |
| S1.4 | As a SEWOL data steward, I store every operational data element in a common VAULTIS-aligned repository so that AI/ML, agentic, and reporting capabilities can build on a single governed source. **DONE WHEN:** Postgres + vector-search tier provisioned with classification + provenance metadata · Govt-owned schema published and version-controlled · Every read/write goes through the Govt-owned API surface · VAULTIS-readiness checklist signed off by the AOR | 8 | S2–S3 |

---

### E2 — Target Discovery & OPE Analytics
**15 pts | 3 stories**
*CNS 3 (Target Discovery) · CNS ATT 1 (1,000 targets threshold → 20,000 objective) · OVD 2.3, 5.1*

| ID | User Story | Points | Sprint |
|---|---|---|---|
| S2.1 | As an EWO, I manage GEO targets in the hierarchical UOI / NOI / SOI data model so that downstream pairing, scheduling, and CID workflows operate against the structured model defined in CNS §3. **DONE WHEN:** UOI / NOI / SOI relationships created, edited, and visualized · Schema enforces required TLE and beam-footprint fields for GEO · 1,000 targets actively managed at threshold performance (3 concurrent users) demonstrated · Data tier scales horizontally toward 20,000-target objective without service redesign | 5 | S2 |
| S2.2 | As an EWO, I ingest targets via M2M from Project 7 when the link is up, or create them manually when degraded, so that planning continues in DDIL conditions per CNS §4. **DONE WHEN:** Ingest service consumes P7 target feed against the published spec (or manual entry when P7 spec is unstable) · Manual entry produces a target record identical in structure to M2M-ingested records · Local state synchronizes when P7 connectivity returns · Operator sees a clear connectivity-status indicator at all times | 5 | S2–S3 |
| S2.3 | As an EWO, I see critical missing target parameters (TLE, transponder footprint) flagged before they break a pairing decision so that I can resolve gaps proactively. **DONE WHEN:** Target-completeness validator runs on save and on bulk import · Missing-parameter warnings surface in the target detail panel and the COP · Targets with critical gaps are excluded from pairing-engine input with operator-visible reason | 5 | S3 |

---

### E3 — Mission Planning & P7 Integration
**23 pts | 4 stories**
*CNS 3 (Mission Planning) · CNS ATT 1 (5 MTOs / 3 users threshold) · OVD 3, 5.1 · P7 Spec Risk*

| ID | User Story | Points | Sprint |
|---|---|---|---|
| S3.1 | As an EWO, I ingest a Space Tasking Order from Project 7 (or create one manually) so that I can begin planning a mission against approved tasking. **DONE WHEN:** P7 M2M ingest handler implemented against current spec version · Manual STO creation form covers all required fields per the OVD planning workflow · STOs persist to the structured data model and appear in the planning queue · 5 concurrent MTOs supported at threshold (CNS Att 1) | 5 | S2 |
| S3.2 | As an EWO, I add SPINS and CDA inputs to a mission plan so that the scheduler honors deconfliction windows and Special Instructions. **DONE WHEN:** SPINS attached to mission with operator notes captured · CDA-driven deconfliction windows visible in the Sync Matrix · Scheduler receives SPINS + CDA as inputs to the constraint set | 5 | S3 |
| S3.3 | As an EWO, I run the Plan → Pair → Schedule workflow end-to-end against a representative GEO target set so that I can produce an exportable, deconflicted enterprise schedule. **DONE WHEN:** "Generate Schedule" action chains target selection → engine invocation → Sync Matrix render · Schedule export produces a human-readable artifact (CSV + PDF) acceptable to EW crews · End-to-end demo runs against ≥100 targets / ≥50 assets within the threshold latency bound · Workflow continues to operate with P7 connectivity simulated as down | 8 | S3–S4 |
| S3.4 | As an EWO, I see clear, actionable feedback when a planning input is invalid or incomplete so that I can fix problems before scheduling fails. **DONE WHEN:** Plan-validity check runs on every input change · Validation errors point to the specific field and the corrective action · NASA-TLX measured for the planning workflow ≤ Medium-Low at threshold | 5 | S3 |

---

### E4 — Mission Scheduling & Pairing Engine
**26 pts | 4 stories**
*CNS 3 (Mission Scheduling) · CNS ATT 1 (<2 min threshold, <15 sec objective on 1,000 targets) · OVD App A*

| ID | User Story | Points | Sprint |
|---|---|---|---|
| S4.1 | As a SEWOL engineer, I stand up the OR-Tools CP-SAT solver with the EW domain modeling layer so that the pairing engine has a working foundation by end of Sprint 2. **DONE WHEN:** CP-SAT solver integrated as a microservice behind the Govt-owned API · Domain layer encodes the OVD App A factors: capability match, beam-footprint centrality, OPSCAP, slot earliness, load balance, SDR count, signal bundling, available power, prep/tear-down, SNR/EIRP, CDA windows · Benchmark suite runs in CI on every commit with results published to the Govt dashboard | 8 | S1–S2 |
| S4.2 | As an EWO, I run the pairing engine against a 100-target / 50-asset GEO set so that I have a deconflicted schedule produced in under 2 minutes (CNS threshold). **DONE WHEN:** 100×50 benchmark completes in <2 min on the Phase I dev environment · Generated schedule passes the deconfliction validator (no overlapping assignments, all CDA windows respected) · Performance ramp toward the objective (<15 sec on 1,000 targets) published with the Phase I report · Solver warm-starts from the previous schedule on re-runs | 8 | S3 |
| S4.3 | As an EWO, I see the score breakdown and human-readable rationale for every pairing so that I can trust, audit, and override engine output. **DONE WHEN:** Each pairing exposes per-factor scores (capability, footprint, OPSCAP, earliness, load balance) · "Jump To Alternate" navigation between candidate pairings implemented · Operator can override a pairing with a captured rationale string (audit trail preserved) · Score-rationale UI validated with at least 2 EWO operators in a hands-on session | 5 | S3 |
| S4.4 | As an EWO, I see exactly which STOs were unassignable, and why, so that I can re-task, request maintenance, or escalate to the SIFE. **DONE WHEN:** Unassignable panel lists count, STO IDs, and per-STO reason codes · Reason codes map to actionable next steps in the UI · Operator can re-run the engine after corrections without losing prior context | 5 | S4 |

---

### E5 — Battlespace Mgmt & COP
**16 pts | 3 stories**
*CNS 3 (Battlespace Mgmt / COP) · CNS ATT 1 (50 assets / 100 missions / 25 users threshold) · OVD 3.2, 5.1*

| ID | User Story | Points | Sprint |
|---|---|---|---|
| S5.1 | As an EWO, I view planned tasks, target visibility, and EW fleet position on a geospatial COP so that I have a single-pane-of-glass situational picture. **DONE WHEN:** Map view renders assets, planned STOs, and target visibility ranges · Layer toggles let operators filter the picture to their role · Threshold: 50 assets + 100 simultaneous missions with 25 concurrent users (CNS Att 1) · SUS measured on the COP ≥ 75 with at least 5 EWO test users | 5 | S2–S3 |
| S5.2 | As an EWO, I view a Sync Matrix timeline at the bottom of every prototype view so that I can deconflict and synchronize the schedule against the JADO context. **DONE WHEN:** Sync Matrix renders by asset and by mission window · Drag-to-zoom and click-to-detail interactions implemented · Sync Matrix updates in <1 sec when the schedule changes · Configurable dashboard framework supports the matrix as a reusable component (SOO §2.2) | 5 | S3 |
| S5.3 | As an EWO, I see OPSCAP fleet health (Green / Amber / Red) so that scheduling honors asset readiness and Red assets are automatically excluded from pairing. **DONE WHEN:** Asset Status Dashboard shows Green / Amber / Red with manual override · Red assets are excluded from pairing-engine input automatically · Amber generates operator-visible warnings on affected pairings · OPSCAP changes are auditable with timestamps and originator | 6 | S2–S3 |

---

### E6 — COA Development *(exceeds OVD MVP baseline)*
**13 pts | 2 stories**
*OVD 3.4, 5.1 "Exceeding the Baseline" · SIFE Engagement · Phase I Differentiator*

| ID | User Story | Points | Sprint |
|---|---|---|---|
| S6.1 | As a SIFE user, I send a COA Request (Space Support Request) from Project 7 and receive multiple weighted COA options back from SEWOL so that I can choose based on commander's intent rather than solver mechanics. **DONE WHEN:** P7-Inbound COA Request panel implemented · Three pre-configured weighting presets run in parallel: Maximize Coverage, Balanced, Minimize Asset Risk · Each COA shows weighting preset, scheduled-vs-unassignable count, average pairing score, solve time, full schedule preview · SIFE can promote a COA, send back for re-eval, or close the request | 8 | S3–S4 |
| S6.2 | As an EWO, I tune COA weighting presets within mission-defined bounds so that the engine reflects current commander's intent without requiring an engineer. **DONE WHEN:** Preset editor with bounded sliders (no out-of-range values that destabilize the solver) · Custom weighting saved per-mission, auditable · Operator can revert to default presets at any time | 5 | S4 |

---

### E7 — SDK v1 & Digital Support Center
**18 pts | 3 stories**
*SOO 2.5, 2.7, 2.8 · Deliverable 12 (SDK), 13 (API Specs), 14 (Doc & Support Center) · Shopify-style Help Center*

| ID | User Story | Points | Sprint |
|---|---|---|---|
| S7.1 | As a third-party adapter developer, I receive SDK v1 with versioned API documentation, code samples, and on-boarding guidance so that I can build a compliant C2 adapter without Rise8 hand-holding. **DONE WHEN:** OpenAPI specs published for every Govt-owned API · SDK includes Python + TypeScript client libraries with samples · On-boarding guide walks a notional adapter from clone to first integration test · SDK validated by a Rise8 "outside" developer pair (TS/SCI-cleared but not on the core team) building a stub adapter | 8 | S2–S4 |
| S7.2 | As an EWO, I find searchable, role-relevant documentation in a Digital Support Center modeled on Shopify Help Center so that I can self-serve without filing tickets. **DONE WHEN:** Help Center indexes all MVP capability docs, keyword-searchable · Role-aware landing pages (EWO, SIFE, admin, developer) · Docs are versioned and published alongside every release · Govt has commenting access for continuous feedback | 5 | S3–S4 |
| S7.3 | As a Government Authorizing Official, I access a continuously up-to-date API Specifications & Data Schema package (Deliverable 13) so that I can review the system without ad-hoc requests to Rise8. **DONE WHEN:** API specs auto-published from CI on every merge · Schema diffs visible between releases · Govt-owned API catalog accessible without Rise8 intermediation | 5 | S2–S3 |

---

### PI-01 Top Risks & RWG Co-Prioritization

*Backlog is a starting point, not a contract. RWG holds final priority authority (SOO 2.1). Rise8's PM translates RWG direction into actionable backlog between sessions.*

| ID | Risk | Label | Mitigation |
|---|---|---|---|
| R1 | P7 interface specification stability. | P7 SPEC | Manual STO/MTO creation built in from Sprint 1 (S2.2, S3.1) — workflow is DDIL-resilient and operates without P7 · Early integration against current spec; re-integration is a one-sprint operation if the spec changes |
| R2 | Scheduling engine performance at CNS-threshold scale. | SOLVER PERF | CP-SAT benchmark suite in CI from Sprint 1 (S4.1) — perf curve published every sprint · 100×50 demo at threshold latency, with a published ramp toward the 1,000-target / <15-sec objective across Phases II–III |
| R3 | RWG availability and decision cadence. | RWG CADENCE | PI Planning week sets RWG ceremony cadence with sprint-level Backlog Refinement and Sprint Reviews · PM owns translation of RWG direction into actionable backlog between sessions; no item enters a sprint without RWG alignment |

---

## Contractor-Generated Statement of Work (CSOW)

**SEWOL Framework & Mission Applications | NSTXL RPP 2607 | Rise8, Inc. (SDVOSB / NTDC)**

### 1. Scope

Rise8 will serve as the prime Lead Systems Integrator (LSI) for the Space Electromagnetic Warfare Operating Location (SEWOL) Framework and Mission Applications, executing all eight Statement of Objectives outcomes (SOO §2.1 through §2.8) across the three-phase Crawl-Walk-Run program defined in the SEWOL OVD. Rise8 is the prime and sole performer; no subcontractors are proposed. The period of performance is 48 months from a 1 July 2026 anticipated ATP, organized as Phase I (months 1–3, MVP and down-select), Phase II (months 4–12, MVCR with live RMT integration and TS/SCI deployment), and Phase III (months 13–48, Run-state operations with full EW fleet integration, advanced AI/ML, and 24/7 sustainment). This CSOW is structured to be incorporated into the resulting Project Order and traces every task to a SOO objective, a CNS requirement, an RPP-defined deliverable, and a payable monthly milestone in Attachment 10.

### 2. Tasks

**2.1 Lead Enterprise Systems Engineering (SOO §2.1)**
Rise8 will lead the SEWOL enterprise systems engineering effort across all 48 months. Tasks include: (a) participating in the government-led Requirements Working Group (RWG) every Program Increment (PI) to translate the CNS into a prioritized product backlog, with the RWG retaining final priority authority; (b) facilitating PI Planning at the start of each 13-week PI to baseline scope, dependencies, and the Outcome-Oriented Roadmap; (c) running Sprint Reviews each sprint with working software demonstrated to Government stakeholders; (d) running Backlog Refinement once per sprint with the integrated Government team; (e) defining and reporting Value Measurement KPIs per SOO §3 and DoDI 5000.87, including task completion time, System Usability Scale (75+ threshold / 85+ objective), NASA-TLX cognitive load (Medium-Low / Low), data accuracy, EW systems supported, and Mission Task Effectiveness; and (f) maintaining a continuously updated risk register reviewed each sprint with a 5x5 probability/consequence matrix and named owners, escalating high-impact risks to the AOR within three business days.

**2.2 Deliver and Maintain the Integrated Application & Microservices Platform (SOO §2.2)**
Rise8 will design, develop, and maintain the SEWOL platform as cloud-native containerized microservices on Kubernetes, deployed on Mission O/S Core (Rise8's productized path-to-production codified from IL4/IL5/IL6 delivery patterns on Kobayashi Maru and EM&C). Each capability domain (Target Discovery, Mission Planning, Scheduling, COP, Remote EW C2) is an independent service exposing functionality only through versioned, government-owned APIs, with module boundaries enforced through automated dependency analysis in the CI/CD pipeline (MOSA per SOO §2.2). The platform deploys without modification across unclassified, classified, and air-gapped environments through one consistent architecture. Phase I stands up Mission O/S Core in the unclassified environment and delivers configurable dashboards with multiple visualization types, drag-and-drop composition, role-based customization, documented UX standards, and a reusable component library. Phase II promotes the platform to SIPR and TS/SCI via Government-approved cross-domain transfer mechanisms (signed binaries, SBOMs, deployment guides, verification checksums). Phase III delivers JWICS deployment and CDS data transfer per the Roadmap.

**2.3 Deliver End-to-End Mission Capability (SOO §2.3)**
Rise8 will deliver the operator-facing Mission Applications that execute the end-to-end EW mission across all three phases, traced to CNS Mission Planning, Mission Scheduling, Target Discovery, COP, and Combat ID capabilities and the OVD §3 workflows. Phase I (MVP, Crawl) delivers the Plan-Pair-Schedule loop for GEO targets per OVD §5.1. Phase II (MVCR, Walk) adds the live M2M interface to the first weapon system (RMT/NARWOL via RMT Connect, then RMT C2), the end-to-end mission execution loop, the Combat ID workflow with chat-based tipping and Chatsurfer integration, the live P7 COA workflow, and initial auto-TTP selection. Phase III (Run) delivers Bounty Hunter Connect/C2, Meadowlands Connect/C2 (MDLS), MEO/LEO target support, coordinated engagements with split uplink/downlink, full agentic workflow orchestration, and scales toward CNS Attachment 1 objective (75 MTOs / 20 users / 500 assets / 1,500 missions / 300+ users) through horizontal scaling without service redesign.

**2.4 Security Accreditation and Continuous Authority to Operate (SOO §2.4)**
Rise8 will execute the SEWOL Risk Management Framework (RMF) lifecycle and establish a continuous Authority to Operate (cATO) posture from Sprint 1, applying NIST SP 800-207 Zero Trust at the application and data layers and NIST SP 800-190 container security (minimal bases, scanned at build, Cosign-signed, rebuilt on cadence). Tracer (Rise8's OSCAL-aligned compliance automation) generates the System Security Plan, Plan of Action & Milestones, and continuous monitoring evidence directly from pipeline data. Phase I establishes cATO posture in the unclassified IL5 environment with initial ATO package delivery to the Authorizing Official. Phase II extends the same cATO machinery to SIPR/TS-SCI for MVCR deployment. Phase III maintains cATO across the operational fleet and adds JWICS deployment. The cATO Package (RPP Deliverable #15) is delivered as version-controlled SSP/POAM with continuous Government access. A Senior Information Security Analyst (cRMF) is staffed full-time from Phase II forward and runs the continuous monitoring program through end-of-contract.

**2.5 Deliver Government-Owned APIs, Data Models, and External Interfaces (SOO §2.5)**
Rise8 will deliver all SEWOL APIs, data models, and database schemas as government-owned under Data Rights Category C. APIs follow REST and gRPC patterns, are documented in OpenAPI, and conform to the DoW API Technical Guidance. Rise8 produces signed Interface Control Documents before development begins for every external interface and version-controls them aligned to the software baseline. Phase I builds the live M2M interface to Project 7 (STO/MTO ingest and COA response) with manual-entry fallback, validates UDL connectivity for TLE retrieval, and delivers the SDK v1 (versioned API documentation, code samples, conformance test tools, onboarding guidelines, Mission Framework access) to enable downstream EW C2 adapter performers without coupling to Rise8 release cycles. Phase II adds Surefire and Shotfire (via Warpcore) for CDA ingest and deconfliction, Ion Trail / MIDB / MARS for target intelligence, Globalview for transponder beam data, and Chatsurfer for tipping and cueing during Combat ID. All external dependencies are isolated behind an Interface Adapter pattern. Phase III extends the SDK with M2M reporting, chat reports, expanded P7 integration, and Bounty Hunter and Meadowlands Mission Framework support per the Roadmap.

**2.6 Establish and Operate the DevSecOps Platform (SOO §2.6)**
Rise8 will operate the Mission O/S Core DevSecOps platform as the single delivery pipeline for SEWOL across the 48-month POP. The pipeline implements automated CI/CD with code merges to main triggering the SecRel pipeline (SAST, DAST, SCA, container scanning, dependency analysis), ArgoCD promoting signed artifacts, and Tracer generating compliance artifacts directly from pipeline data. The platform supports FOSS/COTS/GOTS component integration through local and released artifact repositories with automated SBOM generation at every milestone. MLOps capability for the SEWOL AI/ML system lifecycle is delivered in Phase I (model registry, training pipeline, evaluation harness) and operates the closed-loop ML governance pattern validated on EM&C in Phase II (OPA/Rego policy enforcement at sub-2ms latency, pre-HOTL groundedness validation, Decision Artifact Manifests on every AI-assisted output, override-fed retraining). Rise8 provides continuous Government access to source code, the IDE, the DevSecOps pipeline, the Product Backlog, and test and security results (RPP Deliverables #9 and #10).

**2.7 Perform Lead System Integrator Duties (SOO §2.7)**
Rise8 will serve as the LSI from Day 1, leading planning and prioritization with the RWG, running design reviews and technical exchanges with associate contractors, executing end-to-end integration testing, and coordinating information exchange with all external and Government stakeholders. The Phase I SDK delivery gives downstream RMT, Bounty Hunter, and Meadowlands adapter performers a clean entry point in Phase II without coupling them to Rise8 release cycles. Phase II integrates the first weapon system end-to-end (RMT/NARWOL) and the Combat ID chain. Phase III integrates Bounty Hunter and Meadowlands and coordinates split uplink/downlink engagements across the full MD3 fleet. Rise8 will execute integration test events at the Government-designated cadence and capture results in the Increment Report (RPP Deliverable #4).

**2.8 Deliver Comprehensive User Support (SOO §2.8)**
Rise8 will deliver a complete training, documentation, and lifecycle support package across the POP. Phase I stands up the Digital Documentation and Support Center (RPP Deliverable #14), modeled on the Shopify Help Center: web-based, searchable, updated alongside software releases, hosting both operator and administrator documentation and the train-the-trainer curriculum. Help desk support during Government test events is provided in Phase I. Phase II stands up the operational 24/7 / 2-hour-maximum-response help desk at MVCR operational acceptance, staffed through an on-call rotation among Senior Software Engineers and the cRMF Analyst with Program Management coordination and SME-bench escalation. Training and exercise environments run as a separate Mission O/S Core tenant, isolated from production and configured identically. Phase III sustains 24/7 operations through end-of-contract and adds operator-facing capability releases (CID Support, Auto-TTP, AI/ML improvements) on the same release-with-docs cadence.

### 3. Deliverables and Cadence

| # | Deliverable | Cadence | Applicable Phase(s) |
|---|---|---|---|
| 1 | Progress Report — Management | 1/Sprint | Phase I–III |
| 2 | Progress Report — Technical | 1/Sprint (from Phase II) | Phase II–III |
| 3 | Increment Planning Summary | 1/Increment | Phase I–III |
| 4 | Increment Report | 1/Increment | Phase I–III |
| 5 | Software Demonstration | 1/Sprint + 1/Increment | Phase I–III |
| 6 | Product Roadmap | 1/Increment | Phase I–III |
| 7 | Product Backlog (Jira access) | Continuous | Phase I–III |
| 8 | Product Releases (MVP, MVCR, Enhancements) | 1/Increment | Phase I–III |
| 9 | Source Code & DevSecOps Environment | Continuous | Phase I–III |
| 10 | IDE Access | Continuous | Phase I–III |
| 11 | Framework Architecture / Design Artifacts | MVP + each major release | Phase I–III |
| 12 | Software Development Kit (SDK) | MVP + each major release | Phase I–III |
| 13 | API Specifications & Data Schema | Continuous | Phase I–III |
| 14 | Digital Documentation & Support Center | Continuous | Phase I–III |
| 15 | cATO Package (SSP, POAM) | Continuous | Phase I–III |
| 16 | Operational & System Data Access | Continuous | Phase I–III |

### 4. Schedule and Payable Milestones

Rise8 proposes 48 monthly payable milestones aligned to observable technical achievements, mapped to the three-phase Crawl-Walk-Run structure. Detailed milestone values by ALIN are in Attachment 10.

| Phase | Period (from ATP) | Observable Achievement Anchors |
|---|---|---|
| Phase I (Crawl) | ATP – ATP+3 mo | PI-01 Planning baselined; Sprints 1–4 working-software demos; MVP delivery with Plan-Pair-Schedule for GEO, P7 ingest with manual fallback, OPSCAP-aware COP, SDK v1, cATO posture established; down-select gate. |
| Phase II (Walk) | ATP+3 – ATP+12 mo | MVCR feature deliveries; RMT/NARWOL Connect then RMT C2; live P7 COA workflow; Combat ID with Chatsurfer; initial auto-TTP selection; SIPR/TS-SCI deployment with cATO continuation; MVCR operational acceptance; 24/7 help desk stand-up. |
| Phase III (Run) | ATP+12 – ATP+48 mo | Bounty Hunter Connect/C2; Meadowlands Connect/C2; MEO/LEO target support; coordinated split uplink/downlink engagements; predictive COA analysis; full agentic workflow orchestration; JWICS deployment; CDS data transfer; sustained 24/7 operations and per-PI capability releases through end-of-contract. |

### 5. Government Furnished Support, Data Rights, and Compliance

**Government Furnished Support.** Phase I depends on three GFS items: (1) Project 7 interface specification access and a P7 test endpoint for M2M integration; (2) CAC issuance for all Rise8 personnel; and (3) Platform One IL5 Confluence licenses. Phase II adds SIPR access, eventual TS/SCI environment access, and Authorizing Official coordination for the SEWOL ATO. Phase III adds JWICS access. Full details in the accompanying one-page GFS submission.

**Data Rights.** All SEWOL-developed software, APIs, data models, technical data, operational data, and documentation are delivered under **Data Rights Category C** (Government Purpose Rights), matching the Government's desired posture. Pre-existing Rise8 background IP in Mission O/S Core is delivered under Category A (commercial); the Cat A/Cat C boundary is documented in the accompanying Level of Data Rights submission. A complete SBOM with license terms accompanies every delivery milestone. MOSA is the primary structural mitigation against vendor lock-in: government-owned APIs and the SDK let third parties extend SEWOL without Rise8 involvement.

**Compliance Posture.** Rise8 is CMMC-aligned and compliant with NIST SP 800-171, ITAR (22 C.F.R. §§ 120–130), NISPOM (DoD 5220.22-M), and EAR (15 C.F.R. §§ 730–774). Rise8 holds an active Top Secret Facility Clearance; 100% of staff assigned will hold an active Secret clearance at minimum, with TS/SCI counts defined with the Government in coordination with Phase II classified deployment. No Organizational Conflict of Interest is present; Rise8 will notify the Agreements Officer and NSTXL immediately if one is identified. Rise8 takes no exception to the RPP or the draft Performer's Agreement.

**Acceptance.** Acceptance of each monthly milestone is verified by the AOR via Certificate of Completion against the observable technical achievement defined in Attachment 10. Invoices flow through the NSTXL Certificate of Completion process and are paid via WAWF. This CSOW, on award, is incorporated into the resulting prototype-level Project Order.

---

## Government Furnished Support (GFS)

**Overview.** Rise8 has identified the GFS items below as dependencies for executing the SEWOL Framework and Mission Applications effort across Phases I–III. No Government Furnished Property is proposed for this effort; all hardware and tooling beyond the items listed is commercially procured and maintained by Rise8, and no ACO/AO approval documentation for GFP is required. If any listed GFS item is delayed or unavailable, Rise8 will notify the AOR immediately, document the gap, and propose a mitigation to preserve schedule.

| GFS Item | Type | Need Date | Impact if Unavailable |
|---|---|---|---|
| Project 7 (P7) Interface Spec & Test Endpoint | GFI / Access | Within 30 days of award | M2M ingest of STOs, MTOs, SPINS, COA Requests degrades to manual operator entry; planning workflow continues per CNS §4 (DDIL), but P7 demo scope reduced. Risk: medium. |
| CAC Issuance for Rise8 Personnel | Access | Within 30 days of award | No NIPR/SIPR access without CAC; gap delays first sprint. Mitigated by Rise8 personnel holding active CACs from prior Space Force work; gap applies only to net-new hires. |
| Platform One IL5 Confluence Licenses | License | At Phase I kickoff | Government-mandated formal delivery channel for 16 RPP Project Deliverables (per RPP §B.5). Without it, deliverables ship via interim Rise8 channels until provisioned; no schedule impact. |
| RWG & AOR Availability (Sprint Demos, Decision Points) | GFS / Personnel | Per-sprint, per-PI | RWG is final approval for prioritized backlog/roadmap per SOO §2.1; AOR is single point of technical direction per Performer's Agreement. Reduced availability slows backlog refinement, delays Certificate of Completion against MPS. Mitigated by proactive scheduling and async artifact review. |
| SIPR Environment Access | Access | Beginning Phase II | Classified integration testing to Government SIPR is deferred. NIPR development continues; classified delivery slips by access lead time. |
| TS/SCI Environment Access & ATO Coordination | Access / GFI | Phase II–III | Operational deployment to TS/SCI requires AO coordination and accreditation-boundary access. Without it, SEWOL cannot transition to operational use; Phase III completion impacted. |
| Remote EW C2 Adapter Performer Coordination | GFS / Info | Phase II onward | As lead System Integrator (SOO §2.7), Rise8 requires Government-coordinated access to adapter ICDs, integration windows, and test plans. Absence creates integration risk and schedule dependency. |

---

## Level of Data Rights Proposed

**Baseline Posture — Category C (Government Purpose Rights).** Rise8 will deliver all SEWOL-developed software, source code, APIs, data models, schemas, architectural artifacts, the versioned Software Development Kit, training materials, and operational data under Category C as defined in SpEC RPP Data Categories (Attachment 6). This matches the Government's desired end-state across all six rights actions (Use, Modify, Reproduce, Display, Release, Disclose) per RPP Section D.1. Rise8 asserts no Restricted, Limited, or Specially Negotiated License Rights on any SEWOL-funded deliverable. No data rights price impact is required.

**Background IP — Mission O/S Core (Category A, Commercial).** Rise8 will deliver SEWOL on top of Mission O/S Core, Rise8's pre-existing, commercially available platform that is operating today across multiple Space Force programs at IL4, IL5, and IL6. Mission O/S Core was developed at private expense prior to and independent of this prototype effort and is provided under Category A (Commercial Computer Software License). The Government receives the rights set forth in the applicable commercial license, including the right to use Mission O/S Core for all SEWOL operational, sustainment, and authorization purposes for the full SEWOL period of performance. The Cat A / Cat C boundary is precise: the Mission O/S Core platform itself remains Category A; all SEWOL-specific configuration, mission applications, integration code, and downstream artifacts are Category C.

**MOSA as the Structural Mitigation.** Modular Open Systems Approach is the primary mitigation against vendor lock-in. Government-owned APIs and the SDK delivered under Category C let third-party performers extend SEWOL, build Remote EW C2 adapters, and replace components without Rise8 involvement. The Government retains the unrestricted ability to compete follow-on Mission Application development, Remote EW C2 adapter development, and future SEWOL sustainment.

**Data Rights Summary:**
- All SEWOL-funded software, source code, APIs, data schemas, technical documentation, training materials, and operational data: Category C, Government Purpose Rights.
- Mission O/S Core platform (Rise8 background IP): Category A, Commercial Computer Software License.
- Open-source and commercial components: rights as set forth in each applicable license, identified in the SBOM at every delivery milestone.
- No Restricted, Limited, or Specially Negotiated License Rights are asserted on any SEWOL deliverable. No data rights pricing impact.

---

## Organizational Conflict of Interest (OCI) Mitigation Plan

**Affirmative Statement.** Rise8, Inc. has conducted an Organizational Conflict of Interest assessment in accordance with FAR Subpart 9.5 and the SEWOL RPP and affirms that no actual or potential OCI exists for Rise8 in connection with this effort. No Rise8 personnel have had access to non-public, competitively useful information related to this procurement. Rise8 has not participated in developing the SEWOL specifications, requirements, evaluation criteria, SOO, OVD, CNS, or Roadmap (no Biased Ground Rules); does not evaluate its own work or a competitor's work under any related contract (no Impaired Objectivity); and has received no SEWOL information outside the publicly released RPP package and NSTXL-administered Q&A (no Unequal Access to Information). Rise8 will notify NSTXL and the Agreements Officer immediately if any actual or potential OCI is identified during performance.

**Forward-Looking OCI Management — SEWOL System Integrator Role.**
Rise8 acknowledges that, as the proposed Framework and System Integrator performer, Rise8 occupies a position of structural awareness of SEWOL interfaces, performance characteristics, and integration patterns that future adapter competitors will rely on. Rise8 further acknowledges the RPP's statement that future OTA eligibility is strictly subject to 10 U.S.C. § 4292 and submission of an AO-approved OCI Mitigation Plan at the time of any such bid, with case-by-case evaluation by the AO.

**Mitigation Commitments:**
- **Government-Owned APIs and SDK:** all integration interfaces between SEWOL and downstream adapters are delivered under Category C, fully documented, and equally accessible to all adapter performers. Rise8 holds no informational advantage at the interface boundary.
- **Equal Information Disclosure:** any SEWOL interface specification, test environment access, integration window, or technical Q&A response Rise8 provides in support of an adapter competition is made available to all adapter competitors simultaneously through Government-controlled channels — never bilaterally.
- **Firewall on Future Bid Activity:** Rise8 will not bid on any future Remote EW C2 Adapter procurement, or any other follow-on procurement where Rise8's SI role would create an unfair competitive advantage, without first submitting an effort-specific OCI Mitigation Plan for AO approval per 10 U.S.C. § 4292.
- **Personnel Separation:** should Rise8 pursue an adapter procurement under an AO-approved mitigation plan, the bid team will be physically and contractually separated from the SEWOL SI delivery team, with non-disclosure and non-influence terms documented and auditable.
- **Continuing Disclosure:** Rise8 will report any new business relationship, contract award, or organizational change that could give rise to an OCI risk to the AO and NSTXL within five business days of identification.

---

## Compliance Documentation

**Overview.** Rise8 affirms full compliance with each mandatory restriction and requirement identified in SEWOL RPP Section C, and proposes no exceptions to the solicitation or to the draft NSTXL Performer's Agreement (Attachment 7) or Supplemental IP Agreement (Attachment 8).

**NIST SP 800-171 — Protection of CUI**
No Variances Proposed. Rise8 is compliant with the NIST SP 800-171 security requirements in effect at solicitation. Rise8's self-assessment was performed under the DoD Assessment Methodology and the resulting SPRS score has been uploaded to the Supplier Performance Risk System. A screenshot or formal record of the SPRS submission will be provided to the Agreements Officer upon request.

**Cloud and Computing Services**
Rise8 will execute SEWOL development on Mission O/S Core, operating today across multiple Space Force programs at IL4, IL5, and IL6, each running on Government-approved cloud infrastructure under an active AO authorization. AO approval is already in place for the cloud and computing services proposed. Phase III deployment to TS/SCI environments will require additional AO coordination as identified in the GFS submission.

**Section 889 — Covered Telecommunications**
Pursuant to Section 889(a)(1)(B), Pub. L. 115-232, and FAR 52.204-24:
*"Rise8, Inc. represents that it [ ] will, [X] will not provide covered telecommunications equipment or services to the Government in the performance of any contract, subcontract, or other contractual instrument resulting from this solicitation."*

Rise8 does not use, incorporate, or propose any covered telecommunications equipment or services. All infrastructure, cloud services, and tooling rely on approved U.S.-origin or open-source components with no dependency on any covered entity (Huawei, ZTE, Hytera, Hangzhou Hikvision, Dahua, or affiliates).

**Additional Compliance Representations:**
- DoDI 8582.01 / DoDM 5200.01 Vol 4 (CUI), ITAR (22 C.F.R. §§ 120–130), EAR (15 C.F.R. §§ 730–774), NISPOM (DoD 5220.22-M): Rise8 complies with all applicable CUI, export-control, and industrial-security requirements.
- Space Contractor Responsibility Watch List (CRWL): neither Rise8 nor any proposed sub-performer appears on the CRWL per Section 1601 of the FY25 NDAA and DAF guidance.
- CMMC 2.0 Level 2: Rise8 maintains a documented cybersecurity posture aligned to NIST SP 800-171 and is on a path to formal C3PAO Level 2 Certification within the DoD-required timeline.
- Exceptions: Rise8 takes no exception to any term or condition of this RPP, the draft NSTXL Performer's Agreement, or the Supplemental IP Agreement.

---

## Explanation Supporting Eligibility for Award of a Prototype OTA

**Eligibility Basis — 10 U.S.C. § 4022.** Rise8 qualifies for award of a Prototype Other Transaction Agreement under 10 U.S.C. § 4022 on the basis of Criterion (b): a Non-Traditional Defense Contractor (NTDC) is participating to a significant extent in the prototype project. Rise8 has not performed on any Department of Defense contract or subcontract subject to full Cost Accounting Standards (CAS) coverage within the one-year period preceding this solicitation, to the best of its knowledge and belief, and is therefore an NTDC as defined in the statute.

**Significant Extent.** Rise8 is the prime and sole performer. Rise8, an NTDC, will perform 100% of the SEWOL Framework and Mission Applications prototype effort directly — all product management, design, engineering, DevSecOps, integration, demonstration, and delivery. No work is subcontracted to traditional defense contractors. NTDC participation is not nominal or supplemental; it constitutes the entirety of prototype execution, satisfying the significant-extent requirement without qualification.

**Business Classification.** Rise8 is a Service-Disabled Veteran-Owned Small Business (SDVOSB), U.S.-owned and U.S.-controlled, headquartered in Tampa, Florida. CAGE Code: 8C8E8. UEI: FZG5H96FF1V4. Facility Clearance: Top Secret (Non-Possessing). Eligibility Criterion (b) — Non-Traditional Defense Contractor — is identified on the Proposal Cover Page per RPP Section C.4.a.

---

## Foreign Ownership, Control, or Influence (FOCI) Information

**Affirmative Statement.** Rise8, Inc. is not subject to Foreign Ownership, Control, or Influence (FOCI) as defined by applicable U.S. Government regulations, including the National Industrial Security Program Operating Manual (NISPOM, 32 C.F.R. Part 117). Rise8 is U.S.-owned and U.S.-controlled, headquartered at 601 S. Harbour Island Blvd., Ste. 109, Tampa, FL 33602.

**Supporting Representations:**
- No foreign ownership: no foreign person or foreign entity holds any direct or indirect ownership interest in Rise8.
- No foreign control: no foreign person or foreign entity has the power, direct or indirect, to direct or decide matters affecting the management or operations of Rise8.
- No foreign influence relationships: Rise8 has no contracts, agreements, or relationships with foreign persons or entities that would create FOCI as defined under the NISPOM.
- Active Facility Clearance: Rise8 holds an active Top Secret (Non-Possessing) Facility Clearance and has previously completed SF-328 (Certificate Pertaining to Foreign Interests) in connection with that clearance.
- No sub-performers: Rise8 is the prime and sole performer; no subcontractors, vendors, suppliers, or teaming partners are proposed under this RPP. As a result, no sub-performer FOCI disclosure is required.

**Documentation.** A current SF-328, an organizational chart, and a listing of Key Management Personnel are on file with the Defense Counterintelligence and Security Agency (DCSA) as part of Rise8's active FCL and are available to the Agreements Officer upon request. Rise8 will notify NSTXL and the AO immediately of any change in ownership, management, or affiliations that could affect this FOCI representation during the period of performance.
