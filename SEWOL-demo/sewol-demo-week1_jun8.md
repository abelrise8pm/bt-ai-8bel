# SEWOL Demo - Week 1 Recap (Jun 8, 2026)

**Sources:** SEWOL Demo Kickoff transcript ([SEWOL-demo-kickoff.md](./SEWOL-demo-kickoff.md), 2026-06-08), PM working session (this conversation), SEWOL-demo docs ([OVD](./SEWOL_Operational_Vision.md), [Rise8 Technical Volume](./Rise8_Technical_Volume.md)).

**Period covered:** Jun 8 through the July presentation. Near-term planning horizon: July 16.

---

## Workflow chosen for the demo

**Plan-Pair-Schedule**, scoped to GEO targets. The EWO ingests an approved STO from Project 7 (or creates one manually if the link drops), adds constraints like SPINS and CDA deconfliction windows, then a single command automatically pairs EW assets to targets, generates a deconflicted schedule on the Sync Matrix timeline, and exports a validated plan handed to crews for execution.

Term is the customer's own ([OVD §5.1](./SEWOL_Operational_Vision.md#L160)). Dan named it as the demo workflow in the kickoff: "STTO plan pair schedule" (transcript line 19) and "a plan pair schedule loop, an automated pairing around scheduling" (transcript line 75).

---

## What they want ready for the demo

The Plan-Pair-Schedule workflow above, shown end to end. Dan's words for what to demonstrate in July (transcript line 79):

- An EWO can ingest a formal STO from sample data, or create one from scratch
- Manage GEO-only targets
- See targets on a map
- Run an automated pairing process with a command or button
- See the schedule in a sync matrix
- Export the schedule

Integrator view (transcript line 81): an integrator can onboard, get a project in source control, find documentation, find example projects or references, and deploy a sample application that leverages the framework.

What Dan said must hold up underneath the workflow, in his words "the floor for us to be credible" (transcript line 88): ontology and schema for STO and SPINS (common data elements for C2 and space planning), cATO, and SDK delivery at the platform and application level.

---

## What we know

**Timeline**
- Proposal submitted early June. Expect notification first week of July if selected.
- July activity: in-person presentation, demonstration of working software, and a tabletop exercise of agile/design process. Third or fourth week of July.
- Government selects up to three vendors for a three-month competition. MVP target is November (end of that window).
- Phase two is six months ($10M); phase three runs to three years ($40M).
- Reason for starting now: a three-month build is not achievable if the team starts in August. The demo gives the August team a starting point.

**How Dan framed winning**
- Build on Mission O/S Core (Rise8 cATO platform).
- cATO as the lead differentiator.
- Third-party integrators as first-class citizens. MOSA framed as a third party being able to build on the shipped system, not Rise8 as the center of gravity.
- SDK at both platform and application level (adapters, libraries, CLIs, documentation).
- AI-first / agentic capabilities treated as a core user of the platform.
- Rise8 agile/design process for the tabletop exercise.

**What "the framework" is** (Dan, transcript lines 44-48, 84): the framework is SEWOL itself, built as a stack on Mission O/S Core: data tier / ontology (STO, SOCO, SPINS, CDAs), a slice of domain services (pairing, target management, asset management, create STO), the SDK layer, and the operator experience (globe, STO form, pairing button, sync matrix).

**Prototype status**
- Dan's vibe-coded prototype is the operator experience only, built to produce proposal screenshots. The data layer is not realistic. Ontology, schema, and data parts are up to the engineers (transcript lines 149-151).

**M2M**
- Machine-to-machine with Project 7 is not strictly in the government roadmap; Dan reads it as open to interpretation (transcript line 19). Not required for July.

**AI for July**
- AI is not required to be demonstrated in July. The bar is showing the team is thinking about agentic and AI use cases (transcript line 77).

---

## Assumptions

