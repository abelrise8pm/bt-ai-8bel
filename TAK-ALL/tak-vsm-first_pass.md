# TAK VSM - First Pass

## Mission Impact — Working Hypothesis

> `v0.1` - SOF operators make faster, more informed decisions during mission planning and execution — reducing cognitive load and operational risk in time-critical environments.
> `v0.2` - SOF Planners produce mission-ready GRGs faster and with less cognitive effort — ensuring operators have a shared targeting reference even in time-critical windows (under 2-3 hours), reducing operational risk and increasing mission success.
> `v0.3` - SOF Planners produce accurate, labeled GRGs within a 3-hour mission window — giving all executing personnel a shared targeting language that enables coordinated ground, air, and artillery action, reducing the risk of miscoordination and mission failure.

## Mission Impact — Placeholder Statement

> SOF teams execute missions with more complete maps — every operator on the same page, speaking the same targeting language, even when time is short — so less bad things happen.

**Core Mission we're framing improvements around:**
> SOF teams execute missions with more complete maps — every operator on the same page, speaking the same targeting language, even when time is short — so less bad things happen.

**Mission/Business imperatives for this improvement cycle:**
> Reduce GRG creation time and cognitive burden so the planning window is never the bottleneck — especially in time-critical scenarios under 2-3 hours.

**Existing KPIs / improvement goals:**
- Time to complete GRG: **[baseline ~60 min] → [target <15 min]**
- Cognitive load score: **[baselining in progress — survey scale]**
- Labeling accuracy out of box: **~90% (validated)**
- Manual correction rate: **[9-12% of labels require edits — validated]**

---

## Value Stream Scope

> SOF Mission Planning — from mission order received, through GRG creation and distribution, to mission execution and return — so we can measure whether the GRG enabled the team to succeed.

> **Scope boundary note:** The value stream ends when the team returns from the mission, not when the GRG is distributed. Distribution is a near-end step — but we can't know if the GRG worked until the mission is complete. If the team can't confirm the scope boundary during the workshop, default to GRG distributed and flag for follow-up.

## Supplier / Initiator Candidates

> "Who starts the desired outcome of our value stream?"

- **Command/Order Issuer** *(unconfirmed — needs validation)* — issues the mission order ("Orders! Red building!"), which triggers the entire planning process. Who exactly this is (SOCOM, SOFMC, unit-level command) is not confirmed by evidence and should be surfaced in the workshop.
- **Intelligence sources / targeting data** — provides AOI imagery and targeting information the Planner needs to begin GRG creation (e.g. Maxar imagery)

> Triggering inputs: mission order + target location data. Without both, no GRG gets made.

## Customer / End-User Candidates

> "Who realizes the desired outcome(s) of the value stream?"

- **All executing personnel** — primary customer; receive the shared GRG and use it to navigate and communicate during the mission
- **JTAC** (Joint Terminal Attack Controller) — uses the labeled map to coordinate air and artillery support ("nine lines")
- **Ground forces, air support, artillery teams** — downstream users of the shared targeting language

> Note: The **SOF Planner** is a process block, not the customer. They receive the mission order and produce the GRG — they sit in the middle of the value stream. Worth naming explicitly in the workshop, as the team may instinctively call the Planner the "user."

## Assumed Triggering Event / Inputs — "What starts the process?"

- **Triggering event: A mission order is issued** — command designates a target and the clock starts ("Orders! Red building!")
- **Target location** — the specific building or area of interest
- **Time constraint** — typically 3 hours or less to plan and execute
- **AOI imagery** — high-resolution map data (e.g. Maxar) loaded into ATAK to give the Planner enough detail to work with
- **Intelligence / targeting data** — informs which buildings matter and how the area is structured

> Without mission order + target + imagery, the Planner has nothing to work with. All three arrive as a bundle that kicks off the GRG creation workflow.

