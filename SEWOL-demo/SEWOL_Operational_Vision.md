# SEWOL Operational Vision Document

> **Source:** `SEWOL_Operational_Vision__attn4.pdf`
> This document was transcribed from a PDF via AI vision. All content is text-based — no embedded images were present. For authoritative reference, open the original PDF.

---

## 1.0 Introduction & Strategic Context

### 1.1 Purpose of the OVD

The Operational Vision Document (OVD) provides the operational vision for the Space Electromagnetic Warfare Operating Location (SEWOL) system, expanding upon the requirements defined in the SEWOL Capability Needs Statement (CNS). Its purpose is to describe the system from the viewpoint of the operator and the mission. It will serve as the primary narrative guide for potential performers, ensuring they understand the "what" and "why" of the system's required capabilities. This document is not a technical specification that describes exactly how each workflow should work; it is a description of how SEWOL will be used to execute the Electromagnetic Warfare (EW) mission, intended to provide essential context for the offeror's proposal. Innovative offeror solutions will apply advanced technologies where appropriate to improve the execution of the mission.

### 1.2 The SEWOL Mission

The core mission of the SEWOL program is to replace the current fleet of disparate, stove-piped, and manually-intensive C2 processes with a single, integrated, and data-driven software application. SEWOL will enable the transformation of Mission Delta 3's (MD3's) operators from system-specific specialists into a unified force of Electromagnetic Warfare Operators (EWOs), capable of commanding the full spectrum of available EW assets from a single software solution. The system will automate complex and time-consuming aspects of planning, scheduling, and battle management. This will reduce the potential for human error, provide operators with data-driven decision support, and accelerate the entire C2 cycle, thereby increasing the lethality and effectiveness of Space Force EW capabilities.

### 1.3 Doctrinal Foundation

SEWOL is not a standalone system; it is an execution engine designed to operate within the established doctrinal framework of the Joint Force and the U.S. Space Force. The system's workflows and design principles are directly guided by keystone publications for Joint Electromagnetic Spectrum Operations (JEMSO), Targeting, Planning, and Mission Command and DoW Application Programming Interface Technical Guidance. This ensures the tool will be intuitive for trained operators and will integrate seamlessly into the broader command and control structure.

### 1.4 The "Crawl, Walk, Run" Vision

The SEWOL program will employ an iterative, agile development approach. The vision for the system will be delivered in phases, providing value to the warfighter early and often.

- **Crawl (Minimum Viable Product (MVP)):** The MVP will focus on delivering a valuable, standalone planning and scheduling capability that automates the most burdensome manual tasks for the operators.
- **Walk (Minimum Viable Capability Release (MVCR)):** The MVCR will build upon the MVP by integrating a machine-to-machine (M2M) interface, initially for the Remote Modular Terminal (RMT) Block 0 and Block 1 weapon systems, enabling a fully automated, end-to-end mission execution cycle for that system.
- **Run (Objective System):** Subsequent releases will add additional weapon systems, enhance orchestration capabilities, and introduce other automation and Artificial Intelligence/Machine Learning (AI/ML)-based workflow improvements.

---

## 2.0 Operational Environment

### 2.1 The Users and Customers

- **Primary Users: Electromagnetic Warfare Operators (EWOs)**
  The day-to-day, hands-on users of the SEWOL application will be the operators of Mission Delta 3 (MD3). SEWOL is intended to transform these personnel from single-system specialists into a unified force of EWOs, capable of employing the full range of MD3 assets.

- **Primary Customer: The SEW Integrated Fires Element (SIFE)**
  The SIFE is an MD3 team embedded with the Component Command (e.g., Space Forces Indo-Pacific [SFI]) Combined Warfare Integration Cell (CWIC). The SIFE relies on the EWOs and SEWOL for Course of Action (COA) development and tactical mission planning, to execute tasked missions, and to report back tactical combat assessments.

### 2.2 The Systems

