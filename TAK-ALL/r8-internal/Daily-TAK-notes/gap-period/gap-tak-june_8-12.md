# Weekend Pre-plan

## SEWOL

1. Glossary
2. Quick Ref/Cheat Sheet
3. Assumptions --> 
4. Mission Model Canvas (skill)

---

## SOAP

1. Fix Problem Statements
    * Problem Drafting Skill
2. Backlog - Issue drafting
3. Current-State VSM
4. Mission Impact Map
3. OOR
2. Setup Env
    * Run Prototype "arclight"

---

## AI GRG

1. Assumptions --> Experiments
2. Hypothesis
3. Current State VSM
    * Future State VSM
3. Outcome Oriented Roadmap
3. Setup AI GRG 
    * Android Studio
    * Get Repo & Run Apps again


---

## RISE 8

1. Personal Review
2. Peer Reviews
3. AI in the Balanced Team

===

# PM Read out and review of SEWOL_Operational_Vision document

### Summary
The review covers the operational vision and core requirements for the space electronic warfare modernization program.

**Modernizing Electronic Warfare Operations**
The program replaces manual command and control processes with an integrated application to improve operational speed. This transformation unifies electromagnetic warfare operators through automated decision support.

**Architecture and Data Strategy**
The phased rollout utilizes machine to machine interfaces to advance from planning tasks to full weapon system orchestration. Data management adheres to government strategies to ensure security and interoperability.

**Minimum Viable Product Requirements**
The system focuses on automating planning workflows while maintaining resilience against potential data link failures. Achieving continuous authority to operate represents the standard for successful delivery.

### Details

**Meeting Purpose and Introduction:** Abel conducted a review of the SEW (Space Electromagnetic Warfare Operating Locations) Operational Vision Document (OVD) to provide context for a demo project assigned to their team by Rise8. The SEW project, also referred to as SEWOL, is defined as a space electronic warfare system designed to modernize current operations (00:00:18). Abel noted that the OVD is intended to provide the "what" and "why" of system requirements from an operator's perspective rather than acting as a strict technical specification (00:02:17). The document structure includes sections on strategy context, operational environments, workflows, design principles, and a phased rollout plan (00:00:18).

**SEW Program Core Mission and Modernization Goals:** The primary mission of the SEW program is to replace disparate, "stovepiped," and manually intensive command and control (C2) processes with a single, integrated, and data-driven software application (00:03:57) (00:09:30). Abel highlighted that this is a modernization effort aimed at transforming Mission Delta 3 (MD3) operators from system-specific specialists into a unified force of Electromagnetic Warfare Operators (EWOs). By automating complex aspects of planning, scheduling, and battle management, the system aims to reduce human error, provide data-driven decision support, and accelerate the C2 cycle to increase the lethality and effectiveness of Space Force electromagnetic warfare capabilities (00:03:57) (00:08:20).

**Key Performance Indicators and Success Metrics:** Abel identified several expected outcomes and behavioral changes the system must achieve, specifically focusing on error reduction and increased operational speed (00:07:15). They emphasized the need to understand current error baselines in manual planning and noted that "data-driven decision support" implies the current state involves reactive assessment using stale or manually aggregated data. The ultimate mission success is measured by the system's ability to accelerate the C2 cycle, which Abel identified as the core driver for increasing lethality and effectiveness (00:08:20).

**Strategic Alignment and Integration Framework:** The SEW system is designed as an execution engine that operates within established US Space Force and Joint Force doctrinal frameworks, specifically adhering to Keystone publications for Joint Electromagnetic Spectrum Operations (JEMSO). Abel noted that the system's workflows must align with DAF application programming interface technical guidance to ensure the tool is intuitive for trained operators. This alignment is intended to allow SEW to integrate seamlessly into the broader command and control structure (00:10:45).

**Phased Rollout Strategy (Crawl, Walk, Run):** The program utilizes an iterative agile approach delivered in three distinct phases: Crawl (MVP), Walk (MVCR), and Run (Objective System). The Crawl phase focuses on a standalone planning and scheduling capability to automate burdensome manual tasks (00:12:06). The Walk phase, or Minimum Viable Capability Release (MVCR), adds machine-to-machine (M2M) interfaces for remote modular terminal weapon systems to enable automated end-to-end mission execution. The Run phase targets the objective system, adding additional weapon systems, enhanced orchestration, and AI/ML-based workflow improvements (00:13:15).

