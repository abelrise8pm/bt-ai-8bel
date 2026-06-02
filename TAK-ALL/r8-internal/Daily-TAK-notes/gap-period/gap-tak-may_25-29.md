# TAK Gap period outcomes/outputs - what we want, why it's valuable - May 26th [Gemini transcript]

### Summary
Conference debriefs and architectural planning discussions yielded a consensus on prioritizing an orchestration layer over plugin development.

**Conference insights and planning**
Conference feedback highlighted a disconnect between software deployment and sales. The group plans to build evidence-based prototypes during the upcoming gap period.

**Platform infrastructure and orchestration**
Development focuses on a cloud-agnostic orchestration layer to streamline compliance and observability. Participants established SOAP as the working name for this mission software initiative.

**Strategy and technical validation**
The team decided to build a thin slice prototype to validate architectural feasibility. This approach avoids technical debt by prioritizing orchestration over rewriting multiple plugins.

### Details

**Conference Recap and Context:** Kevan shared updates from a recent conference in Tampa, describing it as a sales-focused event involving Special Operations Command (SOCOM) leadership and various vendors, including demonstrations of autonomous boats. Kevan noted that the event highlighted a disconnect between developers and project managers regarding software deployment and sales, prompting a discussion about the team's upcoming activities.

**Gap Period Activity Planning:** Abel and Jonathan initiated a discussion on defining concrete objectives for the upcoming gap period to ensure clear goals and assumptions are tracked (00:04:14). The group aims to build evidence-based prototypes in weekly increments to maintain flexibility regarding the Other Transaction Authority (OTA) requirements.

**Clarification of "P2P" Terminology:** Abel and Kevan confirmed that the term "P2P" is used internally to refer to both "Path to Prod" and "peer-to-peer" communication, noting the ambiguity in the current project documentation.

**Platform Infrastructure Requirements:** Kevan detailed the need for platform-level infrastructure work, distinct from plugin development, to manage software images (such as IBM Mars and WebTAK Oasis) across numerous nodes. The primary requirement is a cloud and hardware-agnostic solution that allows for remote configuration management and troubleshooting by non-technical personnel on the ground.

**Drivers for Platform Development:** Kevan explained that the platform's development is driven by two critical needs: reducing the Authority to Operate (ATO) timeline from 10-18 months to a matter of days through platform-level compliance inheritance, and providing centralized observability for edge devices that currently lack remote support capabilities.

**Target Audience and Affected Parties:** Kevan clarified that the platform infrastructure work is primarily intended for DevOps and platform engineers, while the current Tactical Assault Kit (TAC) plugin developers would be the secondary beneficiaries of a more unified system.

**Prototype Feasibility Experiment:** The team is developing a "thin" dashboard prototype to validate the feasibility of the proposed platform concept for Chad. This prototype utilizes open-source components including K3s, Flux CD, Prometheus, Grafana, and Harbor to visualize data status across different Tactical Local Area Network (TACLAN) enclaves.

**Standardizing Project Language:** Kevan recommended adopting "enclave" as the standard term instead of "node," as the units in question are servers running multiple services rather than single-function hardware.

**Focus on Orchestration Layer:** Kevan proposed focusing efforts on an "orchestration layer" to enable coherent mission planning, including shared data and team models. The team discussed using this as a strategic approach to provide a unified user experience across devices, which they view as more scalable than maintaining a fragmented plugin-based architecture.

**Strategy for the August Tactical Planning Conference (TPC):** The team is preparing to present a "Shark Tank" style pitch to Nick, the Program Manager, by the August TPC. The strategy is to propose a holistic alternative to the current default plan of rewriting over 20 plugins in the existing Tactical Assault Kit User Interface (TACUI), which is currently facing technical deprecation issues.

**Minimal Viable Prototyping Strategy:** Jonathan and Kevan agreed to build a thin slice prototype that demonstrates the vision across all layers—including data models, team models, and UI components—to prove the concept without over-investing in specific implementation details that may be subject to change.

**Clarification of Project Pitches:** Kevan and Abel discussed the distinction between two primary project pitches: the Platform pitch, managed by Adam and Chad, and the Mission Software pitch, also referred to as observability or orchestration, managed by Ni Klein. The team clarified that the primary goal for the Tactical User Interface (TUI) is to avoid cross-platform plugin extrapolation. After discussion, the participants reached a consensus that the term "orchestration" accurately defines the focus of the mission software pitch.

**Project Deliverables and Strategy:** Jonathan presented a document outlining the platform and mission software pitches, with the platform pitch potentially involving a white paper and a working prototype, and the mission software pitch focusing on establishing structural concepts. Andrew is currently developing a prototype based on the white paper to provide a visual reference for stakeholders. These efforts are intended to derisk the project's initial execution. While it remains uncertain how the platform pitch will integrate into the upcoming long-term Operational Test and Assessment Agency (OTAA) contract, the mission software work—which focuses on a future-state journey including route planning, Geospatial Reference Grids (GRGs), and threat response—is confirmed for inclusion.

**Addressing Feasibility and User Testing Concerns:** Abel expressed skepticism regarding the efficacy of building prototypes without direct user validation, noting concerns that high-fidelity mockups might not translate to actual operational needs for DevOps engineers. Kevan and Jonathan clarified that the current objective is not to prove mission value to end-users, but to assess architectural feasibility and determine if a sustainable structure can be built to avoid rewriting numerous plugins (01:07:02). The team agreed that this approach helps them form stronger opinions and derisks the technical architecture before committing further resources.

**Hypothesis-Driven Development and Iteration:** To advance the project, the team decided to define explicit hypotheses and experiments rather than relying solely on mockups. Kevan emphasized that the team should adopt a fast-paced, iterative approach to quickly learn what works and what does not. By focusing on the orchestration layer as a means to demonstrate capabilities like data synchronization and team modeling, the team aims to reduce risk for future holistic plugin development.

**Confidence, Naming, and Next Steps:** Kevan acknowledged that while they are uncertain if their current architectural decisions will be the final solution, these prototypes provide the necessary confidence to choose the correct direction. The team referred to the orchestration initiative as "SOAP" (Software Orchestration Automation Platform) until a better name is established. For next steps, Abel will coordinate with Thomas, Mary, and Jonathan to define specific activities for these initiatives, with Kevan available to provide support throughout the week.


### Decisions - ALIGNED
**Gap period strategy focused on prototype** The team decided to prioritize building a thin, minimal prototype of an orchestration layer during the gap period to serve as a strategic 'Shark Tank' pitch for Nick in August, rather than committing to a full rewrite of existing plugins in TacUI.

**Strategic purpose of prototype development** The primary goal of prototype development is to conduct a feasibility assessment and derisk solutions to enable productive stakeholder conversations rather than proving immediate mission value to end-users.

**Adoption of hypothesis-driven development** All development work, including prototyping and user access requests, will be structured as hypothesis-based experiments to ensure iterative progress.

### Next steps
[Kevan] Share White Paper: Distribute the document evaluating different paths for platform infrastructure to the team.
[Jonathan] Create Design System: Establish a layer to inform components for the orchestration platform.
[The group] Draft Team Model: Define initial roles equipment and personnel for the platform orchestration.
[Kevan] Add Zack: Include Zack in the project communication thread.
[Abel] Schedule Planning Meeting: Coordinate a meeting with Thomas, Mary, and Jonathan to define specific activities for the platform and orchestration work.
[The group] Define Development Activities: Identify and define the specific activities and hypotheses for the platform and orchestration software. These definitions will inform the long-term development strategy.
[The group] Build Prototype: Develop a minimal thin slice prototype of the orchestration software to demonstrate the future state. Focus on proving feasibility to avoid the need to rewrite existing plugins.
[The group] Prepare Shark Tank Pitch: Create a pitch for Nick that compares the proposed orchestration solution to the existing plugin maintenance plan. Include evidence of feasibility and architectural direction.

