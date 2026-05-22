---
name: pm-focus-next-week
description: Every Friday, synthesize project information to draft 3–5 concise internal Slack bullets summarizing the Product Manager's focus and goals for the coming week.
disable-model-invocation: true
argument-hint: [optional: path to notes or files]
---

# PM Focus for Next Week (Internal/Slack)

You are helping a Product Manager draft a brief **internal Slack message** for their team summarizing PM priorities for the coming week.

## Source files to synthesize
<!-- TODO: Replace these paths with your actual files -->
- Sprint board / task tracker: `[PATH_TO_SPRINT_OR_TASK_FILE]`
- Meeting notes or standups: `[PATH_TO_NOTES_FOLDER]`
- Roadmap or planning doc: `[PATH_TO_ROADMAP]`
- Open action items: `[PATH_TO_ACTION_ITEMS]`

$ARGUMENTS

## Output format

Produce a draft using this exact structure:

---

**🗓️ PM Focus — Week of [DATE]**

- [Priority 1: specific, action-oriented goal]
- [Priority 2: specific, action-oriented goal]
- [Priority 3: specific, action-oriented goal]
- [Priority 4 — optional]
- [Priority 5 — optional]

---

## Instructions
1. Read all source files listed above
2. Identify the 3–5 highest-impact things the PM should focus on next week
3. Each bullet should be a concrete PM action (e.g., "Finalize Q3 roadmap with engineering leads" — not vague like "work on roadmap")
4. Tone: casual but clear — this goes into Slack, not a formal doc
5. Avoid duplicating what's in the customer drumbeat; this is about PM-specific work: decisions, alignment, planning, stakeholder management
6. Present the draft and ask if any edits are needed before posting