**User Personas and Organizational Stakeholders:** Abel identified the primary users as Electromagnetic Warfare Operators (EWOs) and the primary customer as the SEW Integrated Fires Element (SCYTHE) (00:13:15). The SCYTHE is an MD3 team embedded with the Space Force Indopacific (SFINDOPAC) combined warfare electromagnetic cell. The SCYTHE relies on SEW for course of action (COA) development and tactical mission planning, making the system a central C2 application for managing various weapon systems (00:14:56).

**Data Management and Technical Ecosystem:** The SEW system will interface with various internal and external systems, including the United Data Library (UDL), Warp Core, Chat Surfer, and Ion Trail (00:14:56). Abel noted that Warp Core is considering a single common application interface for its ecosystem. The system must manage diverse data types, such as tasking orders, target data, and asset data, following DoD data strategy "VAULT" goals (Visible, Accessible, Understandable, Linked, Trusted, Interoperable, and Secure).

**Classification and Security Domain Constraints:** The system will operate within Top Secret (TS) and Sensitive Compartmented Information (SCI) domains, necessitating a Cross-Domain Solution (CDS) to transfer data when weapon systems reside in lower security domains (00:16:15). Abel noted that while development and initial testing can occur in unclassified environments, the product must eventually be migrated to TS/SCI for hardening and operational use. They mentioned that managing unclassified and classified versions of systems is a familiar challenge from previous projects like OSIT (00:17:34).

**Core Operational Workflows - Fleet and Battle Space:** Abel detailed several critical workflows, including Fleet Management (maintenance and configuration) and Battle Space Monitoring (00:17:34). The monitoring workflow utilizes a geospatial map view to display situational awareness elements like blue and red orders of battle and satellite footprints. Operators will use configurable dashboards to monitor the real-time health (OPSCAP) and operational readiness of the EW fleet, including metrics like effective isotropic radiated power (EIRP) levels and system heartbeats (00:19:04).

**Core Operational Workflows - Mission Execution:** Additional workflows include target discovery (identification and correlation), COA development, and Space Tasking Order (STTO) based planning. Abel highlighted dynamic retasking as a key capability for responding to time-sensitive targets or unexpected events. They specifically noted a need to clarify what "Project 7" refers to, as it is a recurring source for formal STTOs within these workflows (00:21:54) (00:29:19).

**Design Principles and User Experience (UX):** The system aims for a unified UX comparable to leading consumer-grade SaaS platforms to minimize cognitive burden (00:23:19). Abel highlighted that the architecture will support natural language interfaces and agent-to-agent (A2A) protocols from inception to enable LLM-powered task execution. The design prioritizes progressive disclosure and context awareness to reduce manual overhead for the operators (00:24:44).

**Architectural Requirements and AI Readiness:** SEW will employ a data-centric architecture where the government owns the data model and schema. Abel explained that the system is designed to support a future formal ontology for AI/ML-driven predictive analysis and automated decision support (00:24:44). The core includes an automation and orchestration engine capable of handling real-time disruptions like task failures or loss of communications (00:26:35).

**MVP Requirements and Success Criteria:** The MVP is specifically focused on revolutionizing the EWO's planning and decision-making process by creating an automated "brain" for manual planning. It must integrate with Project 7 but remain resilient enough to allow planning even if that connection is lost (00:29:19). Key capabilities include M2M interfaces, resilient planning workflows (plan, pair, schedule), situational awareness dashboards, and a developer SDK to enable future third-party C2 adapters (00:30:28).

**Exceeding the MVP Baseline:** Abel noted that simply meeting the MVP requirements is considered a "minimal acceptable baseline" (00:26:35) (00:31:44). Competitive deliverables should aim to exceed this by achieving a Continuous Authority to Operate (cATO), delivering a mature digital support center, or integrating initial Chat Surfer functionality. Supporting engagements for Medium Earth Orbit (MEO) or Low Earth Orbit (LEO) targets was also mentioned as a way to exceed requirements (00:26:35) (00:33:26).

**Future Capabilities and Appendix Insights:** Appendix A.3 outlines advanced orchestration considerations for capabilities beyond the MVP, such as coordinated engagements between multiple EW systems for a single target (00:33:26). Abel concluded the review by emphasizing the need to discuss these MVP goals with Dan Montgomery to determine if the team's current work is intended to fill the gaps identified in the OVD (00:28:09).

