# THE FOUR TASKS FROM THE SOW

### TASK 1 — AI/ML GRG Plugin SDK Update to v5.6
> SOW Reference: 4.3.1

**What the task is:**
Update the existing AI/ML GRG ATAK plugin from its current SDK version to the most current release (v5.6), as maintained by the TAK Product Center (TPC), while maintaining compatibility with SOCOM's release processes and TAK Forge security standards.

**What it actually means in practice:**
This is an execution task, not a research task. The plugin was built during an 8-week competition and has not been maintained against the TPC release schedule since. The work involves identifying and resolving breaking changes introduced by the v5.6 SDK, ensuring all existing modules continue to function, and producing a deployable artifact that can survive TAK Forge's security scanning pipeline. Kevan's expectation is that this could be completed within the first sprint if no unknown compatibility surprises surface.

**What "done" looks like:**
- All existing plugin modules function correctly on SDK v5.6
- Breaking changes identified and documented in release notes
- Plugin tested and verified on physical Android devices (not just emulators)
- TAK Forge Fortify scan passes: zero critical, zero high, fewer than 10 moderate, fewer than 20 low findings
- Mil-tagged APK pipeline enabled via Program Office MOA/MOU request
- Release package complete with everything downstream teams need to deploy

**What success looks like once delivered:**
- The plugin installs, launches, and completes an AI GRG generation workflow on v5.6 without crashes or build errors
- A compliant, stable, deployable version consistent with the TPC or SOCOM release schedule exists in production
- SOFMC can demonstrate the plugin running on v5.6 in a real device environment

**Key constraints and risks:**
- TAK Forge access and AppGate provisioning are hard blockers — neither can be self-served and must be requested from the Program Office at or before kickoff
- The mil-tagged APK requires a formal government request to unlock the TAK Forge pipeline — without it, the team cannot deploy to real military users regardless of code quality

**Scope ambiguity:** the SOW says "modernize" but the actual expectation is "restore compatibility with the current release" — clarifying that boundary with Jonathan Miller at kickoff prevents scope creep.

**How this connects to OUTCOMES:**
This task is an enabling outcome. It does not improve what the plugin does for the warfighter. It restores the precondition for getting the plugin into real user hands — which is the only path to measuring any mission outcome at all. The user outcome ("a GRG creator produces an accurate map in less time") cannot be validated in production until this is done.

### TASK 2 — TAK UI Framework Research and Migration
> SOW Reference: 4.3.2
**What the task is:**
Conduct research, in collaboration with the government team, to provide a cost and timeline estimate for rewriting the AI/ML GRG plugin into the TAK UI development framework. The stated goal is to establish TAK UI Bridge language cross-compatibility — meaning a single plugin codebase that deploys across all TAK-supported clients: ATAK (Android), WinTAK (Windows), and eventually TAK-X (Linux).

**What "done" looks like:**
- Framework mapping artifact completed: current UI components inventoried, TAK UI equivalents identified, gaps and decisions flagged.
- Risks of migrating documented, including any modules that broke or lack equivalents
- A mockup of what the plugin looks like under the new UI framework
- A roadmap with proposed milestones and timeline estimates
- If implementation is in scope: TAK UI components rendering correctly across Android and Windows from shared code

**What success looks like once delivered:**
- The same UI components render and function correctly across ATAK and WinTAK from a single shared codebase
- Future platform additions require no UI rewrite — multi-platform parity is confirmed at the code level
- SOCOM/SOFMC can make an informed go/no-go decision on funding a full TAK UI migration as part of the follow-on OT contract
- The plugin survives future TAK SDK updates without requiring UI rework each time

**How this connects to OUTCOMES:**
This task is an enabling outcome for the engineering team and for SOCOM/SOFMC's decision-making capacity. 
- The behavior change it enables: SOCOM/SOFMC can deploy and maintain the GRG plugin across all TAK clients from a single codebase, without needing separate implementations per platform. 
- The enabling impact: future feature work and model improvements ship once and reach all users, rather than requiring parallel builds. 
- The mission connection: operators on Windows (WinTAK) and Android (ATAK) work from the same map experience and the same plugin version, reducing inconsistency across devices during mission planning.