---

# TAK/ATAK Context / Demo Share - May 26th [Gemini transcript]

### Summary
Meeting focused on Tactical Assault Kit plugin workflows and transitioning to an open-source infrastructure deployment strategy.

**GRG Plugin Demonstration**
The team presented a new tool automating building labels for field operations. This plugin successfully passed delivery testing and is currently undergoing active deployment.

**Infrastructure Modernization Strategy**
Developers proposed replacing costly proprietary systems with an open-source Kubernetes-based hub for edge deployments. This architecture prioritizes operational control and simplicity for field teams.

**Deployment and Collaboration**
The team plans to define mission requirements through lean validation experiments. Future efforts focus on integrating feedback to streamline edge computing and software management.

### Details

**Overview of Meeting Objectives:** Jonathan introduced the meeting's purpose, which included reviewing how the Tactical Assault Kit (TAC) fits into Special Operations Command (SOCOM) missions, discussing the new plugin the team developed and shipped, and running a demonstration of the plugin's workflow. They emphasized that all questions were welcome and set the stage by defining the mission context, specifically focusing on Special Operations teams like 12-man Operational Detachments (ODA) that often operate in disconnected or denied service environments.

**SOCOM Mission Context for TAC:** Jonathan explained that the team focuses on missions involving Special Operations teams that rely on Android Tactical Assault Kit (ATAC) on devices like the Samsung S20, often in field conditions with variable lighting and weather. The mission phases involve intelligence gathering, planning, executing, and exfiltration, where Gridded Reference Graphics (GRGs) are critical tools for building shared awareness (00:05:48). Planning maneuvers in these environments is difficult due to variables like terrain, logistics (food and batteries), and weather, which are often managed via existing core TAC features or specialized plugins. The riskiest phases of a mission involve the "move, shoot, and communicate" portion, rather than the final objective.

**Discussion on Plugin Distribution:** Following the overview, Abel asked about the distribution process for applications to ATAC, noting uncertainty about current release paths. Jonathan clarified that the current session was focused on the user journey and the current state of the plugin, not the release process or the path to production. Andrew mentioned that they had some high-level information to share on that technical infrastructure toward the end of the meeting.

**Overview of the GRG Plugin:** Jonathan detailed the purpose of the team's Gridded Reference Graphic (GRG) plugin, which provides a grid with letters and numbers overlaid on imagery to help teams maintain a shared understanding of building locations during missions. The plugin addresses previous pain points where manual labeling of buildings was time-consuming, stressful, and error-prone, which often resulted in poor-quality maps or a lack of shared context. The team validated the solution with users like Pete Wagner (Marine Raider) and Staff Sergeant Hayes (fire support specialist), resulting in a tool that allows users to import imagery, draw sections, and use AI to automatically identify and label buildings.

**Demonstration of the GRG Plugin Workflow:** Thomas demonstrated the plugin, showing how to load local imagery, drop a grid, adjust rows and columns, and lock the grid position. The demo illustrated that operators can define sections for better organization and use the plugin's AI detection to automatically label buildings within the grid. The team highlighted features such as manually adding missed building labels, reflowing label sequences, and customizing section names or colors to ensure consistent and accurate mission references.

**Plugin Settings and Export Functionality:** Jonathan and Thomas reviewed the plugin’s settings and export options, explaining that users can adjust grid density and section-specific detections to optimize performance. The plugin allows users to save projects for continued editing or export them as Keyhole Markup Language Zipped (KMZ) files, which serve as the final mission-ready artifacts that can be shared with the team. This process replaces older, manual paper-based methods with a digital, standardized format.

**Model Training and Deployment Status:** Jerod inquired about the AI model training, and Thomas confirmed the use of SageMaker and the evaluation of models like YOLO, which provided the best results in terms of accuracy and speed. Jonathan noted that the plugin has passed the delivery testing process with Software Management Command (SoftMC) and is currently being deployed by mission users. Andrew added that operators such as Wagner and Hayes are preparing to deploy with the tool, and the Program Executive Officer for Special Operations Forces Digital Applications (PEO SDA) specifically highlighted the plugin's success during a briefing at SoftWeek.

**Future Vision for Integrated Mission Planning:** Jonathan outlined a visionary approach for future SOCOM work, moving away from isolated plugins toward a system with a shared data model that understands mission context, team members, and specific roles. This vision includes advanced automation for routing, responding to hostile threats, and managing intent, while maintaining user authority for final decision-making. The goal is to reduce the "orient and observe" phases of the OODA (Orient, Observe, Decide, Act) loop, allowing operators to focus on deciding and acting. The team plans to explore the feasibility and value of this integrated, AI-assisted workflow.

**Current Infrastructure for Software Deployment:** Andrew presented an overview of the current "TAC LAN" infrastructure used to push applications to field teams, noting the current reliance on Palantir's mission manager, which is costly and unpopular with users. The proposed solution involves a "TAC LAN Hub" to manage deployments, moving away from legacy products to a homegrown approach using open-source tools. This architecture utilizes Kubernetes clusters (such as K3S or potential alternatives like RK2), Flux CD for GitOps deployments, Prometheus for observability, and Keycloak for user authentication.

**Edge Deployment and User Control Requirements:** Andrew and the team discussed the requirements for edge deployments, emphasizing the need for zero-trust security and the ability for users to block updates during active missions. The prototype, currently running locally via Podman, allows administrators to view edge nodes and push application updates to field devices, addressing the needs of special forces operating in disconnected, disrupted, and low-bandwidth (DDIL) environments.

**Tacklan and Edge Computing Definition:** Andrew explains that the "tacklan" device acts as a local area network (LAN) designed for field use in disconnected environments, such as specific missions where a team might be isolated from the headquarters network. The team defines "edge" as a generic term indicating that data is stored and processed physically close to the operators to ensure they maintain reachback capability and access to critical mission imagery or data even if they are disconnected.

**SOCOM J6 and Active Directory:** Andrew clarifies that "J6" refers to the operations portion of SOCOM (Special Operations Command), which manages the greater Active Directory. They suspect that field devices receive a subset of the home-based Active Directory LDAP database to authenticate users, though they note they lack complete context regarding this specific implementation (01:02:38).

**Virtual Machines and Network Classification:** Andrew confirms that a virtual machine (VM) serves as an input to tacklan management. The participants express uncertainty regarding the network classification level of these devices, noting they are unsure if they operate at an unclassified level, though Andrew assumes they might ingest higher-side data sets (01:03:44). Andrew observes that edge users are often less concerned with rigid classification compliance if it impedes their ability to execute a mission.

**Operational Challenges and System Requirements:** Abel discusses reports stating that the Mission Manager on Palantir failed to resolve issues effectively due to delays from various components on the tacklan J6 and developer side (01:04:44). Andrew explains that the core problems involve a lack of visibility into system operations and a lack of ease of use for field operators who may not possess deep technical expertise in systems like Kubernete. The proposed solution aims to provide simple, button-based or chatbot-based controls to manage tasks, such as freezing updates during active missions to prevent data corruption (01:06:50).

**Project Costs and Open Source Strategy:** Andrew highlights that the current Palantir-based system costs approximately $30 million per year. To address this, the team is proposing an open-source alternative that carries no inherent licensing costs, requiring payment only if they choose to purchase enterprise versions for support (01:06:50). Abel hypothesizes that the existing Mission Manager on Palantir lacks flexibility because it likely relies on out-of-the-box components (01:07:45).

**Future Collaboration and Validation Planning:** Abel outlines a plan to collaborate more closely with Andrew and the team to define assumptions and validate project requirements through lean experiments. The goal is to quickly compile a list of features to present to DevOps experts to gather feedback (01:08:56).