### Next steps
[Abel] Define Workflows: Analyze the current planning scheduling and battle management processes to establish a comprehensive end to end understanding of system requirements.
[Abel] Analyze Error Baselines: Investigate current human error rates and operational baselines to inform future project efficiency goals.
[Abel] Consult Team: Contact Sager or Evan to discuss the machine to machine interface requirements for remote modular terminal block systems.
[Abel] Clarify Fleet Composition: Determine the specific components and weapon systems that constitute the electromagnetic warfare fleet for the asset status dashboard.
[Abel] Interview Dan Montgomery: Discuss the minimum viable product scope and objectives with the principal solutions architect.
[Abel] Research Project 7: Clarify the definition and operational scope of the entity referred to as project 7.
[Abel] Review Web Dart: Analyze the historical project documentation and data regarding the previous delta operational experiences.

===

## Stand-up: TAK Beach Gap, June 8 

### Summary
The meeting covered roadmap development and user research updates, with an asynchronous retrospective ownership decision established.

Roadmap and Planning Strategies
Planning initiatives prioritize outcome-oriented roadmaps for plugins and orchestrations. Mission impact mapping and value stream delivery definitions remain key focus areas.

Research and Architecture Alignment
Hybrid interviews will validate future state assumptions for Software Development Kits. Prototype development involves integrating codebases and extracting architecture components.

Operational Strategy and Roles
Roles and responsibilities for upcoming projects require clarification to maintain team alignment. The team decided that 1 lead will manage the asynchronous retrospective process.

### Details

**Introductions and Environment Update:** The team opened the meeting with casual conversation regarding their respective work environments, with Zachary joining from a mountain location. Participants shared brief updates on their weekends before transitioning into the formal agenda.

**Roadmap and Planning Overview** Abel announced plans to collaborate with Mary on outcome-oriented roadmaps for the ARGRG plugin and the SOAP orchestration future state, specifically creating problem statements for the roadmap. The team also intends to review the backlog for prototype spikes and chores, finalize the value stream app for delivering plugins with software, and conduct mission impact mapping for these domains.

**Midyear Evaluations:** Mary reminded the team to begin working on their midyear evaluations, noting that they are due on a federal holiday and suggesting that everyone start chipping away at them to avoid working that day.
Seaw Wall Kickoff: Mary noted that the team has an invitation to the Seaw wall kickoff meeting scheduled for the afternoon.

**User Research and SDK Architecture:** Jonathan described plans to conduct hybrid interviews, including a session with an ex-Air Force JTAC, to validate the connection between current mission use and future state assumptions. Jonathan is also focusing on the SOAP orchestration concept, specifically how design, doctrine, and user experience fit into an SDK that could be utilized across SOCOM TAC plugins in the future. They invited Thomas and Andrew F to participate in these ongoing architectural discussions.

**Lattice Planning and ATAC Research:** Sean Herbert planned to focus on Lattice planning and catching up on Seaw wall documentation. Additionally, Sean Herbert mentioned a connection with extensive ATAC experience and offered to arrange an interview if the team is interested in user research regarding situational awareness and tactical air control party planning.

**Prototype Development and Repository Management:** Zachary intends to pull the Arclight code into the repository and integrate it with their ongoing prototype work to make it available for the rest of the team.

**Technical Troubleshooting and Security Training:** Andrew F reported issues with Android Studio and artifact building, noting that the TAC application crashes upon starting on their emulator. Andrew F requested tips from the team to resolve this and noted that they have gained access to security controls, which will require time to complete mandatory security training.

**Mission Core Repository and Architecture:** Thomas confirmed they successfully set up the repository for Mission Core. Their plan is to catch up on documentation regarding Seaw wall, begin Lattice reviews, and evaluate the Arclight architecture to determine what components can be extracted into a separate SDK.

**TAC Server Integration and Resource Management:** Andrew Knife worked on integrating the TAC server into the TAC planner prototype but experienced major resource issues with their pod, which they believe they have now resolved. After taking time away to assist the Pierce family, Andrew Knife plans to continue working on this integration, complete Lattice reviews, and prepare for the Seaw wall meeting.

**Prototype Debugging and Document Review:** Jerod Culpepper noted that they spent the previous day working on the prototype and encountering bugs. Jerod Culpepper plans to review Seaw wall documents and conduct peer reviews. They also offered to pair with Andrew F to help troubleshoot the prototype issues.

**Operational Logistics and Meeting Strategy:** Abel established that Thomas will own the async retro process, leading Slack threads for updates on Tuesdays and Thursdays. The team discussed the upcoming Seaw wall kickoff, agreeing that they need to clarify roles and responsibilities with Dan Montgomery to avoid burnout and ensure alignment with existing work like TAC land management and SOAP orchestration. Sean Herbert noted that the acronym SEAW stands for Space Electromagnetic Warfare operating location.

