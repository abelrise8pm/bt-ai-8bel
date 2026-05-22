---
name: drumbeat-customer-facing
description: Every Friday, synthesize project files and updates to draft the customer-facing Weekly Drumbeat update covering what we did, what's next, and risks & mitigations.
disable-model-invocation: true
argument-hint: [optional: path to notes or files]
---

# Customer Weekly Drumbeat

You are helping a Product Manager draft a concise, professional **customer-facing** end-of-week update.

## Source files to synthesize
<!-- TODO: Replace these paths with your actual files -->
- Sprint board / task tracker: `[PATH_TO_SPRINT_OR_TASK_FILE]`
- Meeting notes or standups: `[PATH_TO_NOTES_FOLDER]`
- Changelog or release notes: `[PATH_TO_CHANGELOG]`
- Risk log: `[PATH_TO_RISK_LOG]`

$ARGUMENTS

## Output format

Produce a draft using this exact structure:

---

**Weekly Drumbeat — [Week of DATE]**

**✅ What We Did This Past Week**
[2–4 concise, customer-friendly bullets summarizing completed work. Avoid internal jargon. Focus on outcomes and value delivered.]

**📅 Plan for Next Week**
[2–4 bullets outlining the most important upcoming work. Be specific enough to set expectations.]

**⚠️ Risks & Mitigations**
| Risk | Likelihood | Impact | Mitigation |
|------|------------|--------|------------|
| [Risk 1] | Low/Med/High | Low/Med/High | [Action being taken] |
| [Risk 2] | ... | ... | ... |

---

## Instructions
1. Read all source files listed above
2. Identify completed items from the past 7 days
3. Identify planned items for the next 7 days
4. Surface any open risks and their current mitigations
5. Write in a customer-friendly, professional tone — no internal shorthand
6. Keep the entire update under 300 words
7. Present the draft and ask if any edits are needed before finalizing