**External Stakeholder Engagement:** Jerod suggests reaching out to the "Raft" data platform team, as they have experienced issues with the current Mission Manager (01:08:56). The group notes that other contractors, such as Draper and Raft, have provided consistent feedback, and Abel commits to building a stakeholder map and creating supporting documentation to manage these inputs (01:10:01).

**Project Roadmap and Hardware Strategy:** Andrew states that while the core technical challenge of pushing data to the edge is not inherently difficult, the main hurdle is the ambiguity of the client's specific requirements. The team plans to leverage their influence to recommend the best hardware platforms and develop mission-specific variants to meet varied operational needs (01:10:53).

**AI Integration and Closing:** Andrew mentions that Sean Herbert has been working independently on the AI integration portion of the project. The meeting concludes with the participants agreeing to schedule further time for collaboration (01:11:56).

### Next steps
[Jonathan] Grant Board Access: Grant all team members access to the project boards discussed during the session to facilitate further exploration.
[Jonathan] Share GRG Examples: Distribute better examples of Gridded Reference Graphics to the team.
[Jonathan] Share project materials: Distribute links and relevant project materials to the team.
[Abel] Define assumptions: Identify key project assumptions that require validation.
[Abel] Create stakeholder list: Document all relevant teams and contractors involved in the project.
[Abel] Develop documentation: Compile necessary artifacts and supporting information for the project.
[The group] Schedule follow-up: Organize a future meeting to continue collaboration and discuss ongoing development.

---

# Stand-up: TAK Beach Gap - May 26th [Gemini transcript]

**Summary**
Team updates covered development status and platform architecture with a decision to standardize on Tackland Manager.

**Project Progress and Setup**
Development on the prototype progresses alongside successful environment resolutions for internal repositories. Technical efforts shift toward refining design systems and repository alignment.

**Naming and Strategy**
Team members formally adopted the name Tackland Manager for the enclave platform. Strategic discussions emphasized capturing product assumptions and conducting early experiments to ensure future alignment.

**Technical Collaboration Goals**
Research into local mesh networking and Bluetooth Low Energy continues with defined expansion goals. The team is evaluating Kotlin Multiplatform to enhance future plugin development efficiency.

### Details

**Jonathan's Project Updates:** Jonathan intends to upload research insights and documentation to the shared Claude project today to ensure the team has access to the information. Additionally, they plan to continue strategic planning with Abel and aim to pair with Zachary to discuss design architecture and the design system.

**Andrew's Prototype Progress:** Andrew is continuing development on the Tackland prototype with the goal of finalizing a demo for stakeholders this week. They plan to record a video of this demo for team reference and aim to pair with Jerod and Sean Herbert later in the day. Andrew will be unavailable for part of the day to shadow an interview.

**Thomas' Development Environment:** Thomas successfully resolved issues with the internal Rise 8 GitLab instance and updated the repository, noting that the slug has been changed to align with the Forge environment. Thomas plans to test Claude within their local development environment to improve future efficiency.

**Zachary's Environment Setup:** Zachary has completed the environment setup following the J migration, including resolving access issues with OnePassword. They are available to begin working with Jonathan on the design system.

**Sean Herbert's Tackland Prototype:** Sean Herbert has reached a functional stopping point for current Tackland tasks, noting that all links are working. They proposed exploring the potential of running AI locally on the hub and connecting edge nodes through chatbots. Sean Herbert has scheduled a pairing session between 1:00 PM and 4:00 PM with Jerod and Andrew to compare applications and determine the path forward.

**Jerod's Research:** Jerod spent time researching the Tackland Manager repository using Claude to build context. They intend to participate in the scheduled pairing session with the team later in the afternoon (00:04:36).

**Kevan's Mesh Network Prototype:** Kevan is developing a plugin using Wi-Fi Direct and Bluetooth Low Energy (BLE) to create a local mesh network among Android devices. This proof of concept currently enables basic ping-pong messaging and a heartbeat mechanism to advertise device presence while offline. Kevan aims to expand the prototype to send location data and markers, emphasizing the necessity of including metadata such as timestamps, attribution, and data provenance in future iterations.

**Enclave Management Platform Naming:** The team discussed the official nomenclature for the enclave management platform, with Andrew confirming that it is currently being referred to as the "Tackland Manager" or simply "TM".

**Product Roadmap and Strategy:** Abel is coordinating a discussion regarding product roadmaps for the Tackland Manager and other projects. Abel emphasized the need to capture product assumptions and conduct experiments early to ensure the team is prepared for future deployment. They requested that the team prioritize consistent feedback loops to maintain documentation and alignment with project goals.

**Technical Collaboration and Kotlin Multiplatform:** Jonathan and Kevan discussed the technical specifics of the mesh network prototype, particularly regarding how to handle data attribution and connectivity when disconnected from a server. Kevan also requested that Thomas and Zachary investigate the feasibility of using Kotlin Multiplatform Compose to build plugins for the platform (00:14:53).

### Next steps
[Jonathan] Update Claude Project: Upload research insights and documentation to the shared Claude project to allow for team querying.
[Jonathan] Plan Design System: Discuss and plan design architecture and the design system with Zachary.
[Andrew] Demo Prototype: Create a new demonstration for stakeholders and post a video recording of the demo to the channel.
[Andrew] Pair Programming: Schedule pairing time with Jared and Sean.
[Zachary] Setup Environment: Complete environment setup and download necessary repositories.
[Zachary] Pair on Design: Pair with Jonathan to work on the design system.
[Sean Herbert, Jared, Andrew] Pair Programming: Meet with Jared and Andrew between 1 PM and 4 PM to pair on apps and determine the path forward.
[Abel] Document Assumptions: Capture all product assumptions and experiments for Tackland Manager to document for stakeholders.
[Abel] Discuss Roadmap: Meet with Kevan and Jonathan to discuss the product roadmap for Tackland Manager.
[Kevan] Research Plugin Compatibility: Investigate if Kotlin Multiplatform Compose can be used to build tactical plugins.


### Summary
Project scope was defined via prioritized architectural foundations and value stream mapping for system visibility.

Defining SOCOM project scope
Development focuses on Web Tactical over existing alternatives. Architectural foundations for plugins take precedence over immediate platform production work.

Value stream mapping strategy
Value Stream Mapping will expose system bottlenecks and process waste. An orienting scenario provides the necessary structure to define future state transitions.

Process alignment and scheduling
Parallel documentation and experimental validation will guide development. The team decided to cancel the scheduled retro to prioritize synthesizing research and mapping efforts.

### Details

**Rise 8 Selection and Client Expectations:** Kevan clarifies that Special Operations Command (SOCOM) hired Rise 8 to deliver effective products rather than just pursue return on investment, which was a point of frustration with past product vendors, or perform purely research-based work that failed to reach warfighters (00:00:00). They emphasize the team's role in supporting the SOCOM ecosystem through various tasks, including hardware provisioning and software development (00:02:18).

**SOCOM Project Scope and Preferences:** Kevan notes that the team will likely integrate into the SOCOM ecosystem gradually, potentially sunsetting existing vendors over time as their contracts expire (00:02:18). Regarding software development preferences, Kevan expresses a strong preference for prioritizing Web Tactical (WebTAC) over Win Tactical (WinTAC) or Tactical X (TAC-X) (00:03:30).

**Architectural Strategy and Prioritization**: Kevan argues that the team should prioritize establishing an underlying *plug-in architecture foundation* rather than focusing on platform or path-to-production work, which currently relies on uncontrolled dependencies (00:04:41). Kevan notes the *risk of simply rewriting plugins without a cohesive foundation, suggesting the development of a shared Software Development Kit (SDK) to facilitate mission capabilities* (00:06:13).
> Team Notes: 