## Assumed Outputs the Customer Receives — "What outputs do customers/end-users receive?"
- **Primary output: A shared, labeled GRG artifact** — a complete map of the target area with identified buildings, numbered sections, and a legend, exported as a KMZ file and distributed to all executing personnel
- Building markers with systematic labels (e.g. A1, B3)
- Section boundaries drawn along roads or terrain breaks
- Grid coordinates in MGRS
- Legend with operation title, location, and version
- A shared targeting language usable over radio and digital comms ("building A3, section B")

> The output enables coordinated action under a common reference — ground, air, and artillery teams speaking the same targeting language when it matters most.

---

**Strongest Evidence (running)**
- "key enabler for SOF operators decision cycle" + "force responsiveness and availability" — SOW
- "decreasing the cognitive workload by generating an AI/ML GRG" — SOW
- "streamline and accelerate critical mission command activities" — SOW
- "the difference between having a sheet of music or having none" — pre-sow-tak-competitions, line 78
- "reducing risk and increasing mission success" — pre-sow-tak-competitions, line 13
- 60 → 15 min target; 28 min measured savings — pre-sow-tak-competitions, lines 92, 222
- "effort doesn't scale linearly — it explodes" — pre-sow-tak-competitions, line 107
- Operator remains final authority (augmentation, not automation) — pre-sow-tak-competitions, line 385
- "operators in the field have three hours to plan and execute a mission to enter a target building... map building is crucial" — tak-daily-march_16-20, line 181
- "completed map needs to be shared with all executing personnel to ensure shared situational awareness and common communication references" — tak-daily-march_16-20, line 181
- "standards require a shared definition of building identities for coordinating air or artillery support with ground forces" — tak-daily-march_16-20, line 187
- Manual labeling is "time-consuming and painful, particularly when needing to reorder many points" (confirmed current state waste) — tak-daily-march_16-20, line 190

**Open Questions (running)**
- No explicit operational metric for "success" defined in any source so far
- Who is the Planner exactly — dedicated role or any SOF operator?
- Is 15 min the right target, or does it vary by mission type?
- Planner role may be answered: gunnery sergeant, fire support specialist, or any operator in the field — still needs customer validation
- Are there more use cases and user segments beyond the GRG planner? (JTAC mentioned, others likely)
- What are the consequences of a mislabeled GRG? (miscoordinated fire support implied but not explicitly confirmed)
- Do we have access to real production users, or only user representatives from the competition?
- Who specifically issues the mission order — SOCOM command, unit-level leadership, something else? What does that hand-off look like?

---

## People / Systems Roster

### People (roles and representatives)
- **SOF Planner** — the person who receives the mission order and creates the GRG. Could be a gunnery sergeant, fire support specialist, or any operator in the field. Role not fully confirmed — needs validation. *Known reps: GySgt Wagner, SSgt Hayes, Justic (competition participants)*
- **All executing personnel** — receive the GRG and use it to navigate and communicate during the mission. Primary customer of the value stream.
- **JTAC** (Joint Terminal Attack Controller) — uses the labeled map to coordinate air and artillery support ("nine lines"). Downstream customer.
- **Ground forces** — operators who enter the target building; use GRG for navigation and radio communication.
- **Air support / pilots** — referenced in targeting coordination; use GRG to identify strike or support targets.
- **Artillery teams** — coordinate indirect fire using shared building labels.
- **Command / Order Issuer** *(unconfirmed)* — issues the mission order that starts the clock. Who exactly this is needs validation.
- **Intelligence / targeting analysts** — provide AOI imagery and targeting data that the Planner needs to begin GRG creation.

### Systems (ordered by assumed relevance to value stream)
- **ATAK / WinTAK** — primary platform; Planner creates and distributes the GRG here
- **GR8 Plugin** — AI/ML GRG plugin running inside ATAK/WinTAK; core of the improvement cycle
- **ONNX Runtime** — runs the building detection model on-device (DDIL-compatible, no cloud dependency)
- **TAK Forge / TAK Server** — distribution pipeline; how the GRG artifact is shared to executing personnel
- **KMZ format** — export artifact; the GRG file format distributed to the team
- **MGRS coordinate system** — grid reference standard used for all location and targeting communication
- **COT (Cursor on Target) markers** — protocol for transmitting position and targeting data over TAK network
- **Maxar imagery (or equivalent)** — high-resolution AOI imagery loaded into ATAK at the start of GRG creation
- **Survey / cognitive load instrument** — baselining tool for measuring Planner effort (in progress)
---

