


# End of Day Sync - May 27th [Gemini transcript]

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