**Value Stream Mapping for System Visibility:** Abel advocates for creating a Value Stream Map (VSM) to expose existing dependencies, waste, bottlenecks, and handoffs within the current SOCOM ecosystem to the client (00:10:00). Abel emphasizes that this approach will help the team move beyond being just a for-hire team and demonstrate a clear path to improving the client's current processes (00:11:09).
> Team Notes: 

**Defining the Mapping Process:** Kevan and Abel discuss using a specific "orienting scenario" as a concrete example to map the current state versus the desired future state (00:12:24). While there was some debate on whether to focus on the orienting scenario or *the broader plugin ecosystem*, they agree that defining a specific process flow is necessary to avoid overcomplication and ensure alignment.
> Team Notes: the orienting-scenario is a way for us to demonstrate what a "future state" would involved and look given we had shared libraries, models, schema (modularity, scalability and interoperability), "describes how an ideal solution would benefit the operators"

**Parallel Execution Strategy:** Jonathan proposes a parallel approach where the team documents the current state while simultaneously running experiments on the future state (00:16:45). Kevan and Abel agree with this strategy, noting that they should aim to create a Value Stream Map while also validating the future state through testing (00:17:56).

**Balancing Research and Iterative Development:** Jonathan distinguishes between a research-first approach—which focuses on goals, problem prioritization, and current-state mapping—and a "build-and-validate" approach (00:19:05). Kevan acknowledges that the team currently leans toward the latter but intends to improve on aligning their research and foundational documentation to ensure everyone is on the same page regarding what they are building (00:21:30).

**Aligning Documentation and Sources:** The team discusses consolidating various research notes, journey maps, and vision documents stored in separate repositories and Claude instances (00:22:42). Jonathan notes that they have significant research material already prepared for review, including notes from Nick, Wagner, and Mike Riker (00:23:46).

# TAK Design/Product Room - May 27th [Gemini transcript]

### Summary
Project governance strategy defined alignment, terminology standardization, and collaborative documentation frameworks for future development cycles.

**Standardizing Project Terminology**
Defined common lexicon for project workstreams. Hosted glossary in Google Sheets to ensure team accessibility.

**Aligning Development Artifacts**
Established proto-personas and interconnected outcomes for mission software. Integrated pain point documentation as a shared responsibility.

**Enhancing Stakeholder Visibility**
Prioritized increased communication with leadership and developers. Required cross-functional involvement in prototype decision-making processes.

### Details

**Project Ownership Mapping:** Abel initiated a discussion regarding the need to map out project activities and ownership, agreeing with Jonathan Van Dalen to anchor their efforts towards the product roadmap previously outlined by Kevin.

**Establishing Ubiquitous Language:** Abel proposed the creation of a lexicon or glossary to establish a clear taxonomy and nomenclature for the project, noting that there is currently a lack of consistent, ubiquitous language (00:01:03).

**Glossary Implementation and Ownership:** The team discussed where to host the project glossary. After considering using a Claude project, Jonathan Van Dalen and Abel concluded that it would be more efficient to start by maintaining the list in a Google Sheet within the SOCOM OTAA transition drive to ensure accessibility, with Jonathan Van Dalen agreeing to take primary responsibility for initiating the document (00:04:42) (00:07:32).

**Proto-Personas Development:** Jonathan Van Dalen and Abel agreed on the necessity of creating proto-personas for both the path-to-prod effort (dev users) and the mission software effort (mission users) (00:10:09). Jonathan Van Dalen will lead this task, adopting a light approach to persona documentation, and will house the work within the project context (00:13:00) (00:16:18).

**Assumption Tracking:** Abel identified a need for an assumption tracker to support risk mitigation, rather than implementing a full lifecycle management system. Abel and Mary Pollin will collaborate on creating this tracker (00:14:33).

**Integrating Outcomes, Problems, and Pain Points:** Jonathan Van Dalen and Abel aligned on the view that personas, outcomes, and problems are interconnected, and that outcomes must be defined to establish the intent before identifying problems that block that state (00:17:39). Jonathan Van Dalen clarified the distinction between assumptions about pain points and validated pain points (00:19:02) (00:24:00).

**Pain Point Documentation:** The team determined that documenting pain points is a shared responsibility between PM and design. Jonathan Van Dalen will initiate this artifact, ensuring that all documented pain points are categorized as either assumed or validated to enable progress (00:21:49) (00:24:00).

**Drafting Project Outcomes:** The team planned to begin drafting target outcomes, agreeing to utilize the metrics page in FigJam for this task (00:28:15). Jonathan Van Dalen emphasized that they must involve Kevin and eventually Nick in the drafting and finalization process to ensure organizational buy-in (00:26:42).

**Journey Maps and Service Blueprints:** Jonathan Van Dalen noted that there are existing journey maps for the mission software effort (00:30:05). Regarding the path-to-prod work, Jonathan Van Dalen suggested creating a service blueprint to map out how security, pipeline, and platform teams collaborate, acknowledging that this requires significant effort and collaboration with the engineering teams (00:31:26).

**Future State and Mapping Dependencies:** The team discussed the need to validate and refine the future state of the mission software to enable specific outcomes (00:34:48). Abel questioned if a value stream map might be applicable for identifying process bottlenecks, noting the risk of attempting such maps without fully understanding the underlying processes (00:36:50).

**Workstream Terminology and Demo Awareness:** Abel and Jonathan Van Dalen agreed to use the term "workstream" rather than "domain" to describe their different areas of focus (00:39:36). They also discussed a demo mentioned by Drew, noting that they had previously been unaware of it (00:41:32).

**Stakeholder and Leadership Engagement:** Abel and Jonathan Van Dalen discussed the need to communicate to Kevin that the product management team requires visibility into prototype development (00:42:43). Jonathan Van Dalen emphasized that the PM and design teams must be present during decision-making and stakeholder briefings to maintain project context and ensure alignment before commitments are finalized (00:44:57).

**Developer Team Alignment:** Abel and Jonathan Van Dalen addressed the fact that team members like Thomas and Zach are currently out of the loop regarding specific details of the SOAP and mission software efforts. Abel stated an intent to connect with Thomas to discuss these matters and gain alignment (00:47:21).

### Decisions - ALIGNED

**Glossary centralized in Google Sheet** The team decided to use a Google Sheet to centralize the glossary of terms, opting against using a Claude project or re-uploading documents.

**Proto-personas approved for development** The team decided to develop a set of basic proto-personas to represent users for the mission software effort.

**Assumption tracker implementation** The team adopted a simplified assumption tracker for risk management, excluding the need for a full lifecycle management process.

**Outcome and problem methodology** The team established that outcome and problem statements are intrinsically linked and must be developed as a shared responsibility between product management and design.

**Pain point categorization standard** The team decided to track all pain points in a unified location, requiring each to be categorized by its source as either assumed or validated.

**Outcome drafting stakeholder participation** The team determined that the drafting of project outcomes must involve key stakeholders, specifically Kevin and Nick, to ensure buy-in.

**Standardized project terminology** The team adopted 'workstream' as the standard terminology for referring to specific project focus areas, replacing the term 'domain'.

### Next steps

[Abel] Create Glossary: Establish a document for taxonomy and nomenclature using a Google sheet. Populate this with terms related to the project context.

[Jonathan Van Dalen] Create Personas: Set up a basic persona sheet for the mission software and path to prod efforts. Identify user roles and key assumptions.

[Abel, Mary Pollin] Track Assumptions: Manage the document to track project assumptions and associated risks.

[Jonathan Van Dalen] Document Pain Points: Develop a format for capturing known and assumed pain points. Categorize these items as assumed or validated to enable outcome mapping.