## First Pass — Value Flow

### Opening frame
> "We're going to map what actually happens — not what should happen, not the ideal. Describe the real process. We'll start at the end and work backwards, then fill in the middle."
---
### Prompt 1 — Last process block
> "When the team comes back from the mission — what is the very last thing that has to happen for us to say the GRG did its job? What does 'done' look like from a mission value standpoint?"

*Listen for:* Debrief, after-action review, feedback on GRG accuracy, confirmation that shared targeting language held up under fire.

*If the team jumps to GRG distribution:* "That's likely a step near the end — but do we know whether it worked at that point? What happens after execution that tells us the GRG succeeded?"

*If the team pushes back on mission return as the boundary:* "Fair — let's use GRG distributed as the right endpoint for now and flag the post-mission feedback loop as out of scope. We can revisit if it matters for the metrics we care about." Then pin GRG distributed as the last block.

**Last block:**
> [ ]

**Facilitator note:** The team may land on two plausible endpoints:
> - `GRG distributed to all executing personnel` — the delivery milestone
> - `Team debrief / after-action review` — the validation milestone
>
> Either is defensible. Pick one, name the assumption, and move on.

---

### Prompt 2 — First process block
> "When the mission order comes in and the clock starts — what is the very first thing the Planner does? What actually kicks off the GRG creation?"

*Listen for:* Receiving the order, opening ATAK, loading imagery, orienting to the target. Pin the answer as the leftmost block.

**First block:**
> [ ]

---

### Prompt 3 — Fill the middle
> "Now walk us through everything that happens in between — step by step, in the order it actually happens."

*Listen for:* Loading imagery, defining the grid, drawing sections, running AI detection, reviewing labels, correcting, exporting. Keep them at the right level:

> "If someone said 'planning happens' that's too broad. If they said 'Planner taps the detect button' that's too detailed. Aim for something like 'Planner draws operational sections'."

**Middle blocks:**
> [ ] → [ ] → [ ] → [ ] → [ ]

---

### Prompt 4 — Confirm each block
*Ask these for every block placed:*

> - "How would you phrase this as an action verb + noun?" *(e.g. 'Run AI building detection')*
> - "Who owns this step — what role, team, or function?"
> - "How many people does it take to complete this and pass it to the next step?"
> - "Does work queue up here? Does it get batched? Is there ever a wait before this step starts?"

---

### Anchor assumption to validate
*Share this if the team gets stuck:*

> "Based on what we've observed so far, we think the flow might look something like this — tell us where we're wrong:"
> `[Receive mission target] → [Load AOI imagery] → [Define planning grid and sections] → [Run AI building detection] → [Review and correct building labels] → [Share GRG artifact]`

---

# March 19th - GRG Value Stream Map - first pass

### SUMMARY
Value stream mapping scope defined the GRG creation workflow from command order through mission execution and return with the legacy process of manual label dropping.

**Define Plugin Value and Scope**
The plugin's value is increasing map creation speed and completeness, reducing stress for missions with tight 10-minute planning windows. The scope of the Value Stream Mapping effort was set to cover the legacy GRG creation workflow, including mission execution and return, to measure mission impact.
> Abel's Takes:

**Identify Users and Key Systems**
Primary user roles were identified as the GRG creator and the executing war fighters who use the map, with Justin noted as a key Subject Matter Expert. Key systems include ATAC, WINTAC, Maxar imagery, and Onyx, with data shared mainly via KMZ files or the TAC server.
> Abel's Takes:

**Detail Legacy GRG Creation Pain Points**
The legacy process involves manual grid definition, non-building detail addition, and section drawing using vanilla TAC tools. Building labeling is the worst user experience due to the manual identification and repetitive tapping of hundreds of items, causing extreme frustration when fixing label sequences.
> Abel's Takes:

### DETAILS

**Value Proposition of the Plugin:** The primary value of the plugin is the ability to create and label maps far more quickly than the previous manual process. This speed is crucial for missions with short planning times, such as when only 10 minutes are available, making it possible to create more complete and accurate maps faster (00:00:00). The goal of the work is to improve speed, reduce stress, and enhance the quality of maps by ensuring completeness, especially when time is limited.
> Abel's Takes: a criteria I need to keep in mind for sucess metrics (outcomes) are "more complete maps" and "accurate maps" and "faster creation", For the fist time I heard about "reduce stress" A condition needs to be called out too. It appears there are some maps that have more leeway (days or hours) vs others that need to be created within a few mins. That's relevant context for experiments and desired outcomes. 

**Definition of "More Complete" Maps:** The team noted that they currently lack a specific metric or definition for what constitutes a "more complete" map (00:01:30). Before the plugin existed, it was already possible to create complete and accurate Geographic Reference Grids (GRGs) and distribute them to operators. The plugin's main contribution is speeding up this process and reducing the stress associated with manually dropping and fixing hundreds of labels.
> Abel's Takes: This is an important distinction, we are not enabling the capability of freating these GRGs and ensuring they are complete, that was possible, we are more of a modernizing and optimizing factor, and this is why it's very important for us to under stand HOW the Ai/ML capability makes this bette not just when creating it, the full feedback cycle, while on the mission and returning. How are we changing the world?

**Value Stream Mapping Requirements:** The focus of the meeting shifted to defining the scope of the value stream mapping (VSM) effort, which includes establishing mission impact, identifying the initiator and end user, defining the triggering event, and generating outputs (00:02:29). The discussion centers on whether the VSM should encompass only GRG creation and distribution or extend through mission execution and return (00:12:41).
> Abel's Takes: We did a hybrid. Giving the GRG to the "Executing personnel" and also the debrif AFTER the mission. 

**Identifying User Roles and Personas:** Several user roles were discussed based on existing notes and transcripts, including SOCOM/Softmc and the "command order issuer". The role of "planner" was recognized as an informal role, suggesting that "GRG creator" is a more appropriate term, as it reflects the primary task of creating and sharing GRGs (00:03:57). Specific examples of GRG creators include Gunnery Sergeant Wagner and Staff Sergeant Hayes (00:05:04).
> Abel's Takes:

**Subject Matter Experts and Other Roles:** Justin was identified as a subject matter expert (SME) and a Joint Terminal Attack Controller (JTAC) trainer with extensive experience in GRG creation, usage, and communication (00:06:32). JTAC refers to a role, not an organization, involving the communication and coordination of attacks. "Executing personnel" is a broad category for end users, as the actual titles and roles (e.g., aircraft personnel, ground forces, artillery operators) can vary significantly (00:07:40).
> Abel's Takes: He was a participant during the experiment.

**Current Systems and Technologies:** Key systems and tools mentioned include ATAK, the plugin itself, WINTAK, Maxar imagery, and ONNX. Data is often shared via KMZ files, which are essentially zip files containing all the necessary data. Other systems mentioned include the Military Grid Reference System (MGRS), building detection SDK, AI SDK, TAK Forge, GitLab, AWS SageMaker, CVAT, and S3.

**Determining the Scope of the Value Stream:** An initial proposal to end the VSM once the executing personnel received the labeled map was deemed too quick because it would not measure mission impact. The proposed scope for the VSM is the GRG creation workflow "from mission order receive through GRG creation and distribution to mission execution and return". This extended scope allows for measuring success and incorporating a feedback loop.

/// establishing framing of CURRENT STATE
**Refining the Scope: Current vs. Ideal State:** A major point of alignment was the need to map the *current state* of the GRG creation process, which exists *before* the team's plugin or AI/Machine Learning (ML) assistance existed . The current state involves the legacy process of manual label dropping. The group decided to proceed with mapping the legacy GRG creation workflow through mission execution and return.
> Abel's Takes: yes, we started with some confusion. We were mapping what we know is the "legacy" GRG process, current state.

