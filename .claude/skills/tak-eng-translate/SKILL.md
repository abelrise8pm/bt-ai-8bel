---
name: tak-eng-translate
description: Decipher an engineer's technical message (Slack, email, doc, handoff) into PM-level, source-anchored, provenance-tagged items the PM can defend and bring back to the engineering team. Use when translating heavy engineering detail into PM language, turning an engineer's shareout into candidate chores/considerations/questions, or preparing to collaborate with engineers on scope. Runs BEFORE tak-issuedrafting.
argument-hint: "[paste the engineer's message, or point to the file + line range to translate]"
disable-model-invocation: true
---

# TAK: Translate an Engineer's Message into PM-Level Items

This skill helps Abel (PM, Rise 8 — not an engineer, may be new to the system) **decipher an engineer's technical message into a PM-level lens** so he can steer the work toward the team's goals, outcomes, and target conditions — and away from the anti-goals.

The PM does **not** need to fully grasp the engineering. The PM needs the **PM-level relevant factors** — anchored in the engineer's actual words — so he can collaborate with engineers and keep the work pointed at the right outcomes.

The output is a set of items the PM can **defend by pointing at the source**: when an engineer asks *"where did you read that?"*, the PM points at the engineer's actual words, in context, and it holds up. The PM walks in with **defensible questions**, not a task list the assistant invented.

---

## When to Use This Skill

Use this skill when Abel has:
- A technical message from an engineer (Slack shareout, email, design doc, handoff notes), and
- A need to turn it into PM-level items — candidate chores, considerations, or questions — to discuss with the engineering team.

Do **not** use this to invent work, prescribe how/what to build, or pretend to grasp the engineering. The skill's job is translation and classification, not engineering judgment.

This is **upstream of `tak-issuedrafting`** (shape the confirmed items into artifacts) and **distinct from `tak-issue-triage`** (broader problem identification, not engineer-comms-specific).

---

## Ground Truth

- **The source engineer's own words are the only ground truth.** Other people's inferences or summaries about that engineer's work are NOT source.
- Quote the source with line references so every item is traceable.
- Anything the assistant concludes that the engineer did not state is an **inference** — flag it 🟨 and never present it as the engineer's words.

---

## Skill Workflow

This skill runs in two rounds. **Ask one question at a time. Confirm each item before moving to the next.**

### Round 1 — Anchor & Align

**First, load the source.** Confirm with Abel the exact message and line range to translate.

**Then, load the goals frame.** Every item is judged against the project's stated goals, anti-goals, and target outcomes. Load and cite them at the start. They currently live in:
- `TAK-ALL/r8-internal/Daily-TAK-notes/gap-period/` — the daily note's **Goals & Anti-Goals** header (top of the active week's file)
- 🟨 *and wherever the canonical target-outcomes / assumption-tracker file lives — confirm the path with Abel.*