### Decisions
**ALIGNED**
Async standup schedule established Async standup updates are established to occur on Tuesdays and Thursdays, with Thomas designated to initiate the Slack threads.

### Next steps
[The group] Midyear Evaluations: Start progress on midyear evaluations.
[Jonathan] Conduct Interviews: Interview Air Force JTAC and project stakeholder to validate assumptions.
[Zachary] Update Arclight: Pull Arclight from repository and integrate with prototype to share with team.
[Andrew F] Fix Emulator: Troubleshoot Android Studio emulator crash and configure development environment.
[Andrew F] Security Training: Complete required security training sessions.
[Thomas] Sync with Abel: Consult with Abel regarding project requirements after the design meeting.
[Thomas, Andrew Knife, Jerod Culpepper] Review Documents: Read provided Seaw wall documentation before the kickoff meeting.
[Thomas, Andrew Knife] Lattice Reviews: Complete pending lattice reviews.
[Thomas] SDK Architecture: Analyze Arclight architecture for potential extraction into a separate SDK.
[Andrew Knife] Restore Prototype: Fix resource constraints on the pod and complete integration of the tax server.
[Thomas] Manage Async Updates: Lead the async update process on Slack for Tuesdays and Thursdays.
[Unassigned] Clarify Roles: Ask Dan Montgomery to define roles and responsibilities during the kickoff to prevent resource conflict.

===

# Backlog Review and WIP for Prototype spikes and chores , Jun 8 [gemini-trascript]

### Summary
Project development and research status were reviewed with infrastructure blockers leading to a pause on setup.

**Prototype and Research Progress**
Marker placer development has officially initiated following the successful completion of the mission data research phase. These efforts provided necessary insights for project requirements.

**Infrastructure Blockers and Decisions**
Unresolved Virtual Machine access issues stalled technical progress. Work on project setup tasks was officially paused to prevent premature resource allocation.

**System Design and Preparation**
Collaboration on design system prototypes and the distribution of client documentation occurred to support team readiness. These materials improve the quality of upcoming client discussions.

### Details

**Marker Placer Prototype Development:** Abel directed Zachary to develop the marker placer component with the goal of establishing a working tech and web tag locally. Zachary is responsible for creating a "CMP KMP prototype" folder and uploading the code to the GitLab repository so that Thomas and Andrew Ferguson can pull the code, test it, and validate its functionality (00:00:01) (00:15:27). Zachary is currently in the process of cloning the repository to integrate the prototype (00:02:49).

**Linux Virtual Machine Access:** Zachary reported that expanding into TAX requires a Linux machine, and they have been unable to obtain an approved list or a viable Virtual Machine (VM) despite submitting an inquiry through IT tools. Zachary intends to follow up with a specific contact to resolve this blocker, noting that progress on testing is stalled until the VM is acquired.

**Mission Core Repository Location:** Abel and Mary confirmed the directory location for the Mission Core project, identifying it as the "Mission Core Temp" folder (00:01:59).

**Completion of Mission Data Research:** Thomas confirmed the research spike regarding mission data—specifically regarding sync, live presence, and telemetry—is complete and can be marked as done (00:03:45). Thomas clarified that the document provides a comprehensive overview of data models across different project phases, with phases four and five being the most relevant for client-facing discussions regarding team awareness and information exchange (00:07:00). Abel plans to finalize the status of this ticket by adding it to a "done" column (00:11:03).

**Prioritization and Future Work:** Thomas indicated they will wait until after a 4:00 PM meeting to determine the next steps and whether to pick up additional project setup tasks (00:11:03). Consequently, Abel decided to pause further work on the project setup to avoid premature commitments (00:12:51) (00:18:59).

**Design System Prototype:** Thomas and Zachary discussed establishing a prototype plugin for the Arclight design system. This task will involve setting up a new subgroup and split-out repositories, which will align with the broader effort to organize the project modules (00:12:51) (00:20:01).

**Andrew Ferguson’s Assignment and Device Access:** Andrew Ferguson has a scheduled meeting with Max at 2:00 PM to discuss potential assignment to the tag contract and the acquisition of a tag device. Abel noted that allocation is handled by leadership but confirmed there is no issue with inquiring about device access (00:18:00). Additionally, Abel will contact Lakshmi to facilitate necessary system access for Andrew Ferguson (00:23:07).