**Identifying the End User (Customer) of the Value Stream:** The primary end users are the "executing war fighters" or "GRG users" who look at their devices and coordinate operations during the mission. These individuals receive the value from the GRG being complete and accurate. It was noted that the GRG creator and the GRG user can sometimes be the same person.
> Abel's Takes: Yes, this was ONE of the "customers" but as we discussed later, There is another customer, for then they return from the mission and debrief.

**Initiating the Value Stream:** The value stream starts with the "command order issuer" who sends the orders (00:48:17). The first activity performed by the GRG creators is the [1]image preparation process (00:51:41). This involves downloading necessary imagery, which can be large and time-consuming, especially with connection instability (00:53:03).
> Abel's Takes:  This is some of the context for our firs process block "Start Image Prep process" It be worth here for us to reference this to better inform Process blocks for Value Added, Necessary Non-value added and uncessary non-valu add, as well as any systems
[1] Start Image Prep process
- Activity (Action Verb + Noun phrasing) = Start Image Prep process
- Function/Dept/Team = GRG Creators
- Barriers to flow = large files, many data packages

***Alternative GRG Creation Methods:** GRG creation is not always done through TAK software. In situations where more time is available, individuals may use non-TAK software to create grids and labels, putting them into PowerPoint presentations or screenshots, which are then shared (00:50:23).
> Abel's Takes: Worth calling this out for a second pass for maybe "Identify IT systems that support the value flow."

**Next Major Activity in the Workflow:** Following the image prep process, the next major activity is "[2]grid definition," which involves determining the size, spacing, labeling, rows, columns, and center point of the grid. Depending on the mission, multiple GRGs might be created from a single large image, especially if several areas of interest are involved (00:56:31).

**Defining Grid Parameters:** Continuing on from "[2]grid definition," The GRG creators begin by defining grid parameters, which involves placing a grid over maps. The GRG creators are responsible for this task, and the main constraint is that the process is entirely manual with no automation for placing and defining the grid. A key requirement is ensuring that all buildings within a certain proximity are encapsulated within the grid to avoid mistakes where buildings or labels are left off the grid (00:59:26) (01:01:43). This step is currently executed using the GRG builder plugin (01:20:58).
> Abel's Takes: The first callout to the legacy "GRG Builder Plug-in" So our process block currently reads as follow:
[2] Defining grid parameters to place over map(s)
- Activity (Action Verb + Noun phrasing) = Defining grid parameters to place over map(s)
- Function/Dept/Team = GRG Creators
- Barriers to flow = no automation to support grid defining, manual process, user error buildings “outside” the grid

**Adding Non-Building Details to the Map:** The next step in the process involves [3]adding non-building details to the map, which occurs between grid creation and section drawing (01:09:59). This process includes adding floor plan overlays, vehicles, and drawings for plans, routes, or lines of fire (01:08:54). Major landmarks that are not buildings, such as a large hill or a cliff, are also labeled during this step, and the GRG creators perform this activity (01:12:27). These functions are currently executed using vanilla TAK tool.
> Abel's Takes: Some of these other elements might be provided from people up the chain” other intel..  if this is a mission with no more leetime.
[3] Adding/defining non-building details to map
- Activity (Action Verb + Noun phrasing) = Adding/defining non-building details to map
- Function/Dept/Team = GRG Creators
- Barriers to flow = tbd
> Abel's Takes: Important call out here that we should find out the motivation for why these other GRG creators dont use the legacy TAK plug-in and would they use ours?

**Defining and Drawing Sections on the Gridded Map:** Following the non-building detail addition, the GRG creators [4]define or draw sections on the gridded map, utilizing drawing tools like shapes available in TAK (01:03:47). Sections are intended to be understandable chunks of the map, ideally following natural breaks such as roads, intersections, tree lines, and landmarks. Users prefer that sections contain a maximum of 50 to 100 buildings to maintain readability and local relevance. Currently, the drawing tools used for this task are considered "vanilla TAK" functions (01:22:06).