**What it actually means in practice:**
The plugin built during the competition did not use TAK UI components. It was built fast, for a prototype context, and the current UI is described as "an absolute mess" that doesn't adhere to TAK UI standards. Kevan's expectation is that the team should execute the migration, not just estimate it — the idea being "look, we did it, here's how long it took" is a stronger output than a document projecting what it might cost. The research framing in the SOW is likely contract language, not a directive to stop short of implementation. However, this has not been confirmed with the customer, which is a live risk. Regardless of whether the team estimates or implements, a critical intermediate output is a mapping artifact — an inventory of every current UI component, what its TAK UI equivalent is, and what decisions need to be made for components with no equivalent.

**Key constraints and risks:**
* TAK UI documentation and the TAK UI repo are locked behind AppGate — the team cannot access them until TAK Forge access is provisioned. Research cannot start without it
* Scope ambiguity is the highest risk on this task: the SOW says "research and estimate," Kevan says "just do it." The customer has not confirmed which they expect. This must be clarified at kickoff before the team commits to either path
* Political sensitivity: TAK UI is TPC's software, not SOCOM's. If Rise8 evaluates it critically under Task 4 (GOTS evaluation) while simultaneously recommending its adoption here, those two positions may conflict — and Rise8 would be caught in the middle of an unresolved SOCOM vs TPC tension
* HCI constraint: the plugin cannot deviate from standard ATAK flows and user expectations. Consistency is a non-negotiable principle — improvements are possible, but the TAK UI standards set the ceiling for design decisions

### TASK 3 -  AI/ML Model Improvements
> SOW Reference: 4.3.3

**What the task is:** Conduct research, in collaboration with the government team, to make improvements to the AI/ML model powering the GRG plugin's building detection and labeling capability.

**What "done" looks like:**
- Customer-confirmed scope: SOCOM has identified which specific areas they want improved — architecture, training data, inference strategy, or a combination
- Documented baselines for all relevant model metrics tied to the confirmed use cases
- At minimum one improvement cycle completed with measurable output against those baselines
- A codified model training pipeline documented end-to-end: data collection, labeling, training, evaluation, validation, and monitoring in production
- Evidence of improved detection across at least one terrain type where the model previously underperformed (tree cover, complex urban environments)

**What success looks like once delivered:**
- The model produces more accurate GRGs in shorter time frames compared to the competition baseline, as demonstrated on a real device
- SOFMC can independently run their own model training pipeline — the capability exists and is repeatable without Rise8 present
- The label correction rate drops below the 9-12% competition baseline, with a customer-confirmed target threshold

**How this connects to OUTCOMES:**
This task sits closest to a mission outcome of the four. The behavior change it enables for the GRG creator: producing a complete, accurate map with fewer manual corrections in the available planning window. 
- The enabling impact for the internal team: a repeatable training pipeline that can incorporate field feedback and improve the model continuously — reducing the cycle from "feedback received" to "improved model deployed." Without that pipeline, every improvement is a one-off and the OT contract has nothing to build from. The mission connection lives in the gap between process block 8 and block 9 of the VSM: if the model improves based on field data, operators execute missions with GRGs they can trust rather than tolerate.

**What it actually means in practice:**
This is the most undefined of the 4 tasks. The SOW offers no metric, no target, and no scope. The team ranked first in the competition and received almost no qualitative feedback — only confirmation that requirements were met. As a result, the team is entering this contract without knowing whether the customer wants improvements to the model's architecture, its training data, its inference strategy, or something else entirely. That ambiguity is the first thing that must be resolved with SOCOM at or before kickoff.

