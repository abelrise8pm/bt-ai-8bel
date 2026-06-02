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
   (line 152); Sean Herbert's AI-on-hub idea (line 158); Kevan's mesh PoC →
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

# Output/Deliverable Candidates (Competition Period)

> Sourced from: `pre-sow-tak-competitions.md`, `tak-challenge_n_current-condition.md`, `tak-repo-info.md`. Each item uses the source's own wording. For inquired items, sourced facts and technical judgments (not in the docs) are tagged separately — no fabrication.

### Plugins

1. **Fully functional WinTAK plugin** — Built in a different .NET WPF framework, working through its technical limitations. — `pre-sow-tak-competitions.md:398`

2. **Single AI SDK** — Performed inference and complicated labeling algorithms with an ONNX YOLO computer vision model; the same "Building Detection SDK" feeds both the WinTAK plugin and the ATAK plugin. — `pre-sow-tak-competitions.md:399`, `:44-47`
   - **On the question (why a "single" SDK is a thing / what it enables):**
   - *Sourced:* The two plugins live in completely different frameworks — ATAK on Android, WinTAK on .NET WPF (`:398`). The SDK feeds both (`:47`). ONNX runtime was specifically chosen because it runs on *both* Windows and Android edge devices (`:33`). The "train once, build once" framing says security patches get fixed once and deployed everywhere (`:40-41`), and the testing slide claims users get "the same reliable experience regardless of the device" (`:56`).
   - *Technical judgment (not in docs):* The contrast — "do AI without an SDK" — would mean embedding the inference + labeling logic directly inside each plugin. Across two unrelated frameworks (Android/Java vs .NET WPF) that means writing it twice, where the two copies inevitably drift and behave differently. A single SDK is feasible *because* ONNX is cross-platform: one model artifact + one runtime works on both. The SDK is the seam that makes one body of AI logic serve both plugins.
   - *Outcome it enables:* Consistent detection/labeling behavior across ATAK and WinTAK, one place to patch vulnerabilities, one place to swap models — primarily an engineering/maintainability + cross-platform-consistency enabler, not a user-facing feature.

### AI SDK features / enhancements

3. **Advanced labeling algorithm** — Numbers buildings the way a human would; naturally adapts to complex, irregular layouts. — `pre-sow-tak-competitions.md:159`
   - **On the question (why "advanced," and what evidence defines "complex/irregular"):**
   - *Sourced — what "complex/irregular" means:* Buildings normally organize in logical sequences/rows with a top-left origin (`:177-178`), but "roads, rivers, and natural or man-made gaps influence label order" and "circular or irregular patterns require judgment and 'artful' adjustment" (`:186-187`).
   - *Sourced — evidence it works on those:* Validated on two real AOIs of different size/layout — Ft. Magsaysay, Philippines (30 buildings) and Razish Village, California (68 buildings) — reaching ~90% out-of-box acceptability with only 9-12% of labels needing edits (`:192-202`); SME Hayes called the default "acceptable and valuable" for mission use as-is (`:197`).
   - *Technical judgment (not in docs):* "Advanced" is relative to naive sequential numbering (blind left-to-right). This algorithm mimics human ordering and reacts to layout features rather than ignoring them — that's the differentiator.
   - *Outcome it enables:* A labeling order that's "instantly intuitive," reducing cognitive load and corrective actions (`:159`).

4. **Additional labeling features** — Easy strategies for common scenarios like row- and grid-based schemes; operator selects the best scheme. — `pre-sow-tak-competitions.md:320`

5. **Multi-Model Runtimes** — SDK engineered to allow different AI models; configurable to match mission requirements and device, with support to quickly add new model runtimes. — `pre-sow-tak-competitions.md:161`, `:322`
   - **On the question (benefit, the opposite, eng vs end-user):**
   - *Sourced:* "Ideal user workflow needs multi-model support… SDK configurable to match mission requirements and device" (`:322`); operators "select the balance of speed and accuracy to match their exact mission requirements and device" (`:161`). Slide 12 names the drivers: the S20 needs small/fast models at the cost of detection performance; general-purpose models compromise too much, so specialized models are needed; a plug-and-play architecture allows continuous replacement of fungible models (`:262-268`). Slide 16 shows the tradeoff concretely — YOLO is fast (~2s on S20) but misses small objects; YOLT catches small objects but is slow (40s+ on S20) (`:308-310`).
   - *Technical judgment (not in docs):* The opposite is a single hard-coded model baked into the plugin — one fixed speed/accuracy tradeoff for every device and mission. That forces a bad compromise: a fast S20-friendly model underperforms on capable hardware, while an accurate heavy model is unusably slow on the S20.
   - *Eng vs end-user:* Both. Engineers can add/deploy new runtimes without rebuilding the plugin; the end user (or mission config) gets to pick speed-vs-accuracy for their device/mission.
   - *Outcome it enables:* The plugin stays useful across a device range and mission types (fast "hasty" vs. accurate "deliberate") instead of being locked to one tradeoff.