**Constraints and Pain Points in Section Drawing:** The manual drawing of sections is reported to be finicky and requires time to determine the correct size, shape, and flow of section names (01:14:07). The sections are generally named simply by a letter (e.g., Section A, Section C) (01:06:55). The manual nature of this task is a known issue.
> Abel's Takes: 
[4] define or draw sections on the gridded map
- Activity (Action Verb + Noun phrasing) = Defining/drawing section on grided map
- Function/Dept/Team = GRG Creators
- Barriers to flow = drawing is manual, finicky, time consuming to think about the “right” sections, sizes, flow of names.

**Labeling Buildings within the Grid:** The next major process block is [5]labeling buildings within the grid, with the goal being that every building inside the grid receives a label. A common naming convention is used, which consists of the section letter plus a sequential number (e.g., A1, A2, A3), though this is more of an art than a strict science in terms of the directional flow of labels. Building labeling is a separate process block that occurs after sections are defined.

**Challenges in Building Labeling:** This process is considered the area where the worst user experience happens, primarily due to the manual effort involved. Pain points include the time it takes for a human to identify what constitutes a building, the repetitive work of tapping potentially hundreds of items, and the extreme frustration of fixing number sequences or label directions if a mistake is made (01:17:28). Although TAK may offer some sequential naming capabilities, these features are not always intuitive or reliably used, potentially creating a knowledge gap among users.
> Abel's Takes: while these pain points are assumed valid, we still need to confirm with the customer and try to hone in on what could be improved too.
[5] labeling buildings within the grid
- Activity (Action Verb + Noun phrasing) = Labeling the buildings within the grid
- Function/Dept/Team = GRG Creators
- Barriers to flow = Tree cover, blurry images - its on the human to define what a building is. The manual effort of tapping 500 or how ever many buildings you need to label. manually “inputting” the labels because they dont always automatically get labeled based on current TAK plug in functionality, Potential knowledge gap also and is not entuative. Fixing/refactoring the numbering sequence when you already created 100s of labels

**Exporting the GRG Map:** Once the grid, sections, and building labels are complete, the next step is to [6]export the GRG (Grided Reference Graphic), which includes the grid and all associated data. Common export formats include KMZ and PDF, with PNG also being possible. A known issue is that the xported filee is often described as a "glorified image," which means it cannot be easily edited after export and does not give the receiver the same original creation experience as the GRG creator had...
> Abel's Takes: So are we saying that an indeal state our Ai/ML GRG plug in can achieve or aims at is getting away from that "Glorify Image", and instead getting an editable KMZ file? that will be something relevant and important for us to see if is a potential new outcome. Meaning. If GRG maps are now extremely easy and quick to update and make, those "glorified files" are no longer relevant and users will prefer the KMZ since they know they can updating it quickly?
[6] Export the GRG
- Activity (Action Verb + Noun phrasing) = Exporting the GRG
- Function/Dept/Team = GRG Creators
- Barriers to flow =  he xported filee is often described as a "glorified image," which means it cannot be easily edited after export and does not give the receiver the same original creation experience as the GRG creator had

**Review and Refinement of the GRG:** After the GRG is exported, there is a subsequent process of [7]review and refinement where the creator shows the GRG to the team to gather feedback and make necessary adjustments for mission success. This review and refine process is a possible block, though it is unclear whether it happens before or after the initial export. Following this, the finalized GRG is shared with the mission execution team, who are the end customers for the value stream.
> Abel's Takes: IN the initial VSM exercise, I dind't make this a process block, but I decided to make it the 7th one.
[7] Export the GRG
- Activity (Action Verb + Noun phrasing) = Review and Refinement of the GRG
- Function/Dept/Team = GRG Creators
- Barriers to flow = tbd

**Methods for Sharing GRG Files:** GRG creators [8]share the GRG files with the mission executing team through two main current state methods: locally via file sharing (e.g., KMZ files through Bluetooth or local files) and non-locally via TAK server. Additionally, maps can still be printed out on paper and used in the field.