SEWOL is the central C2 application that will command and control a variety of connected weapon systems and interoperate with external data sources. The architecture must be extensible to accommodate future systems.

**Internal (Controlled) Systems** — EW weapon systems SEWOL will directly task and manage. The initial set includes:
- Remote Modular Terminal (RMT) — 76th Electromagnetic Warfare Squadron (EWS)
- Meadowlands (MDLS) — 4th EWS
- Bounty Hunter (BH) — 16th EWS
- *(Note: The SEWOL system's architecture is expected to be extensible to incorporate other future USSF, Joint, or Special Access Program [SAP] weapon systems with minimal re-engineering.)*

**External (Interfaced) Systems** — Key data sources and C2 systems that SEWOL will interoperate with:
- Project 7 — a cloud-based regional C2 system that will provide combatant commands with a joint integrated framework that operationalizes the space tasking cycle.*
- Ion Trail* / Modernized Integrated Database (MIDB) / Machine-assisted Analytic Rapid-repository System (MARS)
- Surefire* (or similar source for Commander's Deconfliction Assessments (CDAs))
- Globalview* (or other transponder beam data source)
- Unified Data Library (UDL) / Warp Core*
- Chatsurfer (or similar chat services)

> *Note: The Warp Core program office is currently considering implementing a single common application interface for connecting into the Warp Core ecosystem.*

### 2.3 The Data

The SEWOL system will process, create, and manage a wide variety of operational data. Key data types include, but are not limited to:

- **Tasking Orders & Guidance:** Higher-level orders and guidance such as the Master Space Attack Plan (MSAP)/Space Tasking Order (STO), Space Operation Control Order (SOCO), Special Instructions (SPINS), COA Requests, Commander's Deconfliction Assessment (CDA), and the Joint Restricted Frequency List (JRFL).
- **Target Data:** A comprehensive, structured model of targets. This includes hierarchical relationships between Users of Interest (UOIs), Networks of Interest (NOIs), and Signals of Interest (SOIs), as well as other target types such as satellites, specific transponders, and Dynamic Targeting Ranges. The system must be able to model and manage targets in all orbital regimes, including Geosynchronous (GEO), Medium Earth Orbit (MEO), and Low Earth Orbit (LEO).
- **EW Asset Data:** The health, status, location, and specific capabilities of every EW system in the fleet (Operational Capability [OPSCAP] data).
- **Mission Data:** This category includes both the "data out" from SEWOL (detailed Mission Plans and executable task lists) and the "data in" from the weapon systems (task status changes, radiated power levels, observed Electromagnetic Support (ES) data, Electromagnetic Attack (EA) data, and the resulting data used to inform Tactical Assessment).

### 2.4 The Classification Domains

The SEWOL system will be deployed and operated within the TS/SCI classification domain. When EW weapon systems reside in a lower security domain, a Cross Domain Solution (CDS) must be employed to transfer mission data between SEWOL and the EW weapons. The majority of development, integration, and testing can be performed in an unclassified environment and later migrated to the TS/SCI environment for hardening, additional testing, training, exercises, and operational use.

---

## 3.0 Core Operational Workflows

The SEWOL system is designed to support the full spectrum of the Joint Targeting Cycle as it applies to Electromagnetic Warfare. The following workflows describe the primary "day-in-the-life" activities that SEWOL must make more efficient, effective, and data-driven.

### 3.1 Fleet Management & Configuration

This workflow describes the foundational C2 functions required to manage the operational readiness and configuration of the connected EW weapon systems. This includes the initial on-boarding of new assets and provides the EWO with the tools to:

- **Schedule Future Maintenance:** Proactively schedule and deconflict future maintenance windows for EW systems to ensure asset availability for planned operations.
- **Configure Weapon Systems for Operations:** Configure key operational parameters such as arming and disarming, setting "lost communications" behavior, and managing unit-level emission authorizations.
- **Perform Basic System Maintenance:** Conduct first-echelon troubleshooting and maintenance on the weapon systems. This includes capabilities such as investigating system issues, viewing detailed system logs, and restarting individual software microservices on the remote asset.

### 3.2 Battlespace Monitoring & Preparation

This workflow describes the continuous activities the EWO performs to maintain constant situational awareness. The central component of this workflow is a geospatial map view that displays all relevant planning and situational awareness elements, such as blue and red orders of battle, satellite transponder footprints, scheduled weapon target pair assignments, and active engagements. From this view, the EWO can take additional actions appropriate to the subject system, such as manually adjust Effective Isotropic Radiated Power (EIRP) levels, or adjust weapon system pointing. In addition to the map, the EWO will utilize configurable dashboards to monitor the real-time health and operational readiness of the entire EW fleet (OPSCAP). The operator will also monitor which units (and channels) are engaging (emitting) or surveilling specific SOIs or other target types, their EIRP levels, and other critical data points such as the date/time of the last Built-In Test (BIT) and last system heartbeat. A key dashboard component is the Sync Matrix, a real-time timeline display of all scheduled EW missions set against the context of the wider operational picture (e.g. Joint All-Domain Operations [JADO]). The EWO will also monitor the health and performance of the SEWOL application itself through real-time application and resource monitoring dashboards. This "sense and understand" workflow ensures the operator is always prepared to respond effectively to new orders, threats, or system failures.

### 3.3 Target Discovery & Management

This workflow focuses on the EWO's role in curating and understanding the target landscape. It begins with SEWOL ingesting approved target lists from external sources and maintaining a history of target-related data (e.g., previous taskings, observed pattern of life). The system provides a clear visualization of the complex, hierarchical nature of space targets (UOI, NOI, SOI). A critical function of this workflow is managing targets with unknown Wartime Reserve Modes (WARMs). When a new signal is detected, SEWOL supports the full, closed-loop Combat Identification (CID) process. Based on the Commander's Accepted Level of Risk (ALR), this includes:

- **Unknown SOI Identification:** Providing the operator with a notification of the new observed signal, along with all available signal attributes/characteristics, and an assessment of whether there is enough data to correlate the signal to a known or scheduled target.
- **Tipping & Cueing:** Generating and transmitting a "tip" to a more capable Electronic Support (ES) sensor, either via a machine-to-machine (M2M) tasking or an automated message to a designated Chatsurfer room.
- **Response Ingestion & Correlation:** Ingesting the response from the tipped asset and correlating it back to the original request. The initial capability may require manual handling of chat-based responses, but the architecture is expected to support future AI/ML-driven automation for parsing unstructured chat messages and processing machine-to-machine messages back from the tipped asset.

### 3.4 Course of Action (COA) Development

This workflow describes SEWOL's role in supporting the SIFE during the Joint Targeting Cycle's Phase 3 (Capabilities Analysis). In response to a COA Request from Project 7, the EWO will use SEWOL to develop and analyze potential COAs, model outcomes based on different weapon-target pairing strategies, and send viable options back to the SIFE for consideration.

### 3.5 STO-Based Mission Planning & Execution

This workflow begins when SEWOL receives a formal, approved Space Tasking Order (STO) from Project 7. The EWO uses SEWOL to translate this order into a deconflicted, executable plan, managing various tactical task types like Scheduled Tasks and On-Call Tasks (which can be ES-Triggered or On-Command). The system dynamically manages the executing plan, gracefully handling disruptions. The system is envisioned to automatically attempt to retry a failed task on the same asset. If the retry is unsuccessful, SEWOL will then alert the operator and provide automated re-tasking recommendations. This workflow culminates in providing real-time Tactical Reports (TACREPs) and final Mission Reports (MISREPs).

### 3.6 Dynamic Re-tasking & Time-Sensitive Response

This workflow represents SEWOL's ability to support time-critical operations. Triggered by a time-sensitive target (TST) or other unexpected event, SEWOL will immediately alert the operator and present pre-calculated COAs. The EWO's role is to rapidly assess the recommendations, make a final "go/no-go" decision, and execute the new task, with the results automatically reported back to the command level.

---

## 4.0 Key System Attributes & Design Principles

### 4.1 Unified & Intuitive User Experience (UX)

The System minimizes operator cognitive burden by providing a unified, intuitive interface with a consistent design language comparable to leading consumer-grade Software as a Service (SaaS) platforms and operator-customizable dashboards tailored to role-specific workflows. The architecture will incorporate native support for natural language interfaces and Agent-to-Agent (A2A) protocols from inception, enabling Large Language Model (LLM)-powered task execution, autonomous workflow orchestration, and seamless human-AI collaboration. The design prioritizes progressive disclosure, contextual awareness, and intelligent automation to reduce manual overhead while preserving operator situational awareness and control authority.

### 4.2 Data-Centric Architecture

The SEWOL program regards data as a strategic asset, and the system's architecture will reflect this principle. The offeror will propose a robust Data Model that accurately represents the complex, hierarchical entities of the space EW domain (e.g., targets, assets, missions). This model, and its underlying database schema, will be government-owned. All data ingested by or generated within SEWOL must be captured in this structured repository. This comprehensive data collection is not just for forensic analysis; it is the essential fuel for the program's long-term "Run" state vision. The architecture will be designed from Day 1 to support a future, formal ontology that will enable advanced AI/ML-driven capabilities like predictive analysis and automated decision support. SEWOL should follow DoD Data Strategy and the VAULTIS goals (i.e. Visible, Accessible, Understandable, Linked, Trusted, Interoperable, and Secure).

### 4.3 Human-Machine Teaming & Decision Support

SEWOL will function as a collaborative partner to the operator. The system will augment the EWO by automating complex analysis and providing clear recommendations, but the final authority and operational judgment will always reside with the human in the loop, in line with Mission Command doctrine.

### 4.4 Automation & Orchestration Engine

The core of the system is an engine that manages complex workflows in both plan-driven and event-driven modes. It will be responsible for translating plans into a synchronized sequence of actions and gracefully handling real-time disruptions like task failures, asset status changes, or loss of communication to EW assets. Architecture and design should be flexible enough to integrate agentic AI.

### 4.5 Open Architecture: A Containerized Microservices Approach

The SEWOL system will be built upon a modern, cloud-native architecture of containerized microservices. This MOSA implementation ensures strong isolation, technology flexibility, and independent deployment of capabilities, with all communication governed by government-owned APIs.

### 4.6 Continuous Integration & Automated Verification

The program will embrace a culture of "test early, test often." All software, including 3rd party capabilities, will be integrated into CI/CD pipelines (per microservice) that automatically executes a comprehensive suite of tests (unit, integration, performance, security) with every code commit, ensuring the system is always in a stable, test-proven state.

### 4.7 Modern Digital Support & Training Ecosystem

The vision for supporting the SEWOL operator is one of empowerment and intuitive design, mirroring the user-centric experience of leading commercial SaaS platforms. This ecosystem is envisioned to have two core components: a web-based, searchable Digital Support Experience and an In-House Expertise Program centered on a government-led, "train-the-trainer" model.

---

## 5.0 The Phased Rollout: From MVP to Final Vision

The SEWOL program will be delivered iteratively, with capabilities phased to provide value early and often. This section describes the scope of the initial major releases—the "MVP" and the "MVCR"—which represent the "Crawl" and "Walk" phases of our strategy. The competitive acquisition strategy will evaluate bidders on their ability to deliver a compelling MVP and their plan to rapidly achieve the MVCR and beyond.

### 5.1 The MVP Scope (Phase 1)

The MVP is the first product release, focused on revolutionizing the EWO's planning and decision-making process. It delivers a powerful "brain" that automates the complex and error-prone aspects of manual planning. It will integrate SEWOL with the broader C2 enterprise via a live interface to Project 7. It must be resilient, allowing the operator to continue the planning mission even if the P7 connection is lost.

**From the Operator's Perspective:** *With the MVP, an EWO can ingest a formal STO directly from Project 7 or create one from scratch. They can manage their GEO-only targets and visualize the battlespace on a map. Then, with a single command, they can initiate an automated process that pairs the best assets to their tasks and generates a complete, deconflicted schedule. They can visualize this entire plan on a Sync Matrix timeline to ensure it aligns with the broader operation. The final output is a validated, exportable schedule, that can be handed to the EW system operators for execution.*

The MVP will provide the following key capabilities:

- **Interfaces:** A live machine-to-machine (M2M) interface with Project 7 for data exchange.
- **Resilient Planning Workflow:** The full "Plan-Pair-Schedule" workflow for GEO-only targets, with the ability to function even if the connection to Project 7 is down by allowing the operator to manually create all necessary tasking orders (STOs, SPINS, etc) and target data. The end result is an exportable, human-readable enterprise schedule that can be handed off to the individual crews.
- **Situational Awareness for Planning:**
  - A geospatial map view to visualize planned tasks and relevant target/asset information.
  - A Sync Matrix timeline to deconflict and synchronize the generated schedule against the JADO context.
  - An Asset Status Dashboard to view the manually configured status and readiness of the EW fleet.
- **Developer SDK:** A mature Software Development Kit (SDK) must be delivered to enable future third-party development of C2 adapters.

**Exceeding the Baseline:** The capabilities listed above represent the minimum acceptable baseline for the MVP. A key evaluation factor will be the offeror's ability to exceed this baseline in their initial delivery. Examples of superior competitive deliverables include, but are not limited to, achieving a continuous Authority to Operate (cATO), P7 COA development workflow, the early delivery of a mature Digital Support Center, initial Chatsurfer integration, or coordinated engagements such as support for MEO/LEO targets.

### 5.2 The MVCR Scope (Phase 2)

The MVCR is the second major release and represents the "Walk" phase of our strategy. It builds directly upon the MVP's planning capabilities by "connecting the brain to the arms." Its primary objective is to close the loop on the end-to-end mission cycle for the first weapon system, proving the viability of the entire C2 enterprise. The emphasis in this delivery is on the ability to *execute end-to-end RMT missions*.

**From the Operator's Perspective:** *An EWO can now take a plan they've created and, with a single click, send the tasks directly to the RMT weapon system for automated execution. The EWO can still export the schedule for non-connected weapon systems. As the mission unfolds, they can monitor the RMT's actions and status in real-time on their dashboards. If the RMT detects a new, unknown signal, SEWOL will guide the operator through the Combat ID process, helping them tip other sensors via chat if needed. When the mission is complete, the results are automatically ingested back into SEWOL, allowing the operator to immediately begin their tactical assessment. The entire "Find, Fix, Track, Target, Engage, and Assess (F2T2EA)" cycle for a planned RMT mission now happens within a single, unified system.*

The MVCR will include all capabilities of the MVP, plus the following capabilities deployed to the operational environment:

- **Live Weapon System C2:** A live, M2M interface for RMT weapon systems, enabling automated tasking and real-time status reporting.
- **Live Execution Monitoring:** The introduction of real-time dashboards for monitoring the execution of the live RMT missions.
- **Live Mission Operations & Assessment:** The introduction of the full Combat ID (CID) workflow loop, allowing operators to manage and react to unknown signals detected by the live RMT. This includes support for tipping other sensors via chat-based orchestration, and subsequent engagement when appropriate. This capability also includes the automated ingestion of mission results from the RMT to support the Tactical Assessment / Change Assessment workflow.
- **Course of Action (COA) Development:** Prior to creation of the STO, SEWOL supports SIFE users at the Regional C2 by receiving COA Requests (or Space Support Requests) from Project 7, using its knowledge of real time system status, target details and weapon capabilities and limitations to respond with possible COA's to meet the draft objectives.

**Exceeding the Baseline:** The capabilities listed above represent the minimum acceptable baseline for the MVCR. Earlier implementation of Phase 3 capabilities is highly encouraged.

### 5.3 The "Run" State Vision (Phase 3)

The objective "Run" state for SEWOL is a fully integrated C2 enterprise. This includes M2M interfaces to the full fleet of EW weapon systems, support for all orbital regimes, and the introduction of advanced AI/ML capabilities. These capabilities will automate the interpretation of unstructured orders, provide predictive COA analysis, and enable the system to perform dynamic, semi-autonomous re-tasking, allowing the EWO to focus on the more complex and critical operational decisions.

---

## Appendix A: Scheduling Engine Considerations

### A.1 Purpose

This appendix provides a detailed, though not exhaustive, list of the key factors, constraints, and variables that the SEWOL Planning & Scheduling Engine must consider when performing automated weapon-target pairing and generating a deconflicted schedule. The offeror's proposed solution must describe a credible approach to incorporating these considerations into their planning logic.

### A.2 Core Input Categories

The planning engine must be able to process information from the following categories to generate a valid and effective mission plan.

#### A.2.1 The Tasking & Constraints

- **The Space Tasking Order (STO):** The specific tactical tasks, desired effects, and mission objectives to be achieved.
- **Commander's Deconfliction Assessments (CDAs):** Contains time-based "deconfliction windows" where a specific weapon system must limit its radiated power toward a specific satellite.
- **Special Instructions (SPINS):** Relevant Rules of Engagement (ROE), Acceptable Level of Risk (ALR), procedural requirements, and other guiding principles that may affect which tactics or assets can be used.

#### A.2.2 The Target Environment

- **Target Data:** All characteristics of the specified targets, including their priority, category, and any known hierarchical relationships (UOI/NOI/SOI).
- **Target Location & Orbit:** The target's location, derived from its TLEs or state vectors. The engine must be able to calculate access windows for targets in all orbital regimes (GEO, MEO, and LEO).
- **Transponder Beam Footprint:** The geographic area covered by the target's transponder, which can be confirmed by ingested data (e.g., KML files) or recent operational data.

#### A.2.3 The Weapon System's Capabilities & Status

- **Weapon System Status:** The real-time or most recently updated operational status of each asset in the fleet (e.g., Available, In-Mission, In-Maintenance).
- **Weapon Capabilities & TTPs:** The specific capabilities, tactics, techniques, and procedures (TTPs) that each weapon system is able to perform. The MVP is not required to automatically select a TTP, but it must know which TTPs are available for a given asset. The MVCR will need to perform TTP selection.
- **Software Defined Radios (SDRs):** The number of available SDRs per weapon system, as this is a primary constraint on how many tasks an asset can perform concurrently.
- **Signal Bundling:** The ability of a specific SDR to engage multiple Signals of Interest within a single frequency range simultaneously.
- **Available Power:** The current power budget of the weapon system, accounting for dynamic power loads required for different tasks.
- **Overhead Times:** The required prep and tear-down times for an asset to perform a given task.

#### A.2.4 The Physical & Electromagnetic Environment

- **Weapon System Location:** The physical location of the ground-based EW asset.
- **Local Obscura:** The static, pre-defined "mask" of minimum elevation angles by azimuth for each weapon system, which is part of its configuration profile.
- **Dynamic Obscura:** The ability to account for potential line-of-sight blockages from other moving satellites.
- **Required Effect Level:** The required Signal-to-Noise Ratio (SNR) or Effective Isotropic Radiated Power (EIRP) needed to achieve the desired effect on a target, which may be a default value or a more accurate figure confirmed by recent operational tasking.

### A.3 Advanced Orchestration Considerations

For future capabilities beyond the MVP, the planning engine's architecture must be extensible to support advanced orchestration, such as planning coordinated engagements between two or more EW systems to service a single target that may have geographically separated uplink and downlink transponders.