- What the team does know from the competition: the model uses a customized YOLO framework optimized for mobile, runs entirely on-device via ONNX to meet DDIL requirements, and uses a hybrid section-based inference approach that achieves 80-90% accuracy per section versus 60-70% on a full AOI scan. The label correction rate from competition was 9-12%. There is also an important distinction between three separate improvement categories that tend to get conflated: the model (building detection), the algorithm (ordering and labeling detected buildings), and the UI/UX (how users review and correct results). Improvements to one do not automatically improve the others.

- A further complication: the AWS/SageMaker infrastructure from the competition was wiped. No run logs or training data exist. A CVAT backup lives on one team member's local machine. The team effectively starts from scratch on the data and training side.

**Key constraints and risks:**
- Scope is undefined by the customer — the team risks improving the wrong thing if this isn't clarified at kickoff. This is the most urgent open question for Task 3
- No real-world production data exists. The model has never been used in a live field environment. Every improvement made during these 8 weeks will still be based on competition assumptions until the plugin reaches production users
- The training infrastructure was wiped. Restarting the pipeline requires provisioning a new environment and justifying a training run — which requires new data or specific feedback to validate the effort
- DDIL is a hard constraint on model architecture — any improvement must still run entirely on-device with no cloud dependency. This limits what model sizes and inference approaches are viable
- Model improvement, algorithm improvement, and UX improvement are three separate things. Without a shared definition, the team may deliver model accuracy gains while the customer expected faster label correction — or vice versa

### TASK 4 - GOTS Modularity and Scalability Evaluation
> SOW Reference: 4.3.4
**What the task is:** Evaluate existing program-of-record Government Off-The-Shelf (GOTS) software capabilities for modularity and scalability, as directed by the Government, and deliver an assessment in a briefing to the Program Management Office (PMO). The evaluation framework is anchored in MOSA — Modular Open Systems Approach — a mandatory DoD acquisition strategy requiring systems to use modular design, standardized interfaces, and open standards so components can be added, replaced, or upgraded without full rebuilds.

**What "done" looks like:**
- A confirmed list of GOTS capabilities in scope, agreed with the customer before evaluation begins
- A documented evaluation framework grounded in MOSA criteria: modular design, standardized interfaces, open standards, replaceability of components
An assessment of each in-scope capability against that framework
- A Version 1 repeatable evaluation process that can be reused for future GOTS assessments
- A PMO briefing delivered with findings and recommendations
Clarification on whether the TAK UI migration work (Task 2) satisfies the research requirement for this task or whether a separate evaluation is expected

**What success looks like once delivered:**
- SOCOM/SOFMC has a documented, evidence-based position on which GOTS capabilities meet modularity and scalability standards and which do not
- SOCOM/SOFMC can use the briefing to make or justify development resource decisions — including whether to continue building on TPC's platform or invest in their own capabilities
- The evaluation framework is reusable — a future team can apply it without starting from scratch
- Rise8 has not taken a position on the SOCOM vs TPC organizational tension, only on the technical criteria

**How this connects to OUTCOMES:**
Of the four tasks, this one connects most indirectly to mission outcomes. Its primary value is organizational — it gives SOCOM a documented basis for decision-making about their software ecosystem and development investment. 
If SOCOM uses the evaluation to justify continued development on top of TPC's platform, or to justify building independent capabilities, that decision shapes what the follow-on OT contract looks like and what Rise8's role in it will be. 

- The enabling outcome here is SOCOM's decision-making capacity: they can make an informed, defensible choice about their GOTS stack rather than an assumed one. The mission connection is downstream — a more modular, replaceable system means faster model updates, faster deployments, and less friction getting improvements to operators in the field.

**Key constraints and risks:**
* No in-scope software list exists. The customer has not provided one. The evaluation cannot be scoped or started without it
* Political sensitivity is the highest risk on this task. TAK UI is TPC's software, not SOCOM's. If Rise8 evaluates it and surfaces modularity or scalability gaps, it is functionally critiquing TPC — an org with its own relationship to SOCOM that Rise8 doesn't fully understand yet. Kevan flagged this tension but acknowledged it may be overstated. 
It needs to be confirmed before Rise8 takes any position
Overlap with Task 2 is unresolved. If TAK UI is in scope for both the migration (4.3.2) and the evaluation (4.3.4), the two workstreams need to be coordinated so the outputs don't contradict each other

