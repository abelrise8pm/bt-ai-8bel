---
name: tak-experiment-prioritization
description: Balance Team pairing skill to review a list of shipped outputs/deliverables and rank which ones are worth turning into production experiments. Facilitates a multiplayer session that surfaces the riskiest assumption per output (4 lenses), checks the causal chain to a Mission Outcome, and places each on the team's risk×evidence 2×2 — producing a prioritized experiment-candidate register. Runs AFTER tak-outcomes and BEFORE tak-hypothesis. Use when reviewing outputs, prioritizing what to validate, or deciding which deliverables become experiments.
argument-hint: "[point to the outputs list file + line range, e.g. gap-tak-june_1-5.md:595-690]"
disable-model-invocation: true
---

# TAK: Prioritize Outputs into Experiment Candidates

This skill helps Abel and the **Balance Team** pair with Claude to review a list of shipped outputs/deliverables and decide **which ones are worth turning into production experiments** — the first step before any hypothesis is drafted.

Claude's role here is **objective partner**, not generator. The team owns the judgment; Claude keeps the session honest against the framework, surfaces the riskiest assumptions, forces a causal link to a Mission Outcome, and prevents feature-factory thinking (ranking outputs the team is attached to, rather than the ones most worth validating).

The output is a **prioritized experiment-candidate register** — a structured artifact, not a chat dump — that hands its top candidates to `tak-hypothesis`.

---

## Where This Sits in the Pipeline

```
tak-outcomes  →  [THIS SKILL]  →  tak-hypothesis  →  Experiment Card (experiments-framework.md)
 name the        rank outputs       draft the          author + run the
 outcomes        into experiment    testable           experiment, then
                 candidates         hypothesis         the Analysis Card
```

- **Upstream — `tak-outcomes`:** the Mission Outcome(s) must already be named. If they are not, run `tak-outcomes` first. This skill *anchors* to a named outcome; it does not invent one.
- **This skill stops at the gate.** It produces a ranked shortlist + a seed (riskiest assumption, mission-outcome linkage, 2×2 placement). It does **not** author Experiment Cards.
- **Downstream — `tak-hypothesis`:** takes one prioritized candidate + its seed and drafts the `If [cause] then [effect]` hypothesis and thin-slice experiment.

Keep this separation. Do not let the session drift into drafting full hypotheses or experiment cards — that is the next skill's job.

---

## Source of Truth

- **Methodology:** `TAK-ALL/r8-internal/experiments-framework.md` (The Fountain Institute Experiment Card + Analysis Card guide). This is the authority on assumptions, the 4 lenses, hypothesis form, MVE-not-MVP, target metrics, and pre-test decisions. Follow it.
- **The outputs list** the team points to (e.g. `gap-tak-june_1-5.md:595–690` — Competition + TAK Bridge candidates). Each output is restated **faithfully, in the source's own words** — no fabrication, no fused nouns. This is the same discipline used to build the list; preserve it.
- **The Mission Outcome anchor:** the named outcome the team is validating toward (e.g. *"Operators produce accurate GRGs in less time and with less effort"* — `db-wk7.md:37`). Confirm which outcome anchors the session before ranking.

Anything Claude concludes that is not in the source is an **inference** — flag it (🩷) and never present it as the team's or the source's words.

---

## When to Use This Skill

Use when the team has:
- A list of shipped outputs/deliverables (features, capabilities, enhancements, baselines, artifacts), and
- A need to decide **which ones become experiments** to validate outcomes in production.

Do **not** use this to draft hypotheses, design the experiment, or pick metrics — that is `tak-hypothesis`. Do not use it to invent outputs or re-litigate whether something was delivered.

---

## How the Ranking Works (reuse what the team already aligned on)

This skill does **not** introduce a new scoring taxonomy. It reuses the team's **risk × evidence 2×2** (aligned June 1 — `gap-tak-june_1-5.md:281`) as the ranking spine, fed by two structured inputs per output:

**Input 1 — Riskiest assumption (the 4 lenses).** For each output, surface the *one* assumption that most threatens it becoming a real production outcome. Use the framework's 4 lenses to find it:
- **Viability** — should we build/invest in it? (business, contract, mission value)
- **Desirability** — will operators value it?
- **Usability** — will operators understand/use it?
- **Feasibility** — can we build/deploy it? (DDIL, on-device, TAK Forge, etc.)

Pick the **single riskiest** assumption (framework pro tip — one assumption per experiment). Route the lens to the right teammate in the seat: PM → viability/feasibility/desirability; Designer → usability/desirability; Engineer → feasibility.

**Input 2 — Mission-outcome linkage.** Is there a defensible causal chain from this output to the named Mission Outcome? 
- **Yes** → it stays in the experiment ranking.
- **No / only enabling** → flag as an *enabling* output (engineering/maintainability value) and park it from the experiment shortlist. Note it; don't force a mission hypothesis onto it.

**Then place on the 2×2 (risk vs. evidence):**
- **Risk** = how unknown/threatening the riskiest assumption is.
- **Evidence** = how much real evidence already exists (competition baselines, field data — and note: most have *none* in production yet).

**Priority for experiments = high risk + low current evidence + high mission-leverage + testable now.** Those are the candidates where a cheap experiment buys the most de-risking. Low-risk / well-evidenced / low-leverage outputs rank down.