- Team for the demo period is everyone in the channel (8, possibly 11). Confirmed only as "the list of names that Max has"; allocation not finalized (transcript lines 114-118).
- One or two people carry continuity from this team into the demo team (transcript line 108).
- July 16 is an internal planning horizon; the demonstration itself is the third or fourth week of July.
- Plan-Pair-Schedule is the workflow chosen to prototype (this conversation; [OVD §5.1](./SEWOL_Operational_Vision.md#L160)).

---

## Open items

- Allocation: who works on the demo, and what happens to SOAP, the TACLAN Manager prototype, and other current work (forge, TAK orchestration). Dan to talk to Max and Adam (transcript lines 124-130, 151).
- Number of people the government will invite, and what they will ask for (transcript line 108).
- Cadence and who spends time on the demo (transcript line 118).
- Mission O/S Core onboarding: who beyond platform devs gets access; Drew McFarland to help or point to the right contact (transcript line 140).
- Domain context for SPINS. Dan needs help; may go to Clark and Berner (transcript line 140).
- The specific slice to build. Mini discovery this week to decide (transcript line 142).
- Tabletop exercise format. Not yet known (transcript lines 23, 36).
- PM process setup: Mary and Abel to work with Dan on how the team operates (transcript line 157).

---

## Where we can start (stack rank, owners, and COAs)

From the team pairing session (Mary, Abel, Zach). Ranked top to bottom by how much we can begin now. Format per item: Owner / Context / COAs.

### Start now

**1. Ontology + schema for STO and target data**
- *Owner:* Engineers
- *Context:* Dan's stated floor for credibility (transcript line 88). Source material in [OVD §2.3](./SEWOL_Operational_Vision.md#L66) and [Appendix A.2](./SEWOL_Operational_Vision.md#L200-L219). Runs on sample data.
- *COAs:*
  1. Ask the engineers if they have what they need to run this (possibly Drew Knife and Jared; confirm who stays on post-demo).

**1.2 Ontology + schema, SPINS (Special Instructions): rules and constraints within a mission (what is task-able vs what is physically possible)**
- *Owner:* Engineers, PMs assisting
- *Context:* SPINS depth is gated on domain input; Dan lacks the context and is sourcing it (transcript line 140).
- *COAs:*
  1. Create an agenda and research questions (plan) to ask Berner and Clark about SPINS, to get the information needed for ontology + schema. (Mary messaged both and collected insights on SPINS; call TBD.)

**2. Operator experience flows**
- *Owner:* PMs and Jonathan
- *Context:* Dan vibe-coded the operator experience for proposal screenshots; data layer not realistic, will share the codebase (transcript lines 149-151). OVD describes the screens; required user steps are explicit (transcript line 79).
- *COAs:*
  1. Get access to Dan's prototype, for reference.
  2. Draft an EWO process map of the Mission Planning workflow, referencing the OVD and the prototype.

**3. Pairing / scheduling domain service (GEO-only)**
- *Owner:* Engineers with PM assist
- *Context:* [OVD Appendix A](./SEWOL_Operational_Vision.md#L190) lists the pairing-engine inputs. MVP not required to auto-select TTP ([A.2.3](./SEWOL_Operational_Vision.md#L215)).
- *COAs:*
  1. Prioritize and determine which engine inputs and constraints to focus on for the demo.
  2. Scope to GEO and a representative subset of constraints. Don't model the full Appendix A list; pick the constraints that make pairing legible on screen.

### Discovery spike first

**4. SDK at platform + application level (proposed spike)**
- *Owner:* Engineers
- *Context:* Dan's named differentiator (transcript line 96). Contents named, but "mature SDK" and what a third party needs are loosely defined.
- *COAs:*
  1. SDK criteria spike. "This is what wins the deal": what a third-party integrator needs to build on us without dependency on Rise8 engineers (adapters, libraries, CLIs, docs, reference projects), plus agent-consumable.

**5. Mission O/S Core onboarding + cATO**
- *Owner:* PMs and Engineers
- *Context:* We build on Mission O/S Core; cATO is the lead differentiator (transcript lines 27, 42). Team not onboarded; Drew McFarland to help or point to a contact (transcript lines 104, 140).
- *COAs:*
  1. Reach out to Drew McFarland to get the platform engineers onboarded first.
  2. Then, when Dan responds, onboard the rest of the team members.

### Defer

**6. AI / agentic slice**
- *Context:* Not required for July; the bar is showing the team is thinking about AI use cases (transcript line 77). No agreed definition of agentic yet (transcript lines 54, 66).
- *COAs:*
  1. Define what "agentic AI" is and means.
  2. Look into AI features (AI side panels).
  3. Agent-consumable SDK.

**7. M2M with Project 7 C2 system**
- *Context:* Not strictly in the government roadmap; not required for July (transcript line 19). The resilient manual path is the actual MVP requirement ([OVD §5.1](./SEWOL_Operational_Vision.md#L160)).
- *COAs:*
  1. Build the manual/resilient path, not live M2M.
- *Note (Phase I, post-award, not July):* 30-day timeline; interface spec to receive a P7 test endpoint ([Tech Vol GFS](./Rise8_Technical_Volume.md#L482)).

**8. Other exceed-baseline (Chatsurfer, MEO/LEO, digital support center)**
- *Context:* Government lists these as ways to exceed the MVP baseline ([OVD §5.1](./SEWOL_Operational_Vision.md#L167)).
- *COAs:*
  1. Spike on Chatsurfer integration: requirements and dependencies.
  2. Spike on MEO/LEO and digital support center: requirements and dependencies.

### Updates as of June 9th 4pm

- Mary reached out to Berner, Clark, Thomas Anastasio is in the loop too, Abel also asked Sagar and Evan.
- Mary started a script/agenda for SPIN questions
- Mary started on the workflow process map for the demo

----


Fair point. Here's the short version:

---

## What Engineers Need to Do to Define Common Data Models

**The core work is two things: research and definition.**

First, engineers need to **research** what these objects actually are in the real operational world — what fields matter, what's authoritative (DoD standards, P7 spec, CNS), and where the gaps are between what exists and what SEWOL needs.

Then they need to **define and publish** each model as a versioned schema — typed fields, relationships to other objects, and an API contract that every other service (scheduler, planner, UI) can build against.

Until those schemas exist and are agreed upon, nothing else can be built reliably. The models are the shared language of the entire system.

---

**As spikes:** research unknowns — what does P7 actually send us, what fields does a COA need, how does JRFL bind to the scheduler.

**As chores:** write the schemas, publish them as OpenAPI specs, seed demo data.

That's the work.

/////

# SEWOL Call with Dan, JUNE 10

What we learned

How he can help

SPINS(Mary)
Who else did you talk to? Anyone we can interview?
- Dan: Clark and Berner are the best two people, Max pointed him to them.. SPINS and STOs that converation, He wants to be credible, CREDIBLE, and we are makimng assumptions we are NOT FAR OFF.. and Drew McF - GET CREDIBLE

THE PROCESS MAP
- Dan: perfect, 


We did NO PROMISE what we show in JULY
The only requirement and ask.. and ocntext we have
DEMO WORKING SOFTWARE

Dan's opinion.. 
1. demo more the Mission OS Core
2. We need to also demo CREDIBLE PLAN/PAIR/SCHEDULE
* PAiring is straight forward
- known list of assets, targets
- rules engine

RELEVANT AND CREDIBLE WORKING software
- DATE, tbd

June 1st - we submitted
Notify in 4 weeks "of the next part"
in person demo and table type exercise.
July 4th, + 3

MARY asking about the Prototype
the weighted scores, what were they based on?
Dan, said Claude did that.. 

Dan is an engineer, he wants to help built, not tell us HOW
He needs us to tell us how the team works..
Max will give guiadence

--

# RECAP FROM DAN CALL June 10 (SEWOL DEMO GOALS AND CONSTRAINTS)

## Demonstrate working, relevant and credibel software by the July in-person presetnation

**NOT REQUIRED** A full MVP, Rise8 has NOT promised a specific workflow to the SEWOL customer

>DAN: "We need to show something functional and credible that is relevant to what will eventually be guilt, not just a walkthrough for a platform (Mission O/S) for onboarding.

**2nd GOAL** Put Rise8 in a good place to avoid startinfom ZERO in August. The demo artifact should serve as a foundation for Phase 1 (UDL integrationm Project 7 Stand up, ABEL CONFIRM IF THIS IS PHASE I)

**Relevant Workflow** Plan, Pair and Schedule - Pairing a known list of assets against a known list of targets on a timeline, using a rules engine, Dan built a mockup..


===

# Max Slack Message on June 10, 6pm ET

Hi team! just as a follow up and to be explicit about expectation, I think this team should be prioritizing this SEWOL work as top priority for the period of time we have in front of us.
Once the TAK Production contract lands, our attention will decidedly shift back to that as your full-time billable allocations.

I can't wait to see you all crush it on a cool and unique opportunity for rapid prototyping

===

# SEWOL Dan's Recap on The goals June 10 - [gemini-transcript]

### Summary
Project strategy defined for SEWOL software demonstration to secure funding via prioritized engineering workflows.

**Demo Scope and Goals**
The team prioritized functional software for the July 20 demonstration to secure phase 1 funding. Development will center on the plan pair schedule workflow to ensure credibility.

**Data Modeling and Logistics**
Engineers received autonomy to define core data schemas while prioritizing Space Tasking Order (STO) and Special Instructions (SPINS) objects. Access to existing wireframes was established to accelerate local environment setup.

**Leadership and Execution Strategy**
Leadership declared the project the top priority for rapid prototyping. The team will integrate external expertise and streamline product management to meet the 28 day deadline.

### DETAILS

**SEWOL Project Overview and Alignment:** Abel discusses a recent alignment call with Dan Montgomery (Solutions Architect for Rise 8) regarding the SEWOL project, which is an electromagnetic warfare planning tool. The meeting focused on defining the scope, demo approach, and near-term engineering priorities for an upcoming presentation intended to secure a phase one follow-on contract (00:00:06).

**Demo Goals and Hard Requirements:** The primary goal is to demonstrate credible, functional software by July 20. Abel emphasizes that while a full MVP is not required, the software must be relevant to the eventual product to avoid merely showcasing a generic platform like Mission OS core (00:00:44).

**Secondary Goals and Long-term Foundation:** Abel notes a secondary goal of ensuring that current development serves as a foundation for phase one in August to avoid starting from scratch. Key considerations for this foundation include UDL (Universal Data Link) integration and the stand-up of Project 7 (00:01:56).

**Core Workflow - Plan Pair Schedule:** The demo will center on a "plan pair schedule" workflow, which involves pairing a known list of assets against a known list of targets on a timeline using a rules engine. This workflow is based on a mockup previously built by Dan Montgomery (00:02:28).

**Bidding and Notification Timeline:** Abel outlines the project timeline following the June 1 proposal submission. The client is expected to notify Rise 8 and other bidders approximately four weeks post-submission, likely around June 29 or early July. If successful, the team will have three weeks to prepare for an in-person demo and tabletop exercise during the week of July 20 (00:03:35).

**Data Modeling - Internally Defined Objects:** Dan Montgomery categorized domain objects into five blocks: Mission OS core, common data models, domain services, SDK, and operator experience. One category includes objects like "target," "asset," "plan," "schedule," and "task," where the engineering team has full control to research and define schemas, fields, and relationships without external dependencies. Abel assigns an action item for the team to define these in English relative to the SEWOL domain (00:05:24).

**Data Modeling - Externally Sourced Dependencies:** A second category of objects, such as STTO (Space Tasking Order), SPINS (Special Instructions), COA, CDA, and JRFL, are constrained by outside sources. Abel highlights STTO and SPINS as the primary priorities for the demo, while others like CDA (likely sourced from Surefire) should only be defined if they surface in the demo scope within the next six weeks (00:07:47).

**Scope Flexibility and Technical Approach:** Dan Montgomery granted the team 100% flexibility in determining the technical approach and specific "slice" of software to build, provided the output remains credible. Abel notes that if engineers find a proposed slice infeasible, they are encouraged to identify a better alternative (00:10:00).

**Process Mapping and Documentation:** The team is maintaining a process map grounded in the client’s Operational Vision Document (OVD), specifically section 3.4. Abel specifies that this map must distinguish between minimum requirements and MVP goals and should be updated following Subject Matter Expert (SME) interviews (00:10:26) (00:16:32).

**Subject Matter Expertise and Knowledge Gaps:** Abel identifies Clark and Berner as the primary contacts for domain questions. Additionally, Jonathan is scheduling time with Drew McFarland on June 11 to address knowledge gaps regarding SPINS and STTO to ensure the team can speak confidently during the July demo (00:11:26).

**Weighted Scoring and Pairing Rules Engine:** The demo includes a five-factor weighted scoring model for pairing assets and targets: capability match, footprint centrality, opscap health, slot eariness, and load balance. Abel clarifies that current weights are mere placeholders generated via Claude, rather than doctrine. While defensible weights are valuable, they are not expected to be the deciding factor in winning the contract (00:12:16).

**Codebase Access and Environment:** Dan Montgomery will provide access to his wireframe/mockup via a specific GitLab instance (gitlab.gl.rivet.us). Abel is responsible for forking the repository so the team can spin it up locally for review (00:13:45) (00:16:32).

**Team Prioritization and Leadership Guidance:** Following confusion regarding split allocations across multiple projects (e.g., Ship It, TAC UI), Max issued a directive via Slack prioritizing SEWOL as the top priority. Max characterized the effort as a "rapid prototyping" opportunity (00:14:09).

**Role of Dan Montgomery and Team Integration:** Dan Montgomery intends to act as an active engineering contributor rather than just an adviser. Abel will integrate Dan Montgomery into the team's agile ceremonies and recurring calls while ensuring he follows established working norms (00:15:05).

**Product Management and Engineering Execution:** Abel raised several open questions regarding the "rapid prototyping" approach, including how to leverage agentic development, which PM practices to streamline to fit the 28-day window, and how to avoid becoming a bottleneck while maintaining oversight of the project trajectory (00:17:31).

### Decisions [Aligned]
- Demo implementation flexibility authorized The team is authorized to exercise flexibility in the demo's implementation, provided the resulting deliverables are relevant and credible working software.

- SEWOL project prioritization established The Seaw Wall project is established as the team's top priority for the upcoming period.

### Next Steps

[The group] Define Data Models: Research and publish schemas, fields, and relationships for internally owned objects like targets, assets, plans, schedules, and tasks. Execute these definitions without waiting on external sources.

[Jonathan] Schedule SME Call: Coordinate a meeting with Drew McFarland to discuss domain knowledge regarding special instructions.

[Abel] Fork GitLab Repository: Access the provided repository instance for the project and spin it up locally.

[Abel] Onboard Dan Montgomery: Add the new contributor to all relevant agile ceremonies and recurring calls.

[The group] Review Process Map: Evaluate the current process map against the operational vision document to ensure alignment.

[The group] Validate Process Map: Confirm technical assumptions and map workflows with subject matter experts Clark and Berner.

[The group] Research Pairing Weights: Determine if domain grounded weights for the pairing rules engine are accessible before the July demo.

[Abel] Establish Prototyping Norms: Define the essential practices and norms required for the rapid prototyping effort. Identify specific processes to maintain project velocity.

[The group] Initialize Project: Configure the GitLab project once the guidance on the specific repository is received.

===

## SEWOL Internal Kick-Off , 11am June 11

### Summary
Team aligned on project timelines and methodologies for the upcoming demonstration with strategic infrastructure development.

**Timeline and Methodology**
Project milestones were established for late June and July with a focus on Improvement Kata frameworks to prioritize practical problem solving. The team decided to adopt an flexible documentation approach to prepare for the August kickoff.

**Data and Infrastructure**
Discussions clarified the prototype as a visual representation rather than binding technical requirements. Engineering strategy now emphasizes separating rigid external data models from flexible internal asset planning.

**Development and Engagement**
Teams prioritized establishing a unified GitLab environment and integrating subject matter experts to validate process maps. Engineers focused on synchronizing AI assisted workflows to maintain visibility and output consistency.

### Details

**Project Timeline and PTO Tracking:** Abel reviewed the project schedule, highlighting two primary milestones: a potential customer response regarding the demo by the week of June 29th, and a tentative in-person demonstration and tabletop exercise scheduled for the week of July 20th. To manage team availability, participants used a FigJam board to log their planned personal time off (PTO). Sean noted a scheduling conflict due to army commitments on the 12th.

**Project Approach and Improvement Kata:** Abel outlined the team's methodology, emphasizing the "Improvement Kata" framework to prioritize practical workflow understanding and problem-solving over rigid documentation (00:05:55). The goal is to prepare for a long-term project kickoff in August by documenting current processes, pain points, and jobs to be done without treating the task as a purely linear documentation exercise.

**Prototype and Data Model Strategy:** Abel clarified that the prototype provided by Dan is intended as a visual representation rather than a binding technical requirement, leaving specific implementation details to the engineering team (00:09:18). A distinction was made between "top" data models, which represent inputs from external systems like P7 and require strict adherence to existing standards, and "bottom" data models, such as target asset plans and schedules, where the team has more flexibility. Zachary noted they would check if schemas for the external systems are available via the UDL.

**Infrastructure and GitLab Provisioning:** The team discussed the status of the Mission OS Core platform, which serves as the foundation for the proposal. Jerod and Andrew Knife emphasized that the codebase should be hosted in a new GitLab repository specific to the project rather than the Rise8's GitLab. Andrew Knife committed to contacting Drew McFarland to expedite the necessary provisioning, though the team noted that initial development could proceed in the interim if required.

**Prototype Demonstration:** Sean provided a live demonstration of the existing prototype, which features a global interface tracking satellite and RF information, including chat and scoring features that currently rely on placeholder data (00:19:05) (00:22:47). The team acknowledged that determining the "end intent" of the planning, pairing, and scheduling workflow remains a primary objective, as the demo is intended to demonstrate a credible, end-to-end slice of functionality (00:17:30) (00:21:14).

**Stakeholder and Domain Expertise Engagement:** Abel proposed expanding future meetings with subject matter experts, specifically the upcoming call between Jonathan Van Dalen and Drew McFarland, to allow the broader team to gain domain insights and validate their process map (00:24:39). Jonathan Van Dalen expressed openness to this approach, and the team agreed that if knowledge gaps persist, they would coordinate additional meetings with other experts such as Berner, Clark, and Vicente Pomparo (00:25:51).

**Engineering Development Workflow:** The team discussed the necessity of establishing a standardized, AI-assisted development workflow (00:26:58). Andrew Knife highlighted the importance of synchronizing GitLab tickets with AI agents to ensure visibility for product managers as the agents generate work rapidly (00:28:21). The engineers plan to discuss and reach a consensus on their preferred development environment, including considerations regarding dev containers, to ensure consistency across the team's output (00:29:24).

### Decisions
**Needs Further Discussion**
Establishment of development workflow standards The engineering team must convene to discuss and define a unified development workflow and environment standard to ensure consistency across the team.

**Aligned**
Adoption of improvement kata methodology The team will anchor the project workflow and documentation on the improvement kata methodology to ensure strategic alignment for the August project launch.

### Next steps
[Zachary] Check UDL schemas: Verify if Unified Data Library schemas are accessible.

[Engieners, then rest of team] Align development workflow: Discuss and establish a unified approach for AI agentic development and environment setup among engineers.

[Jonathan] Contact Drew McFarland: Coordinate with Drew McFarland regarding domain knowledge, workflows, and Mission Operating System provisioning.

[Abel, Mary , Jonathan] Consult domain experts: Discuss and validate data model requirements with subject matter experts including Drew, Clark, and Burner.

===

# SEWOL - Workflow task and pairing with Drew McF

### Summary
Technical workflow discussion defined planning terminology and clarified operational constraints for the future software architecture.

**Defining Operational Terminology**
Participants established foundational definitions distinguishing mission planning from asset pairing. Discussion highlighted that current process maps represent an ideal future state rather than existing manual workflows.

**Operational Pain Points**
Key challenges include manual communication reliance, siloed planning data, and the absence of real-time status reporting from squadrons. These factors create significant risks for automated pairing tools.

**System Design Requirements**
The group decided that the software interface must prioritize a task-first view to align with planner workflows. The system must also support manual plan overrides to manage unpredictable operational variables.

### Details

**Background and Context:** Andrew McFarland provided context regarding their background in Air Force operations, specifically working on the Kratos product and Air Tasking Order processes, noting that the Space Force processes largely mirror those of the Air Force.

**Pairing and Constraints:** The group discussed the complexities of the pairing process, noting that while it involves mapping assets to tasks, practitioners must account for diverse inputs such as diplomatic compatibility, legal restrictions, and airspace deconfliction (00:02:02).

**Planning vs. Pairing Definitions:** Jonathan Van Dalen and Andrew McFarland clarified terminology, establishing that "planning" refers to the broader process of determining commander intent and missions, whereas "pairing" is the specific, granular task of assigning individual assets to specific mission tasks (00:05:38) (00:11:12).

**Doctrinal Baseline:** Andrew McFarland provided guidance on doctrinal documents, explaining that the Space Operations Directive (SOD) and Space Tasking Order (STO) serve as equivalents to the Air Force's Air Operations Directive (AOD) and Air Tasking Order (ATO), though individual operating locations often diverge from doctrine in practice (00:07:46).

**Process Map and Future State:** Mary Pollin and Jonathan Van Dalen discussed the project's process map, clarifying that the current documentation represents an ideal future state with an Electromagnetic Warfare (EW) planning tool rather than the current, largely manual state (00:12:24).

**Current Pain Points:** The team analyzed existing challenges, including the lack of orbital data for targets and capacity issues where assets are overtasked, noting that these problems become exponentially more difficult to manage when scaling beyond a single operator (00:13:25) (00:17:56).

**Information Sourcing and Communication:** Andrew McFarland emphasized that the most significant difficulty for operators is not the pairing decision itself, but the reliance on manual communication—such as phone calls—to obtain accurate, real-time data from operational units.

**Risks of Automated Pairing:** Discussing automated pairing tools, Andrew McFarland cautioned against relying on full automation due to "garbage in, garbage out" risks, noting that previous attempts at automated tools failed because the underlying inputs from manual, human-to-human communication were not accurately captured.

**Theater-Specific Variations:** Andrew McFarland advised against hyper-focusing on one specific theater of operations, noting that processes in regions like the 613th differ from more active theaters like Central Command, and the software must account for these variations.

**Managing Constraints and Deconfliction:** The team discussed the difficulty of managing overlapping constraints and time-sensitive deconfliction, which are currently handled manually and are susceptible to catastrophic error without a comprehensive operational picture.

**Signal Bundling and Siloed Planning:** Andrew McFarland identified signal bundling as a challenge, explaining that siloed planning often prevents operators from seeing opportunities to optimize asset usage, such as assigning one asset to multiple tasks, because different planners handle different portions of the schedule.

**Operational Disconnects:** There is a fundamental disconnect between planners and the squadrons that own the assets, as squadrons often lack a mechanism to report real-time asset status or availability, necessitating frequent manual change sheets to address errors.

**Feedback on Prototype:** Andrew McFarland reviewed the current software prototype, observing that the interface is currently "asset-first," whereas planners require a "task-first" view to efficiently map assets to mission requirements (00:40:02).

**System Requirements for Flexibility:** To be successful, the software must allow users to edit plans to account for non-automated, real-world data, such as manual updates received via phone calls, as a fully automated solution cannot account for all necessary variables (00:41:05).

### Decisions - Aligned
**Manual data input support for automation** The automated pairing tool design will prioritize a hybrid approach, ensuring the system supports the ingestion of manual, non-automated operational data as a table-stakes requirement.

### Next steps

- [The group] Internal Discussion: Discuss meeting insights and the process map internally to refine understanding of current versus future state requirements.

- [The group] Contact Andrew: Reach back out to Andrew McFarland with follow up questions once the internal team discussion is complete.

- [The group] Create agenda: Draft a structured outline for future meetings. Include follow-up topics identified during recent discussions.

===

## Drew McF session: scope filter and next steps

Measures the Drew McFarland session ([lines 375-428](#L375)) against Dan's stated demo goals ([lines 230-323](#L230)): credible plan/pair/schedule on a known list of assets against a known list of targets, sample data, STO and SPINS first, slice flexibility as long as the output is credible.

### In scope for the July demo

- Task-first view. The current prototype is asset-first; planners map assets to tasks task-first ([line 415](#L415)).
- Manual plan override. The pairing tool supports ingestion of manual, non-automated operational data as a table-stakes requirement ([lines 417](#L417), [420](#L420)).
- Planning vs pairing terminology in the process map. Planning is the broad commander-intent and mission work; pairing is assigning individual assets to specific tasks ([line 395](#L395)).
- Process map as a future state with the EW tool, distinct from the current manual state ([line 399](#L399)).
- Doctrinal grounding. SOD and STO are the Space Force equivalents of the Air Force AOD and ATO ([line 397](#L397)).

### Park for August / Phase 1

Raised by Drew, outside the July demo scope per Dan's goals:

- Real-time squadron asset status reporting, the planner-to-squadron disconnect, and manual change sheets ([line 413](#L413)). Depends on live data feeds and M2M, which Dan deferred ([lines 57](#L57), [142](#L142)).
- Capturing manual phone-call data into the system ([line 403](#L403)). The demo runs on known asset and target lists ([line 240](#L240)).
- Theater-specific variations, for example the 613th vs CENTCOM ([line 407](#L407)).
- Signal bundling optimization across siloed planners ([line 411](#L411)).
- Orbital data sourcing for targets ([line 401](#L401)).

### Decision from the session

- The pairing tool design uses a hybrid approach and supports ingestion of manual operational data as a table-stakes requirement ([line 420](#L420)).

### Next steps (from session close, [lines 422-428](#L422))

- [The group] Discuss the session insights and the process map internally to refine current vs future state.
- [The group] Reach back to Andrew McFarland with follow-up questions after the internal discussion.
- [The group] Create an agenda for future meetings, including the follow-up topics identified.

### Mary's takeaways

- Input data is updated manually. The team gets the document updates from humans manually ([line 403](#L403)).
- The pairing engine (also referred to as the generation engine or the rules engine) takes manual effort from the EWOs. Open question: how might we automate that? Drew's point was that the constraint is the input information, not the pairing step itself.
- If the inputs are bad, the pairing engine output is bad ([line 405](#L405)).

===












----

## June 11th, PM scratch pad




===

SEAN
He is fixing Dan's prototype?
Rapid Prototyping




STO
SOCO
SPINS
COA
CDA
JRFL

- 

## ALL DEVS COME UP WITH THE BEST SOLUTION
- Beads?
- Being able to sync the tickets with GitLab, agents tracking

On-boarding Portal, from Drew mcF
POC Mission O/S 

Pairing as much as possible todau (Mr. Knife)
TAK GAP Pairing

--

