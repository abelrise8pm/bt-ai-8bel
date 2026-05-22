---
name: tak-week-pm-prep
description: Friday PM close-out and week-ahead prep for the TAK Bridge contract. Sources the current week's daily notes and latest drumbeat to produce a Resolved/Open issues list, a next-week focus list, and a paste-ready Monday hand-off prompt. Writes a new tak-daily file after each section is approved.
argument-hint: "[optional: paste additional context, open threads, or directional guidance for this week's close-out]"
---

# TAK Week PM Prep — Friday Close-Out Workflow

A Friday end-of-week workflow for the TAK Bridge PM. Sources current-week daily notes and the latest drumbeat to close out the week, set focus for the coming week, and generate a Monday hand-off prompt. Abel owns the final judgment on every item — this skill surfaces and structures what is in the record.

This is a section-by-section workflow. Never draft ahead without PM approval.

---

## Step 1 — Source Discovery

Gather context from these sources in this order:

**1. Outcomes reference**
Read `TAK-ALL/tak-oor.md` fully. Note all active Enabling and Mission Outcomes by name. These inform the issues and focus sections — do not draft outcomes language, just hold the map in context.

**2. Latest drumbeat**
Look in `TAK-ALL/r8-internal/Daily-TAK-notes/tak-drumbeats-bridge/` for the most recent `db-wk*.md` file. Read fully. Note open risks, incomplete items, and any forward-looking threads.

**3. Current week daily notes**
Look in `TAK-ALL/r8-internal/Daily-TAK-notes/` for the most recent `tak-daily-{month}_{date-range}.md` file. Read fully.

**4. Prior week daily notes (supplemental)**
Read the second most recent `tak-daily-{month}_{date-range}.md` file. Use only to surface unresolved items that were not addressed this week — do not pull in items that are clearly closed.

**5. $ARGUMENTS**
If provided, treat as directional guidance. Incorporate throughout.

After reading all sources, present a one-paragraph summary of what you found — key threads, open items, and anything that looks unresolved. Then ask:
> "Here's what I found across this week's notes and the latest drumbeat. Anything to add or flag before I start drafting?"

Wait for Abel's response before proceeding.

---

## Step 2 — Resolved/Open Issues (Evidence First)

Before drafting, present the raw evidence list in the chat:

- List each candidate issue or matter found in the sources
- For each, include: a one-line description and a citation (filename + approximate line or section)
- Example: `tak-daily-april_20-24.md, line 31 — silent failure on GRG submission, no operator feedback shown`

Then ask:
> "Here are the issues and matters I found. Any to add, remove, or adjust before I draft?"

Wait for Abel's response. Incorporate any changes.

---

## Step 3 — Draft Resolved/Open Issues

Once the evidence list is approved, draft the issues section and show it in the chat.

**Format — one entry per item:**

**[Issue/Matter Title]**
Description: [The problem or opportunity and why it is relevant — under 40 words]
Resolution: [Open / Solved / WIP / TBD]
COA: [Expected or documented action item and who is responsible]

**Rules:**
- Source every entry — no item may appear that was not in the evidence list
- Resolution must be one of: Open, Solved, WIP, TBD
- TBD means more information is needed before a COA can be stated
- COA must name a responsible party if one is known — if unknown, write "Owner TBD"
- Do not editorialize — state what is in the record
- No minimum or maximum — include every active item found

After drafting, ask:
> "Does this issues list look right? Any entries to add, edit, or drop before I move to next-week focus?"

Wait for approval before proceeding.

---

## Step 4 — Focus for Next Week (Evidence First)

Before drafting, present the raw evidence list for next-week candidates:

- List items from the drumbeat's Looking Ahead section, open COAs from the issues list just approved, and any forward-looking threads in the daily notes
- Cite each item (filename + section)

Then ask:
> "Here are the candidates for next week's focus. Anything to add, remove, or shift priority on?"

Wait for Abel's response.

---

## Step 5 — Draft Focus for Next Week

Once the candidate list is approved, draft 4-6 focus items and show them in the chat.

**Audience:** Internal product team, customer success, and Rise8 leadership.

**Format — one item per line, numbered:**

[N]. [What needs to happen, who or what is involved, and what it unlocks or confirms — written in Abel's voice, outcome-oriented, no engineering detail]

**Example style:**
> Get SOCOM's first feedback on the 5.6 release from Chad and Nik that the build passes field review. That confirmation is what lets us submit our first Enabling Outcome.

**Rules:**
- 4 items minimum, 6 maximum
- Each item must trace to a source — drumbeat, daily note, approved COA, or $ARGUMENTS
- If an item connects to a named Enabling or Mission Outcome from tak-oor.md, append a single line: `Outcome: [Outcome name]`
- Only tag when the link is explicit in the record — do not invent connections
- No intensifier adjectives or adverbs — let the work speak
- Do not add items not traceable to the record

After drafting, ask:
> "Does this focus list look right? Any items to add, reorder, or reframe before I move to the hand-off summary?"

Wait for approval before proceeding.

---

## Step 6 — Hand-Off Summary and Monday Prompt

Draft a paste-ready block Abel can drop into a new Claude chat on Monday.

**Format:**

---
You are picking up TAK Bridge PM work as of [Day, Month Date, Year].

[2-3 sentences on where things stand: what was completed this week, what is in flight, and what the first priority is Monday.]

Open threads to be aware of:
- [Item 1 — one line]
- [Item 2 — one line]
- [Item 3 — one line, max]

My focus for the week ahead:
[Paste-in of the approved focus list from Step 5]

Reference files:
- Outcomes: TAK-ALL/tak-oor.md
- Latest drumbeat: TAK-ALL/r8-internal/Daily-TAK-notes/tak-drumbeats-bridge/[latest db-wk*.md]
- This week's notes: TAK-ALL/r8-internal/Daily-TAK-notes/[current tak-daily file]
---

**Rules:**
- Open threads must come from the approved issues list — only items with resolution Open or TBD
- Maximum 3 open threads in the prompt — if more exist, surface the most consequential based on the record
- Do not add threads not in the approved issues list
- The "where things stand" paragraph must be traceable to this week's sources

After drafting, ask:
> "Does this hand-off summary look right? Once you confirm, I'll assemble the file."

Wait for approval before proceeding.

---

## Step 7 — File Assembly

Once all sections are approved, ask:
> "Ready to write the file. Confirm the week date range for the filename — e.g. `tak-daily-april_27-may1.md` — and I'll save it to `TAK-ALL/r8-internal/Daily-TAK-notes/`."

Wait for Abel to confirm the filename before writing anything.

**File contents in order:**
1. Hand-off summary and Monday prompt
2. Focus for next week (numbered list)
3. Full Resolved/Open issues list

Do not write to any file until Abel confirms the filename.

---

## Discipline Rules

These apply to every section. No exceptions.

- **No assumptions.** If something was not found in the source files or confirmed by Abel, flag it as unknown rather than fill it in.
- **No intensifier adjectives or adverbs.** State what is in the record. Abel assesses severity and importance.
- **Evidence first.** Present sourced candidates before every draft. Never draft without showing evidence first.
- **Section by section.** Never draft ahead without explicit approval.
- **Source every item.** If it cannot be traced to a drumbeat, daily note, or Abel's input, it does not go in the output.
- **No em dashes.** Use a comma, colon, or period instead.