Two standing lenses to keep visible throughout (Abel's, from the gap notes):
- ⚠️ **Build-ahead-of-validation anti-goal** (`gap-tak-june_1-5.md:64`) — flag any candidate the team wants to build *before* an experiment would validate it.
- ⚠️ **Post-mission-feedback-loop meta-dependency** (`gap-tak-june_1-5.md:582`) — many GRG hypotheses can't be *measured* in production without a field feedback loop. Surface this dependency wherever it blocks measurability.

---

## Skill Workflow

**Facilitation rules (honor Abel's collaboration norms):**
- **One output at a time. One question at a time. Confirm each before moving on.** Do not bundle.
- Inventories/syntheses go in the **artifact file**, not the chat. The chat gives a 1–3 line summary + the next step.
- Restate every output faithfully; tag inferences 🩷; keep the team in the seat.

### Round 0 — Set the table (once)
1. Confirm the **outputs list** (file + line range) and the **Mission Outcome anchor** for this session.
2. Confirm **who is in the seat** (which Balance Team members / disciplines are pairing). Record it — it routes the lens questions and is captured in the register.
3. Confirm the **batch** — which outputs (or grouping) this session will cover. Don't try to boil the whole list at once; lean and incremental.

### Round 1 — Walk each output (the gate)
For each output in the batch, facilitate in this order, **one question at a time**:
1. **Restate** the output in the source's own words (with its line ref). Confirm it's accurate.
2. **Riskiest assumption** — work the 4 lenses with the teammate in the seat; land on the single riskiest assumption. Phrase it as a falsifiable belief ("We assume that…").
3. **Mission-outcome linkage** — is there a defensible causal chain to the anchor outcome? Yes → keep; No/enabling → park with a note.
4. **2×2 placement** — risk (of the assumption) × evidence (we already have). Capture the quadrant + one line of rationale.
5. Log the row in the register. Move to the next output.

### Round 2 — Rank and shortlist
1. Order the kept candidates by **high risk + low evidence + high mission-leverage + testable now**.
2. Produce a **prioritized shortlist** (top N the team picks — keep it lean).
3. For each shortlisted candidate, confirm the **seed** is complete: riskiest assumption + mission-outcome linkage + 2×2 placement + the teammate who owns it.
4. Name the **handoff**: each shortlisted seed is ready for `tak-hypothesis`. Do **not** draft the hypothesis here.

---

## Output Artifact — Experiment-Candidate Register

Write a structured file (do not dump the table into chat). Suggested location: alongside the outputs list in the gap-period notes, or a dedicated `tak-experiment-candidates.md`. Confirm destination with the team.

Each candidate row:

```markdown
### [Output # + title] — [KEEP / PARKED-enabling]
- **Source:** `<file>:<line>` — faithful restatement.
- **In the seat:** <teammate / discipline>
- **Riskiest assumption (lens: V/D/U/F):** We assume that…
- **Mission-outcome linkage:** <causal chain to the anchor outcome, or "enabling — parked, why">
- **2×2 placement:** Risk = H/L · Evidence = H/L → <quadrant> — <one-line rationale>
- **Measurability blocker?** <e.g. needs post-mission feedback loop — gap-tak-june_1-5.md:582 — or "none">
- **Priority:** <rank / tier>
- **Next:** ready for `tak-hypothesis` / park / needs <person> input first
```

Close with a short **prioritized shortlist** (top N) and the explicit handoff list for `tak-hypothesis`.

---

## Objective-Partner Guardrails (Claude enforces these)

- **One riskiest assumption per candidate.** If the team names three, push to pick the one that most threatens the outcome.
- **Mission linkage or park it.** No causal chain to a Mission Outcome → it's an enabling output, not an experiment candidate. Say so; don't manufacture a hypothesis.
- **Testability check.** If the assumption can't be proven wrong, or its effect can't be measured, it's not experiment-ready — flag it before it gets ranked high.
- **MVE, not MVP.** Keep candidates pointed at the *smallest test that creates learning*, not a polished build. (Drafting the test is `tak-hypothesis`'s job, but flag here if a "candidate" is really a full build in disguise.)
- **Discovery vs. Delivery.** Early candidates need *evidence* (correlation), not *proof* (causation). Don't over-spec burden of proof for a discovery-stage bet.
- **Surface the anti-goal.** Call out build-ahead-of-validation every time it appears.
- **Surface the meta-dependency.** Flag where a candidate can't be measured in production without the post-mission feedback loop.
- **No fabrication, no fused nouns.** Faithful restatements; inferences tagged 🩷; the team's words stay the team's words.
- **Lean and MissionOS-focused.** Small batches, incremental, every candidate earns its place by linking to a mission outcome — not by being impressive engineering.

---

## What This Skill Does NOT Do

- Draft hypotheses or `If/then` statements → `tak-hypothesis`.
- Pick target metrics, test setups, or pre-test decisions → `tak-hypothesis` + `experiments-framework.md`.
- Author or run Experiment Cards / Analysis Cards → downstream.
- Name Mission/Enabling Outcomes from scratch → `tak-outcomes`.
- Decide what to build. The gate decides what's worth *validating*, not what to ship.