**Barriers to File Sharing:** Current barriers to the flow of sharing GRG files include network connectivity issues and interference, as well as limitations in the connection range. The TAK server method for sharing is also thought to require an internet connection, though TAK devices can form a mesh network to connect with nearby devices.
> Abel's Takes: So the team was focusing first on describing with more detail the GRG File sharing experience.
[8] Share the GRG file(s) with the Mission executing team
- Activity (Action Verb + Noun phrasing) = Share the GRG file(s) with the Mission executing team
- Function/Dept/Team = GRG Creators/SOF PLanners
- Barriers to flow = TAK Server requiring an internet connection, Limited range via Bluetooth and other methods thru a mesh network, interference 

**Post-Mission Process (Debriefing):** The team determined that once a mission is executed, there may be a [9]debriefing process, but they lack awareness of who is involved or the exact procedures following the mission's completion (00:29:28). The executing personnel are assumed to report back on what aspects of the GRG worked or were ineffective. For now, the end users include the executing personnel and the assumed "mission debrief people".
> Abel's Takes: A significant assumption, open question and part of the process we must understand bring up to our stakeholders. This is also how we can determine the model improvement, also worth flagging that if ideal mission impact is "SOF teams execute missions with more complete maps every operator on the same page, speaking the same targeting language, even when time is short, so less bad things happen." the value stream needs to end here with a post missiin debfrief of some sort.. where we get feedback on the model's performance and the GRGs effectiveness in the field, important th disticnt here we can measure different things.
[9] Report what GRG’s “worked” or were “bad”
- Activity (Action Verb + Noun phrasing) = Report what GRG’s “worked” or were “bad”
- Function/Dept/Team = GRG Creators/SOF PLanners
- Barriers to flow = tbd

**Ideal State for GRG Usage and Feedback:** In an ideal state, maps should be able to be updated and shared as new versions during a mission by any mission participant, not just the original creator (01:32:20). There is currently a gap in the value stream regarding how the mission execution and GRG usage experience is captured and how feedback is gathered to improve the underlying AI model. Currently, there is no built-in mechanism in the prototype to capture and log operator corrections locally on the device for future model retraining.
> Abel's Takes: This just once again high-lights that gap between "[9]Share the GRG file(s) with the Mission executing team" and [9] "Report what GRG’s “worked” or were “bad”. As part of codifying the model training pipeline and also ensuring we are improving the model and measuring outcomes, we ne to answer these questions "there is no built-in mechanism in the prototype to capture and log operator corrections locally on the device for future model retraining." 

--
Theme 4: The end-user/customer of the value stream is not known
> I feel this is #1 in the sense of urgency to sort out with the customer because if we are trying to deliver mission-outcomes (the change in system or user behavior or level of functioning that generates a mission result (implies: in production)) and our mission impact "ends" at hand off the GRG and not on the effectiveness from the GRG post during and post mission, then we need to align and redefine mission impact.

Theme 7: The Non-TAK Workflow Exists and Is Unaccounted For
> this is #2 because it tells me there's possibly another user segment with different motivations and barriers. Is it an access isseus that they dont use TAK legacy to create GRG or is it that the legacy process sucks so bad? I guess for lack of better words, how might learn from them and how relevant are they to adoption and rollout plan.

Theme 3: The Plugin Is a Modernizer, Not an Enabler
> #3 here because it allows us to prioritize outcomes that are relevant on improving/enhancing the current process that was already good enough to produce "complete maps every operator on the same page, speaking the same targeting language" is this was already a real thing and our ideal mission impact only highlights "more" as in "SOF teams execute missions with more complete maps every operator on the same page, speaking the same targeting language," then what is "more"? I also think here is where those gaps between [8] Share the GRG file(s) with the Mission executing team and [9] Report what GRG’s “worked” or were “bad” become even more relevant because we would need to measure outcomes that improve speed, accuracy, or something else entirely (e.g., reduced cognitive load under fire). I feel this is very urgent.