[The group] Draft Outcomes: Generate and prioritize target outcomes within the metrics page of the project space. Include input from stakeholders like Kevin and Nick.

---

# End of Day Sync - May 27th [Gemini transcript]
**Scheduling and Final Alignment:** To facilitate alignment on the current state and artifact creation, the team decides to cancel their scheduled retro meeting. They commit to meeting tomorrow to synthesize their sources and agree on the content for their documentation and Value Stream Mapping efforts.

===
# TAK Current State - Thursday 4PM May 28 [gemini-transcript]

### SUMMARY
The team reviewed value stream mapping progress and scoped future process improvements via strategic documentation.

**Current State Mapping Review**
The initial value stream map for plugin delivery was reviewed for gaps in granularity and metrics. Collaboration with subject matter experts is required to identify process bottlenecks.

**Expanding Process Scope**
The team plans to integrate diverse plugins and utilize conditional process blocks to model complex workflows. This strategy highlights systemic inefficiencies and documents critical development dependencies.

**Future State and Assumptions**
Development of the future target state will proceed alongside current mapping. An assumption tracker categorized by feasibility, viability, and desirability was established for asynchronous team review.

### DETAILS
**AI GRG Value Stream Mapping - Current Status:** Abel outlined the current state of the value stream map, which focuses on AI GRG plugin delivery to Green Beret team leads using the Android Tactical Assault Kit (ATAK) in disconnected environments. The team identified the supplier (SOCOM), the mandate initiator, and the initial process blocks ranging from requirements definition to deployment. Abel noted that the current board represents a "first pass" and currently lacks granular detail regarding performance metrics, lead times, and process times, which will require input from subject matter experts like Nick or Chad.

**User Feedback Loop:** Mases questioned the integration of user feedback into the established workflow. Jonathan clarified that while feedback was collected during design and pre-release phases, there is currently no mechanism for collecting user feedback within the application itself. While no formal plan for in-app feedback exists, the team intends to conduct interviews with known users within a month to gather operational insights.

**Strategic Connection and Scope:** Jonathan expressed a desire to ensure the value stream map connects to the team's broader strategic bets, specifically regarding plugin architecture. They questioned if the current plugin delivery workflow effectively illustrates the difference between current delivery methods—where plugins are developed in isolation—and the team's desired future state, which involves a connected data model.

**Value Stream Mapping - Refining the Process:** Abel acknowledged that the current map feels somewhat redundant and mirrors existing process maps because it lacks detail regarding dependencies and inefficiencies. Abel suggested that the team must continue to populate the current state with contributions from subject matter experts to identify waste categories and process bottlenecks (00:09:32). Kevan and Abel discussed the need to expand the scope to include additional variants, such as different service environments and classification levels, to ensure the map remains representative (00:11:55) (00:21:43).
> Abel's Takes: These are suggestions I want the /vsm-faciliator-v1 SKILL.md to prompt me for during the rounds to ensure we are outlining/highlighting what are some of those "things" that Kevan called out.  

**Expanding the Scope of the Map:** The team discussed incorporating additional process blocks to account for other plugins, such as AirDrop planning, Combat Swim, and TAK UI contributions. Abel argued that these distinct plugins, while sharing some processes, involve different variants regarding classification, server environments, and user types, all of which should be reflected in the mapping process.
> Abel's Takes: So while we must ensure our value stream map shows the current stream for what we landed on "AI GRG plugin delivery end to end", We want to demonstrate to our stakeholders and customers all their depedencies and how some of their variants (different plugin use cases, users, classification, BAH vendor dependency, etc) are present and hinder the process.

**Future State and Conditional Process Blocks:** Kevan proposed utilizing "conditional process blocks"—similar to those used in the Torque map—to represent branching paths based on specific requirements, such as whether a plugin needs Army coordination. This approach allows the team to model complex workflows without creating an unmanageable number of unique process maps. Kevan illustrated how these conditional blocks can show where 80% of tasks might follow a standard path, while 20% require additional security assessments or approvals.
> Abel's Takes: Consider giving Claude and the Skill access to that TORQUE VSM

**Integration of Diverse Plugins:** The discussion turned to integrating diverse plugin development tracks, such as WinTAK and WebTAK, alongside ATAK. Kevan suggested that mapping these parallel efforts would highlight the current disparate landscape and the potential value of moving toward a unified "SOFTAK". This approach aims to demonstrate how achieving feature parity across platforms could reduce overall development timelines.
> Abel's Takes: "SOFTAK" is the unofficial name we are referring to Rise8 design of the future state, future vision..

**Documenting Dependencies and Systemic Issues:** Abel and Kevan agreed that the map should explicitly include dependencies such as Tech UI contributions, which act as separate process blocks. The intent is to use the value stream map to expose systemic inefficiencies and "dirty laundry" to stakeholders, providing evidence for the necessity of the proposed target state (00:36:12) (00:38:11).

**Plugin Responsibility and Coordination:** The team discussed the need to document which individuals are responsible for different plugin domains. Abel mentioned needing to locate the list of plugins and their owners, noting that while they do not currently know how feedback loops aggregate up to master project increment planning, this information should be integrated into the map to show how requirements are prioritized.
> Abel's Takes: This is another update that I need to include in the claude VSM collaboration and I need to find that plugin list. 

**Future Target State:** Abel suggested that the development of the "target state" (future vision) does not need to wait for the completion of the current state mapping. Kevan agreed, noting that working on both maps simultaneously will help document process gaps. Abel proposed using an artificial intelligence tool to start scaffolding the target state (00:43:52).

**Figma Organization:** The team agreed to organize their work in the SOCOM Figma team/group to maintain consistency . Jonathan moved the beach transition board to a new project titled "SOFTAK" to ensure clarity, as the team shifts toward creating evergreen documentation rather than maintaining isolated snapshots (00:46:16).

**Assumption Tracking Framework:** Jonathan introduced an assumption tracker categorized into Desirability, Viability, and Feasibility. They explained that Desirability assumptions focus on user validation, Viability involves business value and strategic alignment, and Feasibility addresses technical implementation. The team was tasked with reviewing the document asynchronously to provide feedback, particularly regarding feasibility concerns and ensuring assumptions are tied to measurable outcomes. Kevan suggested finding ways to automate the tracker to link assumptions directly to work in progress to prevent it from becoming a neglected catalog (00:55:03).

#### ALIGNED: Conditional process blocks for VSM The team will utilize conditional process blocks within the value stream map to represent process variations and dependencies, rather than creating separate maps for each instance.

### Next steps

- [Abel] Move Board: Migrate the beach transition board to the SOCOM Figma team project.
- [Kevan, Mases Krikorian] Review Assumptions: Provide asynchronous feedback and comments on the shared document regarding desirability, viability, and feasibility.
- [Abel] Update VSM: Add conditional process blocks and incorporate dependencies such as ATAK and WebTAK TAK UI contributions into the value stream mapping.
- [Abel, Kevan] Create Target Map: Scaffold the future target state for the value stream to contrast with the current state mapping.
- [Jonathan] Update Desirability Assumptions: Update and improve the certainty level of desirability assumptions before the OTAA by gathering user signal.
- [Jonathan] Rewrite Desirability Concept: Revise the desirability concept description to clearly reflect the compression of the UDA loop.
- [Kevan] Track Operator Assumptions: Include specific desirability insights from discussions with Nick in the master tracking document.
- [Abel] Review Viability Assumptions: Evaluate and provide feedback on the currently listed viability assumptions.
- [The group] Define Feasibility Assumptions: Identify and document specific feasibility concerns to validate the model and technical capabilities.

===

### Kevan's "quick technical feasibility prototype" Slack shareout , Friday May 29th"

