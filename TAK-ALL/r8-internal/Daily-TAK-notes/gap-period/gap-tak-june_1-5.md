# Goals and Anti-Goals

### Anti-Goals: During the TAK Beach Gap Period, we will NOT:
- Burn out before OTA begins by spreading thin across beach projects and not taking time to know each other.
- Lock ourselves into a direction for the future vision based on assumptions we can't validate yet.
- Do throw-away work by building things without grounding in user input, problem evidence, or feasibility.
- Move into the OTA contract without drafting problem statements and exploring target mission-outcomes for the future vision.

### GOALS

**The Overall Goal:** Establish the Mission OS foundation for OTA by first week of June, with the current state defined, the target condition identified, and an assumption validation cycle established.

1. By May 29th - June 2nd, align the whole team on shared project context, the future vision, and the proposed bets.
2. Build evidence-based prototypes in weekly increments to remain flexible with our learnings towards the OTA.
3. By June 8, ready the OTA project setup: required CAC/access docs submitted with POCs identified, backlog consolidated to a single project board, and a current-state path-to-prod artifact(s) in place.
4. Establish and iterate on team operating norms by June 12, including pairing across the team and cross-role AI coordination.


# TAK Gap Period — June 1–5

Day-start pickup for the technical feasibility prototype work. Sources: `gap-tak-may_18-22.md`, `gap-tak-may_25-29.md` (incl. Kevan's Slack shareout, lines 352–901).

---

## TLDR Summary

WHAT: During the OTA contract gap, the team built feasibility prototypes to
de-risk a future "orchestration" architecture instead of rewriting 20+ TAK
plugins. Kevan delivered a working two-device prototype ("Arclight") on Fri 5/29.

WHY (already-aligned intent):
- Goal: "Build evidence-based prototypes in weekly increments." (may_18-22)
- Decision: prototype is for "feasibility assessment and derisk solutions…
  rather than proving immediate mission value." (may_25-29, line 53)
- Strategy: thin slice to back an August "Shark Tank" pitch to Nik, the PM,
  as an alternative to rewriting 20+ TACUI plugins. (may_25-29, line 51)

WHAT KEVAN PROVED (2 disconnected Android devices, no server):
1. Trusted peer connection (only admitted peers sync)
2. Author a mission + routes locally
3. Publish → syncs phone-to-phone, NO central server (the DDIL / $30M-Palantir story)
4. Bidirectional sync (edit from either device)
5. Text command "drop a hostile armored vehicle 500 yards east of me" → real marker
6. Hostile dropped near a route → route auto-turns orange (threat proximity)
Source: may_25-29, lines 479–602.

HONEST CAVEATS:
- Language parsing is a hardcoded Kotlin parser, NOT real AI yet; LLM layer is
  still planned only. (lines 401, 561, 439)
- No audio on the demo recording. (line 479)
- Kevan: "everything here is up for grabs… a baseline to keep adding
  robustness and mission capability." (line 602) — intentionally disposable.

NAMING (working names, not final):
- Arclight = the secure phone-to-phone sync layer
- MissionCore = the mission logic (routes, hostiles, teams)
- "SOFTAK SDK" = Arclight + SDK + MissionCore + adapters, cumulatively
- "SOAP" = earlier working name for the orchestration/mission-software initiative

OPEN / PM-OWNED NEXT:
- Map prototype to the Desirability/Viability/FEASIBILITY assumption tracker
  (may_25-29, line 334) — feasibility now has real evidence.
- Confirm the prototype's role in the Shark Tank pitch narrative.
- Abel's standing concern: prototypes built ahead of user validation
  (line 43) — route features through DevOps experts via lean experiments.

---

## Hand-off Prompt

# Hand-off: TAK Technical Feasibility Prototype — context & next steps

You are assisting Abel (Product Manager, Rise 8) on the SOCOM TAK project during
the OTA contract gap period (May 20 – June 15, 2025). I need help turning a
technical feasibility prototype into PM artifacts (assumptions, pitch narrative,
stakeholder comms). I am a PM — translate engineering detail into plain language
and product implications; do not assume I need to validate the crypto/networking.

## Source material (in repo)
- TAK-ALL/r8-internal/Daily-TAK-notes/gap-period/gap-tak-may_18-22.md
  → goals, anti-goals, hypothesis-driven design decisions
- TAK-ALL/r8-internal/Daily-TAK-notes/gap-period/gap-tak-may_25-29.md
  → multiple meetings (May 26–28) + Kevan's Slack shareout (lines 352–901)
- FigJam current-state board: figma.com/board/uKpig5cfxLpMOOFK4gvQZv (line 915)
- Claude Project "SOCOM TAK Current/Future State Learnings" (line 918)

## Strategic frame (already aligned by the team)
- Approach: thin-slice feasibility prototype to de-risk a future orchestration
  architecture rather than rewriting 20+ TACUI plugins. (may_25-29, lines 51–53)
- Purpose: feasibility/de-risk, NOT proving mission value to end users yet. (line 53)
- Target: back an August "Shark Tank" pitch to Nik (PM). (line 51)
- Frame: all work is hypothesis-driven experiments. (line 55)

## What was built (Kevan, solo, ~2 days, delivered Fri 5/29)
A working TWO-DEVICE prototype with no central server (Slack lines 352–602):
- "Arclight" = secure phone-to-phone mesh sync layer (Wi-Fi Direct → BLE → LAN
  fallback; admitted-peer trust; ECDSA signing + AES-256-GCM encryption).
- "Team Presence / MissionCore" = mission logic above Arclight.
- Demo beats (line 479): trusted peer connect → author mission/routes locally →
  publish → syncs to 2nd device → bidirectional edits → text command drops a
  hostile marker → manual hostile near a route turns the route orange.
- Durable mission data (routes, hostiles, metadata) rides an "MST document" sync
  path; high-churn positions (PLI) ride an ephemeral "heartbeat" path. (Thread #2)

## Caveats / what is NOT done
- Text parsing = hardcoded Kotlin parser, not AI; LLM adapter is planned only.
  (lines 401, 439, 561)
- Prototype is explicitly disposable: "everything here is up for grabs… baseline
  to keep adding robustness." (line 602)
- Naming is provisional: Arclight, MissionCore, "SOFTAK SDK", "SOAP".

## ===== APPENDIX A: Synthesized Findings (6 themes, cited) =====
1. PURPOSE — prove architectural feasibility, not mission value.
   "validate architectural feasibility… avoids technical debt by prioritizing
   orchestration over rewriting multiple plugins" (line 13); decision line 53.
2. STRATEGY — thin slice to avoid 20+ plugin rewrite / Shark Tank pitch.
   Decision line 51; "Minimal Viable Prototyping Strategy" line 37.
3. WHAT'S BEING BUILT — multiple parallel prototypes:
   platform dashboard for Chad (K3s/Flux/Prometheus/Grafana/Harbor, line 29);
   edge-deploy prototype on Podman (line 103); Andrew's Tackland prototype
   (line 152); Sean's AI-on-hub idea (line 158); Kevan's mesh PoC →
   now "Arclight" (line 162); white paper + prototype (line 41).
4. TECH STACK — open-source, cloud/HW-agnostic, replacing ~$30M/yr Palantir:
   K3s/RK2, Flux CD, Prometheus, Keycloak, Harbor (lines 29,101); $30M (line 113);
   ATO 10–18 months → days via compliance inheritance (line 25). Open Q: Kotlin
   Multiplatform Compose for plugins (line 168).
5. HYPOTHESIS FRAMEWORK — assumption tracker w/ Desirability/Viability/
   FEASIBILITY; "Feasibility addresses technical implementation" (line 334);
   "Define Feasibility Assumptions" next step (line 348).
6. TENSION — building ahead of user validation. Abel's skepticism (line 43);
   anti-goal "throw-away work… without user input/feasibility" (may_18-22);
   mitigation: lean experiments + DevOps-expert feedback (line 115).

## ===== APPENDIX A.1: Which theme does Arclight align with? =====
PRIMARY → Theme 1 (Purpose: prove architectural feasibility, not mission value).
  Literal match — Kevan: "I did this all… to derisk feasibility… I'm fairly
  confident in our overall approach… as far as feasibility is concerned" (line 602).
  Theme 1 is the WHY the prototype exists. Use this label for the pitch.

ALSO CATALOGUED UNDER → Theme 3 (What's being built).
  Theme 3 is the list of concrete prototypes in flight. Arclight is the grown-up
  version of "Kevan's mesh-network PoC" (line 162). Theme 1 = why; Theme 3 = what.
  Use this when filing it on the prototype list.

BRUSHES → Theme 6 (building without user validation).
  Two best demo beats — text command (#5) and auto threat-proximity (#6) — start
  to look like MISSION VALUE, not just feasibility; and it was built solo in ~2
  days with no operators in the loop. That's the exact tension Theme 6 + Abel's
  line-43 skepticism name. Not a problem — the lens to watch when mapping it to
  the assumption tracker.

## ===== APPENDIX B: Orientation for a non-engineer =====
Kevan posted THREE Slack threads:
- #1 (lines 352–608): what he built + demo walkthrough — the part PM cares about.
- #2 (lines 609–736): how data stays in sync (MST docs vs heartbeat) — internals.
- #3 (lines 737–901): how devices find/trust each other — mesh, radios, crypto.
Threads #2 and #3 are engineering internals: evidence it works, not PM decisions.

## What I want help with next
[Abel: fill in — e.g. "draft feasibility assumptions for the tracker", "draft the
Shark Tank pitch narrative", "draft a stakeholder update for Kevin/Nik"]

---

## Kevan arclight - next.. Post -stand up

The 3 engineer terms, in PM language:

- **Mesh** — the phones find each other and pass data directly, hopping device-to-device over whatever radio is available (Wi-Fi, Bluetooth), with no router or server in the middle. Self-forming network.

- **MST documents vs. heartbeat** — Kevan split the data two ways: durable stuff that must stay correct (the mission, routes, who's hostile) vs. constantly-changing stuff (live positions). Different plumbing for each so positions don't clog the system. "Facts" vs. "live blips."

- **Kotlin Multiplatform Compose (KMP)** — a way to write the app's guts once and reuse it, instead of rewriting per platform. This is Kevan's lever to avoid the 20+ plugin rewrite — directly serves the anti-rewrite bet.

Kevan's prototype (the baseline). Over about two days, Kevan built a working two-device proof that mission data can sync directly between phones with no server in the middle — one device authors a mission, routes, and enemy markers, and they appear on the second device over a self-forming radio network, with edits flowing both ways. Underneath sits "Arclight," a secure sync layer that handles trusted-peer connections, encryption, and picking whatever radio is available (Wi-Fi, Bluetooth, LAN). He's explicit that it's a disposable baseline — "everything here is up for grabs" — built to de-risk feasibility, not to prove mission value. It answers one question: can we orchestrate this architecture instead of rewriting 20+ plugins? — and the answer is yes.

The assumed ask to Zach, Thomas, and Mases (inferred — Kevan gave direction, not a written request). 

- What he literally said: take this prototype as a baseline and "keep adding technical robustness and mission capability"; 

- structure as much of it as possible in Kotlin Multiplatform Compose so only the TAK-specific UI stays platform-bound; 

- have MissionCore run on the Arclight SDK; and (to Mases specifically) pull down the repo and push it to internal GitLab to iterate on (lines 596–605). 

- The assumed request, in plain terms: 

1. "Here's a proven foundation — start hardening and extending it toward the real architecture."
> What he did not give: any scope, task split, effort, or timeline — which is precisely the part you'd be confirming with them today.


--- 

### Sync w/Zach and Thomas about Kevan's ask..

1. built with Kotlin Multiplatform -  (currently Kotlin with atak only) native.. Kevan wants us to be update to Kotlin Mutliplfarm -- Kotlin ompose, how much code sharing between them?

2. Thomas trying to parse through the slack messages


---

### [raw-notes] Problem prioritization

Creating the plan in TAK

Problems in Handoffs formats, (not in Nik's focus)
Static KMZ exports (cant update)
Works in ArcGIS Pro (not TAK)

Value Stream 


* more time to prepare
* redeuce time to get ready = more time to get ready for mission
* Less risks
* better decisions
* "quicker" acting

--

"purple" --> assumed problems..


## Problem prioritization - June 1st [gemini-transcript]

### Summary
Meeting discussions analyzed operational pain points and established a prioritization framework via risk assessment methodologies.

**Operational Pain Point Analysis**
System architecture lacks shared data models for mission intent, creating high manual cognitive burdens for team leaders during planning and execution. Current tools provide static, non-editable outputs.

**Risk Prioritization Framework**
Teams agreed to utilize quadrant mapping to categorize pain points by risk and evidence. Route planning was identified as the highest-risk element requiring immediate prioritization.

**Strategic Research Strategy**
Participants achieved consensus to prioritize purple cards for further investigation to clarify risks. This research approach serves as the foundational strategy for subsequent meeting sessions.

### Details

**Strategic focus and handoff gaps:** Jonathan identifies that while Nik is currently focused on plan execution and route creation, the team has uncovered significant problems regarding handoffs and formats that are not currently prioritized in Nik's orienting scenario.

**KMZ imagery limitations:** Jonathan highlights that the current attack plugin output is a static KMZ image rather than an editable plan, preventing operators from making necessary route adjustments in the moment when threats arise.

**Documentation of pain points:** Abel confirms that all discussed pain points have been captured and categorized directly from the team's current journey map (00:04:54).
Strategic alignment on priorities: Jonathan notes that intel handoffs, briefing, and approval processes are currently considered out of scope by Nik, though they represent potential risks regarding time to prepare and execute missions.

**Mission setup and team loadout:** Jonathan explains that the current system architecture lacks a shared data model for mission intent and team composition, forcing team leads to maintain loadout information for 12 to 16 members mentally.

**Route planning difficulties:** Jonathan describes route planning as a mentally taxing and complex process where operators must manually manage variables, and notes that the system provides no decision support to help identify optimal routes.

**GRG provenance and transparency:** Jonathan discusses the lack of visible markers or a design language to distinguish between AI-generated and human-input content in Grid Reference Graphics (GRGs), marking this as an assumed risk that requires validation.

**Information freshness and trust:** The team emphasizes the need for staleness indicators for imagery and GRGs, noting that the inability to verify the age of information in DDL (Denied, Degraded, Limited) environments creates significant trust and safety risks.

**Multi-GRG creation workflows:** Jonathan points out that the current manual process for creating multiple GRGs—such as for large areas and target areas—is time-consuming and represents an opportunity for AI-assisted suggestion and generation.

**Contingency planning challenges:** Jonathan explains that contingency planning currently exists only in the operator's head with no structured workflow, and there is no semantic method to communicate the activation of contingencies to the team.

**Manual threat response burdens:** Jonathan describes the current execution process as a high-burden task where team leads must rely on memory to identify threats and coordinate resources under pressure, which the team identifies as a major area for improvement.

**Cross-plugin system isolation**: Jonathan notes that the fires capability and other tools operate in isolation, lacking a shared team model, which forces operators to manually bridge information gaps.

**Mid-mission synchronization:** The participants discuss how team members often rely on verbal radio updates to coordinate mid-mission changes due to the lack of reliable digital file syncing.

**Prioritization framework**: Abel suggests using a quadrant mapping exercise based on risk and evidence to prioritize the identified pain points, with the team agreeing to focus initially on the "red" high-evidence items.

**Execution risk assessment:** The team evaluates the manual threat response process as a high-risk item with moderate evidence, given its reliance on human memory during critical moments.

**Data sharing and integration:** Abel and Jonathan agree to consolidate issues regarding the lack of shared understanding between planning and GRG creation into a single category to better address downstream impacts on execution.

**Criticality of route planning:** Mary and Jonathan conclude that route planning is the riskiest element of mission preparation, noting that existing tools provide no decision support, which can lead to mission failure.

**KMZ editing and terrain analysis:** The team confirms that KMZ exports remain static and non-editable, and they note that terrain analysis remains fragmented across multiple tools, further complicating the planning process.

**Assessment of Mission Risk Levels:** Jonathan questions if any of the items being reviewed fall into a mission risk category of 1 or 2, rather than 3 or 4. Abel indicates they are uncertain and expresses the belief that the items require rewriting to be effective. Jonathan explains that they are bolding the core problem statement within the text to assist the team during the future rewriting process. Abel states they cannot provide a definitive assessment immediately due to time constraints, which Jonathan accepts as a preliminary "gut check" regarding the relative importance of the problems.

**Prioritization of Purple Cards and Research Strategy:** Jonathan proposes prioritizing the "purple cards" for discussion to better understand the associated risks, noting that while there is currently limited evidence, this process will clarify what areas require further research. Abel and Mary express agreement with this approach, confirming that it aligns with the intended second round of the meeting. The participants conclude the discussion with a consensus on this path forward.

### Decisions
`ALIGNED`
**Risk-versus-evidence prioritization framework established** The team will utilize a 2x2 risk-versus-evidence matrix to evaluate and prioritize project pain points.

**Cross-plugin isolation issue consolidated** Cross-plugin isolation and related execution issues are consolidated into a single issue card for prioritization.

**Data and planning issues consolidated** Specific planning issues are merged into the broader category of data-sharing and shared intent-understanding issues.

**Top-priority risk areas identified** The team designated route planning, observe-orient-decide-act (OODA) loop shortening, and sync capabilities as the highest-priority risks.

**Purple cards prioritized for risk discussion** The group aligned to prioritize the purple cards for risk discussion to determine which areas require further research.

### Next steps

[Jonathan] Brief Nik: Present the compiled problem space and identified pain points to Nik. Seek clarification on his priorities regarding the currently deprioritized issues.

[Jonathan] Rewrite Problem Statements: Rewrite the problem statements to clarify the core issues based on the bold text identified during the discussion.

[The-group] Prioritize Purple Cards: Prioritize the purple cards by discussing their associated mission risks to determine future research needs.

---

## Candidate Engineering Chores — Now → Target → Chore

Synthesized from Kevan's 5/29 Slack threads (`gap-tak-may_25-29.md`, lines 352–901)
for Abel to review and shape into `/tak-issuedrafting` artifacts.

**Discipline:** Only Kevan's actual Slack messages are ground truth. Zach's and
Thomas's inferences are NOT used as source. 🩷 = Abel's-to-challenge inference by
Claude, not Kevan's stated words.

**Read each as:** where Kevan said "now it's like this" and "it should be like that"
— the gap between them is the chore.

---

### Candidate #1 — Port the shared logic to Kotlin Multiplatform

- **NOW** — 🩷 *inferred (Kevan doesn't state it outright):* the architecture runs
  through *"the ATAK runtime plugin"* (line 357), and his phrasing *"the only ATAK
  specific portion **should be** the specific UX components"* (596) implies more than
  the UI is ATAK-bound today. → *The shared logic (mainly MissionCore) is currently
  tied to one platform, ATAK.*
- **TARGET** — line 596, Kevan: *"put as much of this in Kotlin MultiPlat Compose as
  possible, the only ATAK specific portion should be the specific UX components… TAK-X
  and TAK-Y and TAK-Z."* → *Move the shared logic into Kotlin Multiplatform so the only
  ATAK-specific part left is the UI.*
- **CHORE** = move as much of the shared logic (mainly MissionCore) out of the ATAK
  runtime plugin and into Kotlin Multiplatform, leaving only the UI ATAK-specific.
- **So what:** this is the candidate that most directly tests our bet — write the logic
  once and reuse it, rather than **rewriting 20+ existing plugins** (lines 36, 89). Also
  the strongest **interoperability** evidence against the GOTS / MOSA (Modular Open
  Systems Approach) criteria we were asked to assess the plugins against. → **Goal 2 evidence.**

### Candidate #2 — Modularize the Team Presence plugin into clean layers

- **NOW** — line 397, Kevan: *"Right now, Team Presence contains both the mission
  business logic and the ATAK UI/rendering logic… are mostly inside the plugin."*
  → The Team Presence plugin bundles two different jobs:
  1. the mission logic and 
  2. the on-screen UI — together in one unit.

- **TARGET** — lines 403–404, Kevan labels it: *"Future Layered Model — The cleaner
  target structure is:"* then lists the separate modules himself: 
  - mission-core,
  - adapters, 
  - UI plugin (lines 408–447). 
  → *Split into separate, single-responsibility modules with clear boundaries between them.*
- **CHORE** = modularize Team Presence into the layered modules Kevan specified
  (mission-core / adapters / UI plugin).
- **So what:** today it's one room doing three jobs; modular layers give each job its
  own room with a defined doorway, so you can change or reuse one without disturbing
  the others. This separation is the precondition that makes #1 possible.

- 🩷 **OPEN / assumptions to confirm with Kevan:**
  - Is "Team Presence" the *whole* prototype, or one feature inside it? (scope unconfirmed)
  - The modular *target* is Kevan's own words; **who executes this chore** (Mases /
    Thomas / Zach) is inferred — Kevan gave direction, not a written task assignment
    (lines 177–188).

### Consideration — Move command-parsing out of the UI plugin into mission-core

> 🩷 **Not a standalone chore for this week.** Kevan framed this *"over time"* (line 401),
> and it reads as a *piece inside* the #2 modularization rather than a parallel story.
> Flagged as a consideration; scope + sequencing is a question to confirm with Zach,
> Thomas, and Mases — not for the PM to settle. (Bring: *"Is this its own chore or part
> of #2? Is 'over time' this-week or later?"*)

- **NOW** — lines 399–401, Kevan: the command text *"is parsed by Kotlin code inside
  the plugin."* → *Command-parsing [standard term: turning typed text into a structured
  action] currently lives inside the UI plugin, alongside the screen code.*
- **TARGET** — line 401, Kevan: *"the intent/action mapping should move into
  mission-domain logic over time"* (line 424 lists "mission intent/action contracts"
  inside mission-core). → *That parsing code should move into mission-core, separate
  from the UI.*
- **POSSIBLE MOVE** = move the command-parsing code out of the UI plugin into mission-core
  (likely as part of #2, not a separate track).
- **So what:** once parsing lives in mission-core instead of the UI plugin, any
  input source — a phone screen, a web client, or a real LLM (#4) — can reuse the same
  parsing logic. Precondition for #4.

**Terms used in #3:**

- **mission-domain logic** — `[standard term "domain logic" + Kevan's "mission-domain"]`
  Domain logic = the rules and behavior specific to the problem the software solves
  (here the mission: routes, hostiles, teams), as opposed to UI or networking code.
  "Mission-domain" is Kevan's word for it (line 401).
- **mission-core** — `[Kevan's module name]`
  The module in Kevan's target structure that holds the mission-domain logic
  (lines 408–447). The concrete container; mission-domain logic is what goes inside it.
- **command-parsing / command-parsing code** — `[standard term + my naming]`
  Command-parsing = turning typed text ("drop a hostile 500 yds east") into a
  structured action the app can execute. "Command-parsing code" = the actual code
  that does it.

🩷 **Assumptions to confirm with Kevan:**
- *mission-domain logic* (the rules) vs *mission-core* (the module they live in) — confirm
  he means exactly that pairing.
- Kevan didn't say "command-parsing"; his words are *"parsed by Kotlin code inside the
  plugin"* (line 399) and *"intent/action mapping"* (line 401). I'm applying the standard
  term to what he described — the code is real, the label is the industry one.

### Candidate #4 — Add the planned LLM parser layer (mission-llm-adapter)

- **NOW**
  - **Anchor (lines 558–563)** — Kevan's "Text command action flow": *"A natural-language-style
    text command is entered to drop a hostile marker. The current prototype uses a
    deterministic Kotlin parser. The parser resolves intent, distance, direction, and
    hostile metadata into a structured action. The action executes the same domain flow
    as a manual hostile drop."*
  - **Bridge** — "deterministic" = fixed, hand-written rules; same input always gives the
    same output (vs. a language model, which interprets flexibly).
  - **Defensible read** — today the text command is handled by fixed-rule Kotlin code that
    pulls out intent/distance/direction/metadata and drops the marker.
- **TARGET**
  - **Anchor (lines 435–439)** — Kevan lists a *mission-llm-adapter* in the future layered
    model: *"Optional parser layer: local Gemma / other on-device LLM / cloud LLM, converts
    natural language into typed MissionCommand DTOs only, never directly mutates mission
    state or talks to Arclight."*
  - **Bridge** — a language model would interpret plain speech flexibly, instead of the
    fixed rules above.
  - **Defensible read** — a planned module where an on-device/cloud LLM turns plain language
    into structured mission commands. 🩷 *Kevan labels it "Optional" and does not say it
    "replaces" the deterministic parser — that framing is mine; confirm with Kevan.*
- **CHORE** = build the mission-llm-adapter (the planned LLM parser layer).
- **So what:** turns the staged *"drop a hostile 500 yds east"* beat into proven capability.
  Biggest **open feasibility** question — but heavier, and Kevan tagged it "Optional"; do
  after the modularization foundation.
- **Link to the #3 consideration (PM read):** #2 (and the #3 consideration) first create a
  clean, defined spot in mission-core where command-understanding belongs; the LLM adapter
  plugs into that same spot. 🩷 *My read — sequence the foundation first, then the LLM.*

**Terms used in #4:**

- **deterministic** (in "deterministic Kotlin parser") — `[standard engineering term]`
  Same input always produces the exact same output, by fixed rules. A deterministic
  parser only understands the exact phrasings it was hand-coded to recognize — no
  interpretation, no flexibility. That's why the demo's *"drop a hostile 500 yds east"*
  works but a reworded command might not. Kevan's word, line 561.
- **MissionCommand DTOs** — `[Kevan's term; "DTO" is standard]`
  DTO = Data Transfer Object: a simple, structured package of data passed between parts
  of a system. "MissionCommand DTO" = Kevan's name for one mission command in that
  structured form. It's the format mission-core accepts — line 439, the adapter
  *"converts natural language into typed MissionCommand DTOs only."*
- **mission-llm-adapter** — `[Kevan's module name; "adapter" is standard]`
  Adapter = a component that converts one thing into the form another component expects.
  "mission-llm-adapter" = Kevan's name for the module that uses an LLM to convert plain
  speech into MissionCommand DTOs — the planned replacement for the deterministic parser.
  Kevan's term, lines 435–439.

### Candidate #5 — Build out the TAK Server fallback (today a stub)

- **NOW**
  - **Anchor (lines 368–373)** — Kevan's "Tiered transport routing": *"Wi-Fi Direct preferred,
    BLE fallback, LAN direct fallback, TAK Server stub/future fallback, route scoring and
    per-recipient delivery tracking."* And the scoring (lines 824–834): *"Wi-Fi Direct
    registered peer 400 … LAN direct 325 … BLE client write 200 … TAK Server relay stub 50."*
  - **Bridge** — "stub" = a placeholder piece of code standing in for a real feature that
    isn't built yet. At a score of 50 (vs 200–400 for the radios), the router only reaches
    for it as a last resort.
  - **Defensible read** — the TAK Server path exists only as a stub today, ranked last among
    the transport routes.
- **TARGET**
  - **Anchor (line 372)** — Kevan's only words on the future state are *"stub/future fallback."*
  - **Bridge** — "future" = planned but not built.
  - **Defensible read** — 🩷 *Kevan names it a "future fallback" but gives no spec, no
    target, and asks no one to build it. A working TAK Server relay path is my inference
    from the word "future" — confirm with Kevan before treating it as a real chore.*
- **CANDIDATE CHORE** = build out the TAK Server fallback into a working relay path
  (🩷 inferred from "future fallback"; not a stated ask).
- **So what:** a backup route for when devices can't reach each other directly. 🩷 *My read:*
  needed for real deployments, but NOT required to prove the core no-central-server thesis
  (TLDR line 41) → **backlog.**

### Candidate #6 — Add multi-sensor data fusion (confidence + prioritization)

- **NOW** — 🩷 *inferred:* no fusion exists today (Kevan frames it as a future
  improvement, not a current capability). → *Inputs aren't yet combined into one picture.*
- **TARGET** — line 735, Kevan: *"areas for improvement, such as data fusion from
  multiple sensors with confidence and prioritization. But it's a stable foundation."*
  → *Combine several sources into one trustworthy picture.*
- **CHORE** = add multi-sensor data fusion with confidence/prioritization.
- **So what:** mission-capability hardening, not feasibility. Real value later — but
  watch the *build-ahead-of-validation* anti-goal here. **Backlog.**

### Candidate #7 — Tune the transport layer (prioritize LAN, per-radio heartbeat timing)

- **NOW** — current fixed route scoring (lines 824–835) and uniform heartbeat timing.
  → *The plumbing works but is tuned one-size-fits-all.*
- **TARGET** — line 901, Kevan: *"prioritizing LAN direct, having different PLI/heartbeat
  timings and sync strategies depending on transport."* → *Tune routing/timing per radio.*
- **CHORE** = adjust transport routing priorities and heartbeat timing per transport.
- **So what:** performance/reliability polish on plumbing that already works. Low risk,
  low learning. **Backlog unless a specific test needs it.**

### Candidate #8 — 🩷 Prove it works beyond 2 devices (squad/platoon scale)

- **NOW** — *Kevan did not state this.* Every demo used exactly two phones (lines 490–542).
  → *Trust + sync are only proven at 2 devices.*
- **TARGET** — 🩷 *inferred, none stated:* hold trust + sync at squad/platoon scale (5–20+).
- **CHORE** = test whether admitted-peer trust and sync hold beyond 2 devices.
- **So what:** a real field-use **feasibility** question Kevan didn't name. Abel's call
  whether to raise it. 🩷 fully inferred — challenge freely.

---

### Claude's read (Abel to override)
- **#1 + #2 are the pair that earns the week** — they unblock everything and produce
  feasibility evidence (Goal 2). #3 is a small enabler that can ride alongside.
- **#4 is the tempting over-reach** ("real AI") — park as *next* week so it doesn't pull
  the team into a rabbit hole before the foundation (#2) is clean.
- **#5–#7 are backlog** (hardening/capability, not feasibility). Naming them "not this
  week" is the rabbit-hole guard.
- **#8 is Abel's to decide** whether to raise with the engineers.

===

## Let's focus around [4.3.3] AI/ML Model Improvements first,

- #12

- #13 and #14 related

- #15 

- #17, #18, #19 and #20 related

## Let's focus on Bucket 1 - Capabilities Shipped during the competition 

**Bucket 1 — Capabilities shipped during the competition (candidate outputs)**

- #6. Advanced labeling algorithm — human-like numbering, adapts to irregular layouts
  - *Def:* Auto-numbers detected buildings the way a human would, adapting to complex/irregular layouts to produce intuitive label order and reduce cognitive load. 
- #7. Multiple labeling schemes (row / grid), operator-selectable
  - *Def:* Operator picks from preset labeling strategies (e.g., row- or grid-based) to match the scenario, speeding labeling and reducing corrective actions.
- #8. Swipe-to-relabel gesture — re-sequence markers
  - *Def:* A swipe gesture re-sequences building marker numbers, letting operators optimize labeling order for mission flow after AI detection.	
- #10. KMZ export with auto-generated legend (op title, MGRS, version)
  - *Def:* Exports the finished GRG as a KMZ file with an auto-generated legend (operation title, MGRS location, version) for sharing and interoperability.	
- #11. Multi-model / plug-and-play runtime SDK demonstrating CT/CD
  - *Def:* SDK swaps/adds ONNX model runtimes without rebuilds, so new trained models deploy continuously (CT/CD) and match mission and device needs.	
- #12. Training pipeline: CVAT → SageMaker → S3 artifacts
  - *Def:* Pulls labeled imagery from self-hosted CVAT, trains models in AWS SageMaker, stores weights/benchmarks/metrics as versioned artifacts in S3.
- #14. ONNX runtime (beat TFLite/PyTorch) + 256×256 tiling + RGB bitmap input
  - *Def:* On-device ONNX runtime (chosen over TFLite/PyTorch for edge) processes 256×256 image tiles with RGB bitmap input for better detections.

**Bucket 2 — Competition baselines (measured metrics → strongest hypothesis candidates)**

- #16. Section vs full-AOI accuracy = 80-90% per section vs 60-70% full scan
  - *Def:* Detection accuracy measured at 80-90% when run per drawn section versus 60-70% scanning the full AOI at once.
- #17. Recall improvement (YOLT) = 670%
  - *Def:* Integrating the YOLT model yielded a 670% improvement in building-detection recall, reported as a competition KPI.
- #18. Labeling time saved = ~28 min faster across 6 GFE AOIs (estimate)
  - *Def:* Estimated that AI-assisted labeling would be ~28 minutes faster than manual across the six Government-Furnished Areas of Interest.
- #19. Labeling acceptability out-of-box	~90% with default algo
  - *Def:* A single default labeling strategy reached ~90% label acceptability for mission use out-of-the-box, per user-representative review.
- #20. Label correction rate = 9-12% (2-3/30 PH; 3-12/68 CA)
  - *Def:* 9-12% of AI-generated labels needed manual correction in testing (2-3 of 30 in Philippines; 3-12 of 68 in California).
- #21. End-to-end time target	60+ min → under 15 min (not yet met)
  - *Def:* Target hypothesis: cut mission-ready GRG creation from 60+ minutes to under 15; competition results trended toward it but didn't reach it.
- #22. Initial effort-reduction experiment = "55% accuracy" — add/remove 14 per 15 AI got right
  - *Def:* Early experiment: operators added/removed ~14 labels per 15 the AI got right (~55%), cutting labeling task time by more than half.
- #23. Cognitive-load / effort	Non-linear effort explosion w/ building count; 100 bldgs ≈ 3.5/10
  - *Def:* Baseline: manual effort rises non-linearly with building count (25-250); ~100 buildings rated ~3.5/10 perceived effort ("manageable").
- #24.	Stress vs time available	Stress curve by window (>1 day vs <1 day)
  - *Def:* Baseline charting perceived operator stress (0-10) against planning time available, contrasting "more than 1 day" versus "less than 1 day" windows.
- #25. Security	93% unit-test coverage; ATAK MTTR 157 min, WinTAK 25 min
  - *Def:* Security baselines: 93% unit-test coverage, NIST compliance, and mean-time-to-resolve per vulnerability of 157 min (ATAK) and 25 min (WinTAK).
- #26. Terrain-type accuracy variance	Desert vs tree cover vs urban differ (unsolved)
  - *Def:* Detection accuracy varies by terrain type — clear desert, tree cover, and complex urban each performed differently; consistent cross-terrain accuracy remains unsolved.

###  Proposed production hypotheses (baselines → outcomes)


Framed against the mission outcome "Operators produce accurate GRGs in less time and with less effort." My proposals — tighten or reject:

1. Field accuracy holds — 80-90% section accuracy & 9-12% correction persist with real operators on operationally-relevant terrain. (#16, #20)
2. Time reduction is real in the field — operators approach the 15-min target under Hasty windows. (#18, #21, #22)
3. Cognitive load drops — perceived effort/stress measurably falls vs the manual effort-explosion curve. (#23, #24)
4. Trust, not just tolerance — ~90% acceptability translates to operators trusting output (the distinction #28 says we can't currently make).
5. Terrain generalization — accuracy is consistent enough across desert/tree-cover/urban to be dependable — Abel's "honey pot." (#26)
6. Minimum Viable GRG by window — a defined "good enough" per window changes tool usage. (#27)

The meta-dependency: all six are blocked on the same missing thing — a post-mission feedback loop (#28). Without field telemetry/ground-truth, none can be measured, only assumed. That makes the feedback loop itself the highest-leverage opportunity: it's the instrument that converts every other baseline into a validatable hypothesis.


**QUESTIONS**

- What's the plan for the WinTAK Plugin?

* Remember - Before we defined the experiments.. We need to talk to people, Yi, Mases, Kevan, Etc..
* Remember - some of these answers, assumptions and experiments need to be discussed with Nik first.. use this to get him to open up about what we want to learn.

===

# Stand-up: TAK Beach Gap - Weds, June 3 [gemini-transcript]

**Summary**
Meeting notes detailed automated gardening progress and prototype architecture designs alongside team updates and engineering milestones.

**Automated Garden and Design**
The team discussed automated gardening features involving scheduled watering systems. Design efforts are currently focused on refining prototype architecture, libraries, and plug-in integration for mission visibility.

**Prototype and AI Updates**
The Tackling prototype reached near-production status for future demonstrations. Attack Manager AI integration now supports multiple model providers and local large language models via Ollama.

**Team and Operational Updates**
The team welcomed new engineering support and finalized administrative transitions. A major decision was made to prioritize immediate pairing sessions over previously scheduled interview preparation activities.

### Next steps

[Zachary, Jonathan] Discuss Design Systems: Coordinate on the design system implementation. Meet to discuss the implementation strategy together.

[Zachary] Pair Prototype Expansion: Reach out to Thomas to collaborate on expanding the prototype into TAC X. Coordinate effectively to achieve the best results.

[Andrew] Record Prototype Demo: Capture a video demonstration of the prototype. Share current progress and functionality with the team.
[Andrew] Discuss Taffan Approach: Collaborate with Jared and Sean to explore how the Taffan approach can support SOAR. Identify opportunities to improve existing workflows.

[Sean] Cancel Interview Prep: Notify relevant parties to cancel the scheduled interview preparation session. Coordinate rescheduling for a future date if necessary.

[Thomas] Add To Slack: Provide Andrew Ferguson with access to the appropriate project Slack channels. Enable him to review previous discussions for extra context.


### Details

**Design and Prototype Architecture:** Jonathan explained that the design team has been prioritizing pain points and refining problem statements to establish a foundation for future work. 
- They are determining how to implement design within the architecture established by Kevan, which includes libraries, a user interface, a software development kit, and plug-ins. 
- Thomas is focusing on creating data models to facilitate shared mission visibility between devices. 
- Mary Pollin noted that the team will continue to huddle to define the chores necessary to realize the prototype, while Zachary will pair with Jonathan to address design systems and expand the prototype into TAC X.

**Zachary's Upcoming Leave:** Zachary announced plans to take time off before Friday to renew a driver's license in West Virginia. Additionally, Zachary will be working remotely from the mountains during the following week.

**Andrew Ferguson's Onboarding:** Andrew Ferguson introduced themself as a software engineer joining the team from the MEOGMI team for the next few weeks until a contract is finalized. Andrew Ferguson noted that they will not be fully focused on work until Monday due to being out on Friday and stated that they have already reviewed the prototype shared by Kevin.

**Andrew's Prototype Updates:** Andrew reported that the Tackling prototype is in a near-production state and they plan to record a demo for the team. Andrew is pairing with Jerod Culpepper and Sean to explore how the Tackling approach might support Security Orchestration, Automation, and Response. Additionally, Andrew will leave at approximately 3:00 PM to attend a cyber security event in Tampa.
Jerod Culpepper's Daily Tasks: Jerod Culpepper stated that they intend to assist with Alligate at some point during the day.

**Attack Manager AI Integration:** Sean completed a significant portion of the AI integration for Attack Manager, which allows users to select from various model providers or run a local large language model using Ollama. Sean also refined the rule-based chatbot to improve user experience for Q&A-style interactions. Regarding team collaboration, Sean is canceling the scheduled interview prep with Andrew Ferguson to focus on pairing to explore how to incorporate ideas from the 160th unit into Attack Manager.

Closing Housekeeping:  Thomas committed to adding Andrew Ferguson to the relevant Slack channels to provide additional context for the project.

===

# Session Recap and Hand-off: Candidates to GitLab Issues (updated June 4, 2026)

## What happened this session (the arc)
- Reviewed the engineers' raw notes (Thomas and Zach's "5 to 6 things") and Kevan's 5/29 Slack threads (`gap-tak-may_25-29.md`, lines 352 to 901).
- Translated them into a 6-candidate set with tak-eng-translate. It lives in `gap-tak-may_25-29.md`, the "Candidate Chores, engineers' read" section (about lines 903 to 1060).
- Drafted issues from the candidates with tak-issuedrafting and put them in GitLab.
- Refactored the tak-issuedrafting skill twice: an em-dash rule, and a no-injected-jargon rule (lead with plain WHAT and WHY, leave the HOW and the precise terms to the engineers).
- Held a pre-IPM that was eye-opening and reshaped how we should draft (see Learnings).

## Read this first: the one trap
There are TWO candidate lists in these notes. Use only one.
- USE: the 6-candidate set in `gap-tak-may_25-29.md` (about lines 903 to 1060). This is what maps to GitLab.
- DO NOT USE: the older 8-candidate "Candidate Engineering Chores" list in THIS file (lines 301 to 512). It is an earlier synthesis, now superseded.

## Authoritative crosswalk (engineer raw item to candidate to GitLab)

| Engineer raw item | Candidate (may_25-29) | GitLab | Status |
|---|---|---|---|
| 1. Arclight SDK (Mases, network mesh) | Candidate 1 | #11 | Drafted. Cleaned version ready to paste (adds Mases notes + Ditto decision). Was #7, deleted, now #11. |
| 2. Multiplatform, mission stuff into Mission-Core (Zach) | Candidate 2 | none (deleted) | Zach reframed it as a CMP-vs-KMP viability spike. Needs recreating in GitLab as that spike. |
| 3. "command contract" data models | Candidate 3 | #9 (Spike) | Drafted, cleaned of jargon. |
| 4. LLM adapter / command parser | Candidate 4 | #10 (Chore) | Parser half is #10. LLM half parked as a future spike. |
| 5. Sensor integration / data fusion | Candidate 5 | none | Not drafted. Consideration, blocked on discovery. |
| 6. "API route hardening" / security | Candidate 6 | none | Not drafted. Question for the team; security already built per Kevan. |

## New ground truth from the engineer conversations
- **Mases / Arclight (#11):** Mases may start next week. His raw notes, to confirm: move all the business logic out of the individual platforms, shared UI and less code, ideally avoid changing business logic separately across ATAK and the SDK. This is Kevan's suggestion and direction, not a task Kevan assigned.
- **Zach / Mission-Core (Candidate 2):** Zach's own first step is a spike, in his words: "CMP viability vs KMP (ATAK, WebTAK, TAK-X)." He is building a thin "marker placer" to baseline how the business logic shares across the 3 platforms. MVP is ATAK and WebTAK dropping markers off the same code. Then bring TAK-X to parity, validate, then move to bigger features (CoT messages, GRG). Validation, his words: Zach creates a "CMP/KMP Prototype" folder in the GitLab repo, Thomas and Andrew F pull it down and test it, since there is no client environment. So Candidate 2's real ticket is this spike in Zach's words, not the abstract "extract Mission-Core" chore first drafted.
- **Ditto:** decided NOT to use it. Kevan confirmed it costs about $2 million, so we are building our own. The earlier Ditto buy-versus-build question is closed.

## Still to do
- Recreate Candidate 2 in GitLab as Zach's CMP-vs-KMP viability spike (his title, his marker-placer MVP, his validation method). The old ticket was deleted.
- Update #11 with the cleaned version (Mases notes attributed to him, Ditto as a closed decision).
- Draft Candidate 5 (sensor integration) and Candidate 6 (API route hardening / security). Both are likely NOT build chores. Determine the type with Abel first.

## Learnings from the pre-IPM (these reshape how we draft)
- We were over-building. Full, confident, citation-backed chores got drafted from thin engineer notes, so they read as more settled and more Claude's than the input warranted. Example: from about 20 words of Zach's note, a complete "extract Mission-Core" chore was produced. Zach's actual first step turned out to be a narrow CMP-vs-KMP viability spike.
- Proposed next refactor of tak-issuedrafting (NOT built yet): a pre-drafting step where Abel sets two things before any drafting, and those choices set how Claude collaborates and how much it drafts.
  1. Abel's PM confidence on the issue (knowledgeable, intermediate, limited).
  2. Abel's gut on the type (technical chore or spike, bug, user story, general spike).
  Captured here so it is not lost.

## Conventions locked this session (carry forward)
- Never use the em dash character, anywhere. Use commas, periods, parentheses, or "e.g."
- Use the real name, not a description. "Arclight SDK", not "generic sync api". "Mission-Core", not "mission logic".
- Do not introduce tech terms the engineers have not used. Lead with plain WHAT and WHY. Leave the HOW and the precise terms for the engineers to define. Keep an engineer's own term as theirs (e.g. Thomas's "command contract", Zach's "marker placer").
- Use "track" for a place in the code where a chore cuts, not "seam".
- Terms: Multiplatform (general), KMP (logic only), CMP (logic and UI). Use "CMP" only where it was actually raised.
- Thomas, Zach, and Mases are the team's engineers. Their read is trusted. Kevan's words are the citation anchor for intent.
- Chore shape: WHAT and WHY firm, then "How we'll confirm" in witnessable terms, then "To align on with the engineers". Never tell engineers how to do the work.
- Spike shape: collapse What and Why into one research-leaning section, leave the deliverable form to the engineers.
- Match the drafting depth to how solid the input is. Do not draft a full, confident ticket from a thin note.
- Workflow: one clarifying question at a time, propose the title only and stop, then ask "ready to draft" before the full draft.

## Hand-off Prompt (paste into a new context window)

You are assisting Abel (Product Manager, Rise 8) on the SOCOM TAK project during the OTA gap period. We use the tak-issuedrafting skill to turn candidate engineering items into GitLab issues. I am a PM, not an engineer. Translate engineering detail into plain language. Do not put me in the engineer's seat: open engineering questions are things I carry TO the team, not decisions I owe you.

Source of the candidates: TAK-ALL/r8-internal/Daily-TAK-notes/gap-period/gap-tak-may_25-29.md, the "Candidate Chores, engineers' read" section, about lines 903 to 1060. This is the 6-candidate set. Do not use the older 8-candidate list in gap-tak-june_1-5.md (lines 301 to 512).

State of the work:
- GitLab #11 = Arclight SDK extraction (Candidate 1, engineer item 1, Mases). Cleaned version pending paste.
- GitLab #10 = command parser into Mission-Core (Candidate 4 parser half).
- GitLab #9 = data models spike, "command contract" (Candidate 3).
- Candidate 2 (Mission-Core, engineer item 2, Zach) has NO ticket. Zach reframed it as a CMP-vs-KMP viability spike (a "marker placer" across ATAK, WebTAK, TAK-X). Recreate it in GitLab in his words.
- Candidate 5 (sensor integration) and Candidate 6 (API route hardening) are not drafted.
- Ditto: decided against, about $2 million, building our own.

Your task: help me (1) recreate Candidate 2 as Zach's CMP-vs-KMP viability spike, then (2) draft Candidate 5 and Candidate 6, type first. One clarifying question at a time, title only first, then draft after I confirm.

Conventions to follow:
- Never use the em dash character. Use commas, periods, parentheses, or "e.g."
- Do not introduce tech terms the engineers have not used. Lead with plain WHAT and WHY; leave the HOW and the precise terms to the engineers. Keep an engineer's own term as theirs.
- Use the real name, not a description.
- Terms: Multiplatform (general), KMP (logic only), CMP (logic and UI); use "CMP" only where it was raised.
- The engineers (Thomas, Zach, Mases) are trusted; Kevan's words are the citation anchor.
- Chore shape: WHAT and WHY firm, "How we'll confirm" witnessable, "To align on with the engineers". Spike shape: collapse What and Why, leave the deliverable form to the engineers.
- Match the drafting depth to how solid the input is. Do not draft a full, confident ticket from a thin note.
### One thing I did not do, because you have not asked yet: actually building that pre-drafting "confidence + gut-type" step into the skill. It is captured as a proposed change only. Want me to take that on next, or leave it for a future session?

===

# Mission Core Pre-IPM - June 4th, [gemini-transcript]

### Summary
The team defined architectural goals for Compose Multiplatform and Kotlin Multiplatform integration for future system unification.

**Defining Core Development Strategies**
Compose Multiplatform and Kotlin Multiplatform definitions were clarified to distinguish between user interface sharing and logic decoupling. Prototype development established a modular approach for mission-specific data handling.

**Architectural Vision and Integration**
The team discussed extracting network mesh logic into an independent SDK to enhance data synchronization reliability. A future architecture was outlined to centralize business logic and design systems for cross-platform consistency.

**Feasibility and System Ownership**
Investigating design system library integration with current prototypes was prioritized to demonstrate technical superiority. Strategic alignment regarding stakeholder dependencies and contract flexibility was identified as a critical factor for success.

### Details
**Clarification of CMP and KMP Terms:** Zachary and Abel established the definitions for Compose Multiplatform (CMP) and Kotlin Multiplatform (KMP), clarifying that CMP includes shared UI capabilities while KMP focuses on business logic and data rules. The goal of using CMP is to maximize value by sharing UI components across the ATAC, WebTAC, and TACX platforms, thereby reducing the need for redundant UI maintenance while keeping core business logic consistent (00:00:00).

**"Marker Placer" Prototype Development:** Zachary is building a "marker placer" feature, which serves as a prototype to establish scaffolding and determine how to effectively share business logic and UI between platforms (00:04:31) (00:06:32). The objective is to decouple mission-specific business logic from ATAC-specific UI, ensuring that the mission core remains modular and independent of any single platform (00:03:23).

**Technical Progress on Marker Placer:** Zachary confirmed that the marker placer is currently functional on both ATAC and WebTAC using a shared codebase. The next phase of development involves expanding this functionality to TACX to achieve platform parity, which will be followed by the integration of additional features such as GRG placement or CO messages (00:08:02). Zachary considers the successful implementation of the marker placer on TACX as the minimum viable product (MVP) for the prototype (00:10:17).

**Verification and MVP Deployment:** For validation, Zachary plans to push the prototype code to a repository where the team, including Thomas and Andrew, can pull and test it locally. While Abel questioned whether a local environment is sufficient, they agreed that local verification by the team is the appropriate next step before proceeding to more complex deployment strategies (00:11:19). Once the MVP is validated, the team will prioritize the next set of mission features (00:13:46).

**Defining Mission Domains:** Jonathan suggested using the term "mission domains" to refer to specific objects like routes and GRGs, which the team agreed would help clarify future discussions regarding data models and schemas (00:15:18). Abel noted that the team will check in on the progress of the marker placer work the following Monday (00:16:34).

**Thomas’s Spike on Data Models:** Abel summarized a spike led by Thomas, which involves investigating the data models required for mission data shared between field devices. This effort aims to produce informed suggestions for SOCOM rather than developing live software immediately (00:17:42). Zachary explained that the work involves identifying the necessary classes and determining the optimal methods for storing and presenting this data (00:18:46).

**Arclight SDK and Network Mesh:** The team discussed the "Arclight" SDK, a concept for a network mesh designed to synchronize data between devices. Kevin previously proposed extracting this logic from the current monolith to ensure it operates independently of ATAC (00:20:46) (00:22:50). The team initially considered using a third-party tool called "Ditto," but Zachary noted it was prohibitively expensive, leading them to favor building an internal solution using Android native functions (00:21:57).

**Operator Trust and User Perspectives:** Jonathan emphasized that the need for a robust data sync solution is driven by user feedback, noting that operators often exhibit distrust toward digital tools compared to traditional methods like paper maps or radio communication (00:23:46). Consequently, ensuring that the data displayed in ATAC is current and trustable is a critical requirement for meeting operator needs (00:24:52).

**Technical Alignment for Arclight SDK:** The team clarified that the goal for the Arclight SDK is to remove business logic from individual platforms while maintaining shared UI where possible (00:26:11). Jonathan noted that this technical separation will be detailed in upcoming architectural diagrams, which will help the team align on what should move out of the ATAC-specific codebase (00:27:15).

**Coordination with Mases K:** Abel took action to communicate with Mases K to align on the project spike and the plan to extract the network mesh into a standalone module (00:27:15).

**Command Parser Logic:** The team discussed the necessity of moving the logic that parses typed orders into actions from the existing plugin to the "mission core" (00:29:31). This transition is intended to decouple the command flow from ATAC and allow for reuse across different platforms (00:30:37).

**Red Queen Plugin Investigation** Zachary identified the "Red Queen" plugin, which handles speech-to-text and command processing, as a potential reference for their command-parsing work (00:30:37) (00:32:49). Zachary offered to investigate the documentation for Red Queen to determine if it offers useful patterns that the team can apply to their own integration (00:31:37).

**Repository Management and Future Steps:** Zachary plans to coordinate with Thomas to organize the Git repository and push the prototype code, with a target completion date of early next week (00:33:51). Abel outlined remaining management tasks, including following up with Thomas and Mases K and preparing issues for future work, such as LLM adapters, voice recognition, and sensor integration (00:35:10).

**Current Architecture Overview:** Jonathan presented an overview of the current architectural state, where features are built directly on the ATAC SDK without centralized design guidance. This approach provides flexibility but lacks guardrails, relying on custom source code and limited support from TAC UI or the Android base theme (00:44:34).

**Future State Architecture Vision:** The team outlined a future-state architecture where the ATAC SDK is layered with the Arclight SDK, shared libraries, business logic, and a formal design system (00:49:25) (00:53:04). This design system is intended to reside within the library and logic layer, providing standardized styles, colors, and components to foster trust and consistency (00:50:37). This structure is envisioned to eventually roll up into a "Soft Tac SDK" that supports multiple plugins (00:53:04).

**Architecture Benefits and Design System Role:** Jonathan highlighted that the proposed architecture offers benefits such as faster plugin creation, reduced maintenance of shared logic, and improved cross-platform consistency. The design system is intended to complement existing TAC UI capabilities rather than replace them, allowing plugins to inherit design decisions while maintaining the ability to customize further (00:52:00) (00:55:14).

**Implementation Strategy:** The team discussed that while the full architectural vision requires SOCOM alignment, the design system can be implemented incrementally (00:57:38) (01:00:24). Zachary observed that the design system could be utilized either through a shared SDK or directly within individual plugins, ensuring that the work provides value regardless of the final organizational implementation (01:02:44). Jonathan noted that the skeleton of the design system could be established with minimal effort, as the primary challenge is decision-making rather than technical complexity (01:03:52).

S**ystem Ownership and Dependencies:** Jonathan suggests utilizing their existing system and TAC UI to demonstrate flexibility to Nick. Abel initiates a discussion on identifying stakeholders and dependencies, noting that TAC UI is owned by SOCOM (or SoftMC) and maintained by BAH, while the ATAC core is an open-source project maintained by TPC. Abel emphasizes the importance of understanding these relationships and establishing alignment between the different players (01:05:02).

**Contract Scope and Strategic Implementation:** Zachary and Abel discuss how the specific terms of the incoming contract will dictate their ability to perform exploratory work. Zachary suggests that if the contract permits flexibility, the team can demonstrate the value of their system, which they consider to be superior, thereby positioning it as an advantageous solution for the stakeholders to adopt (01:06:37).

**Prototype Feasibility and Skill Development:** Jonathan and Zachary outline their plans to use the current gap period to investigate the feasibility of connecting a design system library to their prototype code. Jonathan notes that this initiative serves a dual purpose: it acts as an educational exercise for the team members involved, and it provides a proof of concept demonstrating their capability to drive a plugin from a design system, which would prepare them should they be granted the flexibility to implement this solution (01:07:42).

**Library Integration and Meeting Conclusion:** Abel inquires about the integration of Arclight and Soft TAC libraries into the prototype. Jonathan confirms that these elements are part of the prototype, though they may require further layering. The participants clarify that TAC UI acts as the framework for the design system library, potentially encompassing states and other considerations that require future investigation. Abel concludes the meeting to address an insurance matter (01:09:01).

### Decisions

ALIGNED, according to gemini

* Marker placer prototype established as MVP The team aligned on establishing the marker placer prototype as the Minimum Viable Product (MVP) to validate shared business logic and UI across all platforms.

* ArcLight SDK development over buy The team decided to develop an internal "Arc Light" SDK for network mesh functionality, choosing to build an in-house solution rather than purchasing the costly "Ditto" software.

* Design system development approved The team decided to proceed with developing a design system as an independent library, ensuring the work provides value regardless of whether the full future-state architecture is adopted.

### Next steps
[Zachary] Build marker placer: Develop and expand the marker placer prototype across ATAC, WebTAC, and TACX to achieve feature parity by next week.
[Zachary-Thomas] Organize prototype repo: Create a dedicated folder in the git repository for the prototype code to facilitate team access and testing. Work with Thomas to organize these folders.
[Abel] Contact Thomas: Message Thomas via direct message to confirm his availability and status regarding his assigned spike.
[Abel] Coordinate mesh extraction: Discuss with Meis the plan to extract the network mesh logic into a separate module from the current prototype.
[Abel] Document development tasks: Create and document tracking issues for the LLM adapter, voice recognition, text parser, sensor integration, and route hardening.
[Zachary] Research Red Queen: Investigate the Red Queen plugin and its speech capabilities to inform future command and text input implementation.
[Jonathan-Zachary] Connect Design System: Link the library containing token files and components to the prototype code. Demonstrate the ability to drive plugins from a central design system to ensure feasibility.
[Jonathan] Brief Nick: Present the system advantages and problem outcome language to Nick. Facilitate understanding without requiring a deep technical discussion.
[Abel] Arrange Pairing Sessions: Arrange time to pair with Missise, Thomas, and Kevin. Organize these sessions to refine the current design work.

===


## Raw notes from Daily Stand up , Friday June 5th 

[p2p-future-state]


[taclan-manager-platform]

- jared: TACLAN manager, prototyp running on his machine, then got pulleed into some Alloc8 stuff, today focus on TACLAN Manager running,
- Thomas, wrapping spike. need to format a document for what the contract would look like.. going forward when we have hausers, want to verify it fits with them. -- Assuming this prototype is what we are moving forward..  AND second, getting the Arclight repo into gitlab as a base to get us , thats all I got for now.. 
- Zach: get TAK X on the repo, next week pick the next feature to expand.. in and out next week. 

- Andrew, TAKLAN Manager, last change he is making, a placeholder for TAK server app, TAK server "iron bank" He has a little work ShipIt with bugs.. failures occuring, He posted in channel helping a friend. off line 1 hour or so..

# Mission Core Pre-IPM - June 4th, [gemini-transcript]