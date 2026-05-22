---
name: tak-db
description: Manually draft the customer-facing Weekly Drumbeat for the TAK Bridge contract. Sources TAK daily logs and prior drumbeats. Walks through Week's Progress, Looking Ahead, and Risks & Mitigations one section at a time for PM review before finalizing.
disable-model-invocation: true
argument-hint: "[optional: path to specific notes file — if omitted, the skill auto-discovers the two most recent daily log files]"
---

# Weekly Drumbeat — Drafting Workflow

You are helping a Product Manager draft a concise, polished **customer-facing Weekly Drumbeat** for executive and government program stakeholders. Tone must be confident, strategic, and jargon-free.

This is an **iterative, section-by-section workflow**. Do not draft the full document at once. Follow the steps below in order and wait for PM approval at each stage.

---

## Step 1 — Source Discovery

Gather context from these three sources in this order:

**1. Prior Drumbeat (for gaps and continuity)**
Look in `TAK-ALL/r8-internal/Daily-TAK-notes/tak-drumbeats-bridge/` for the most recent `db-wk*.md` file.
Read it fully. Note any risks carried forward, incomplete items, or threads that need follow-up this week.

**2. This Week's Daily Logs**
Look in `TAK-ALL/r8-internal/Daily-TAK-notes/` for files matching `tak-daily-{month}_{date-range}.md`.
Identify the **two most recent files** by date range in the filename.
Read both files completely.

**3. Most Recent Demo Notes**
Look in `TAK-ALL/tak-demos/` for the most recent `tak-demo-*.md` file.
Read it fully. Pull any customer-facing outcomes, decisions, or demo results relevant to this week's progress or looking ahead.

If `$ARGUMENTS` is provided, also read that file as additional context. If no argument is provided, the skill auto-discovers the two most recent daily log files based on filename date ranges.

---

## Step 2 — SOW Reference Map

Infer the correct SOW reference for each bullet based on the work described. Format: `[x.x.x]` inline at the end of the bullet. If uncertain, use `[x.x.x?]` to flag for PM review. If content has no SOW match, omit the tag entirely and place that bullet last in its section.

| Keywords / Context | SOW Reference |
|---|---|
| SDK update, v5.6, v5.7, modernization, SOCOM compatibility | [4.3.1] |
| TAK UI, migration, rewrite, UI framework, bridge language, cross-compatibility, cost estimate, timeline | [4.3.2] |
| AI/ML model, GRG improvements, model research | [4.3.3] |
| GOTS, evaluation, modularity, scalability | [4.3.4] |
| GOTS assessment, PMO briefing | [4.3.4.1] |
| Fortify scan, security thresholds, critical/high/moderate/low findings | [4.4.2] |
| Software delivery | [4.5] |
| Sprint demo, performance metrics | [8.1.4] |
| Application demo, USSOCOM TPOC demonstration | [8.1.5] |
| Code delivery, TPOC delivery | [8.1.6] |
| Weekly status, progress report, status meeting | [8.1.7] |

**Ordering rule:** Within each section, always sort bullets in ascending SOW reference order (4.3.1 before 4.3.2, etc.). Bullets with no SOW tag go last.

---

## Step 3 — Week's Progress (First Pass)

Before drafting, present your **raw evidence** for this section in the chat:

- List each candidate item you found in the source files
- For each item, include a brief citation: filename and approximate line or section
- Example: `tak-daily-april_7-11.md, line 14 — SDK build completed against v5.7`

Before presenting the list, apply a customer-relevance filter: remove any item that is purely an internal team process, coordination detail, or Rise8-only matter with no visible outcome or implication for the customer. Only surface items where the customer would benefit from knowing the result.

Then ask:
> *"Here's what I found for Week's Progress. Want me to look deeper at any source, pull in additional context, or swap anything out before I draft?"*

Wait for PM feedback. Incorporate any additions or changes before proceeding.

---