#### Thread #1 - Kevan: Alright, wrapped up a quick technical feasibility prototype and handing it off!

Current Model
Arclight is the secure mesh synchronization substrate. The ATAK runtime plugin owns the long-running service, peer discovery, peer admittance, routing, identity, encryption, transport fallback, and sync primitives. Other plugins talk to it through the Arclight SDK instead of managing radios, sockets, or mesh state directly.

Arclight currently provides:
```
Secure peer mesh
  stable peer identity
  peer admittance / trust approval model
  signed envelopes
  encrypted payloads
  delivery ACKs

Tiered transport routing
  Wi-Fi Direct preferred
  BLE fallback
  LAN direct fallback
  TAK Server stub/future fallback
  route scoring and per-recipient delivery tracking

Durable mission state
  MST documents
  anti-entropy root adverts
  document upserts/tombstones
  store-and-forward repair/sync

Ephemeral telemetry
  heartbeat rollups
  latest-location style updates
  no durable queue for stale PLI

```

The current Team Presence plugin sits above Arclight. It uses the Arclight SDK to:

publish team member metadata into durable MST documents
publish local PLI and hostile locations into heartbeat telemetry
publish missions, routes, and hostile metadata into MST documents
subscribe to remote mission/team/hostile/route updates
render those updates as ATAK CoT markers and route polylines


Right now, Team Presence contains both the mission business logic and the ATAK UI/rendering logic. Route-threat proximity evaluation, hostile stale handling, draft/publish behavior, side-panel UI, marker rendering, and map capture are mostly inside the plugin.

It also contains the current lightweight action parser. For example, text like: `drop a hostile armored vehicle 500 yards east of me`

is parsed by Kotlin code inside the plugin, resolved against the local user position, then executed as the same hostile-drop flow used by the manual map tool. This is a good prototype, but the intent/action mapping should move into mission-domain logic over time.

Future Layered Model
The cleaner target structure is:

```

:arclight-sdk
  Generic secure sync API:
  MST documents, telemetry, envelopes, runtime state, peer state,
  trust/admittance state, delivery state

:arclight-atak-runtime-plugin
  Android/ATAK runtime:
  foreground service, BLE, Wi-Fi Direct, LAN, TAK Server adapter,
  peer discovery/admittance, identity, routing, crypto, storage,
  sync service lifecycle

:mission-core
  Pure mission logic:
  team members, routes, hostiles, GRGs, source-data manifests,
  draft/publish model, reducers, route-threat rules, stale policies,
  canonical IDs, schemas, validation,
  mission intent/action contracts,
  deterministic command execution,
  simple parser fallback

:mission-arclight-adapter
  Bridge layer:
  maps mission commands to Arclight MST document APIs,
  maps mission telemetry to Arclight heartbeat rollups,
  hydrates MST + heartbeat data into mission-domain state,
  hides Arclight transport, trust, and delivery details from mission features

:mission-llm-adapter
  Optional parser layer:
  local Gemma / other on-device LLM / cloud LLM,
  converts natural language into typed MissionCommand DTOs only,
  never directly mutates mission state or talks to Arclight

:mission-atak-plugin
  ATAK UI adapter:
  side panel, map taps, text/voice command input,
  CoT markers, route polylines,
  ATAK notifications/toasts, plugin lifecycle

```

The intended future command flow is:

```
User text / voice
  -> Mission intent parser or LLM adapter
  -> typed MissionCommand
  -> Mission Core validation and execution
  -> Mission Arclight Adapter publishes MST/telemetry changes
  -> ATAK plugin renders resulting map state
```

For example: `"drop a hostile armored vehicle 500 yards east of me"`

becomes a typed command like:

```
DropHostile(
    label = "Hostile armored vehicle",
    type = "armored_vehicle",
    relativeLocation = DistanceBearing(
        distanceMeters = 457.2,
        bearingDegrees = 90.0,
        origin = SELF,
    ),
)
```
Mission Core validates it, resolves it using local context, and executes the same domain operation as a manual hostile drop. The ATAK plugin provides context and rendering; the LLM only fills the contract.

In this future model, Arclight remains mission-agnostic and owns secure sync over multiple spectrum modalities. Mission Core owns mission semantics and action execution. The LLM adapter owns language-to-command mapping. The ATAK plugin owns rendering and user interaction only.
---
I forgot to record audio for the demo but it shows walking through the Arclight connection overview, that it is connected to 1 other admitted peer. Then I create a provisional mission object and basic routes that are just start and end points, publish them, and then observe the data sync to the other device. Add another route, edit them from the other device, and publish to show them sync all changes both ways. Then I submit a text command that goes through a basic Kotlin parser to drop a hostile CoT marker, and then manually drop a hostile marker nearby that causes the routes to update to orange to indicate hostile proximity to the route.

**Demo Capabilities Demonstrated**

This demo shows Arclight operating as a secure decentralized sync layer underneath a mission-focused ATAK plugin.

Specific technical capabilities shown:

Arclight runtime overview

The Arclight panel shows the mesh runtime state.
The device is connected to one admitted peer.
Peer admission/trust gating is active, so mission data is only exchanged with approved peers.


Secure peer-to-peer synchronization

 Mission data syncs directly between devices through Arclight.
 The demo exercises the current encrypted, admitted-peer mesh path rather than a central server workflow.


Tiered mesh transport foundation

Arclight is managing the underlying transport layer behind the plugin.
The plugin does not directly manage Wi-Fi Direct, BLE, LAN, or socket routing.
Arclight owns route selection, delivery, peer state, and fallback behavior.


Blue team PLI tracking

Automated blue team PLI synced between devices and displayed as CoT markers on map


Mission object creation

A provisional mission object is created from the Team Presence / mission panel.
This demonstrates durable mission-domain data being authored locally before publication.


Draft-to-publish workflow

Mission and route edits are staged as local draft state first.
Publishing flushes the rolled-up mission changes into Arclight’s durable MST document sync path.
This shows the intended “plan locally, publish when ready” workflow.


Basic route authoring

Routes are created from start and end map points.
Route data is represented as mission-domain state, then projected into ATAK map graphics.


Durable MST-backed sync

Published missions and routes sync to the second device.
The remote device hydrates the durable mission documents and renders the corresponding routes.
This demonstrates Arclight’s MST document model for mission state.


Bidirectional sync

A route is added on one device and appears on the other.
The route is edited from the second device and syncs back.
This demonstrates multi-device update propagation rather than one-way broadcast.


Last-writer mission document updates

Edits published from either device update the shared mission/route state.
Other peers observe and render the latest published version.


ATAK CoT/map projection layer

Mission-domain routes are projected into ATAK-visible route graphics.
Hostile entities are projected into ATAK CoT markers.
The plugin handles the UI/rendering layer while Arclight handles sync.


Text command action flow

A natural-language-style text command is entered to drop a hostile marker.
The current prototype uses a deterministic Kotlin parser.
The parser resolves intent, distance, direction, and hostile metadata into a structured action.
The action executes the same domain flow as a manual hostile drop.


Hostile CoT marker creation

A hostile marker is created from the text command.
Another hostile marker is manually dropped through the map UI.
Hostile metadata is stored as durable mission state, while hostile location is represented as telemetry/current location state.


Ephemeral telemetry rollup

Hostile and team-location updates use the heartbeat/telemetry path.
This demonstrates the durable-vs-ephemeral split: metadata belongs in MST documents; frequently changing location belongs in heartbeat telemetry.


Route-threat proximity evaluation

When a hostile marker is placed near a route, the mission logic evaluates distance from hostile location to route geometry.
Routes inside the configured threshold are marked as threatened.


Semantic map styling

Threatened routes turn orange.
This demonstrates mission-domain state driving ATAK rendering, not just static map drawing.