**Client Documentation and Preparation:** Abel has uploaded documentation to the Cloud SAS version to assist the team in preparing for upcoming client calls. Abel encouraged the team to review these materials to generate informed questions, noting that a glossary is currently being developed using Claude to support this preparation (00:21:20).

### Decisions
**ALIGNED** Client documentation presentation scope The strategy for client-facing documentation is limited to phases 4 and 5, as these sections contain the most relevant information for the client.
LLM adapter task priority The Large Language Model adapter task is formally classified as a low-priority item for the project backlog.

### Next steps
[Zachary] Update Prototype: Push the marker placer code to the GitLab repository for testing. Integrate this prototype with the existing mission core repository.
[Zachary] Request VM Access: Contact IT or a specific team member to secure a Linux machine for TAC expansion. Follow up on the initial inquiry regarding a viable virtual machine.
[Zachary] Fix TAC Component: Resolve issues within the tactical component once the necessary environment is available. Coordinate with the team to ensure cooperation with the new machine.
[Thomas] Test Prototype: Download and test the marker placer code after it is uploaded to the repository. Verify the functionality once the code is available.
[Thomas] Configure Project Setup: Complete the mission core project setup on GitLab. Finalize the organization of the sub-group and modular repositories.
[Abel] Request Access: Message Lakshmi to facilitate system access for Andrew Ferguson. Ensure he has the necessary permissions required for his role.
[Thomas] Develop Design Library: Build a prototype plugin for the Arclight design system. Coordinate this task alongside setting up the new repository subgroup.

===

# AI GRG outcomes, Jun 9th [gemini-transcript]

### Summary
The project team reviewed Gridded Reference Graphics (GRG) outcomes for production documentation and aligned on Artificial Intelligence modeling features.

### Documenting Project Outcomes
The team identified core Gridded Reference Graphics capabilities for production. This ensures project documentation accurately reflects delivered features like imagery handling and Artificial Intelligence detection.

### Artificial Intelligence and Labeling
Technical teams confirmed the transition to the You Only Look Once (YOLO) model for improved detection. Advanced algorithms now replicate human operator behavior for intelligent building labeling.

### Operational Workflow Improvements
Significant upgrades like nested radial menus and operational section definitions enhanced grid configurations. Auto-generated legends provided necessary advancements for exporting Gridded Reference Graphics.

### Details

**Project Outcome Identification:** Abel initiates a review to document successful outcomes for Gridded Reference Graphics (GRG) creation that were delivered during the competition and bridge contract phases. The goal is to credit the team for these features in production, ensuring they are not lost in the documentation gaps. They focus on identifying high-level capabilities, including imagery handling, grid definition, section definition, drawing, AI detection, labeling, and GRG export.

**AI Building Detection Functionality:** The team clarifies the on-device AI building detection feature. Jonathan notes that the tool provides two specific functions: 
* one that detects buildings within the entire grid and 
* another that detects buildings within a single drawn section.

**Model Verification (YOLO vs. Yolt):** The team discusses the current state of the AI model. While there was previous confusion regarding "YOLT" versus "YOLO," Zachary confirms the current model is YOLO. The team notes that the transition to YOLO addressed issues with false and double detections, though they lack specific, current recall percentage figures.
> Abel's takes: Go back to this, There was a % number that Yi called out in demos and other docs. Is that relevant still?

**Sliding Window and Zoom Stability**: Regarding AI accuracy, Jonathan and Zachary confirm the implementation of a "sliding window" method ensures consistent detection quality across both single sections and full grids. Furthermore, locking the zoom level to 19 ensures that the system captures images at the correct distance for optimal detection, providing reliability across repeated runs.
> Abel's takes: This is at least one candidate for a mission-outcome, So the feature/capability is AI Building Detection, However the specific Output that could inform the hypothesis is "Sliding Window Method at 19 zoom level" Did what and by how much? We have some baselines. CANDIDATE! [AI-DETECTION]

**Advanced Labeling Algorithm:** The team discusses the advanced labeling algorithm, noting that Kevan developed it to replicate human operator behavior. Rather than simple sequential numbering, the system is designed to label buildings intelligently, adapting to complex or irregular layouts in a way that mimics how human operators typically perform the task. [LABELING-ALGORITHM-a]
> Abel's takes: Yes, this is the main feature/capability "advanced labeling" via an algorithm, however what are some SPECIFIC outputs that we can turn into outcomes? 

