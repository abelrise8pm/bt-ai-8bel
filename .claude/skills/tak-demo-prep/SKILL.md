---
name: tak-demo-prep
description: Prepare slide content and talking track cues for the bi-weekly TAK Demo and Product Update presentation. Sources drumbeats and daily notes to produce stakeholder-level slide content and spoken cues across all sections: Sprint Accomplishments, Demo, Sprint WIP and Planned Work, PI Planning, Issue Resolution, and Cheat Sheet Q&A.
argument-hint: "[optional: paste additional context, specific talking points, or directional guidance for this demo]"
---

# TAK Demo and Product Update — Prep Workflow

A bi-weekly spoken presentation to SOCOM and program stakeholders. This is not a drumbeat — it is a live presentation. Content must be stakeholder-level, outcome-oriented, and free of engineering detail. Abel owns his speaking voice; this skill produces the structured content and talking track cues he speaks from.

This is a section-by-section workflow. Never draft ahead without PM approval.

---

## Step 1 — Source Discovery

Gather context from these sources in this order:

**1. Two most recent drumbeats**
Look in `TAK-ALL/r8-internal/Daily-TAK-notes/tak-drumbeats-bridge/` for the two most recent `db-wk*.md` files. Read both fully. Note Sprint accomplishments, risks carried forward, and any open asks.

**2. Relevant daily notes**
Look in `TAK-ALL/r8-internal/Daily-TAK-notes/` for `tak-daily-{month}_{date-range}.md` files covering the sprint period. Read all relevant files.

**3. Abel's context**
If `$ARGUMENTS` is provided, treat it as directional guidance and incorporate it throughout. If no argument is provided, ask Abel before drafting:
> "Here's what I found across your drumbeats and daily notes. Anything specific you want emphasized, added, or left out before I start drafting?"

Wait for Abel's response before proceeding.

---

## Step 2 — Sprint Accomplishments Table + Talking Track

Draft the Sprint Accomplishments table. Each row represents a distinct work item completed during the sprint.

**Table format:**

| Week | SOW Section | Task / WorkStream | Deliverables |
|---|---|---|---|
| Week 1 or 2 | [4.3.x] + label | Succinct title of the work | Concise stakeholder-level summary of what was done and what it means |

**Rules:**
- Week column: identify whether the work happened in Week 1 or Week 2 of the sprint
- SOW Section: use the reference map below — always tag with `[4.3.x]` and the section label
- Task / WorkStream: one line, action-oriented, no jargon
- Deliverables: what was produced and why it matters to the stakeholder — no implementation detail, no internal shorthand
- Minimum 3 rows, maximum 6
- Sort rows by SOW reference ascending; untagged rows go last
- Source every row — do not invent items not found in the source files

**SOW Reference Map:**

| Keywords / Context | SOW Reference |
|---|---|
| SDK update, v5.6, v5.7, modernization, SOCOM compatibility | [4.3.1] SDK Updates |
| TAK UI, migration, rewrite, UI framework, BAH collaboration | [4.3.2] TAK UI Migration |
| AI/ML model, GRG improvements, detection, model research | [4.3.3] AI/ML Model Improvements |
| GOTS, evaluation, modularity, scalability, Trailblazer, Combat Swim | [4.3.4] GOTS Evaluation |
| Fortify scan, security thresholds | [4.4.2] |
| Sprint demo, performance metrics | [8.1.4] |
| Weekly status, drumbeat | [8.1.7] |

After the table is approved, produce a **talking track** for this section. See Talking Track Rules below.

After drafting both, ask:
> "Does this table and talking track look right? Any rows to add, remove, or adjust before I move to the Demo section?"

Wait for approval before proceeding.

---

## Step 3 — Demo Structure

The demo is Abel's to script in his own voice. The skill produces a loose structure only.

**Output:**

**Demo: [Brief title of what is being shown]**

- What to show and in what sequence
- One key point to land per beat — what the stakeholder should take away from each moment
- Any setup or pre-conditions to flag before the demo begins (device connected, AppGate running, tiles pre-cached, correct APK installed, etc.)

**Rules:**
- No scripted language — structure only
- Flag any known risks to the demo going smoothly (connectivity, device state, build version)
- Keep it to 3-5 beats maximum