Foundation for Mission Planning, Coordination, and Execution

  The demo shows the first end-to-end slice of the future architecture:
    mission authoring, durable sync, bidirectional updates, hostile tracking, route-threat coordination, and ATAK rendering on top of Arclight.

Kenva: Mases, Thomas and Zach.. In my head we try to put as much of this in Kotlin MultiPlat Compose as possible, the only ATAK specific portion should be the specific UX components and we can have a corresponding TAK-X and TAK-Y and TAK-Z etc.

MissionCore should leverage Arclight SDK for all data management and sync (kind of like an ORM-esque model)

In a cumulative nature, Arclight + Arclight SDK + MissionCore + Adapters = "SOFTAK SDK" whether we ever officially publish it or not.

And we can keep expanding MissionCore however we want, just a working name at the time being. Also I did this all over the past couple days to derisk feasibility, so everything here is up for grabs as far as moving it from prototype to reality. I'm fairly confident in our overall approach going forward as far as feasibility is concerned, and it should now be used as a baseline to keep adding technical robustness and mission capability.


also why Arclight? That's what the LLM decreed its name should be. Mases, here is a direct link to the zipped repo :joy: for you to pull down and keep iterating on and probably push to our internal gitlab....[link-to-a-zip-folder]

also why Arclight? That's what the LLM decreed its name should be..

#### Thread #2 - Kevan: 
Those curious specifically about the data sync mechanism..
Kevan: Heartbeat PLI
Arclight separates frequently changing location from durable mission metadata.

For PLI and hostile positions, the Team Presence plugin publishes latest-location updates through the Arclight SDK. Arclight places those into an **ephemeral telemetry rollup** on the heartbeat.

The heartbeat carries compact “current state” telemetry such as:

team member short ID -> latest lat/lon/time
hostile short ID     -> latest lat/lon/time

Those updates are intentionally not treated like durable queued mission documents. If a heartbeat update is missed, the next heartbeat should carry the latest position again. That keeps PLI from creating a backlog of stale location messages.

On receipt, Arclight:
- decrypts the heartbeat extension
- verifies the sender is an admitted peer
- decodes the telemetry rollup
- maps short IDs back to durable MST document IDs
- drops older/stale observations
- emits the latest valid location update through the SDK subscription path

The Team Presence plugin subscribes to those updates and receives typed location events for team members and hostiles.

MST Node Sync
Durable mission state uses Arclight’s MST document model. This includes data like:

team member metadata
mission summaries
routes
hostile metadata
GRG/source-data manifests
short-ID mappings

When a plugin publishes durable data, it writes a document into the MST-backed store. Each document has a stable collection and entity ID, for example:

mission.team.member.v1 / ANDROID-...
mission.route.v1       / route-...
mission.hostile.v1     / hostile-...

Arclight hashes documents in canonical order so peers can compare MST roots. Heartbeats periodically include an MST root advert:

local root hash
document count
collection summary

When peers see matching roots, no durable repair is needed. When roots differ, Arclight can use document upserts/tombstones and store-and-forward delivery to bring peers back into sync.

The important split is:

MST:
  durable truth about what entities exist and what metadata they have

Heartbeat telemetry:
  latest known position/motion for entities that already exist or can be hydrated

For example, hostile metadata like label/type/confidence belongs in MST:

Hostile BLOB 1
type = armored vehicle
confidence = manual

The hostile’s current position belongs in heartbeat telemetry:

hostile-local-123 -> lat/lon/observedAt

Hydration
When a telemetry update arrives, the receiver needs metadata to render it well. The flow is:

heartbeat telemetry arrives
  -> short ID maps to durable entity ID
  -> entity ID looks up MST metadata
  -> position + metadata combine into hydrated mission state

If metadata is already present, the marker can render with the right callsign, hostile label, icon/color, and remarks.

If location arrives before metadata, the plugin may temporarily project a fallback marker. When the MST document later arrives, the projection reconciler rehydrates the same deterministic marker UID rather than creating a second marker.

If metadata exists but fresh telemetry has not arrived yet, durable hostile documents can include last-known/initial position so the plugin can render a stale marker until fresh heartbeat telemetry resumes.

CoT Marker Reconciliation
The final step is the Team Presence map projection layer.

The plugin keeps mission-domain state separate from ATAK rendering:

MST document update
  -> mission metadata cache
  -> projection reconciler

heartbeat PLI update
  -> latest location cache
  -> projection reconciler

The reconciler uses deterministic UIDs, such as:

arclight.team.<memberId>
arclight.hostile.<hostileId>
arclight.route.<routeId>.line

That means updates modify the existing ATAK item instead of creating duplicates.

For each update, the reconciler:
- finds or creates the ATAK marker/polyline
- applies the latest position
- hydrates title/callsign/label from MST metadata
- updates remarks/source/timestamp
- marks stale items visually when needed
- removes deleted/tombstoned entities
- reapplies route-threat annotations

So the end-to-end flow is:

Device A publishes metadata
  -> MST document
  -> Arclight sync
  -> Device B receives document
  -> mission cache updates

Device A publishes PLI/location
  -> heartbeat telemetry rollup
  -> Device B receives latest position
  -> short ID hydrates through MST metadata
  -> Team Presence reconciles ATAK CoT marker

The result is that ATAK shows current CoT markers and routes while Arclight keeps durable mission state and ephemeral location updates synchronized underneath.
[5:37 PM]This model minimizes separate rollup send/ACK traffic by using the existing PLI heartbeat as the carrier for ephemeral state that is already expected to refresh continuously. Instead of queueing every location update as a durable envelope that must be sent, acknowledged, retried, and eventually pruned, Arclight treats PLI and hostile positions as latest-value telemetry: each heartbeat carries the current rollup, and missed updates are naturally superseded by the next heartbeat. Durable MST documents still use the reliable sync path when metadata or mission state changes, but high-churn location data rides the heartbeat path without creating extra delivery state. That keeps the protocol simpler, reduces log and network noise, avoids stale backlog replay, and preserves ACK/retry complexity for the data that actually needs durable convergence. 
Kevan: There are definite areas for improvement, such as data fusion from multiple sensors with confidence and prioritization. But it's a stable foundation to build on

#### Thread #3 - Kevan: Mesh network and encryption

Short Version
Arclight currently builds a multi-transport peer graph, not a single radio-level mesh protocol. Each device runs the Arclight foreground service, advertises itself over Wi-Fi Direct, BLE, and LAN, learns routes to other admitted peers, and sends signed/encrypted Arclight envelopes over the best available route.

Preferred route order today:
  Wi-Fi Direct registered peer
  Wi-Fi mesh next hop
  LAN direct
  BLE subscribed peer
  BLE client write
  TAK Server stub fallback

Wi-Fi Direct
On startup, Arclight starts a Wi-Fi Direct socket server on port `42425`, advertises an Arclight DNS-SD service named `Arclight` with type `_arclight._tcp`, and starts Wi-Fi Direct service discovery.

Discovery flow:

Device A advertises Arclight Wi-Fi Direct service
Device B discovers only Arclight-tagged Wi-Fi Direct peers
Android forms a Wi-Fi Direct group
Android chooses one device as group owner
Group owner becomes the network registrar for that group
Clients connect to group owner on 42425
Clients send signed HELLO
Group owner records client IP from socket.remoteAddress
Both sides exchange signed WELCOME / HEARTBEAT frames

The group owner tracks client IPs from incoming `HELLO` and `HEARTBEAT` sockets. That is how it learns where to send outbound envelopes. Clients also re-register after connection changes, and stale Wi-Fi Direct peers expire after a timeout. Heartbeats run periodically and carry telemetry/MST root extensions when allowed.