* The team has not yet reviewed the prior sprint demo decks and MOSA alignment documentation from the competition — that material is the fastest path to understanding what evaluation criteria already exist and what the team has already claimed about MOSA compliance

* No template or format has been confirmed for the PMO briefing. Clarifying this at kickoff prevents rework at delivery

--- 

# CHALLENGE AND CURRENT CONDITION

**Current Condition:** 
The Manual Bottleneck: Highlighting the trade-off between speed and tactical risk -  
GRG creators operate within a time-sensitive, fixed planning window to move from raw imagery to a mission-ready GRG. Because the process is manual and effort grows disproportionately with building count, creators are forced to prioritize speed over thoroughness.

**So What:** Under tight windows, creators may sacrifice completeness — labeling fewer buildings — or accuracy — increasing the likelihood of judgment errors. This leads to operators executing missions with a shared reference that is either incomplete or unreliable, increasing tactical risk.

---

**Current Condition:** The knowledge Gap: Highlighting the danger of building for the wrong mission window (minues vs.days) - GRG creators must support missions ranging from a a few minutes "Hasty" window to a multi-day "Deliberate" window. However, there is no documented standard or telemetry describing how creators prioritize tasks when time is the primary constraint.

**"So What?":** Without understanding these trade-offs, the product team risks optimizing for the wrong scenario—potentially delivering high-fidelity features that are unusable during "Hasty" windows, or lightweight features that lack the detail required for "Deliberate" planning. This lack of alignment prevents us from defining a "Minimum Viable GRG" for high-pressure missions.

---

**Current Condition:** The Silent Failure: Highlighting the inability to learn from real-world mission outcome - There is currently no telemetry or structured feedback loop capturing how GRGs perform during live mission execution. We lack the "Ground Truth" of whether an operator corrected a label, found a feature unusable, or encountered a mission-critical error in the map.

**"So What?":** This "Silent Failure" risk means the product team could be unintentionally reinforcing tactical inaccuracies in the AI model. Without a feedback mechanism, we cannot differentiate between a "successful" GRG and one that was simply "tolerated" because there was no way to report its flaws, making it difficult to validate Mission Impact.


--- /// Workshoping
### CHALLENGE: Planning window variability
A challenge GRG creators face is producing a mission-ready GRG when the available planning window varies; from 10 minutes to multiple days and there is no shared understanding of what "good enough" looks like under each condition, which may risk the tool being optimized for the wrong scenario.

**Risky assumptions**
- That planners behave the same way regardless of time window, a 10-minute planner and a 2-day planner may use the tool completely differently.
- That the plugin's current design accounts for any of these scenarios it may have been built with one window in mind
- "The difference between having a sheet of music or having none" — this is a powerful quote but it came from one person. Is it representative?

**Clarifying questions**
1. Under a 10-minute window, does a planner even attempt a full GRG — or do they skip steps entirely?
2. Is the time window known before the planner starts, or does it sometimes change mid-process?

## CHALLENGES: END TO END GRG Creation Process
> TLDR: _The end-to-end GRG creation process — from getting imagery onto the device through labeling every building — is largely manual, judgment-dependent, and time-consuming, with no automation or standards to guide operators, which may risk inconsistent GRG quality and significant time loss before a mission even begins._

### IMAGE PREP is a connectivity and size-dependent bottleneck
A challenge GRG creators face is getting the right imagery onto their device when data packages are large, multiple packages may be needed, and connection stability cannot be guaranteed, which may risk delaying or preventing GRG creation before the process even begins.

### GRID DEFINITION is a manual, judgment-dependent process with no automation
A challenge GRG creators face is placing and defining a grid over the map when there is no automation to support sizing, spacing, or placement, relying entirely on operator judgment, which may risk inconsistent grid quality and increased time to complete.