After presenting the structure, ask:
> "Does this demo flow work? Any beats to add or reorder before I move to Sprint WIP?"

Wait for approval before proceeding.

---

## Step 4 — Sprint WIP and Planned Work Table + Talking Track

Draft the work in progress and planned effort table for the current sprint.

**Section header:**
Work in Progress and Planned Effort
Sprint [N]: [start date] to [end date]

**Table format:**

| Dates | Work Stream | Progress and Plans |
|---|---|---|
| Estimated date range within sprint | Succinct SOW-linked description | Combined synthesis of ongoing effort and forecasted planned effort for the remaining sprint days |

**Table rules:**
- Dates: estimated range within the sprint, not exact
- Work Stream: ties to one of the four SOW tasks — include the `[4.3.x]` tag
- Progress and Plans: combines what is underway now with what is planned for the remaining 5-7 days. Forward-looking and commitment-style — not vague.
- Minimum 3 rows, maximum 5
- Sort by SOW reference ascending
- Source from daily notes and drumbeats — do not invent planned work

**Progress and Plans cell rules:**
- No engineering mechanics — do not reference branches, pipelines, merge requests, co-routines, or internal job names
- Do not enumerate internal technical items that read alarming or abstract without verbal context
- Prefer "usability" and "operator experience" over "reliability" — the former describes what operators feel, the latter is an engineering term
- If an item is resolved, say so in past tense — do not say "confirming" when it is already done
- One clear thought per sentence — no padding, no filler transitions

After the table is approved, produce a **talking track** for this section — one spoken cue per row. See Talking Track Rules below.

After drafting both, ask:
> "Does this table and talking track look right? Any work streams to add, adjust, or reorder before I move to PI Planning?"

Wait for approval before proceeding.

---

## Step 5 — PI Planning: Forecasted Sprint Schedule + Talking Track

Draft the PI Planning forecast. This is a high-level, one-sentence callout per epic per sprint — not a detailed restatement of the WIP table.

**Rules:**
- One line per epic per sprint — succinct, outcome-oriented
- Match language to what was previously communicated to stakeholders in drumbeats or deliverable commitments
- Sprint 3 (current) should accurately reflect what was just covered in the WIP table — do not contradict it
- Sprint 4 should reflect committed deliverables from the most recent drumbeat
- Extension sprints (5+): frame as proposed, not committed — mention the proposal was sent to the customer and leave room for their response

**Talking track for this section:**
- Briefly acknowledge Sprint 3 without re-hashing — the audience just saw it in depth
- Walk Sprint 4 conversationally — do not read bullets verbatim
- Transition carefully to extension sprints — reference the proposal, invite the customer to share any update

After drafting, ask:
> "Does this PI Planning slide and talking track look right before I move to Issue Resolution?"

Wait for approval before proceeding.

---

## Step 6 — Issue Resolution

Draft one block per active issue.

**Filter — only include items that are:**
- Customer-actionable: the customer or stakeholders can actually do something about it
- New since the last drumbeat, OR known and previously surfaced but still unresolved

**Do not include:**
- Internal engineering issues (build failures, code bugs, pipeline configs, TIFF errors)
- Items the customer has no ability to influence or unblock
- Items that imply blame or ignore constraints the customer already communicated
- Resolved items
- Monitoring-only items with no ask or action

**Block format:**

