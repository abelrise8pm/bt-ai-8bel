# SEWOL Project Lexicon
**Version:** 1.0
**Last Updated:** June 2026
**Maintained by:** Product Management
**Source Documents:** SEWOL Operational Vision (OVD), Rise8 Technical Volume (SpEC RPP 2607), SEWOL Demo Kickoff, SEWOL Product Roadmap

> **How to use this lexicon:**
> Terms are sorted by category in workflow sequence, then alphabetically within each category.
> Terms flagged with ⚑ have limited source context — definitions are synthesized from available references and should be validated with the customer or operators.
> Cross-references link to other terms defined in this document.

---

## Taxonomy

| # | Category | Description |
|---|---|---|
| 1 | [Tasking & Command Authority](#1-tasking--command-authority) | The authoritative orders and requests that initiate and direct EW operations — what SEWOL is told to do and by whom, before planning begins. |
| 2 | [Planning Constraints & Guidance](#2-planning-constraints--guidance) | The rules, restrictions, and deconfliction boundaries that bound what a plan is allowed to do — inputs the planner and scheduler must honor. |
| 3 | [Targets](#3-targets) | The entities that EW operations are directed against — their classification, orbital regime, signal characteristics, and data relationships. |
| 4 | [Assets & Fleet](#4-assets--fleet) | The EW weapon systems available to be tasked — their identity, capability, status, and operational readiness that the pairing engine works with. |
| 5 | [Mission Planning Objects](#5-mission-planning-objects) | The structured data artifacts that represent the work product of the Plan → Pair → Schedule workflow — from initial plan through executable schedule. |
| 6 | [Roles & Organizations](#6-roles--organizations) | The human actors and organizational units whose authorities and needs the SEWOL workflow serves. |
| 7 | [Connected Systems & Integrations](#7-connected-systems--integrations) | The external systems and data sources SEWOL integrates with as a C2 enterprise participant. |

---

## 1. Tasking & Command Authority

---

### COA Request
**Abbreviation:** COA Request (also: Space Support Request)
**Workflow Tag:** `Input: Plan`

**Definition:**
A request sent from Project 7 to SEWOL asking the EWO to develop and return one or more Course of Action options. Triggers the COA Development workflow in which SEWOL generates weighted schedule options for the SIFE to evaluate before a formal STO is issued.

**Source Excerpt:**
> *"As a SIFE user, I send a COA Request (Space Support Request) from Project 7 and receive multiple weighted COA options back from SEWOL so that I can choose based on commander's intent rather than solver mechanics."*
> — Rise8 Technical Volume, Story S6.1

**Source Documents:** Rise8 Technical Volume S6.1; SEWOL Operational Vision (OVD) §3.4
**Cross-References:** [COA](#course-of-action-coa), [STO](#space-tasking-order-sto), [SIFE](#sew-integrated-fires-element-sife), [Project 7](#project-7-p7), [Plan](#plan)
**Notes:** Distinct from [COA](#course-of-action-coa) (Cat 5), which is the planning output SEWOL produces in response. The COA Request is the inbound trigger; the COA is the outbound product.

---

### Master Space Attack Plan
**Abbreviation:** MSAP
**Workflow Tag:** `Input: Plan`

**Definition:**
The highest-level planning document in the space attack tasking hierarchy. Listed as the parent planning artifact from which the Space Tasking Order (STO) is derived. SEWOL receives and processes data that flows down from the MSAP.

**Source Excerpt:**
> *"Higher-level orders and guidance such as the Master Space Attack Plan (MSAP)/Space Tasking Order (STO)..."*
> — SEWOL Operational Vision (OVD) §2.3

**Source Documents:** SEWOL Operational Vision (OVD) §2.3
**Cross-References:** [STO](#space-tasking-order-sto), [SOCO](#space-operation-control-order-soco)
**Notes:** ⚑ Source references MSAP only in a list of key data types. No further definition provided in source documents.

---

### Mission Tasking Order
**Abbreviation:** MTO
**Workflow Tag:** `Input: Plan`

**Definition:**
A tasking order referenced alongside the STO in SEWOL planning workflows. Used in system performance thresholds (e.g. 5 concurrent MTOs at MVP threshold; 75 MTOs at objective scale). Likely represents a subordinate or mission-level tasking artifact derived from or related to the STO.

**Source Excerpt:**
> *"5 concurrent MTOs supported at threshold (CNS Att 1)... CNS Att. 1 threshold (5 MTOs / 3 users)."*
> — Rise8 Technical Volume, Story S3.1

**Source Documents:** Rise8 Technical Volume S3.1; CSOW
**Cross-References:** [STO](#space-tasking-order-sto), [Plan](#plan), [SOCO](#space-operation-control-order-soco)
**Notes:** ⚑ Exact relationship between MTO and STO is not explicitly defined in source documents. Confirm whether MTO is a child of STO or a parallel construct.

---

### Plan → Pair → Schedule
**Abbreviation:** N/A
**Workflow Tag:** `Defines: Full Workflow`

**Definition:**
The named end-to-end EW mission planning workflow that SEWOL executes. **Plan:** assembling tasking orders, targets, and constraints into a mission plan. **Pair:** the automated engine matching the best available assets to each target task. **Schedule:** generating a deconflicted, time-ordered execution sequence from those pairings. This workflow is the core value proposition of SEWOL's MVP.

**Source Excerpt:**
> *"The full Plan-Pair-Schedule workflow for GEO-only targets... PI-01 delivers the Phase I MVP: a working Plan → Pair → Schedule workflow for GEO targets."*
> — SEWOL Operational Vision (OVD) §5.1; Rise8 Technical Volume PI-01

**Source Documents:** SEWOL Operational Vision (OVD) §5.1; Rise8 Technical Volume PI-01; SEWOL Demo Kickoff slides
**Cross-References:** [STO](#space-tasking-order-sto), [Plan](#plan), [Pairing](#pairing), [Schedule](#schedule), [Task](#task), [EWO](#electromagnetic-warfare-operator-ewo)
**Notes:** This is both a workflow name and an organizing principle for the entire SEWOL product. Included as a term because teams need a shared definition of what each phase means.

---

### Space Operation Control Order
**Abbreviation:** SOCO
**Workflow Tag:** `Input: Plan`

**Definition:**
A higher-level operational control order that provides standing guidance and direction for EW operations. Listed alongside the STO as a key tasking and guidance data type that SEWOL must process and manage.

**Source Excerpt:**
> *"Higher-level orders and guidance such as the Master Space Attack Plan (MSAP)/Space Tasking Order (STO), Space Operation Control Order (SOCO)..."*
> — SEWOL Operational Vision (OVD) §2.3

**Source Documents:** SEWOL Operational Vision (OVD) §2.3; SEWOL Demo Kickoff slides
**Cross-References:** [STO](#space-tasking-order-sto), [MTO](#mission-tasking-order-mto), [MSAP](#master-space-attack-plan-msap), [SPINS](#special-instructions-spins)
**Notes:** ⚑ Source provides limited definitional context beyond listing SOCO as a key tasking data type. Confirm precise scope and authority level with customer.

---

### Space Tasking Order
**Abbreviation:** STO
**Workflow Tag:** `Input: Plan`

**Definition:**
The formal, approved order that tells the EWO what to do and what effects to achieve. The STO is the starting gun for mission planning — nothing in the Plan → Pair → Schedule workflow begins without one. An STO can arrive from Project 7 via machine-to-machine interface or be created manually by an operator when the P7 connection is unavailable.

**Source Excerpt:**
> *"The Space Tasking Order (STO): The specific tactical tasks, desired effects, and mission objectives to be achieved."*
> — SEWOL Operational Vision (OVD), Appendix A

> *"As an EWO, I ingest a Space Tasking Order from Project 7 (or create one manually) so that I can begin planning a mission against approved tasking."*
> — Rise8 Technical Volume, Story S3.1

**Source Documents:** SEWOL Operational Vision (OVD) App A; Rise8 Technical Volume S3.1; SEWOL Demo Kickoff slides
**Cross-References:** [SOCO](#space-operation-control-order-soco), [MTO](#mission-tasking-order-mto), [MSAP](#master-space-attack-plan-msap), [SPINS](#special-instructions-spins), [CDA](#commanders-deconfliction-assessment-cda), [Plan](#plan), [Project 7](#project-7-p7)
**Notes:** Relationship between STO and MTO (parent/child or synonymous?) needs clarification from the customer.

---

## 2. Planning Constraints & Guidance

---

### Acceptable Level of Risk
**Abbreviation:** ALR
**Workflow Tag:** `Constraint: Plan`

**Definition:**
A commander-defined threshold that specifies how much operational or collateral risk is acceptable when conducting EW missions. ALR is embedded in SPINS and informs decisions during the Combat ID process when responding to unknown signals.

**Source Excerpt:**
> *"Special Instructions (SPINS): Relevant Rules of Engagement (ROE), Acceptable Level of Risk (ALR), procedural requirements..."*
> — SEWOL Operational Vision (OVD), Appendix A §A.2.1

**Source Documents:** SEWOL Operational Vision (OVD) App A §A.2.1; OVD §3.3
**Cross-References:** [SPINS](#special-instructions-spins), [ROE](#rules-of-engagement-roe), [CID](#combat-identification-cid), [EWO](#electromagnetic-warfare-operator-ewo)
**Notes:** Also appears as "Commander's Accepted Level of Risk" in OVD §3.3. Confirm canonical form of the term with the customer.

---

### Commander's Deconfliction Assessment
**Abbreviation:** CDA
**Workflow Tag:** `Constraint: Plan, Constraint: Pair`

**Definition:**
A time-based restriction that specifies when a specific weapon system must limit its radiated power toward a specific satellite. CDAs define deconfliction windows that the scheduling engine must honor — no asset can be assigned a task during a window that violates its CDA. Sourced externally from systems such as Surefire.

**Source Excerpt:**
> *"Commander's Deconfliction Assessments (CDAs): contains time-based 'deconfliction windows' where a specific weapon system must limit its radiated power toward a specific satellite."*
> — SEWOL Operational Vision (OVD), Appendix A §A.2.1

> *"As an EWO, I add SPINS and CDA inputs to a mission plan so that the scheduler honors deconfliction windows and Special Instructions."*
> — Rise8 Technical Volume, Story S3.2

**Source Documents:** SEWOL Operational Vision (OVD) App A §A.2.1; Rise8 Technical Volume S3.2; SEWOL Demo Kickoff slides
**Cross-References:** [SPINS](#special-instructions-spins), [JRFL](#joint-restricted-frequency-list-jrfl), [Schedule](#schedule), [Sync Matrix](#sync-matrix), [Surefire](#surefire), [Asset](#asset)
**Notes:** Surefire is the planned external source for CDA ingest. That integration begins in Phase 2; CDAs are entered manually in the MVP.

---

### Joint Restricted Frequency List
**Abbreviation:** JRFL
**Workflow Tag:** `Constraint: Plan`

**Definition:**
A joint-force document that identifies electromagnetic frequencies protected from friendly interference. SEWOL must be aware of JRFL restrictions when planning EW operations to avoid disrupting friendly or protected communications.

**Source Excerpt:**
> *"Higher-level orders and guidance such as... the Joint Restricted Frequency List (JRFL)."*
> — SEWOL Operational Vision (OVD) §2.3

**Source Documents:** SEWOL Operational Vision (OVD) §2.3; SEWOL Demo Kickoff slides
**Cross-References:** [SPINS](#special-instructions-spins), [CDA](#commanders-deconfliction-assessment-cda), [SOI](#signal-of-interest-soi), [Plan](#plan)
**Notes:** ⚑ Source lists JRFL as a key data type but does not elaborate on how SEWOL enforces or ingests it. Confirm integration mechanism and enforcement approach.

---

### Rules of Engagement
**Abbreviation:** ROE
**Workflow Tag:** `Constraint: Plan`

**Definition:**
The command authority's rules governing when, where, and how EW forces may employ their capabilities. ROE are embedded within SPINS and set the legal and operational boundaries that the EWO must operate within when executing a mission.

**Source Excerpt:**
> *"Special Instructions (SPINS): Relevant Rules of Engagement (ROE), Acceptable Level of Risk (ALR)..."*
> — SEWOL Operational Vision (OVD), Appendix A §A.2.1

**Source Documents:** SEWOL Operational Vision (OVD) App A §A.2.1
**Cross-References:** [SPINS](#special-instructions-spins), [ALR](#acceptable-level-of-risk-alr), [CDA](#commanders-deconfliction-assessment-cda), [EWO](#electromagnetic-warfare-operator-ewo)
**Notes:** ⚑ ROE appears in source only as a component of SPINS; not defined independently.

---

### Special Instructions
**Abbreviation:** SPINS
**Workflow Tag:** `Constraint: Plan`

**Definition:**
Standing rules and procedural requirements that govern how EW operations must be conducted. SPINS encode Rules of Engagement (ROE), the Acceptable Level of Risk (ALR), and other guiding principles that affect which tactics or assets can be used. They are attached to a mission plan and fed as constraints into the scheduling engine.

**Source Excerpt:**
> *"Special Instructions (SPINS): Relevant Rules of Engagement (ROE), Acceptable Level of Risk (ALR), procedural requirements, and other guiding principles that may affect which tactics or assets can be used."*
> — SEWOL Operational Vision (OVD), Appendix A §A.2.1

> *"As an EWO, I add SPINS and CDA inputs to a mission plan so that the scheduler honors deconfliction windows and Special Instructions."*
> — Rise8 Technical Volume, Story S3.2

**Source Documents:** SEWOL Operational Vision (OVD) App A §A.2.1; Rise8 Technical Volume S3.2; SEWOL Demo Kickoff slides
**Cross-References:** [CDA](#commanders-deconfliction-assessment-cda), [JRFL](#joint-restricted-frequency-list-jrfl), [ROE](#rules-of-engagement-roe), [ALR](#acceptable-level-of-risk-alr), [Plan](#plan), [Schedule](#schedule)
**Notes:** SPINS can be ingested from Project 7 or created manually by the operator when P7 connectivity is degraded.

---

## 3. Targets

---

### Geosynchronous Orbit Target
**Abbreviation:** GEO
**Workflow Tag:** `Input: Plan`

**Definition:**
A target located in geosynchronous orbit, approximately 35,786 km above the equator, where the satellite's orbital period matches Earth's rotation. GEO targets are the MVP scope for SEWOL — all Phase 1 Plan → Pair → Schedule capability is built and validated against GEO target sets.

**Source Excerpt:**
> *"The full Plan-Pair-Schedule workflow for GEO-only targets... End-to-end demo runs against ≥100 targets / ≥50 assets."*
> — SEWOL Operational Vision (OVD) §5.1; Rise8 Technical Volume S3.3

**Source Documents:** SEWOL Operational Vision (OVD) §5.1; Rise8 Technical Volume S3.3
**Cross-References:** [Target](#target), [MEO](#medium-earth-orbit-meo), [LEO](#low-earth-orbit-leo), [TLE](#two-line-element-set-tle), [Transponder Beam Footprint](#transponder-beam-footprint), [Asset](#asset)
**Notes:** GEO is the MVP boundary. MEO and LEO are Phase 3 scope. Access windows for GEO targets are calculated from TLEs.

---

### Low Earth Orbit
**Abbreviation:** LEO
**Workflow Tag:** `Input: Plan (Phase 3)`

**Definition:**
A target orbital regime below approximately 2,000 km altitude. SEWOL must eventually support LEO targets but this is out of scope for the MVP and is a Phase 3 objective. LEO targets introduce additional complexity due to faster orbital motion and shorter access windows.

**Source Excerpt:**
> *"The system must be able to model and manage targets in all orbital regimes, including Geosynchronous (GEO), Medium Earth Orbit (MEO), and Low Earth Orbit (LEO)."*
> — SEWOL Operational Vision (OVD) §2.3

**Source Documents:** SEWOL Operational Vision (OVD) §2.3
**Cross-References:** [GEO](#geosynchronous-orbit-target-geo), [MEO](#medium-earth-orbit-meo), [Target](#target), [TLE](#two-line-element-set-tle)
**Notes:** ⚑ Out of scope for MVP. Phase 3 roadmap item alongside MEO support. Limited planning context in source documents.

---

### Medium Earth Orbit
**Abbreviation:** MEO
**Workflow Tag:** `Input: Plan (Phase 3)`

**Definition:**
A target orbital regime between Low Earth Orbit and Geosynchronous orbit, approximately 2,000–35,786 km altitude. SEWOL must eventually support MEO targets but this is out of scope for the MVP and is a Phase 3 objective.

**Source Excerpt:**
> *"The system must be able to model and manage targets in all orbital regimes, including Geosynchronous (GEO), Medium Earth Orbit (MEO), and Low Earth Orbit (LEO)."*
> — SEWOL Operational Vision (OVD) §2.3

**Source Documents:** SEWOL Operational Vision (OVD) §2.3
**Cross-References:** [GEO](#geosynchronous-orbit-target-geo), [LEO](#low-earth-orbit-leo), [Target](#target), [TLE](#two-line-element-set-tle)
**Notes:** ⚑ Out of scope for MVP. Phase 3 roadmap item alongside LEO support. Limited planning context in source documents.

---

### Network of Interest
**Abbreviation:** NOI
**Workflow Tag:** `Input: Plan`

**Definition:**
The second level of the SEWOL target hierarchy. A NOI represents a specific space-based network or communications system associated with a User of Interest (UOI). A NOI contains one or more Signals of Interest (SOIs).

**Source Excerpt:**
> *"The system provides a clear visualization of the complex, hierarchical nature of space targets (UOI, NOI, SOI)."*
> — SEWOL Operational Vision (OVD) §2.3 and §3.3

**Source Documents:** SEWOL Operational Vision (OVD) §2.3 and §3.3; Rise8 Technical Volume S2.1
**Cross-References:** [UOI](#user-of-interest-uoi), [SOI](#signal-of-interest-soi), [Target](#target)

---

### Signal of Interest
**Abbreviation:** SOI
**Workflow Tag:** `Input: Plan, Input: Pairing`

**Definition:**
The lowest and most operationally specific level of the SEWOL target hierarchy. An SOI represents a specific electromagnetic signal on a specific transponder that an EW asset will be tasked against. SOIs are the atomic unit of EW tasking — each task in a schedule ultimately targets an SOI.

**Source Excerpt:**
> *"The system provides a clear visualization of the complex, hierarchical nature of space targets (UOI, NOI, SOI)."*
> — SEWOL Operational Vision (OVD) §2.3 and §3.3

**Source Documents:** SEWOL Operational Vision (OVD) §2.3 and §3.3; Rise8 Technical Volume S2.1; SEWOL Demo Kickoff slides
**Cross-References:** [UOI](#user-of-interest-uoi), [NOI](#network-of-interest-noi), [Target](#target), [Task](#task), [Signal Bundling](#signal-bundling), [WARM](#wartime-reserve-mode-warm)
**Notes:** WARM (Wartime Reserve Mode) handling is a specific complexity for SOIs — unknown WARMs trigger the CID process.

---

### Target
**Abbreviation:** N/A
**Workflow Tag:** `Input: Plan`

**Definition:**
Any entity that an EW mission is directed against. In SEWOL, targets include satellites, transponders, and signals in any orbital regime. Targets are organized into a hierarchical data model (UOI/NOI/SOI) and must be fully characterized — with orbital data and beam footprint — before they can be paired with an asset.

**Source Excerpt:**
> *"A comprehensive, structured model of targets. This includes hierarchical relationships between Users of Interest (UOIs), Networks of Interest (NOIs), and Signals of Interest (SOIs), as well as other target types such as satellites, specific transponders, and Dynamic Targeting Ranges."*
> — SEWOL Operational Vision (OVD) §2.3

**Source Documents:** SEWOL Operational Vision (OVD) §2.3; SEWOL Demo Kickoff slides
**Cross-References:** [UOI](#user-of-interest-uoi), [NOI](#network-of-interest-noi), [SOI](#signal-of-interest-soi), [GEO](#geosynchronous-orbit-target-geo), [MEO](#medium-earth-orbit-meo), [LEO](#low-earth-orbit-leo), [TLE](#two-line-element-set-tle), [Transponder Beam Footprint](#transponder-beam-footprint), [Plan](#plan), [Pairing](#pairing)
**Notes:** MVP scope is GEO targets only. MEO and LEO target support is a Phase 3 objective.

---

### Transponder Beam Footprint
**Abbreviation:** N/A
**Workflow Tag:** `Input: Pairing`

**Definition:**
The geographic area on Earth's surface covered by a specific satellite transponder's signal. Used by the pairing engine to determine whether a ground-based EW asset is physically located within the footprint and therefore capable of engaging the target. Can be ingested from Globalview or derived from KML files.

**Source Excerpt:**
> *"Transponder Beam Footprint: The geographic area covered by the target's transponder, which can be confirmed by ingested data (e.g., KML files) or recent operational data."*
> — SEWOL Operational Vision (OVD), Appendix A §A.2.2

**Source Documents:** SEWOL Operational Vision (OVD) App A §A.2.2; Rise8 Technical Volume S2.3
**Cross-References:** [Target](#target), [SOI](#signal-of-interest-soi), [Asset](#asset), [Pairing](#pairing), [Globalview](#globalview)
**Notes:** Globalview is the planned external source for beam footprint data. Missing beam footprint is a flagged data quality issue that blocks pairing.

---

### Two-Line Element Set
**Abbreviation:** TLE
**Workflow Tag:** `Input: Pairing`

**Definition:**
A standardized data format that encodes the orbital parameters of a satellite at a specific point in time. TLEs are required for each target so SEWOL can calculate access windows — the time periods during which a ground-based EW asset has line-of-sight to the target. Missing TLEs block a target from entering the pairing engine.

**Source Excerpt:**
> *"Target Location & Orbit: The target's location, derived from its TLEs or state vectors. The engine must be able to calculate access windows for targets in all orbital regimes."*
> — SEWOL Operational Vision (OVD), Appendix A §A.2.2

**Source Documents:** SEWOL Operational Vision (OVD) App A §A.2.2; Rise8 Technical Volume S2.3
**Cross-References:** [Target](#target), [GEO](#geosynchronous-orbit-target-geo), [MEO](#medium-earth-orbit-meo), [LEO](#low-earth-orbit-leo), [UDL](#unified-data-library-udl), [Pairing](#pairing)
**Notes:** TLEs are sourced from the Unified Data Library (UDL). Missing TLE is a flagged data quality issue that blocks pairing.

---

### User of Interest
**Abbreviation:** UOI
**Workflow Tag:** `Input: Plan`

**Definition:**
The top level of the SEWOL target hierarchy. A UOI represents an adversarial user or entity that relies on a space-based network. UOIs contain one or more Networks of Interest (NOIs), which in turn contain Signals of Interest (SOIs). The full UOI/NOI/SOI model structures how targets are discovered, managed, and planned against.

**Source Excerpt:**
> *"The system provides a clear visualization of the complex, hierarchical nature of space targets (UOI, NOI, SOI)."*
> — SEWOL Operational Vision (OVD) §2.3 and §3.3

**Source Documents:** SEWOL Operational Vision (OVD) §2.3 and §3.3; Rise8 Technical Volume S2.1
**Cross-References:** [NOI](#network-of-interest-noi), [SOI](#signal-of-interest-soi), [Target](#target), [GEO](#geosynchronous-orbit-target-geo)

---

### Wartime Reserve Mode
**Abbreviation:** WARM
**Workflow Tag:** `Input: Plan`

**Definition:**
A signal mode or behavior that an adversary holds in reserve and does not reveal during peacetime. When a weapon system detects an unknown signal that doesn't match any known or scheduled target, it may be a WARM — triggering the Combat ID (CID) process to identify and classify the signal before engagement.

**Source Excerpt:**
> *"A critical function of this workflow is managing targets with unknown Wartime Reserve Modes (WARMs). When a new signal is detected, SEWOL supports the full, closed-loop Combat Identification (CID) process."*
> — SEWOL Operational Vision (OVD) §3.3

**Source Documents:** SEWOL Operational Vision (OVD) §3.3
**Cross-References:** [SOI](#signal-of-interest-soi), [CID](#combat-identification-cid), [Target](#target)
**Notes:** ⚑ Source describes the operational trigger but does not define WARM in technical detail. Definition synthesized from context.

---

## 4. Assets & Fleet

---

### Asset
**Abbreviation:** N/A
**Workflow Tag:** `Input: Pairing`

**Definition:**
Any EW weapon system in the MD3 fleet that SEWOL can task, command, and monitor. Assets are characterized by their location, capabilities, OPSCAP status, and available resources (SDRs, power). The pairing engine matches assets to target tasks based on these characteristics.

**Source Excerpt:**
> *"EW Asset Data: The health, status, location, and specific capabilities of every EW system in the fleet (Operational Capability [OPSCAP] data)."*
> — SEWOL Operational Vision (OVD) §2.3

**Source Documents:** SEWOL Operational Vision (OVD) §2.3; SEWOL Demo Kickoff slides
**Cross-References:** [OPSCAP](#operational-capability-opscap), [SDR](#software-defined-radio-sdr), [TTP](#tactics-techniques-and-procedures-ttp), [RMT](#remote-modular-terminal-rmt), [Bounty Hunter](#bounty-hunter-bh), [Meadowlands](#meadowlands-mdls), [Pairing](#pairing), [Schedule](#schedule)
**Notes:** Asset status (Available / In-Mission / In-Maintenance) directly affects pairing eligibility. Red OPSCAP assets are automatically excluded from the pairing engine.

---

### Bounty Hunter
**Abbreviation:** BH
**Workflow Tag:** `Input: Pairing, Output: Schedule (execution)`

**Definition:**
An EW weapon system operated by the 16th Electromagnetic Warfare Squadron and one of three internal systems SEWOL will command and control. Bounty Hunter C2 integration is a Year 2 (Phase 3) milestone on the SEWOL roadmap.

**Source Excerpt:**
> *"Bounty Hunter (BH) (16th EWS)... Phase III extends end-to-end mission execution to Bounty Hunter (Year 2)."*
> — SEWOL Operational Vision (OVD) §2.2; Rise8 Technical Volume Phase III

**Source Documents:** SEWOL Operational Vision (OVD) §2.2; SEWOL Roadmap; Rise8 Technical Volume Phase III
**Cross-References:** [Asset](#asset), [RMT](#remote-modular-terminal-rmt), [Meadowlands](#meadowlands-mdls), [OPSCAP](#operational-capability-opscap), [Schedule](#schedule)
**Notes:** ⚑ Source identifies Bounty Hunter as a weapon system but provides limited technical detail about its specific capabilities.

---

### Local Obscura
**Abbreviation:** N/A
**Workflow Tag:** `Constraint: Pairing`

**Definition:**
A static, pre-defined mask of minimum elevation angles by azimuth for each EW weapon system. The local obscura defines the physical horizon limitations of an asset — terrain or infrastructure that permanently blocks line-of-sight to certain parts of the sky. It is part of each asset's configuration profile and is a hard constraint in the pairing engine.

**Source Excerpt:**
> *"Local Obscura: The static, pre-defined 'mask' of minimum elevation angles by azimuth for each weapon system, which is part of its configuration profile."*
> — SEWOL Operational Vision (OVD), Appendix A §A.2.4

**Source Documents:** SEWOL Operational Vision (OVD) App A §A.2.4
**Cross-References:** [Asset](#asset), [Pairing](#pairing), [TLE](#two-line-element-set-tle), [GEO](#geosynchronous-orbit-target-geo)
**Notes:** ⚑ Defined in OVD Appendix A only. No operational workflow detail provided beyond its role as a pairing constraint.

---

### Meadowlands
**Abbreviation:** MDLS
**Workflow Tag:** `Input: Pairing, Output: Schedule (execution)`

**Definition:**
An EW weapon system operated by the 4th Electromagnetic Warfare Squadron and one of three internal systems SEWOL will command and control. Meadowlands C2 integration is a Year 3 (Phase 3) milestone on the SEWOL roadmap.

**Source Excerpt:**
> *"Meadowlands (MDLS) (4th EWS)... Phase III... Meadowlands Connect/C2 (MDLS)."*
> — SEWOL Operational Vision (OVD) §2.2; Rise8 Technical Volume Phase III

**Source Documents:** SEWOL Operational Vision (OVD) §2.2; SEWOL Roadmap; Rise8 Technical Volume Phase III
**Cross-References:** [Asset](#asset), [RMT](#remote-modular-terminal-rmt), [Bounty Hunter](#bounty-hunter-bh), [OPSCAP](#operational-capability-opscap), [Schedule](#schedule)
**Notes:** ⚑ Source identifies Meadowlands as a weapon system but provides limited technical detail about its specific capabilities.

---

### Operational Capability
**Abbreviation:** OPSCAP
**Workflow Tag:** `Input: Pairing`

**Definition:**
A real-time or recently updated health and readiness status for each EW asset, expressed as Green / Amber / Red. Green assets are fully available for pairing. Amber assets generate operator warnings. Red assets are automatically excluded from the pairing engine. OPSCAP data drives both the Common Operating Picture (COP) dashboard and pairing eligibility.

**Source Excerpt:**
> *"The COP renders the current EW fleet with OPSCAP status (Green/Amber/Red), the active enterprise schedule, and target visibility ranges. Assets in Red state are automatically excluded from pairing candidates; Amber generates operator-visible warnings."*
> — Rise8 Technical Volume, Epic E5

**Source Documents:** Rise8 Technical Volume E5; S5.3
**Cross-References:** [Asset](#asset), [Pairing](#pairing), [COP](#common-operating-picture-cop), [Schedule](#schedule)
**Notes:** OPSCAP changes are auditable with timestamps and originator. EWO can manually override OPSCAP status.

---

### Remote Modular Terminal
**Abbreviation:** RMT
**Workflow Tag:** `Input: Pairing, Output: Schedule (execution)`

**Definition:**
The first EW weapon system to be connected to SEWOL via live machine-to-machine (M2M) command and control. Operated by the 76th Electromagnetic Warfare Squadron. RMT is the primary weapon system for Phase 2 (MVCR) — the milestone that closes the end-to-end mission execution loop for the first time.

**Source Excerpt:**
> *"Remote Modular Terminal (RMT) (76th Electromagnetic Warfare Squadron [EWS])... Phase II closes the end-to-end mission cycle for the first weapon system."*
> — SEWOL Operational Vision (OVD) §2.2 and §5.2

**Source Documents:** SEWOL Operational Vision (OVD) §2.2 and §5.2; Rise8 Technical Volume Phase II
**Cross-References:** [Asset](#asset), [OPSCAP](#operational-capability-opscap), [Schedule](#schedule), [Task](#task)
**Notes:** Also referenced as NARWOL in some contexts. RMT Block 0 and Block 1 are referenced as distinct configurations in Phase 2 scope.

---

### Signal Bundling
**Abbreviation:** N/A
**Workflow Tag:** `Input: Pairing`

**Definition:**
The capability of a specific SDR to engage multiple Signals of Interest within a single frequency range simultaneously. When signal bundling is possible, a single SDR slot can cover multiple tasks, improving scheduling efficiency. The pairing engine factors bundling ability when evaluating asset-to-task assignments.

**Source Excerpt:**
> *"Signal Bundling: The ability of a specific SDR to engage multiple Signals of Interest within a single frequency range simultaneously."*
> — SEWOL Operational Vision (OVD), Appendix A §A.2.3

**Source Documents:** SEWOL Operational Vision (OVD) App A §A.2.3; Rise8 Technical Volume S4.1
**Cross-References:** [SDR](#software-defined-radio-sdr), [SOI](#signal-of-interest-soi), [Asset](#asset), [Pairing](#pairing)
**Notes:** ⚑ Defined in OVD Appendix A as a scheduling engine input factor. No additional operational detail provided.

---

### Software Defined Radio
**Abbreviation:** SDR
**Workflow Tag:** `Constraint: Pairing`

**Definition:**
A radio transceiver on an EW asset implemented in software rather than hardware, allowing it to be reconfigured for different signal types. The number of available SDRs per asset is a primary hard constraint in the pairing engine — it determines how many simultaneous tasks an asset can perform at once.

**Source Excerpt:**
> *"Software Defined Radios (SDRs): The number of available SDRs per weapon system, as this is a primary constraint on how many tasks an asset can perform concurrently."*
> — SEWOL Operational Vision (OVD), Appendix A §A.2.3

**Source Documents:** SEWOL Operational Vision (OVD) App A §A.2.3
**Cross-References:** [Asset](#asset), [Signal Bundling](#signal-bundling), [Pairing](#pairing), [Task](#task)
**Notes:** SDR count is a hard constraint in the CP-SAT scheduling engine. Signal bundling can allow one SDR to cover multiple SOIs within a frequency range.

---

### Tactics, Techniques, and Procedures
**Abbreviation:** TTP
**Workflow Tag:** `Input: Pairing`

**Definition:**
The specific methods and procedures a weapon system can use to conduct an EW engagement. Each asset has a defined set of TTPs it is capable of performing. The pairing engine must know which TTPs are available per asset, though automatic TTP selection is not required in the MVP — that capability arrives in Phase 2 (MVCR).

**Source Excerpt:**
> *"Weapon Capabilities & TTPs: The specific capabilities, tactics, techniques, and procedures (TTPs) that each weapon system is able to perform. The MVP is not required to automatically select a TTP, but it must know which TTPs are available for a given asset. The MVCR will need to perform TTP selection."*
> — SEWOL Operational Vision (OVD), Appendix A §A.2.3

**Source Documents:** SEWOL Operational Vision (OVD) App A §A.2.3
**Cross-References:** [Asset](#asset), [Pairing](#pairing), [RMT](#remote-modular-terminal-rmt)
**Notes:** Auto-TTP selection is a Phase 2 / MVCR capability. MVP only requires TTP awareness (which TTPs are available per asset).

---

## 5. Mission Planning Objects

---

### Combat Identification
**Abbreviation:** CID
**Workflow Tag:** `Output: Execution`

**Definition:**
The closed-loop process SEWOL uses when an EW asset detects an unknown signal that cannot be correlated to a known or scheduled target. CID involves notifying the operator, assessing available signal characteristics, tipping a more capable sensor via M2M or Chatsurfer, and ingesting the response to classify the signal. CID is triggered by unknown WARMs and governed by the ALR.

**Source Excerpt:**
> *"SEWOL supports the full, closed-loop Combat Identification (CID) process... Tipping & Cueing: Generating and transmitting a 'tip' to a more capable Electronic Support (ES) sensor."*
> — SEWOL Operational Vision (OVD) §3.3

**Source Documents:** SEWOL Operational Vision (OVD) §3.3; Rise8 Technical Volume Phase II
**Cross-References:** [WARM](#wartime-reserve-mode-warm), [SOI](#signal-of-interest-soi), [ALR](#acceptable-level-of-risk-alr), [Chatsurfer](#chatsurfer), [SIFE](#sew-integrated-fires-element-sife), [EWO](#electromagnetic-warfare-operator-ewo), [Asset](#asset)
**Notes:** ⚑ CID is a Phase 2 (MVCR) capability. Initial implementation may require manual handling of chat-based responses. Full automation is a Phase 3 objective.

---

### Common Operating Picture
**Abbreviation:** COP
**Workflow Tag:** `Output: Schedule`

**Definition:**
A geospatial map view within SEWOL that provides the EWO with a unified, single-pane-of-glass situational picture. The COP displays EW fleet positions with OPSCAP status, active target visibility ranges, planned task assignments, and active engagements. Asset OPSCAP health (Green/Amber/Red) is rendered in real-time and drives pairing eligibility.

**Source Excerpt:**
> *"As an EWO, I view planned tasks, target visibility, and EW fleet position on a geospatial COP so that I have a single-pane-of-glass situational picture."*
> — Rise8 Technical Volume, Story S5.1

**Source Documents:** Rise8 Technical Volume S5.1; SEWOL Demo Kickoff slides
**Cross-References:** [Schedule](#schedule), [OPSCAP](#operational-capability-opscap), [Asset](#asset), [Sync Matrix](#sync-matrix), [Target](#target)
**Notes:** Also described as the "Battlespace Management COP." MVP threshold: 50 assets / 100 simultaneous missions / 25 concurrent users.

---

### Course of Action
**Abbreviation:** COA
**Workflow Tag:** `Output: Plan`

**Definition:**
A fully developed scheduling option produced by SEWOL in response to a COA Request from Project 7. Each COA represents a distinct weapon-target pairing strategy with a specific weighting preset (e.g. Maximize Coverage / Balanced / Minimize Asset Risk) and includes scored schedule previews that the SIFE can evaluate and select based on commander's intent.

**Source Excerpt:**
> *"Each COA shows weighting preset, scheduled-vs-unassignable count, average pairing score, solve time, full schedule preview. SIFE can promote a COA, send back for re-eval, or close the request."*
> — Rise8 Technical Volume, Story S6.1

**Source Documents:** Rise8 Technical Volume S6.1; SEWOL Operational Vision (OVD) §3.4
**Cross-References:** [COA Request](#coa-request), [SIFE](#sew-integrated-fires-element-sife), [Plan](#plan), [Pairing](#pairing), [Schedule](#schedule), [Project 7](#project-7-p7)
**Notes:** Distinct from [COA Request](#coa-request) (Cat 1), which is the inbound trigger from P7. COA is the outbound planning product SEWOL generates and returns.

---

### Mission Report
**Abbreviation:** MISREP
**Workflow Tag:** `Output: Execution`

**Definition:**
A final end-of-mission report generated by SEWOL after a mission completes. The MISREP summarizes results to the command level and supports Tactical Assessment. It is the terminal output of the STO-Based Mission Planning & Execution workflow.

**Source Excerpt:**
> *"This workflow culminates in providing real-time Tactical Reports (TACREPs) and final Mission Reports (MISREPs)."*
> — SEWOL Operational Vision (OVD) §3.5

**Source Documents:** SEWOL Operational Vision (OVD) §3.5
**Cross-References:** [TACREP](#tactical-report-tacrep), [EWO](#electromagnetic-warfare-operator-ewo), [SIFE](#sew-integrated-fires-element-sife), [Schedule](#schedule), [Task](#task)
**Notes:** ⚑ Source references MISREPs as a workflow output but does not define format, content, or delivery mechanism.

---

### Pairing
**Abbreviation:** N/A
**Workflow Tag:** `Output: Pair`

**Definition:**
The automated process of matching a specific EW asset to a specific target task based on capability fit, beam footprint, OPSCAP status, and scheduling constraints. Pairing is the "Pair" step of the Plan → Pair → Schedule workflow. The engine (CP-SAT solver) scores each candidate pairing across multiple factors and surfaces a rationale the EWO can inspect and override.

**Source Excerpt:**
> *"Automated weapon-target pairing with full score-breakdown transparency. Each pairing is scored across Capability Match, Footprint Centrality, OPSCAP Health, Slot Earliness, and Load Balance, with human-readable rationale."*
> — Rise8 Technical Volume, Epic E4

**Source Documents:** Rise8 Technical Volume E4; S4.3
**Cross-References:** [Plan](#plan), [Schedule](#schedule), [Asset](#asset), [Target](#target), [OPSCAP](#operational-capability-opscap), [SDR](#software-defined-radio-sdr), [CDA](#commanders-deconfliction-assessment-cda), [TTP](#tactics-techniques-and-procedures-ttp)
**Notes:** Pairing score factors per OVD App A: Capability Match / Footprint Centrality / OPSCAP Health / Slot Earliness / Load Balance. Operator can override any pairing with a captured rationale (audit trail preserved).

---

### Plan
**Abbreviation:** N/A
**Workflow Tag:** `Output: Plan`

**Definition:**
The structured work product created by the EWO that assembles an STO's target list with applicable constraints (SPINS, CDA) and available assets in preparation for the pairing engine. A Plan is the input to the Pair step of the Plan → Pair → Schedule workflow.

**Source Excerpt:**
> *"Mission Data: This category includes both the 'data out' from SEWOL (detailed Mission Plans and executable task lists)..."*
> — SEWOL Operational Vision (OVD) §2.3

**Source Documents:** SEWOL Operational Vision (OVD) §2.3; SEWOL Demo Kickoff slides
**Cross-References:** [STO](#space-tasking-order-sto), [SPINS](#special-instructions-spins), [CDA](#commanders-deconfliction-assessment-cda), [Target](#target), [Asset](#asset), [Pairing](#pairing), [Schedule](#schedule), [Task](#task)
**Notes:** Plan is one of the six named Common Data Models explicitly listed in the SEWOL architecture alongside STO, SOCO, SPINS, COA, CDA, JRFL, Target, Asset, Schedule, and Task.

---

### Schedule
**Abbreviation:** N/A
**Workflow Tag:** `Output: Schedule`

**Definition:**
The final, deconflicted, time-ordered sequence of asset-to-task assignments produced by the SEWOL scheduling engine. A Schedule is the primary output of the Plan → Pair → Schedule workflow — an exportable, human-readable artifact handed to EW system operators for execution. All CDA windows, SPINS constraints, and OPSCAP states are honored in a valid Schedule.

**Source Excerpt:**
> *"The end result is an exportable, human-readable enterprise schedule that can be handed off to the individual crews... Schedule export produces a human-readable artifact (CSV + PDF) acceptable to EW crews."*
> — SEWOL Operational Vision (OVD) §5.1; Rise8 Technical Volume S3.3

**Source Documents:** SEWOL Operational Vision (OVD) §5.1; Rise8 Technical Volume S3.3; SEWOL Demo Kickoff slides
**Cross-References:** [Plan](#plan), [Pairing](#pairing), [Task](#task), [Sync Matrix](#sync-matrix), [CDA](#commanders-deconfliction-assessment-cda), [SPINS](#special-instructions-spins)
**Notes:** The Schedule is exported as CSV and PDF at MVP. It is visualized on the Sync Matrix timeline within the SEWOL interface.

---

### SEWOL
**Abbreviation:** SEWOL
**Workflow Tag:** `Defines: System`

**Definition:**
Space Electromagnetic Warfare Operating Location. The central C2 software application being built to replace disparate, manually-intensive EW command and control processes with a single, integrated, data-driven system. SEWOL commands and controls EW weapon systems, plans and schedules missions, and interoperates with external data sources across the EW enterprise.

**Source Excerpt:**
> *"SEWOL will replace the current fleet of disparate, stove-piped, and manually-intensive C2 processes with a single, integrated, and data-driven software application."*
> — SEWOL Demo Kickoff slides

**Source Documents:** SEWOL Demo Kickoff slides; SEWOL Operational Vision (OVD)
**Cross-References:** [EWO](#electromagnetic-warfare-operator-ewo), [SIFE](#sew-integrated-fires-element-sife), [MD3](#mission-delta-3-md3), [Plan](#plan), [Asset](#asset), [Schedule](#schedule), [Project 7](#project-7-p7), [Mission O/S Core](#mission-os-core)

---

### Sync Matrix
**Abbreviation:** N/A
**Workflow Tag:** `Output: Schedule`

**Definition:**
A real-time timeline visualization within SEWOL that displays all scheduled EW missions against the broader operational context (e.g. JADO). The Sync Matrix allows the EWO to visually deconflict and synchronize the generated schedule, ensuring it aligns with joint operations. It is a persistent element visible at the bottom of every SEWOL prototype view.

**Source Excerpt:**
> *"A key dashboard component is the Sync Matrix, a real-time timeline display of all scheduled EW missions set against the context of the wider operational picture (e.g. Joint All-Domain Operations [JADO])."*
> — SEWOL Operational Vision (OVD) §3.2

**Source Documents:** SEWOL Operational Vision (OVD) §3.2; Rise8 Technical Volume S5.2
**Cross-References:** [Schedule](#schedule), [CDA](#commanders-deconfliction-assessment-cda), [COP](#common-operating-picture-cop), [Task](#task)
**Notes:** Sync Matrix updates in under 1 second when the schedule changes. Supports drag-to-zoom and click-to-detail interactions.

---

### Tactical Report
**Abbreviation:** TACREP
**Workflow Tag:** `Output: Execution`

**Definition:**
A real-time report generated by SEWOL during mission execution that communicates current tactical status and results to the command level. TACREPs are produced during the STO-Based Mission Planning & Execution workflow as operations unfold.

**Source Excerpt:**
> *"This workflow culminates in providing real-time Tactical Reports (TACREPs) and final Mission Reports (MISREPs)."*
> — SEWOL Operational Vision (OVD) §3.5

**Source Documents:** SEWOL Operational Vision (OVD) §3.5
**Cross-References:** [MISREP](#mission-report-misrep), [EWO](#electromagnetic-warfare-operator-ewo), [SIFE](#sew-integrated-fires-element-sife), [Schedule](#schedule), [Task](#task)
**Notes:** ⚑ Source references TACREPs as a workflow output but does not define format, content, or delivery mechanism.

---

### Task
**Abbreviation:** N/A
**Workflow Tag:** `Output: Schedule, Input: Execution`

**Definition:**
The atomic unit of EW execution. A Task represents a single assignment of one asset to engage one target (SOI) within a specific time window. Tasks are the line items of a Schedule. Task types include Scheduled Tasks (pre-planned) and On-Call Tasks (ES-Triggered or On-Command). Task status is reported back from the weapon system during execution.

**Source Excerpt:**
> *"Mission Data: This category includes both the 'data out' from SEWOL (detailed Mission Plans and executable task lists) and the 'data in' from the weapon systems (task status changes...)."*
> — SEWOL Operational Vision (OVD) §2.3

**Source Documents:** SEWOL Operational Vision (OVD) §2.3 and §3.5; SEWOL Demo Kickoff slides
**Cross-References:** [Schedule](#schedule), [Asset](#asset), [SOI](#signal-of-interest-soi), [Plan](#plan), [Pairing](#pairing)
**Notes:** Task is one of the six named Common Data Models in the SEWOL architecture. Task types (Scheduled vs On-Call) are defined in OVD §3.5.

---

## 6. Roles & Organizations

---

### Authorizing Official
**Abbreviation:** AO
**Workflow Tag:** `Actor: Compliance`

**Definition:**
The Government official responsible for authorizing SEWOL to operate (Authority to Operate / ATO). The AO reviews the continuously-generated compliance evidence package (cATO) and is the single point of authority for security accreditation decisions.

**Source Excerpt:**
> *"As the SEWOL AO, I receive a continuously-generated cATO evidence package so that authorization is built throughout Phase I, not deferred to the end."*
> — Rise8 Technical Volume, Story S1.2

**Source Documents:** Rise8 Technical Volume S1.2
**Cross-References:** [RWG](#requirements-working-group-rwg), [SEWOL](#sewol)
**Notes:** Also referenced as "Government Authorizing Official" in some contexts.

---

### Combined Warfare Integration Cell
**Abbreviation:** CWIC
**Workflow Tag:** `Actor: Organization`

**Definition:**
The organizational element within a Component Command where the SIFE is embedded. The CWIC is the joint operational context in which SEWOL's outputs (COAs, schedules) are consumed and acted upon at the command level.

**Source Excerpt:**
> *"The SIFE is an MD3 team embedded with the Component Command (e.g., Space Forces Indo-Pacific [SFI]) Combined Warfare Integration Cell (CWIC)."*
> — SEWOL Operational Vision (OVD) §2.1

**Source Documents:** SEWOL Operational Vision (OVD) §2.1
**Cross-References:** [SIFE](#sew-integrated-fires-element-sife), [MD3](#mission-delta-3-md3)
**Notes:** ⚑ Referenced once as the organizational home of the SIFE. No further definition in source documents.

---

### Electromagnetic Warfare Operator
**Abbreviation:** EWO
**Workflow Tag:** `Actor: Plan → Pair → Schedule`

**Definition:**
The primary hands-on user of SEWOL. EWOs are personnel assigned to Mission Delta 3 (MD3) who execute the full Plan → Pair → Schedule workflow — ingesting orders, managing targets, running the scheduling engine, monitoring execution, and reporting results. SEWOL is designed to transform EWOs from single-system specialists into operators capable of commanding the full MD3 fleet.

**Source Excerpt:**
> *"The day-to-day, hands-on users of the SEWOL application will be the operators of Mission Delta 3 (MD3). SEWOL is intended to transform these personnel from single-system specialists into a unified force of EWOs, capable of employing the full range of MD3 assets."*
> — SEWOL Operational Vision (OVD) §2.1

**Source Documents:** SEWOL Operational Vision (OVD) §2.1
**Cross-References:** [SIFE](#sew-integrated-fires-element-sife), [MD3](#mission-delta-3-md3), [STO](#space-tasking-order-sto), [Plan](#plan), [Asset](#asset), [Schedule](#schedule), [Task](#task)
**Notes:** Source distinguishes EWOs (execution-level operators) from SIFE users (command-level planners). Sub-roles within the EWO population not yet defined in source documents.

---

### Find, Fix, Track, Target, Engage, Assess
**Abbreviation:** F2T2EA
**Workflow Tag:** `Actor: Framework`

**Definition:**
The joint targeting cycle framework that defines the end-to-end sequence of actions from detecting a target to assessing the results of engagement. SEWOL is designed to support and ultimately automate the full F2T2EA cycle for EW missions within a single unified system.

**Source Excerpt:**
> *"The entire 'Find, Fix, Track, Target, Engage, and Assess (F2T2EA)' cycle for a planned RMT mission now happens within a single, unified system."*
> — SEWOL Operational Vision (OVD) §5.2

**Source Documents:** SEWOL Operational Vision (OVD) §5.2
**Cross-References:** [EWO](#electromagnetic-warfare-operator-ewo), [SIFE](#sew-integrated-fires-element-sife), [Plan](#plan), [Schedule](#schedule), [CID](#combat-identification-cid), [TACREP](#tactical-report-tacrep), [MISREP](#mission-report-misrep)
**Notes:** F2T2EA is a joint doctrine framework not specific to SEWOL — included here because it is explicitly named as the operational framework SEWOL supports end-to-end.

---

### Mission Delta 3
**Abbreviation:** MD3
**Workflow Tag:** `Actor: Organization`

**Definition:**
The U.S. Space Force unit that operates SEWOL and the EW weapon systems it commands. MD3 personnel include both the EWOs who operate SEWOL day-to-day and the SIFE teams embedded at Component Commands. The full MD3 asset fleet (RMT, Bounty Hunter, Meadowlands) is what SEWOL is designed to unify under one C2 enterprise.

**Source Excerpt:**
> *"SEWOL is intended to transform these personnel from single-system specialists into a unified force of EWOs, capable of employing the full range of MD3 assets."*
> — SEWOL Operational Vision (OVD) §2.1

**Source Documents:** SEWOL Operational Vision (OVD) §2.1
**Cross-References:** [EWO](#electromagnetic-warfare-operator-ewo), [SIFE](#sew-integrated-fires-element-sife), [RMT](#remote-modular-terminal-rmt), [Bounty Hunter](#bounty-hunter-bh), [Meadowlands](#meadowlands-mdls), [SEWOL](#sewol)

---

### Requirements Working Group
**Abbreviation:** RWG
**Workflow Tag:** `Actor: Governance`

**Definition:**
The government-led body that holds final authority over the SEWOL product backlog prioritization. Rise8 participates in RWG sessions each Program Increment to translate requirements into a prioritized backlog. The RWG is the primary governance mechanism ensuring SEWOL development reflects warfighter needs.

**Source Excerpt:**
> *"Rise8 partners with the government-led RWG to refine the CNS into a prioritized product backlog (RWG holds final priority authority)."*
> — Rise8 Technical Volume, Management Approach

**Source Documents:** Rise8 Technical Volume Management Approach; CSOW §2.1
**Cross-References:** [EWO](#electromagnetic-warfare-operator-ewo), [SIFE](#sew-integrated-fires-element-sife), [AO](#authorizing-official-ao)
**Notes:** RWG meets per Program Increment. AOR availability for sprint demos and decision points is identified as a Government Furnished Support dependency.

---

### SEW Integrated Fires Element
**Abbreviation:** SIFE
**Workflow Tag:** `Actor: Plan, Customer: COA`

**Definition:**
The primary customer of SEWOL. The SIFE is an MD3 team embedded with the Component Command in the Combined Warfare Integration Cell (CWIC). The SIFE relies on EWOs and SEWOL for COA development, mission planning, and tactical assessments. The SIFE initiates COA Requests from Project 7 and selects from COA options before authorizing mission execution.

**Source Excerpt:**
> *"The SIFE is an MD3 team embedded with the Component Command (e.g., Space Forces Indo-Pacific [SFI]) Combined Warfare Integration Cell (CWIC). The SIFE relies on the EWOs and SEWOL for Course of Action (COA) development and tactical mission planning."*
> — SEWOL Operational Vision (OVD) §2.1

**Source Documents:** SEWOL Operational Vision (OVD) §2.1
**Cross-References:** [EWO](#electromagnetic-warfare-operator-ewo), [MD3](#mission-delta-3-md3), [COA](#course-of-action-coa), [COA Request](#coa-request), [CWIC](#combined-warfare-integration-cell-cwic), [Project 7](#project-7-p7)
**Notes:** The SIFE is the command-level customer; EWOs are the execution-level operators. The SIFE receives COA options and promotes one for execution.

---

## 7. Connected Systems & Integrations

---

### Chatsurfer
**Abbreviation:** N/A
**Workflow Tag:** `Input: Execution`

**Definition:**
A government chat platform that SEWOL uses to send tipping messages to other sensors during the Combat Identification (CID) process. When an unknown signal is detected, SEWOL can transmit an automated tip to a designated Chatsurfer room to cue a more capable Electronic Support sensor. Chatsurfer integration is a Phase 2 capability.

**Source Excerpt:**
> *"Tipping & Cueing: Generating and transmitting a 'tip' to a more capable Electronic Support (ES) sensor... via an automated message to a designated Chatsurfer room."*
> — SEWOL Operational Vision (OVD) §3.3

**Source Documents:** SEWOL Operational Vision (OVD) §3.3; Rise8 Technical Volume Phase II
**Cross-References:** [CID](#combat-identification-cid), [SOI](#signal-of-interest-soi), [EWO](#electromagnetic-warfare-operator-ewo), [Asset](#asset)
**Notes:** Chatsurfer integration is Phase 2 scope. Initial CID capability may require manual handling of chat responses.

---

### Cross Domain Solution
**Abbreviation:** CDS
**Workflow Tag:** `Input: Execution`

**Definition:**
A security-accredited mechanism for transferring data between systems operating at different classification levels. When EW weapon systems reside in a lower security domain than SEWOL's TS/SCI environment, a CDS must be used to pass mission data (task commands, status updates) between SEWOL and the weapon system.

**Source Excerpt:**
> *"When EW weapon systems reside in a lower security domain, a Cross Domain Solution (CDS) must be employed to transfer mission data between SEWOL and the EW weapons."*
> — SEWOL Operational Vision (OVD) §2.4

**Source Documents:** SEWOL Operational Vision (OVD) §2.4; Rise8 Technical Volume Phase II
**Cross-References:** [Asset](#asset), [RMT](#remote-modular-terminal-rmt), [Schedule](#schedule), [Task](#task)
**Notes:** CDS data transfer is a Phase 2 / Phase 3 capability tied to TS/SCI deployment. Not in scope for MVP.

---

### Globalview
**Abbreviation:** N/A
**Workflow Tag:** `Input: Plan`

**Definition:**
An external system that serves as the source for satellite transponder beam footprint data. SEWOL connects to Globalview to retrieve beam coverage areas used by the pairing engine to determine which assets are within range of a target. Globalview integration is a Phase 2 capability.

**Source Excerpt:**
> *"Globalview (or other transponder beam data source)... Phase II adds Globalview for transponder beam data."*
> — SEWOL Operational Vision (OVD) §2.2; Rise8 Technical Volume CSOW

**Source Documents:** SEWOL Operational Vision (OVD) §2.2; Rise8 Technical Volume CSOW
**Cross-References:** [Transponder Beam Footprint](#transponder-beam-footprint), [Target](#target), [Pairing](#pairing)
**Notes:** The OVD source listing notes "or other transponder beam data source" — Globalview is subject to change.

---

### Ion Trail
**Abbreviation:** N/A
**Workflow Tag:** `Input: Plan`

**Definition:**
An external system (alongside MIDB and MARS) that serves as a source for target intelligence data ingested by SEWOL. Used to populate and enrich target records within the SEWOL target data model. Ion Trail integration is a Phase 2 capability.

**Source Excerpt:**
> *"Ion Trail / Modernized Integrated Database (MIDB) / Machine-assisted Analytic Rapid-repository System (MARS)... Phase II adds... Ion Trail / MIDB / MARS for target intelligence."*
> — SEWOL Operational Vision (OVD) §2.2; Rise8 Technical Volume CSOW

**Source Documents:** SEWOL Operational Vision (OVD) §2.2; Rise8 Technical Volume CSOW
**Cross-References:** [Target](#target), [UOI](#user-of-interest-uoi), [NOI](#network-of-interest-noi), [SOI](#signal-of-interest-soi)
**Notes:** ⚑ Source identifies Ion Trail/MIDB/MARS as a target intelligence source but provides no further detail on data types or integration mechanism.

---

### Mission O/S Core
**Abbreviation:** N/A
**Workflow Tag:** `Defines: Platform`

**Definition:**
Rise8's pre-existing, productized DevSecOps platform on which SEWOL is built and deployed. Mission O/S Core provides the containerized Kubernetes infrastructure, CI/CD pipelines, compliance automation (cATO), and scaling capabilities that underpin all SEWOL services. It is Rise8 background IP delivered under a commercial license (Category A).

**Source Excerpt:**
> *"SEWOL platform as cloud-native containerized microservices on Kubernetes, deployed on Mission O/S Core (Rise8's productized path-to-production codified from IL4/IL5/IL6 delivery patterns)."*
> — Rise8 Technical Volume CSOW §2.2

**Source Documents:** Rise8 Technical Volume CSOW §2.2; Rise8 Technical Volume S1.1
**Cross-References:** [SEWOL](#sewol), [AO](#authorizing-official-ao)
**Notes:** Mission O/S Core is Category A (commercial) IP. All SEWOL-specific configuration and application code built on top of it is Category C (Government Purpose Rights).

---

### Project 7
**Abbreviation:** P7
**Workflow Tag:** `Input: Plan`

**Definition:**
A cloud-based regional C2 system being developed to provide combatant commands with a joint integrated framework that operationalizes the space tasking cycle. Project 7 is SEWOL's primary external interface — it is the source of STOs, COA Requests, and target data. SEWOL must remain operational even when the P7 connection is lost (DDIL resilience).

**Source Excerpt:**
> *"Project 7 is being developed as a cloud-based regional C2 system that will provide combatant commands with a joint integrated framework that operationalizes the space tasking cycle."*
> — SEWOL Operational Vision (OVD) §2.2

**Source Documents:** SEWOL Operational Vision (OVD) §2.2; Rise8 Technical Volume E3
**Cross-References:** [STO](#space-tasking-order-sto), [MTO](#mission-tasking-order-mto), [COA Request](#coa-request), [Target](#target), [SPINS](#special-instructions-spins), [SIFE](#sew-integrated-fires-element-sife)
**Notes:** P7 interface spec stability is identified as a Phase 1 schedule risk. SEWOL is built with manual-entry fallback for all P7-sourced data to maintain operations in degraded connectivity (DDIL).

---

### Surefire
**Abbreviation:** N/A
**Workflow Tag:** `Input: Plan`

**Definition:**
An external system that serves as the primary source for Commander's Deconfliction Assessment (CDA) data. SEWOL connects to Surefire to ingest CDA deconfliction windows that constrain the scheduling engine. Surefire integration is a Phase 2 capability; CDAs are entered manually in the MVP.

**Source Excerpt:**
> *"Surefire (or similar source for Commander's Deconfliction Assessments (CDAs))... Phase II adds Surefire and Shotfire (via Warpcore) for CDA ingest and deconfliction."*
> — SEWOL Operational Vision (OVD) §2.2; Rise8 Technical Volume CSOW

**Source Documents:** SEWOL Operational Vision (OVD) §2.2; Rise8 Technical Volume CSOW
**Cross-References:** [CDA](#commanders-deconfliction-assessment-cda), [SPINS](#special-instructions-spins), [Schedule](#schedule)
**Notes:** OVD notes "or similar source" — Surefire is subject to change. "Shotfire via Warpcore" is referenced as an alternative in the Technical Volume.

---

### Unified Data Library
**Abbreviation:** UDL
**Workflow Tag:** `Input: Plan`

**Definition:**
A government-managed repository of space domain data, including TLEs and other orbital parameters. SEWOL connects to the UDL to retrieve target orbital data (TLEs) needed by the pairing engine to calculate access windows. The UDL is part of the Warp Core ecosystem.

**Source Excerpt:**
> *"Phase I builds the live M2M interface to Project 7... validates UDL connectivity for TLE retrieval."*
> — Rise8 Technical Volume CSOW §2.3

**Source Documents:** Rise8 Technical Volume CSOW §2.3; SEWOL Operational Vision (OVD) §2.2
**Cross-References:** [TLE](#two-line-element-set-tle), [Target](#target), [GEO](#geosynchronous-orbit-target-geo)
**Notes:** Also referenced as part of "UDL / Warp Core." The Warp Core program office is noted as considering a single common application interface for its ecosystem.

---

*End of SEWOL Project Lexicon v1.0*

---

> **Flagged Terms (⚑ Thin Context):** SOCO, MSAP, MTO, JRFL, ROE, MEO, LEO, WARM, Signal Bundling, Local Obscura, Bounty Hunter, Meadowlands, TACREP, MISREP, CID, CWIC, Ion Trail
> These terms appear in source documents but have limited definitional context. Definitions are synthesized from available references. Validate with customer or operators before treating as canonical.