Supporting evidence sources (for context only — not a substitute for the engineer's words):
- `TAK-ALL/tak-demos/` — sprint demo content
- `TAK-ALL/r8-internal/Daily-TAK-notes/tak-drumbeats-bridge/` — weekly drumbeats
- `TAK-ALL/tak-oor.md` — ongoing operations review

**Confirm scope before drafting.** State the source span and the goals file you are anchoring to. Get Abel's confirmation.

### Round 2 — Classify & Draft (one item at a time)

For each topic in the engineer's message, produce one item card (format below), then **stop and let Abel confirm** before the next. Do not batch.

**The core move — classify every item by where it came from:**

| Provenance | Definition | Becomes |
|---|---|---|
| **Engineer-stated** | The engineer explicitly said to do it / it should be X | A candidate **Chore** |
| **Engineer-listed (future/optional)** | Named as a future or "optional" item, but no one assigned and no spec given | A **Consideration** |
| **Inference** | Connecting dots the engineer did not connect | A **Question for the team** (🟨), never a chore |

→ **The hard line: never label something a "chore" unless the engineer stated it as an ask. Listing ≠ assigning.**

---

## Item Card Format

```
Item: [short title — the engineer's topic, in plain words; not a coined name]

Source: [complete, coherent quoted passage + line refs — never an orphan line]
Bridge: [why it means what it means, in plain language]
Read: [PM-level takeaway — restates ONLY what the quoted lines support]

Provenance: [Engineer-stated | Engineer-listed (future/optional) | Inference 🟨]
Type: [Chore | Consideration | Question for the team]   (set by Provenance)

Alignment: [serves which goal/outcome, OR risks which anti-goal — cited to the goals file]

Open / confirm with the engineer: [🟨 anything inferred, unscoped, or needing engineering judgment]
```

When a claim needs two separate passages to hold up, cite both under **Source**.

---

## Strict Rules

1. **Anchor every claim in the source.** Quote complete, coherent passages — never an orphan line lifted from a paragraph. Show **Source → Bridge → Read**. If a claim can't be traced, drop it or mark it 🟨 *"my leap, confirm with the engineer."*
2. **Ground truth = the source engineer only.** Other people's inferences about their work are not source.
3. **No editorializing inside their words.** The Read is the assistant's read, tagged as such, and restates only what the quoted lines actually say. Never inject interpretation into the middle of a quote.
4. **No invented terms.** Every term is tagged as one of three: the engineer's words / a standard engineering term / the assistant's read (a plain sentence, never coined into a new label). No hybrid nouns. **Analogies are off by default** — offer one separately and labeled only if it genuinely helps, and it never replaces the real term.
5. **Grounded source terms aren't "framing."** Terms from an evaluation framework (e.g. GOTS evaluation, MOSA / Modular Open Systems Approach) trace to that framework — treat them as anchored, not casual wording.
6. **Name the pair-with-the-engineer spots.** When connecting the dots requires engineering judgment the PM shouldn't fake, say so explicitly and hand it back as a Question for the team.
7. **Listing ≠ assigning.** Never call something a chore unless the engineer stated it as an ask.

---

## Anti-Patterns

| Anti-Pattern | Why It Fails | Fix |
|---|---|---|
| Orphan line + confident gloss | Reads as the engineer's words; collapses when the PM traces it in front of engineers | Quote the whole passage; show Source → Bridge → Read |
| Coined hybrid term (e.g. "the action parser") | New vocabulary the PM has to decode | Tag each term: engineer's words / standard term / my read |
| Calling a listed item a "chore" | Listing ≠ assigning; the engineer named it, didn't assign it | Provenance class decides the label |
| Connecting two unlinked passages into a task | Needs engineering judgment the PM shouldn't fake | Hand back as a Question for the team |
| Editorializing inside a quote (e.g. "the demo's 'AI' command") | Blurs the engineer's words with the assistant's framing | Keep the Read separate and tagged; quote verbatim |
| Analogy in place of the real term ("the guts," "a translator") | Friendly label the PM must map back to reality | Use the real term + a plain definition |
| Dropping the alignment line | Item floats free of goals/anti-goals | Every item cites which goal/outcome it serves or anti-goal it risks |

---

## TAK Context

**The PM:** Abel — Product Manager, Rise 8. Not an engineer; translating to collaborate, not to prescribe.
**The sources:** any engineer on the team (Kevan and others) — technical Slack shareouts, emails, design docs, handoffs. The skill names no single engineer; the source is whoever wrote the message being translated.
**The audience:** the engineering teammates the PM works with — the skill does not hardcode a fixed set of names.
**The goal frame:** the active week's Goals & Anti-Goals, plus the canonical target-outcomes / assumption tracker (🟨 confirm path).

---

## Related Skills

- **tak-issuedrafting** — Run AFTER this. Shape the confirmed Chores (and validated Considerations) into well-formed agile artifacts.
- **tak-issue-triage** — Broader problem identification across all inputs (not engineer-comms-specific). Use that to find problems to solve; use this to translate an engineer's message.
- **tak-outcomes** — Name the Mission/Enabling Outcomes an item serves; the Alignment line should trace to a named outcome.
- **tak-hypothesis** — When an item is really an open feasibility question, it may become a testable hypothesis.