Wi-Fi Direct is the strongest current route because it gives Arclight direct IP sockets between devices. Arclight also has a simple Wi-Fi mesh-originator concept: peers can advertise route-originator info so a device can route toward another peer through a known Wi-Fi Direct next hop.

BLE
BLE is not Android BLE Mesh. It is an Arclight GATT transport.

Each device starts:
- a BLE advertiser with the Arclight service UUID
- a BLE GATT server
- a BLE scanner looking for that service UUID
- optionally a BLE GATT client connection to another discovered peer

The GATT service exposes one characteristic that supports:

READ
WRITE
NOTIFY
INDICATE

The preferred BLE delivery path is notification/indication from a subscribed peer. When a client connects, it discovers the Arclight service, enables notifications/indications through the CCCD descriptor, and requests a larger MTU. Arclight then treats that peer as a BLE route.

BLE envelope flow:

Small envelope
  -> one GATT value

Large envelope
  -> chunked frames
  -> transfer ID
  -> frame index/count
  -> reassembly
  -> decode Arclight envelope

Current BLE limits include a max GATT value size around `500` bytes and max envelope size of `32 KB`, with fragmentation and reassembly. BLE has a GATT operation queue to avoid write/notify collisions and retries busy operations. Delivery ACKs are Arclight-level ACK envelopes, not merely “GATT write succeeded.”

LAN Direct
LAN Direct is for devices on the same local Wi-Fi/Ethernet network.

On startup, Arclight:
- starts a TCP server on port `42424`
- advertises `_arclight._tcp.` via Android NSD/DNS-SD
- discovers other `_arclight._tcp.` services
- resolves host/port
- sends a signed `HELLO`
- expects signed `WELCOME`

LAN discovery flow:

Device A advertises LAN NSD service
Device B discovers _arclight._tcp.
Device B resolves host/port
Device B opens TCP socket to 42424
Device B sends signed HELLO
Device A replies signed WELCOME
Both remember LAN route

LAN routes have backoff and stale-peer expiration. If a LAN send fails, the host is temporarily suppressed so Arclight does not flood logs or repeatedly hammer a bad route.

Transport Routing
Arclight stages outgoing messages as envelopes, then asks `TransportRouter` to score available routes.

Current scoring is roughly:

Wi-Fi Direct registered peer  400
Wi-Fi mesh next hop           350
LAN direct                    325
BLE subscribed peer           300
BLE client write              200
TAK Server relay stub          50



For broadcast-style sends, Arclight expands the send across known reachable peers. For each recipient, it checks admission, encrypts for that peer, signs the envelope, sends over the selected route, and tracks delivery per recipient.

Identity
Every Arclight node has a stable peer identity:

EC P-256 keypair
peerId derived from SHA-256(public key)
nickname
supported modalities
identity signature
public key fingerprint

On Android, Arclight tries to store the private key in Android Keystore. If that is unavailable, it falls back to legacy software key storage. The identity payload is signed with `SHA256withECDSA`, and peers verify that:
- the peer ID matches the public key
- the identity signature is valid
- the advertised signature algorithm is expected

So route discovery alone is not trust. A peer can be seen over Wi-Fi/BLE/LAN, but it must have a verifiable identity before Arclight treats it as a stable peer.

Peer Admission
The current trust model is explicit peer approval:

policy: current_member_approves
trust model: explicit_peer_approval_v1

When an unadmitted but identity-verified peer is discovered, Arclight can send a membership join request. That request includes the peer identity and a short verification code derived from peer ID + public key.

Flow:

Peer discovered over Wi-Fi/BLE/LAN
Identity verifies
Peer is not admitted
Join request is staged
Existing member sees admission notification
Member taps Admit or Deny
Membership decision is signed and sent back
Decision may also be broadcast to peers
Admitted peer can now receive/decrypt mission data

Unadmitted peers are allowed enough traffic to request admission. Normal mission data is blocked until the peer is admitted.

Signing And Encryption
Arclight uses two layers:

Envelope signature
  ECDSA SHA-256
  proves who sent the envelope
  protects envelope integrity

Payload encryption
  ECDH P-256 + AES-256-GCM
  encrypts DATA payloads and heartbeat extensions per recipient

For encryption, the sender derives a shared AES key using its private key and the recipient’s public key. The payload is encrypted with AES-GCM using a random nonce and authenticated associated data that binds the ciphertext to envelope metadata such as message ID, sequence, sender, recipient, namespace, and key ID.

Important behavior:
- Durable DATA payloads are encrypted per admitted recipient.
- Heartbeat extensions are encrypted per admitted recipient.
- If the peer is not admitted, heartbeat extensions are withheld.
- If Arclight does not have a verified public key for the target, encrypted data is not sent.
- Admission join/decision namespaces are allowed before full admission so peers can join the mesh.

So the radio/network layer may discover anyone nearby, but the Arclight data layer only accepts signed envelopes from verified identities and only exchanges mission payloads with admitted peers.
[5:49 PM]Definite areas to improve, like prioritizing LAN direct, having different PLI/heartbeat timings and sync strategies depending on transport, etc

===

# [raw-notes] May 28th , Thurs

How capabilities get delivered to operators using TAK in SOCOM Missions (right now they are making plugins for every idea or use case)


* TAK =
* SOCOM Missions = 

---

* TAK in SOCOM MISSIONS Current state journey - Pete Wagner (MARSOC), Nik Cline (SOFMC) -figjam board(https://www.figma.com/board/uKpig5cfxLpMOOFK4gvQZv/SOCOM-TAK-Beach-Transition?node-id=2064-6736&t=6CtenJH0OReSCbOo-4)
> How TAK is used currently in missions

* Claude Project: SOCOM TAK Current / Future State Learnings (https://claude.ai/project/019e6ab3-7cdb-7299-8f04-ca6d1aca5b8d)
> It knows about the Current State

--- 

update "in mission" to
> Where are the inefficiencies — dependencies, waste, bottlenecks, handoffs — in how capabilities get delivered to SOCOM TAK operators for a mission

Prompt A — Inventory:
1. plugins/capabilities and sofware updates & new features (combatSwim, AI GRG, TrailBlazer)
    * Prompt B — Segmentation: Special Ops Warfighters: MARSOC (Marine Raiders Fire Support), Army Rangers, Green Berets, Ground Team Lead — primary planner and executor; highest cognitive load; owns route, team composition, and mission approval artifacts, JTAC — fires specialist; plans independently from team lead; owns deconfliction authority and weapon recommendations, Medic / 18D — owns CASEVAC planning, nearest-care routing, and medical readiness; currently unmapped in domain structure, ISR/Intel Operator — handles recon planning and information capture; flagged as a mandatory planning role with no current domain home, Aviation Planner (SOAR) — plans in NIX, not TAK; narrow handoff need (drop point + ingress route) but high friction today
        *   Prompt C — Variation Drivers: 
            1. platform specific: android mobile ATAK, WinTAK (windows app), WebTAK (web desktop), TAK(linux)
            2. provisioning/setup: based on connectivity or lack there of
            3. Security Classification
            4. hardware specs and versions

2. hardware (android devices, laptop-workstations, servers)



Prompt C — Variation Drivers:

--

Let's stay with the Pass 0a — Final question statement, I have some clarifying questions about the prompts and the instruction specific questions you are asking me.

What does this mean or refer to? "Apply the test"? what test?
> § 3. Apply the test — 10 min
For each candidate, ask the team to score both tests as High / Med / Low. Quick — not a debate, an instinct check.
and what do you mean or where does this criteria come from? "Diagnostic strength" and  "Demo strength"

be concise, we sitll need to finish § 4. Converge — 10 min and what follows..



can you collaborate with us on how we can determine the entries for this "Prompt C — Variation drivers:" We have current state and geneeral project and domain info that we can prompt.. 