**Issue:** [Short title]
**Description:** [What's happening — short, plain language, no engineering detail]
**COA:** [What Rise8 is doing to address it — OR — what we are asking from the customer]
**Notes:** [Left blank for Abel to fill in during the meeting]

**Rules:**
- Maximum 3 issues — if more exist, prioritize by impact on delivery
- Do not raise an issue the customer has already acknowledged and communicated a constraint around — that reads as tone-deaf
- State the situation plainly — let the stakeholder assess severity, do not editorialize

After drafting, ask:
> "Does this issue list look right? Any to add, drop, or reframe before I move to the Cheat Sheet?"

Wait for approval before proceeding.

---

## Step 7 — Cheat Sheet Q&A

For each slide section, flag 1-2 anticipated questions and draft a concise PM-level response.

**Rules:**
- Focus on questions that are sensitive, hard to answer on the spot, or likely given what was shown
- Responses are PM-level — no engineering depth required
- Each response should close with a natural handoff to engineers if technical depth is needed: "Kevan / Zach can walk through the specifics if helpful"
- Do not predict questions that won't realistically come up
- Maximum 2 questions per section — flag only the most likely

**Format:**

**Q: "[Anticipated question]"**
> [Concise PM-level response]

After presenting, ask:
> "Anything else you want a prepared response for before final assembly?"

Wait for Abel's response before proceeding.

---

## Step 8 — Final Assembly

Once all sections are approved, assemble the full slide content and talking track in one clean output:

---
**TAK Bridge — Demo and Product Update**
**[Wednesday, Month Day, Year]**

**Sprint Accomplishments**
[Approved table]
[Approved talking track]

**Demo**
[Approved structure]

**Sprint [N]: Work in Progress and Planned Effort**
[Sprint date range]
[Approved table]
[Approved talking track]

**PI Planning: Forecasted Sprint Schedule**
[Approved bullets]
[Approved talking track]

**Issue Resolution**
[Approved issue blocks]

**Cheat Sheet**
[Approved Q&A]

---

Ask:
> "Ready to save this to your daily notes file, or do you want to copy it directly into your deck first?"

Do not write to any file until Abel confirms.

---

## Step 9 — Outcome Reflection (Internal Only)

After the slide content is locked, flag potential outcomes for an internal conversation — nothing from this step goes into the stakeholder slides.

Scan the approved content and identify 1-3 items that may connect to an Enabling Outcome or Mission Outcome. Present them as nudges, not conclusions:

**Format:**
> "[Item from the deck] — this may connect to an [Enabling / Mission] Outcome worth naming before the next drumbeat. Consider running `/tak-outcomes` to develop it."

**Rules:**
- This is a prompt for Abel, not a drafted outcome
- Do not use outcome language in the slides
- Maximum 3 nudges — flag only the strongest connections
- If nothing clearly connects, say so rather than forcing it

---

## Talking Track Rules

These apply to every talking track produced by this skill.

- **Do not read the slide verbatim.** Offer color, context, and natural expansion — not a recitation.
- **Do not start by implying something was neglected or broken.** Framing like "now that X is done, we can finally focus on Y" implies Y was deprioritized. Drop the cause, lead with the work.
- **Do not enumerate abstract items that sound alarming without context.** If listing specifics would confuse or alarm a stakeholder without setup, collapse them into a theme instead.
- **Use natural names.** Say "Booz" or "Booz Allen" in spoken script, not "BAH." Say "Chad and Nik" not "SOCOM" where the reference is personal and direct.
- **No engineering terms in the talking track.** Merged to master, pipeline jobs, co-routines, branches — these belong with the engineers, not on stage.
- **Name the outcome, not the mechanism.** Stakeholders care what it means, not how it works.
- **Keep each row's talking track to 3-5 sentences.** Tight spoken cue, not a paragraph.
- **Active and conversational.** "We're building" not "this effort is to build." "We caught it" not "it was identified."

---

## Discipline Rules

These apply to every section. No exceptions.

- **No assumptions.** If something was not found in the source files or confirmed by Abel, flag it as unknown rather than fill it in.
- **No intensifier adverbs or adjectives.** State facts. Abel and the stakeholder assess severity and importance.
- **Stakeholder language throughout.** No engineering shorthand, pipeline terminology, or internal acronyms without explanation.
- **No sausage making.** The how belongs with the engineers. The slides communicate the what and the so what.
- **Source every item.** If it cannot be traced to a drumbeat, daily note, or Abel's input, it does not go in the deck.
- **Section by section.** Never draft ahead without approval.

---

## Scope

**Do:**
- Source from the two most recent drumbeats and relevant daily notes
- Accept Abel's directional guidance as additional input
- Produce structured slide content and talking track cues Abel can take directly into his deck and presentation
- Flag demo pre-conditions and risks
- Prepare a cheat sheet of anticipated Q&A responses per slide section
- Prompt `/tak-outcomes` after content is locked

**Don't:**
- Write a word-for-word script Abel must read verbatim — produce cues and color, not a teleprompter
- Draft a full presentation without section-by-section approval
- Include internal engineering issues in Issue Resolution
- Include issues the customer cannot act on
- Invent work, risks, or plans not found in the sources
- Let outcome language bleed into the stakeholder slides