### SECTION DRAWING has no standard, producing variable results across operators
A challenge GRG creators face is drawing sections over the gridded map when there is no prescribed method — operators rely on judgment and natural landscape breaks — which may risk variability in GRG quality across operators and missions.

### BUILDING LABELING is a high-effort, error-prone manual process
A challenge GRG creators face is identifying and labeling every building within the grid when the process is entirely manual, requiring individual taps for each building and offering no easy way to correct sequencing errors after the fact, which may risk significant time loss and operator frustration, particularly as building count increases.

**Open Questions**
1. Has a mislabeled or inconsistently labeled GRG ever caused a communication failure or near-miss in the field?

### LABELING CONVENTIONS are operator-dependent with no shared standard
An assumed challenge GRG creators might face is determining how to order and direct building labels when no prescribed method exists, relying on team preference and habit, which may risk inconsistent GRGs across operators and potential miscommunication during mission execution.

**Risky Assumption**
- Labeling inconsistency across operators may not actually cause communication failures in the field — we have no confirmed evidence of this happening
- Operators may not be aware their conventions differ from other teams — they may assume their method is standard
- A prescribed standard may not be adopted — experienced operators may resist changing habits they trust
- The AI labeling algorithm may not resolve this — 90% out-of-box acceptability still leaves room for operator override and reintroduction of inconsistency

**Open Questions**
1. Do units that work together regularly develop shared conventions — or does inconsistency exist even within the same team?
2. Who has the authority to define a labeling standard — a SOCOM/SOFMC decision, or a unit-level decision? - or not something we should concern ourselves with?
3. Does the customer see labeling inconsistency as a problem worth solving, or is operator discretion considered acceptable?
4. When operators correct AI-generated labels, are they correcting errors or imposing their personal convention?

# NOT KNOWING WHAT WE DONT KNOW
## No mechanism exists to capture how the GRG performed in the field
A challenge GRG creators and the team face is learning whether a GRG was effective during mission execution when there is no built-in mechanism to capture operator corrections, field performance, or post-mission feedback — which may risk model improvement decisions being made without real-world evidence and prevent the team from defining or measuring mission impact.

# Model accuracy is inconsistent across terrain types with no clear path to resolution
A challenge the team faces is maintaining consistent building detection accuracy when terrain types vary — clear desert, tree cover, and complex urban environments have each produced different results — which may risk GRG completeness and reliability depending on where a mission takes place.

**Risky Assumptions**

- Operators would consistently report GRG effectiveness after a mission — debrief culture may vary
- Rise8 would have access to post-mission feedback even if a mechanism existed classification or operational security may limit what can be shared

**Open Questions**
1. Does any post-mission debrief process exist today — formal or informal?
2. Is there any existing data on how the GRG performed in the field, even anecdotally?
3. Which terrain types are most operationally relevant to SOCOM/SOFMC right now?

### RISK: Misaligned expectations around mission impact scope
We may be scoped to improve one component of a system where mission impact depends on factors, dependencies, and stakeholders outside Rise8's control — which risks setting expectations with the customer that our improvements will produce mission outcomes that are not fully within our reach to deliver or measure.
---

# NARRATIVE AND CONTEXT
/ THEME-1: Time to plan varies across missions
**2. Time pressure is the critical pain point**
Under 2–3 hour windows, AI GRG creation is "the difference between having a sheet of music or having none." Speed directly determines whether a mission can be planned at all.

**6. Mission time windows vary dramatically**
Some missions allow days for planning; others allow 10 minutes. The plugin's value proposition and success criteria change significantly depending on the window — and no framework exists yet to account for both.
> Abel's take: My first theme attempts to consolidate an assumption of a potential challenge or problem that the GRG creation process can have other influencing factors and that is how muich time GRG creators or planners have to create one, if the mission is happening within 10 mins, 3 hours or 2 days. How might we use these pre-conditions to ensure our solutions lead to outcomes for each scenario?"
// THEME-1 END