Theme 5: The "Glorified Image" Export Problem
> This is #4 on my list. It's hard for me to put into words, but My assumption is that there might be new value add, potential new outcomes, given our AI/ML GRG KMZ file is "dynamic" and "easily" edited after it has been shared, that it might make the static "glorified image" irrelevant? It's just a matter of talkig to users and answering the listed open question to see if there's value and outcomes there.. 

--
# KEY TAKE AWAYS FROM VSM 1st pass (shared on Slack March 20)

## 1 The end-user/customer of the value stream is not known
If the value stream ends at the handoff of a GRG, and not at the conclusion of mission execution or post-mission debrief, then how might we learn from the field, make improvements to the model, and ensure we are not optimizing for the wrong process? Answering this will help us define a viable mission impact and higher quality, more accurate mission outcomes.

## 2 — A Non-TAK GRG Creation Workflow Exists
Some GRG creators bypass TAK entirely; PowerPoint, screenshots, other tools. The question isn't just "who are they," it's why. Is it an access problem? Is the legacy TAK process painful enough that they found workarounds? What can we learn from them about adoption barriers? And how relevant are they to any rollout plan we'd propose?

## 3 — The AI/ML GRG Plugin Improves GRG Creation — Mission Impact Lives Beyond It
Even before an AI/ML-enabled GRG creation process existed, planners and operators were already completing accurate GRGs, making it simpler to speak the same language in the field. The manual process is painful, but it works. So when our assumed mission impact statement says we can provide "more complete maps" — what is "more"? More accurate? More consistent? Created under conditions where it previously wasn't possible? This directly ties back to the gap between process block 8 (Share the GRG) and block 9 (debrief on GRG effectiveness after the mission). We need feedback from the field to know what "better" actually produced. Without that, we can't measure speed, accuracy, or cognitive load improvement in any meaningful way.

# 4 — The "Glorified Image" Export Problem
(Potential new outcome worth exploring with users)
The hypothesis: if our AI/ML GRG produces a dynamic, editable KMZ rather than a static export — and GRG creation is now fast enough that updating is low friction — then the "glorified image" may simply become irrelevant. Users who previously needed a static artifact because editing was too painful might prefer live, editable maps. Whether that's actually true needs to be validated with users. But it's worth naming as a potential new outcome, not just a technical detail.

# 5 Theme 1: "Better" Is Still Undefined
The plugin's value is framed around speed, completeness, accuracy, and reduced stress — but none of these have agreed definitions or metrics yet.
**Assumptions:**
- "More complete" maps are better maps
- Faster creation = less stress = better mission outcomes
- The plugin improves on the legacy process in meaningful ways
**Open Questions:**
1. What does "more complete" actually mean — is it a percentage of buildings labeled? Zero missed buildings in a section?
2. Is there a threshold where "fast enough" is good enough, or does every minute saved matter?
3. "Reduce stress" surfaced for the first time in this session — is that a validated user need or an assumed byproduct?
4. Are there mission types where completeness matters more than speed, or vice versa?

# 6 - Theme 2: Time Windows Are Not One-Size-Fits-All
The 3-hour window was the framing assumption going in. The session surfaced that some missions have days; others have 10 minutes.
**Assumptions:**
- The 3-hour window is the representative scenario
- Speed improvements matter equally across all mission types
**Open Questions:**
1. What is the distribution of mission planning windows in practice — how often is it 10 minutes vs. hours vs. days?
2. Does the plugin's value proposition change fundamentally depending on the time window?
3. Which scenario should anchor the success criteria and experiments?

# 7 - Theme 6: User Roles and Access Are Still Fuzzy
Multiple roles surfaced — GRG creator, executing warfighters, JTAC, debrief personnel — but the boundaries and access are unconfirmed.
**Assumptions:**
* Justin (SME/JTAC trainer) is representative of the broader user base
* GRG creator and GRG user are typically different people
**Open Questions:**
* The GRG creator and user can be the same person — how common is that, and does it change what the plugin needs to do?
* Do we have access to real production users, or only competition participants?
* What are the actual titles and org structure of "executing personnel" — ground forces, air, artillery all use the GRG differently
* Who exactly issues the command order and what does that handoff look like upstream of block 1?