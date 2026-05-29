# VSM Session — SOCOM TAK Capability Delivery

- **Framing:** Customer (SOCOM). Pronouns: "the customer / their team / they."
- **Subject:** How capabilities get delivered to SOCOM TAK operators for a mission
- **Started:** 2026-05-28
- **Last updated:** 2026-05-29
- **Current status:** Second Pass (Information Flow) complete. Third Pass (Metrics Flow) is next.

Section names below follow [Mission-OS/vsm-facilitator-guide.md](../vsm-facilitator-guide.md).

---

## Pre-Mapping Alignment

*(Skill scaffolding upstream of "Set the Stage" — not in the facilitator guide itself, but kept here for context on why we chose VSM and which value stream we're mapping.)*

### Why VSM (and not Journey Map / Service Blueprint / Event Storm / Process Map)

The team already has the Wagner/Cline operator journey map. The objection to address is *"why another mapping artifact when we already have the journey map?"* — not "is VSM useful?"

> "Wagner and Cline gave us the operator's experience in mission. That's a journey map. What we don't have yet is the system-side view: how a capability gets from idea → plugin → integrated → deployed → in an operator's hands during a mission. That's a different question, and it needs a different tool."

**Locked question for this VSM:**
> Where are the inefficiencies — dependencies, waste, bottlenecks, handoffs — in how capabilities get delivered to SOCOM TAK operators for a mission?

### Picked value stream

**AI GRG plugin delivery → Field Operator → on ATAK (Android) → in DDIL/disconnected environments**

- **Walking example:** AI GRG (team has direct familiarity → defensible PT/LT/%C&A)
- **Generalization scope:** The general process of getting an ATAK plugin into a field operator's hands
- **Variation handling:** Common-path with weighted branch annotations
- **Platform scope:** ATAK (Android) only. WinTAK / WebTAK / TAK-linux parked.
- **Provisioning scope:** DDIL/disconnected. Connected captured as variation note.
- **Classification scope:** Unclass for this map. Classified parked.

**Parked alternatives (with one-line divergence notes):**
- TrailBlazer (route/nav-heavy; likely diverges at pre-stage step)
- combatSwim (maritime-niche; likely diverges at platform variant)
- Software updates (lifecycle, not net-new; diverges at distribution step)
- Hardware delivery (entirely different flow — defer to a future VSM)
- May 27 "orienting scenario" (future-state vision; belongs to target-state work)

---

## Set the Stage

The five anchors that the rest of the map hangs from. All locked solo with Abel (2026-05-28), pending team confirmation.

| Anchor | Locked value |
|---|---|
| 1. Mission Impact | Forces produce and act on accurate, complete GRGs during time-pressured missions — even in degraded conditions — so less bad things happen. |
| 2. Initiator (supplier) | Upstream SOCOM authority (Program Office or senior command). External supplier — not block #1. |
| 3. Trigger / inputs | Task order or memo mandate arrives at SOFMC PM. (Variation: task order vs memo / funding decision; common path mapped.) |
| 4. End-user (customer) | Green Beret ODA Team Lead, in Field Operator (execution) mode, on ATAK Android, plan locked, DDIL. SME: Nik C. |
| 5. Outputs | Signed `.mil` AI GRG plugin running on operator's ATAK Android, configured for offline DDIL use. |

**Sourcing notes:**
- Anchor 1 lifted from [TAK-ALL/tak-oor.md:62](../../TAK-ALL/tak-oor.md#L62), lightly sharpened
- Anchor 2 working hypothesis from Nik conversations
- Anchor 4 SME (Nik C) resolves the orienting-scenario gap

**Upstream cut-point:** Map starts at "SOFMC PM receives mandate." Funding decisions, readiness assessments, and prioritization upstream of the PM treated as external supplier input — out of scope.

**Carry to Fourth Pass:** Pink assumption on **provisioning ownership** — (a) operator was provisioned by someone upstream, OR (b) operator self-provisions. Known SOCOM-side friction point. Validate with Nik.

---

## First Pass — Value Flow *(complete 2026-05-29)*

### 16 process blocks

| # | Block (action verb + noun) | Owner |
|---|---|---|
| 1 | SOFMC PM receives mandate | SOFMC PM (Shane T / Chad R) |
| 2 | SOFMC PM translates mandate → PI-committed capability requirement | SOFMC PM |
| 3 | Rise8 Product/Dev team picks up issue from backlog | Rise8 |
| 4 | Rise8 developer writes & commits code | Rise8 dev |
| 5 | Rise8 developer merges PR → triggers signed build | Rise8 dev |
| 6 | Pipeline runs Fortify scan + produces signed `.mil` APK | Rise8 release infra |
| 7 | Rise8 delivers signed build to DTs | Rise8 + DTs |
| 8 | DTs run developmental testing (feedback loop to Rise8) | DTs |
| 9 | DTs submit test report + release recommendation to Config Manager (Jim Bouressa) | DTs → Config Manager |
| 10 | Config Manager reviews → forwards to PMO + Cyber Security | Config Manager |
| 11 | Cyber Security runs ACAS scan | Cyber Security team |
| 12 | JTIC reviews software | JTIC |
| 13 | J8 reviews → grants SwDR approval | J8 |
| 14 | Approved software added to DML | Gov release authority |
| 15 | Unit S6 / operator pulls APK from DML + installs on ATAK Android | Unit S6 *or* Field Operator |
| 16 | Field Operator launches AI GRG on ATAK Android (in DDIL) | Field Operator (Nik C profile) |

**Block count:** 16 (slightly over the 5–15 guideline; acceptable for multi-stakeholder gov current state).

### Supplier shapes on board

- **Upstream SOCOM Authority** factory icon → Block 1 (gray solid arrow)
- **BAH (TAK UI Co-Contractor)** factory icon ↔ Block 4: two dashed arrows representing the contribution loop — Rise8 contributed `Radial Menu` out to BAH; merged version comes back for Rise8 to use in AI GRG
- **Green Beret (Team Lead)** customer factory icon ← Block 16 (purple dashed)

### Rework loop on board

- Curved dashed back-arrow from Block 8 → Block 3 (backlog block)
- Label: `DT-found defects → email spreadsheet → new backlog items`
- Reflects current reality: no shared Jira between Rise8 and DTs during Bridge contract; defects emailed as spreadsheet (see [dt-defect-report-spreadsheet-v5.4-v5.6.csv](../../TAK-ALL/r8-internal/dt-defect-report-spreadsheet-v5.4-v5.6.csv))

### Conditional process blocks on board (3 placed as 🩷 pink assumptions pending Nik)

- **Army Coordination Required** — branches off Block 13 (J8 reviews → grants SwDR approval)
- **Additional Security Assessments** — branches off Block 14 (Approved software added to DML)
- **Additional Approvals Required** — branches off Block 14

All three are Abel's best-guess anchors pending Nik validation. Open questions:
- Confirm anchor blocks above
- Are "Security Assessments" + "Approvals" one branching path with two steps, or two independent conditionals?
- Does Kevan's 80/20 illustration apply for AI GRG, or a different ratio?

---

## Second Pass — Information Flow *(complete 2026-05-29)*

### 6 IT system rectangles placed on board

- `GitLab (Rise8)` — Rise8's self-hosted GitLab; backlog issues board (Block 3)
- `GitLab (TAK Forge)` — TAK Forge gov GitLab; covers code repo + pipeline + Package Registry + Artifactory (Blocks 4, 5, 6, 7)
- `SOFMC/SOCOM Jira` — gov-side Jira; DT tracking + downstream gov reviews (Blocks 8, 9, 10, 12, 13)
- `Tenable (ACAS)` — ACAS scanning implementation (Block 11)
- `DML` — gov-side Definitive Media Library; distinct from TAK Plugin Master List per Abel (Blocks 14, 15)
- `ATAK` — Android runtime where plugin executes (Blocks 15, 16)

### Per-block arrows

| Block | Connection |
|---|---|
| 1 — SOFMC PM receives mandate | No IT system known; 🔴 red sticky |
| 2 — SOFMC PM translates mandate | Email (excluded per facilitator guide); flagged as Fourth Pass kaizen burst candidate |
| 3 — Rise8 picks up from backlog | ↔ `GitLab (Rise8)` |
| 4 — Rise8 dev writes & commits | ↔ `GitLab (TAK Forge)` |
| 5 — Rise8 dev merges PR | ↔ `GitLab (TAK Forge)` |
| 6 — Pipeline runs Fortify + signed APK | ↔ `GitLab (TAK Forge)` with ⚡️ lightning (automated, both ways) |
| 7 — Rise8 delivers to DTs | ← `GitLab (TAK Forge)` (one-way read); email channel excluded; Fourth Pass kaizen burst candidate |
| 8 — DTs run developmental testing | ↔ `SOFMC/SOCOM Jira` |
| 9 — DTs submit report to Config Manager | ↔ `SOFMC/SOCOM Jira` (working assumption) |
| 10 — Config Manager reviews → forwards | ↔ `SOFMC/SOCOM Jira` (working assumption) |
| 11 — Cyber Security runs ACAS | ↔ `Tenable (ACAS)` |
| 12 — JTIC reviews software | ↔ `SOFMC/SOCOM Jira` (working assumption) |
| 13 — J8 reviews → SwDR approval | ↔ `SOFMC/SOCOM Jira` (working assumption) |
| 14 — Approved software → DML | ↔ `DML` |
| 15 — Unit S6/operator pulls + installs | ← `DML` (one-way pull) + → `ATAK` (one-way install) |
| 16 — Field Operator launches AI GRG | ↔ `ATAK` |

### Assumptions and questions on board

- **Block 1** 🔴: *"What IT system (if any) does SOFMC PM use to receive the mandate?"*
- **Block 9** 🩷 + 🔴: DTs submit via same Jira (working hypothesis); confirm actual mechanism + format with Nik
- **Block 10** 🩷 + 🔴: Same Jira extension; confirm whether forwarding to PMO + Cyber Security happens in Jira or separate channel
- **Block 11** 🩷: *"SOCOM's Cyber Security team runs ACAS scans via Tenable (typical DoD implementation: Tenable.sc + Nessus). Specific tooling instance not confirmed — pending Nik validation."*
- **Block 12** 🩷 + 🔴: JTIC operates inside same Jira; confirm JTIC-specific tooling
- **Block 13** 🩷 + 🔴: J8 operates inside same Jira; **also** 🔴 *"What does 'SwDR' stand for in this context?"* (candidates: Software Development Review / Software Design Review / Software Deployment Readiness — pending Nik)
- **Block 14** 🩷 + 🔴: DML is gov-side Definitive Media Library; confirm distinct from TAK Plugin Master List, clarify SOCOM-specific identity/owner/access
- **Block 15** 🔴: *"Who actually pulls the APK and installs — Unit S6 or operator self?"* (the block name's '/' captures the uncertainty)
- **Block 16** 🩷: *"Plugin operates entirely on-device in DDIL — no real-time external dependencies during launch. Required data (map tiles, model weights) is pre-cached."*

---

## Third Pass — Metrics Flow *(next)*

**Method per [facilitator guide](../vsm-facilitator-guide.md):**
- For each of the 16 blocks, estimate **PT (Process Time)**, **LT (Lead Time)**, and **%C&A (Percent Complete & Accurate)**
- Team estimates are fine if no data; flag low-confidence numbers
- Then calculate **Total PT**, **Total LT**, **Activity Ratio** (PT ÷ LT), and **Rolled %C&A**

**Carried items for this pass:**
- PT/LT/%C&A per block with SME input from Nik and Chad
- # People + Queuing per block (deferred from First Pass — collect alongside metrics)

---

## Fourth Pass — Add Visual Aides *(TBD)*

### Candidates queued from prior passes

- ☁️ Kaizen burst: Email-as-handoff between SOFMC PM and Rise8 (Block 2)
- ☁️ Kaizen burst: Email-as-handoff between Rise8 and DTs (Block 7) — Package Registry link sent via email
- ☁️ Kaizen burst: No shared Jira between Rise8 and DTs during Bridge contract — defect spreadsheet emailed as workaround (Block 8)
- 🩷 Pink assumption: provisioning ownership at Block 15 (Unit S6 vs operator self) — carried from Set the Stage Anchor 5
- 🩷 Pink assumption: Initiator variation — sometimes Program Office, sometimes Commander (Set the Stage Anchor 2)
- 🩷 / 🔴 PR-review gate question: should "BAH (Nathan) reviews TAK-UI-touching PRs" be modeled as a discrete step between Block 4 and Block 5?

### Other team-suggested items

- User feedback loop absence (no in-app feedback mechanism) — kaizen burst candidate
- Plugin ownership documentation per block — needs Abel to locate the plugins list

---

## Fifth Pass — Process Block Classification *(TBD)*

## Final Pass — Waste Categories *(TBD)*

---

## Open Questions for Nik (validation queue)

### From First Pass

- Confirm Army Coordination Required conditional anchors at Block 13 (J8 SwDR) — Abel's assumption
- Confirm Security Assessments + Approvals Required conditionals anchor at Block 14 (DML) — Abel's assumption
- Confirm whether Security Assessments + Approvals are one branching path with two steps OR two independent conditionals
- Confirm whether Kevan's 80/20 illustration reflects AI GRG reality or needs a different ratio
- Confirm email-spreadsheet defect handoff pattern (no shared Jira during Bridge contract) is consistent reality

### From Second Pass

- Block 1: What IT system does SOFMC PM use to receive the mandate?
- Block 9: Confirm DTs submit to Jim Bouressa via SOFMC/SOCOM Jira; actual mechanism + format?
- Block 10: Confirm forwarding to PMO + Cyber Security happens in Jira or separate channel
- Block 11: Confirm Cyber Security tooling instance (Tenable working hypothesis)
- Block 12: Confirm JTIC operates inside same Jira
- Block 13: Confirm J8 operates inside same Jira; also: what does "SwDR" stand for?
- Block 14: Confirm DML is distinct from TAK Plugin Master List; clarify SOCOM-specific identity/owner/access
- Block 15: Who actually pulls the APK and installs — Unit S6 or operator self?

### Other open items still active

- Rework loop confirmations: Block 6 Fortify scan failure, Block 11 ACAS scan failure, review-rejection at Block 12/13
- Plugin owners list — Abel to locate
- Mission profile for orienting scenario — Nik picks the most recent real fielding instance

---

## Parking lot (out of scope for this map)

- Funding decisions, readiness assessments, and prioritization waste *upstream* of the SOFMC PM — real waste, but invisible from this cut. Candidate for a follow-on map.
- Hardware delivery flow — entirely different flow. Future VSM.
- Aviation Planner (SOAR/NIX) — likely treated as external supplier handoff, not in-flow role. Confirm with team.
- Connected (non-DDIL) variation — captured as branch annotation, not mapped this round.
- Strategic plugin architecture connection — target-state contrast, not current-state
- Future target state parallel development — follow-on skill arc
- Figma project reorganization to SOFTAK — project hygiene; already an action item

---

## Hand-Off TLDR (paste-ready for fresh session resume)

```
I'm resuming a VSM workshop using the vsm-facilitator-v1 skill.
Read the state file at: Mission-OS/sessions/vsm-socom-tak-delivery-20260528.md

Status:
- Pre-Mapping Alignment: complete (tool choice + picked value stream)
- Set the Stage: 5 anchors locked
- First Pass (Value Flow): 16 process blocks + supplier shapes + DT rework
  loop + 3 conditional process blocks
- Second Pass (Information Flow): 6 IT system rectangles + per-block arrows
  + pink/red stickies

Next: Third Pass — Metrics Flow.

Method (from Mission-OS/vsm-facilitator-guide.md):
- Estimate PT (Process Time), LT (Lead Time), %C&A (Percent Complete &
  Accurate) for each of the 16 blocks
- Team estimates are fine if no data; flag low-confidence numbers
- Calculate Total PT, Total LT, Activity Ratio (PT ÷ LT), Rolled %C&A

Carried items for this pass:
- PT/LT/%C&A per block with SME input from Nik and Chad
- # People + Queuing per block (deferred from First Pass — collect alongside
  metrics)

Collaboration rules I want maintained (already in memory):
- One collaboration window per message — close current topic fully before
  opening next
- Stay in the current pass's deliverable; don't drift into another pass's
  tools
- Use the facilitator guide's pass names (First/Second/Third/Fourth/Fifth/
  Final Pass), not "Pass N" numbering
- No internal taxonomy I didn't author
- Inventories go in the state file, not inline in chat — give me a 1-3 line
  summary in response
- When uncertain, model the best working hypothesis; silently log validation

Pace: block by block. Slow down, sketch, confirm before moving on.

Start of next session: gently orient me to the state file before diving in.
```