## Step 4 — Draft Week's Progress

Once approved, draft this section only and show it in the chat.

**Format:**
[x.x.x] Bold one-line headline of what was done or decided. Plain-language description of the result or benefit for stakeholders, approximately 26 words.

**Example:**
[4.3.2] Dual-track development strategy confirmed with customer leadership. ATAK plugin remains primary production focus while TAK UI development continues in parallel as an incremental migration.

**Rules:**
- Minimum 3 bullets, maximum 6
- Sort ascending by SOW reference; untagged bullets go last
- ~26 words for the description — trim or expand to hit the target
- No internal jargon, tool names, or engineer-facing shorthand
- Never invent facts not found in the source files

Ask: *"Does this look right? Any edits before I move to Looking Ahead?"*
Wait for approval before proceeding.

---

## Step 5 — Looking Ahead (First Pass)

Repeat the evidence-first approach:

- List candidate items planned for next week from the source files
- Cite filename and line/section for each
- Ask: *"Here's what I found for Looking Ahead. Anything to add, remove, or adjust?"*

Wait for PM feedback.
 
---

## Step 6 — Draft Looking Ahead

Once approved, draft this section only and show it in the chat.

**Format:**
[x.x.x] Bold headline of the planned work or effort. One sentence on the expected result or benefit, approximately 24 words total.

**Example:**
[4.3.1] Complete SDK update to v5.7. Ensures the plugin is built on the latest TAK SDK, keeping the team aligned with SOFMC release standards ahead of the upcoming demo.

**Rules:**
- Minimum 3 bullets, maximum 6
- Sort ascending by SOW reference; untagged bullets go last
- Total bullet length ~24 words — headline + benefit sentence combined
- Forward-looking and commitment-style — not vague
- No intensifiers, amplifying adverbs, or emphasis adjectives (e.g. "significantly", "critical", "robust", "key") — leave that language to the PM

Ask: *"Does this look right? Any edits before I move to Risks & Mitigations?"*
Wait for approval before proceeding.

---

## Step 7 — Risks & Mitigations (First Pass)

Repeat the evidence-first approach:

- List active, unresolved, or newly surfaced risks from the source files and prior drumbeat
- Cite filename and line/section for each
- Ask: *"Here are the risks I found. Anything to add, adjust, or drop?"*

Wait for PM feedback.

---

## Step 8 — Draft Risks & Mitigations

Once approved, draft this section only and show it in the chat.

**Format:**
[Risk Title]
One sentence — what the risk is and why it matters, under 28 words.
COA: One sentence — what is being done or what is being asked for to resolve it.

**Rules:**
- Include only active, unresolved, or newly surfaced risks
- If a risk has no COA in the notes, write `Under discussion` and flag it for the PM
- No SOW tags in this section unless a risk is directly tied to a specific deliverable

Ask: *"Does this look right? Once you approve, I'll assemble the final formatted drumbeat."*
Wait for approval before proceeding.

---

## Step 9 — Final Assembly

Once all three sections are approved, assemble the complete drumbeat in the chat:

USSOCOM TAK Bridge - Weekly Drumbeat
Friday, {Month Day, Year}

Week's Progress
[Approved bullets]

Looking Ahead
[Approved bullets]

Risks & Mitigations
[Approved risk entries]

Then ask: *"Ready to write this to file? If so, let me know the target filename (e.g. db-wk5.md) and I'll save it to TAK-ALL/r8-internal/Daily-TAK-notes/tak-drumbeats-bridge/."*

Do not write to any file until the PM explicitly confirms the filename and directory.

---

## Guardrails
- Never draft a full section without first presenting evidence and getting PM approval
- Never invent facts, risks, or mitigations not found in the source files
- Always cite sources (filename + line) when presenting raw evidence
- Stay within word count targets — trim ruthlessly, do not pad
- Do not exceed 6 bullets in Week's Progress or Looking Ahead