**Labeling Schemes and Flexibility:** Jonathan explains that the team implemented various labeling schemes (e.g., top-down, left-right, reading order) to accommodate different operator habits. Additionally, they discuss the "skip ambiguous letters" feature, a toggle that prevents the system from using letters that are visually confused with numbers (like '8' and 'B', "i" and "1") when naming sections. [LABELING-ALGORITH-b]
> Abel's takes: Here two potential outputs stand out, which for now we will segment as "Smart default labeling"
1. The "flexible/labeling schemes"
2. skip ambiguous letters
> What I need to determine is, if these are two distinct outputs, worthy of each having an outcome?

**Labeling System Intelligence:** Jonathan distinguishes between the system's smart defaults and the additional, selectable labeling schemes. The smart default ensures basic numbering reflects established operator patterns, while the extra schemes provide flexibility for different team-specific or mission-specific approaches. [LABELING-ALGORITHM-c]
> Abel's takes: So here is where Jonathan just re-affirms or repeats what the distincnt categories of labelings are. This is where I need to take my time and try to segment what the buckets are the specific functionality it provides, so we can give each output a descripton and understand the potential outcome for each. Between LABELING-ALGORITHM a,b and c and the Figjam VSM notes. 

**Review and Correction Features:** The team reviews features allowing for the addition, removal, and editing of building markers. Jonathan highlights a specific feature for adding markers that ensures consistency with section conventions, which native tools do not support by default. They also discuss the "automatic renumbering" feature that maintains contiguous sequences within a section after edits. [REVIEW-and-CORRECTIONS]
> Abel's takes: This is another relevant output that likely has outcome potential, there was a lot of user feedback about the manuel effort and how painful it is to relabel buildings specially when that has reached 10s, 100s.. loosing sequence of the series of number scheme..

**Swipe Gesture for Resequencing::** Abel and Jonathan discuss the "swipe gesture to resequence and adjust numbering" feature. Developed to streamline workflow, this tool eliminates the manual burden of re-labeling up to 100 markers when a change is made to the Gridded Reference Graphic (00:26:00).
> Abel's takes: Another feature/output that is not getting its due as far as the outcome in prod. This capability allows users to place their digit (finger) on an AOI (Map) and with the movement of their finger "S", "Spiral" circle in and out. etc, etc relabel buildings. Is this part of LABELING ALGORITHM or REVIEW and CORRECTIONS or both?



:**Imagery Handling and Pre-caching::** Abel reviews imagery handling capabilities, including pre-caching before detection runs and status messaging (such as success or failure pop-ups). The team acknowledges uncertainty regarding the relevance of 256x256 image tiling and intends to verify if this remains a necessary outcome.
> Abel's takes: We returned to the beginning process block #1 "Prepare AOI imagery for GRG creation" [IMAGERY-HANDLING], This was highly documented during the Bridge, Good outcome potential.

:**Grid Definition and Improvements::** Discussing grid configuration, Thomas notes that the legacy "GRG Builder" plugin provided basic functionality, but the team's improvements—such as the radio menu—represent a significant upgrade. Although the radial menu concept was not invented by the team, the implementation of "nested radials" provided unique value compared to the legacy tool.
> Abel's takes: In Process Block  #2, This might not have a ton of "juice" for an outcome, UNLESS we hear about it from Operators, which is worth asking during feebdack sessions, Dont let it get lost in the shuffle. [GRID-DEFINITION-and-CONFIGURATION]

:**Section Definition Concept::** Jonathan explains that while native tools already supported drawing generic shapes, the team introduced the concept of "sections" to give those shapes operational meaning. This innovation allowed the system to apply specific features and logic to user-defined sections rather than treating them as simple graphic.
> Abel's takes: Another potential outcome, As Jonathan said, drawing shapes in TAK plugins was possible but it provided no additional functionality other than just outlining something, Sections became something users can run detection with AI inside and also apply auto renumbering and labeling schemes..   [SECTION-DEFINITION/DRAWING]

:**Export and Auto-Generated Legends::** The team addresses GRG export capabilities. Jonathan notes that maintaining interoperability with existing data formats was a key requirement. Regarding auto-generated legends, Thomas confirms that the ability to overlay text on a screen was not supported by the core platform at the time, making the team's implementation a significant advancement.

:**Closing and Future Verification::** Abel confirms that certain processes, such as sharing GRG files with mission execution teams, were outside the project's scope. The team plans to finalize the outcomes in production list and use the confirmed information to reach out to stakeholders for further feedback (00:43:30).

### DECISIONS

**Aligned**

