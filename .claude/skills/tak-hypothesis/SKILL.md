---
name: tak-hypothesis
description: TAK Bridge Lean UX hypothesis drafting. Use when you have a problem framing and draft outcomes and want to build a testable hypothesis statement for a thin-slice experiment. Comes after tak-outcomes. Use when drafting experiments, validating assumptions, or framing what success looks like for a sprint or initiative.
argument-hint: "[optional: paste problem framing, HMW statement, outcome drafts, or raw team discussion notes]"
disable-model-invocation: true
---

# TAK Bridge: Lean UX Hypothesis Drafting

This skill helps Abel draft a well-formed Lean UX hypothesis statement for the TAK Bridge contract. It works best after problem framing and outcome identification are in place. If outcomes are not yet named, run `tak-outcomes` first.

A hypothesis is a structured, testable bet: a thin-slice solution proposed for a specific user group, tied to a specific problem, with a defined expected behavior change and measurable success criteria.

---

## When to Use This Skill

Use this skill when you have:
- A problem or pain point identified (Seiden problem framing or equivalent)
- A user group or persona who experiences that pain
- A proposed thin-slice solution to test (small enough to generate learning within 2-3 weeks)
- Draft outcomes or a HMW statement to anchor the expected behavior change

If any of these are missing, Round 1 will surface the gaps.

---

## Skill Workflow

This skill runs in two rounds.

### Round 1 — Evidence Gathering

**First:** Work with what Abel provides. This may be:
- Pasted team discussion notes, HMW statements, or problem framing
- A rough hypothesis draft that needs shaping
- A specific file or doc to scan and synthesize

**Then:** If evidence is thin, cross-reference these TAK-specific sources for supporting context:
- `TAK-ALL/tak-demos/` — sprint demo content showing what was built and observed
- `TAK-ALL/r8-internal/Daily-TAK-notes/tak-drumbeats-bridge/` — weekly drumbeats with team and customer signals
- `TAK-ALL/tak-oor.md` — ongoing operations review with active blockers and priorities

**Identify which inputs are missing:**

| Input | Missing if... |
|---|---|
| Thin-slice solution | "We believe" is blank, vague, or describes a full feature |
| User persona | No specific user group named |
| Pain point | The problem is generic or unlabeled |
| Expected behavior change | "Resulting in" is an attitude or sentiment, not an action |
| Success metric | No observable, bounded signal identified |

Ask one question at a time to fill gaps. Do not ask multiple questions at once.

**Before moving to Round 2, run two soft checks:**

1. **Riskiest assumption check:** Ask — "Have you confirmed this is the riskiest assumption you're betting on, via a 2x2 or similar prioritization?" Note the answer and move on. This is not a gate.

2. **Learning window check:** If the thin slice looks too large to produce learning signals within 2-3 weeks, flag it: "This scope may be too large to generate useful data within your typical learning window. Want to reduce the slice before drafting?" The PM decides. Military and classified domain constraints may justify extending the window beyond 3 weeks.

---

### Round 2 — Drafting

Once inputs are sufficient, draft the hypothesis using the format below.

If Abel has not provided leading and lagging indicators, ask:
- "What is the leading indicator — the early signal that shows the needle is moving?"
- "What is the lagging indicator — the confirmation that the behavior change has held?"

Both are preferred. Neither is required if the PM has reasons to proceed with one. Do not block on this.

---

## Hypothesis Format

```
**We believe** [thin-slice solution — what we are testing; small enough to generate learning within 2-3 weeks]

**For** [specific user group or persona]

**will address** [the specific pain point, bottleneck, or problem area]

**resulting in** [the expected, observable change in behavior — stated as if achieved]

**We will know we are successful when**

Lagging Indicator:
KR-1: [Who] [does what] [by how much or by when]

Leading Indicator:
KR-2: [Who] [does what] [by how much or by when]
```

---

## Key Result Template

Each success indicator follows the Key Result format:

**`[Who] [does what] [by how much]`**

- **Who:** The specific person or group whose behavior changes
- **Does what:** The observable action — measurable, not attitudinal
- **By how much:** The qualitative or quantitative signal — a threshold, a count, a frequency, or a timeframe

Example from practice:

> KR-1: Prospect stakeholders define the "War-fighter End-State" as the primary success criteria by the end of the Value Stream Mapping workshop.

Lagging indicator — confirmed at the close of the experiment.

> KR-2: The Decision Maker signs the summary artifact (which explicitly lists outcome-based requirements) within 5 business days of the workshop.

Leading indicator — observable early enough to adjust the experiment.

---

## TAK Context

**End users:** SOCOM operators, GRG Creators
**Customer proxies:** Nik (Program Office), Jonathan Miller (field), Chad Molyet (SOCOM DT), Nathan and Kelly (BAH)
**Domain note:** Military and classified environments may have access, timeline, and data collection constraints. The 2-3 week learning window is a default, not a rule. Flag when scope seems large, but defer to the PM's judgment on what is feasible.
**Relevant evidence sources:** tak-demos, tak-drumbeats-bridge, tak-oor.md

---

## Multiple Hypotheses

If more than one thin slice is on the table, the skill can draft multiple hypotheses in one session. This is optional and PM-driven. Each hypothesis gets its own complete block. Do not merge two thin slices into one hypothesis — each is a separate bet.

---

## Strict Rules

- **No intensifiers.** Never use words like "extremely," "highly," "significantly," or "dramatically." If it is true, state it plainly.
- **No word fillers or jargon-jamming.** Do not pack methodology terms or acronyms into the draft. The hypothesis should be readable by a stakeholder with no Lean UX background.
- **Behavioral language only.** "Resulting in" must describe what a person does differently — not what they feel, think, or appreciate. If the subject of the resulting-in clause is a tool, system, or abstract concept, rewrite it with a human actor.
- **Bounded metrics.** Each KR must be observable within a defined window or threshold. Open-ended metrics are not metrics.
- **One problem per hypothesis.** If two pain points are bundled into one hypothesis, flag it and split.
- **No editorializing.** Do not inject emphasis or framing that belongs to the PM. Draft what is supported by the evidence — nothing more.

---

## Anti-Patterns

| Anti-Pattern | Why It Fails | Fix |
|---|---|---|
| "We believe the new dashboard will improve operator experience" | Not testable; "experience" is not behavioral | Name what the operator will do differently |
| "Resulting in operators who feel more confident" | Sentiment, not behavior | Name what operators do when confident — run detection without re-checking, skip manual fallback, etc. |
| Thin slice that spans a full quarter | Cannot generate learning in the experiment window | Cut scope to what can be observed in 2-3 weeks |
| KR with no bound — "adoption increases" | No way to confirm success | Add who, does what, by how much |
| Two distinct user groups in one hypothesis | Blurs the experiment | One hypothesis per user group |
| "Resulting in" with "the tool" as subject | Outputs, not outcomes | The actor must be a person |

---

## Related Skills

- **tak-outcomes** — Run this first to identify and name Mission Outcomes and Enabling Outcomes. The "resulting in" and success metrics in the hypothesis should trace back to a named outcome.
- **tak-issuedrafting** — The proposed thin-slice solution ("We believe X") may be comprised of multiple user stories or spikes. Use tak-issuedrafting to shape those backlog items after the hypothesis is confirmed.

----