6. **Fungible AI model upgrades** — Swapped in latest trained model ONNX files, demonstrating CT/CD (Continuous Train/Continuous Deploy) value. — `pre-sow-tak-competitions.md:324`
   - **On the question (same as Multi-Model Runtimes):**
   - *Sourced:* "Swapped in latest trained model ONNX files, demonstrating CT/CD value" (`:324`); architecture supports "continuous integration and replacement of fungible models, ensuring ongoing improvement" (`:268`).
   - *Distinction from #5 (judgment):* Multi-Model Runtimes = run *different kinds* of models (YOLO vs YOLT); fungible upgrades = drop in a *newer trained version* as a swappable ONNX artifact.
   - *Technical judgment (not in docs):* The opposite is a statically embedded model — upgrading it means rebuilding and redeploying the whole plugin through TAK Forge (itself a hard, gated path). Fungible = ship just the ONNX file.
   - *Eng vs end-user:* Primarily an engineering/ops enabler that benefits users downstream — it shrinks the cycle from "model improved" to "operator has the better model" (connects to Task 3's repeatable-pipeline outcome in `tak-challenge_n_current-condition.md:86`). **Caveat:** real-world deployment still has to clear TAK Forge.

7. **Image Format Improvements** — Created an RGB bitmap input for the model, resulting in better detections. — `pre-sow-tak-competitions.md:326`
   - **On the question (RGB input / how "better" was measured):**
   - *Sourced:* One line only — "Create a RGB bitmap input for model, resulting in better detections" (`:326`). **No metric, magnitude, or measurement method is given in any of the three files.**
   - *Technical judgment (not in docs):* YOLO-family models are trained on 3-channel RGB imagery, so feeding an input that matches that expected channel format (vs. a grayscale/mismatched encoding) would plausibly improve detection — but the docs don't quantify or describe how this was validated.
   - *Read:* This looks like an engineering pre-processing call-out, not a measured user-facing feature. Low-confidence candidate pending evidence.

8. **Multi-inference strategy** — Implemented a multi-inference strategy based on user-defined sections to overcome YOLO's limitations within the user workflow. — `pre-sow-tak-competitions.md:314-317`

9. **Upgraded AI model (YOLT integration)** — Integrated state-of-the-art detection model YOLT, resulting in a 670% improvement in building detection recall. — `pre-sow-tak-competitions.md:157`, `:84`
   - **On the question (670% compared to what / prior baseline):**
   - *Sourced:* "Integrating the YOLT model resulted in a significant 670% improvement in AI building detection recall" (`:84`), restated as "670% improvement in our model's recall" (`:93`). **The prior model and the absolute before/after recall numbers are NOT stated** in any of the three files.
   - *Supported inference (judgment, partially sourced):* The baseline was almost certainly the original YOLO model (the SDK's stated CV model, `:33`/`:399`). Slide 16 supports the mechanism: YOLO scores "No" on small objects while YOLT scores "Yes" (`:309-310`) — so the recall jump is plausibly driven by catching small buildings YOLO missed. The exact comparison base isn't spelled out, so no number is asserted.
   - *What recall means + outcome:* Recall = of all real buildings, how many the model finds. A large recall gain = far fewer missed buildings up front ("Missing a building is missing a marker," ranked Critical, `:297`) → less manual adding by the operator.
   - *Don't conflate:* This Oct 10 recall figure is a different metric from the Oct 24 experiment's "55% accuracy rate" (`:224`). They measure different things at different dates.

10. **ONNX runtime AI engine** — Chosen after outperforming TensorFlow Lite and PyTorch for Windows and Android edge devices. — `pre-sow-tak-competitions.md:33`

### Plugin capabilities

11. **Automatic renumbering** — System automatically renumbers/updates marker sequences when changes are made; renumbering adjustable via a swipe gesture to optimize sequence for mission flow. — `pre-sow-tak-competitions.md:386-387`
    - **On the question (what it enables):**
    - *Sourced — the pain it targets:* "Labeling accuracy and sequence correction is the worst UX… Fixing numbering sequences after hundreds of labels are placed is described as extremely frustrating and time-consuming" (`:246-250`); 9-12% of labels need manual correction (`:247`). The operator is the final authority who can review/correct/add/remove markers (`:385`).
    - *Technical judgment (not in docs):* Without auto-renumber, removing or inserting one building mid-sequence forces the operator to manually renumber everything after it. Automatic renumbering keeps the sequence consistent on every edit.
    - *Outcome it enables:* Directly attacks the single worst-described UX pain — it removes the "extremely frustrating" manual resequencing while the operator still exercises final authority. Strong evidence-based link to a stated pain point.

12. **Section parameter control** — Users control section name, color, and numbering to match team conventions. — `pre-sow-tak-competitions.md:391`
13. **Legend generation** — Plugin generates a legend with operation title, location (MGRS), and version. — `pre-sow-tak-competitions.md:392`
14. **KMZ export** — Finalized products exportable as KMZ files, supporting data sharing and interoperability with other mission planning software. — `pre-sow-tak-competitions.md:393`

### Pipeline, library & security artifacts

15. **AI Model Training Pipeline** — GitLab model repo → AWS SageMaker (load training imagery via CVAT, epoch training) → generate artifacts (model, weights, results) to S3. — `pre-sow-tak-competitions.md:270-292`
16. **"train once, build once" AI library** — Centralized library so security patches are fixed once and deployed everywhere. — `pre-sow-tak-competitions.md:40-41`
17. **AI Model Training RMF artifacts** — AI Policy Guide, NIST Control Mapping, Secure AI DevSecOps Playbook, AI Security Checklist. — `pre-sow-tak-competitions.md:333-337`

### Repositories — `tak-repo-info.md`

18. **atak-cv-model-servers** — Computer vision model server for building segmentation using a trained YOLOv8 model, designed for ATAK/WinTAK GRG plugin integration; batch processing, CSV/zip output. — `tak-repo-info.md:1-60`
19. **GRG AI MODEL repo** — Trains and evaluates three model implementations (YOLO, YOLT, UNET) on AWS SageMaker with automated CVAT data pulling and S3 artifact storage. — `tak-repo-info.md:64-134`
20. **Security Policy Project for rise8-grg-ai-model** — Repository storing security policies (e.g., enforcing DAST in every pipeline) with protected default branch. — `tak-repo-info.md:136-174`

---

# Output/Deliverable Candidates (TAK Bridge Period)

> Sourced from: `tak-final-demo.md`, `db-wk7.md`, `tak-daily-may_11-15.md`. Each item uses the source's own wording — no fabrication. Running list after Round 2 review cuts.

## Task 1 [4.3.1] — SDK Update to v5.6

1. **`pads-fast` publish service** — Rise8-built publish service replaces the upstream PADS sidecar in the release pipeline; publish time for all five supported ATAK builds cut from 50–60 minutes to under 4 minutes, zero manual interventions since April 22. — `tak-final-demo.md:14`

## Task 3 [4.3.3] — AI/ML Model Improvements

2. **124% building detection accuracy improvement** — Quantified at the April 22 sprint demo, validated through side-by-side comparison with SOCOM. — `tak-final-demo.md:34`, `:45`
3. **Detection accuracy and reliability improvements** — Building detection now performs consistently regardless of zoom level, and repeated detection runs produce stable results. — `tak-final-demo.md:34`, `:43-44`
4. **Imagery pre-caching feature** — Plugin pre-caches imagery before building detection runs, so operators can assess conditions before committing to detection. — `tak-final-demo.md:35`, `:52`
5. **Operator imagery status messaging** — Status notification based on result: full success, partial completion, or fetch failure; includes a "Tile Capture Failed" warning popup when capture fails. — `tak-final-demo.md:35`, `:53-54`
6. **Plugin behavior and operator-experience fixes** — Seven defects resolved: detection no longer triggers before map load; background threads shut down cleanly (memory leak); no detection on backup imagery when tile capture fails; delete-section confirmation shows section name correctly; closed grids no longer reappear on map tap; building labels clear when a GRG is closed; labels outside named sections clear on save/close. — `tak-final-demo.md:37`, `:64-67`