* **Legacy GRG features excluded from outcomes** The team will exclude features inherent to the legacy GRG Builder plugin from the team's outcome submission, as they were pre-existing capabilities.

* **Section concept defined as custom feature** The "Section" concept is defined as a proprietary feature, distinct from the native TAC shape-drawing tools.

### NEXT STEPS

[Abel] Close Product Gap: Schedule a meeting with Yi to discuss the initial product management history and timeline.
[Zachary] Verify Recall Data: Determine if performance statistics shifted following the transition to the current model.
[Abel] Contact Nick: Initiate communication regarding operator feedback and interest in feature concepts.
[The group] Establish Baseline: Analyze the differences between the existing solution and the legacy Grid Reference Graphic tool to highlight value.
[The group] Verify Legend Capability: Review documentation to confirm whether the auto-generated information box existed previously.
[Abel] Complete Roadmap: Consolidate all project deliverables to submit them for official production release.

---

# AI GRG Plugin Outcomes in Prod review, 1:30pm June 11

### Summary
Meeting reviewed production feature validity and operational usability improvements for the building detection plugin.

**Feature Validation and Metrics**
Teams established that AI building detection requires consistent output and automated performance metrics to ensure operational trust. Success is defined by mirroring natural operator workflows for labeling and renumbering.

**Usability and Operational Logic**
System enhancements like ambiguous letter filtering and swipe gesture resequencing provide critical manual control. These features effectively reduce user error and align automated output with established field conventions.

**Interface Migration Outcome**
The primary decision was made to migrate the configuration workflow from a legacy drawer interface to an ATAC-native radial menu to improve long-term maintainability and usability.

### DETAILS

**Project Credit and Production Context:** Abel initiated the meeting to ensure that the competition team receives proper recognition for deliverables now in production. Abel confirmed that the AI GRG plugin is currently in use by operators in the field, and the meeting's objective is to validate key assumptions about these features before submitting the final outcomes.

**AI Building Detection with Sliding Window:** The team implemented a sliding window approach for AI building detection to ensure consistent results across repeated executions. The core assumption is that operators will trust the AI's output because the consistent detections eliminate the need for them to repeatedly adjust zoom levels or rerun the tool.

**Performance Metrics and Pipelines:** Yi Liu recommended that the team utilize precision and recall metrics, potentially including an F1 score, to measure the effectiveness of the building detection. While the competition team relied on manual testing using a "golden data set" of imagery, Yi Liu suggested establishing an automated enabling outcome to measure these metrics to ensure the system meets operational requirements.

**Operational Feedback Loops:** Abel noted that there are currently no formal feedback loops with operators after missions, though establishing them is a priority for the upcoming contract period. Yi Liu advised the team to prioritize internal risk and reward analysis to determine if the development of specific features—such as building detection—provides sufficient value to the operators, even in the absence of direct feedback.
> Abel's Notes: So a few notes raw notes I have about Yi's comments. He asked what motivates operators to "re-run" a detection? What is the signal? Then as noted here, he discussed Precision and Recall Metrics and F1 score, and just exanded on capturing results false-positives and false-negatives. Yi also called for us to consider the various environments, for imagery to conduct precision and recall metrics. This is worth considering for our KRs

**Smart Default Labeling:** The team developed a "smart default labeling" feature designed to mirror the manual numbering process used by operators. The assumption is that by matching natural workflows, operators will accept the default labeling without feeling the need to renumber buildings by hand.

**Labeling Schemes and Error Costs**: Discussion highlighted the importance of selectable labeling schemes to reduce user rework. Yi Liu explained the "cost function" inherent in the process, noting that false positives and false negatives carry different time and mission costs, and the team must balance these variables when fine-tuning the algorithms.
> Abel's Notes: We agreed that this is a smaller outcome. We should Consider that “less re-work” is the measurement, and what is the cost. Once again he called out Precission and Recall, and he used the example of "Given the operator added what elending up being a False marker it takes them "X" to remove it, having extra markers is cheaper to fix.."

**Automatic Renumbering for Marker Sequences:** To support scenarios involving large numbers of buildings, the team implemented automatic renumbering to maintain continuous sequences. Yi Liu recommended that the team estimate the time cost reduction provided by this feature to quantify the improvement, such as calculating the time saved by removing the need for manual resequencin.

**Swipe Gesture Resequencing:** To address the inaccuracies of earlier automatic numbering attempts, the team introduced a swipe gesture allowing operators to manually reshape marker sequences. Yi Liu characterized this as a high-value outcome because it returns control to the operator, achieving 100% accuracy rather than relying on automated estimation.