// THEME-2: Image Prep, Grid Creation, drawing sections and Labeling process
**2. Image preparation is a hidden friction point**
Downloading large imagery packages, managing multiple data packages, and dealing with connection instability is the first step in the workflow — and already a barrier before GRG creation even begins.

**3. Grid and section definition is entirely manual and finicky**
No automation exists for placing the grid or drawing sections. Getting section sizes, shapes, and naming flow right is time-consuming and relies on judgment — a known pain point across users.

**5. Section drawing relies on operator judgment with no standard**
Planners draw sections based on natural landscape breaks — roads, tree lines, intersections — but there is no prescribed method. This creates variability in GRG quality across operators and missions.

**3. Labeling accuracy and sequence correction is the worst UX**
9–12% of labels require manual correction. Fixing numbering sequences after hundreds of labels are placed is described as extremely frustrating and time-consuming.

**1. Manual building labeling is the worst user experience**
Identifying buildings manually, tapping hundreds of items, and fixing label sequences when mistakes occur is described as extremely frustrating. Effort doesn't scale linearly — it explodes with building count and time pressure.

**4. Labeling conventions are tribal knowledge**
No prescribed standard for label order or direction. Teams rely on preference and habit, creating inconsistency across GRGs and potential for miscommunication during mission execution.
> Abel's take: It's worth calling out that this theme encompass 5 process blocks in our VSM: staring the image prep process, defining the grid, non-buildings, drawing sections and labeling buildings. Each with different and unique pain-points and friction. It will be wise to make sure we fully understand the specific workflows and pain-points so that whatever mission-outcomes we define here, are causal towards mission impact. I expect to split these up a bit more, not making one big problem statement. there's at least 2 or 3 here.. This is also "the core" what's likely the most "heavy" or "busy" portion of the workflow. However also the most "dangerous" to get tunnel vision on. 
//THEME-2: END

//THEME-3: Cognetive friction?
**2. Cognitive load reduction is the stated outcome**
The SOW explicitly names "decreasing the cognitive workload by generating an AI/ML GRG" as a core objective — the only user-facing outcome explicitly called out in the contract language.
> Abel's take: so not sure if I want to keep this as a problem/challenge theme, because this is a desired outcome if we fix the creation process and improve based on feedback from post mission insights.
//THEME-3: END

// THEME 4 - Improving the model without post mission execution feedback loops
**6. Post-mission feedback loop is absent**
No built-in mechanism exists to capture operator corrections or field performance for model retraining. The feedback cycle from mission execution back to model improvement is a known gap

**8. The post-mission feedback loop is almost entirely unknown**
What happens after the GRG is shared — during execution and debrief — is the least understood part of the value stream. No mechanism exists to capture field corrections or GRG effectiveness for model improvement.

**1. Model accuracy degrades across terrain types**
Prior work confirmed quality results varied significantly across terrain — clear desert performed differently than areas with tree cover or complex urban environments. Consistent accuracy across diverse AOIs remains an unsolved problem.
> Abel's takes: this is what I consider "the honey pot" and as sonn as we re-start the contract and engaging with the customer, we should get at this ASAP, because this will allow us not just avoid tunnel vision from the prior problems of the creation of the GRG process, but establish our learning feedback loops, have data to truly improve the model, the UI/UX and make further enhancements. 
// THEME 4 -end


// THEM 5- Hidden dependecines and value stream - RISK FOR OUR TEAM
**1. TAK is a decision-cycle enabler, not just a mapping tool**
SOW frames TAK as critical to SOF operator decision cycles, force responsiveness, and mission command — GRG creation sits inside a much larger operational context than the plugin alone addresses.
> Abel's Takes: Another "honey pot" that is a blind spot and also could be impacted by "tunne vision" of the GRG creation process. We risk the false pretense and assumption that we are fixing problems or reaching outcomes, but if we don't understand dependencies, hiearchies and other aspects of the value stream then we miss out on misison impact, (I need to understand more about decisions cycles, force responseiveness and mission command, not just what they are and where do they all "fall in" within the specific GRG creation process, but how do they measure those things?)
// THEM 5-end
