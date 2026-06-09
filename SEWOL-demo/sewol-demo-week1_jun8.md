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
- Domain context for SPINS. Dan needs help; may go to Clark and Burner (transcript line 140).
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