**Repurposing Sections for Building Detection:** The team repurposed existing TAK "sections" (drawing with the shape tool) to provide context for building detections, automatically assigning them prefixes and sequence numbers. Yi Liu confirmed that this functionality established a necessary link between the operator's needs and the graphic output, allowing markers to align with established sectioning conventions.

**Ambiguous Letter Filtering:** The team developed a feature to exclude ambiguous letters—such as 'I' and 'O'—from building markers to prevent communication errors during operations (00:23:20). Yi Liu noted that this was a change in system behavior that supported existing human behavior, as operators were already manually avoiding these characters to prevent confusion.
> Abel's notes: Yi's take was that this is "Less of a change in behavior more of matching, and creating a “new” system behavior because this is a human behavior they do and they were trying to avoid it.."

**Legend Generation:** The team discussed the inclusion of an autogenerated legend on exported GRGs that displays the operational title, MGRS, and version (00:25:15). There was uncertainty regarding the originality of this feature, with Yi Liu noting that the code was likely copied from existing plugins during the competition due to time constraints (00:26:06).
> Abel notes: Yi claims that this functinality is not that new and that it was ripped from GRG Building. My take is that if we didnt "invent" the entire legend concept. didnt we add new value in terms of the version of the GRG? need to find out.. 

**Radial Menu Workflow Migration:** The team migrated the configuration workflow from a legacy drawer interface to an ATAC-native radial menu. Yi Liu and Jonathan confirmed that this shift, which was tested with operators, was driven by both the need to reduce usability risk and the engineering requirement to improve long-term maintainability.

### DECISIONS - Aligned

* Metric for building detection success The team adopted F1 scores, incorporating precision and recall metrics, to validate the effectiveness of AI building detection outcomes.

* Cost function for renumbering outcomes The team adopted a cost function analysis, weighing both time cost and mission impact, to evaluate renumbering and editing performance.

### Next steps

- [Abel] Create hypotheses: Draft hypotheses for the discussed output features and define metrics for measurement including precision and recall.
- [Abel] Review slides: Search through project slides and user interview files to find documentation on smart default labeling and user feedback.
- [Jonathan] Locate user quotes: Identify and retrieve specific user feedback quotes regarding the section repurposing and radial menu design from project documentation.
- [Abel] Submit outcomes: Submit the finalized deliverables to production and include the original team members as contributors.

===


## Review of SEWOL prototype and demo

* **PROTOTYPE** Plan-Pair-Schedule workflow with score-weighted COA generation against a representative GEO target set (Figures 1-4)


---

Andrew F - help him get setup?
abel invite him to n

THOMAS --> 
Got Repo up on Friday for "mission-core"
Thomas has some ask for me:

- SEWOL docs
- Arclight SD


andrew knife: TAK server integration, 

===

# WEEKLY Stand-up, WEDS June 10 - 

[ENG-Others]

- Alloc8, Jared
- Sean, finished Lattice Reviews, prodev (vector and langgraph) help with TACLAN Manager and get that done.."it generates operation order" WHO WAHT WHEN WHY for a mission.. 

[ENG-AI.GRG]

* ZACH: Got the prototype code in the repo, NEXT work on what Jonathan made, Design system -- He is gonna buld that

* andrew F: Got access to the repo (GMI team outcomes, OTHER, True Anamoly contract) He will get the TAK stuff running

* Thomas: reseaching, SEWOL docs, Investing problem space, digging tinto P2P Network Meshing for ArcLight prototyping.. TODAY--> same.. he got pulled away from work in the middle of the day. 


----

* Mr. Knife: ShipIt issues in GitLab, He will help finish that up, Worked a bit on TACLAN demo (resources constraints, multiple edges locally) close to having TAK Server up and running, ARM64 MD issues

CORE FUNC, for Kevan to consume.. he removed the secon edge.. all resource constraints.. 

//

Adndrew
1. Kevs repo from google drive (arclight prototy)
2. TAK install on emulator, crashes
3. 


[MARY]

- SPIN SMEs
- Process Map (OVD vs Rise8) what is the baseline?
- Meeting with Dan
- GET TME WITH MARY on SOAP Outcomes

[JON]
- Interivews for WEDs
- Define research questions
> GO BACK: Jon's interviews, maybe we can get some
- `SEWOL` talking to Drew McF "objects" he is gonna pair with him to understand the domain
> GO BACK: "understand the user experience", NEED TO BE ON THE SAME PAGE