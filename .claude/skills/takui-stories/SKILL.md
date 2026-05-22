---
name: takui-stories
description: Document TAK UI migration workflow story spikes for the AI GRG plugin. Guides Abel, Jonathan, or an engineer through validating the user story, filling the native vs. escape hatch table, writing story-level risk, and preparing Nathan decision points for the BAH collaboration conversation.
disable-model-invocation: true
argument-hint: "[optional: story number or name to work on — e.g. 'Story 5: Export GRG']"
---

# TAK UI Migration — Workflow Story Spike

Use this skill when Abel (PM), Jonathan (designer), or an engineer is about to work on a TAK UI migration workflow story spike. This is discovery and scoping work — not development. The output is a documented spike artifact used to drive the conversation with Nathan at BAH around Priority, Ownership, and Effort before any development stories are written.

---

## What to Have Ready

- User story drafted in "As a / I want / So that" format
- VSM reference: `TAK-ALL/tak-vsm-first_pass.md` — confirms which GRG Creator workflows are in scope and what the pain points are
- UI Framework Mapping: `TAK-ALL/tak-ui-framework-mapping.csv` — maps every XML component to its current Android native component
- Josh's initial findings: `TAK-ALL/initial-findings_takui.md` — confirms TAK UI native vs. ATAK native with specific class names and gotchas
- Plugin source code: `rise8-atak-grg-plugin/` — the actual codebase for preliminary call validation before the engineering review
- Pairing partner — engineer and/or Jonathan (designer) for the live walkthrough of the plugin

---

## Collaboration Workflow

This skill follows a three-stage collaboration sequence: **Abel + Jonathan → Engineers → Nathan**

1. **Abel shares context and the story CSV rows or plain text** before work begins
2. **Run Phase 1 and Phase 2 only** — present the validated story and component table with preliminary calls based on all references including the plugin code
3. **Stop and ask:** "Any feedback, or ready for Phase 3 and 4?"
4. **Abel and Jonathan review with engineers** — engineers validate or correct the native vs. escape hatch calls before anything goes to Nathan
5. **Return with engineer-validated corrections** — regenerate the table if needed, then proceed to Phase 3 and 4 (story-level risk + Nathan decision points)
6. **Once Phase 3 and 4 are confirmed**, ask if you should write the completed story to `TAK-ALL/takui-migration-workflows.md`

Never run all four phases in one shot. Always pause after Phase 2.
The goal of using the code repo is to arrive at the engineer conversation with sharper preliminary calls — not to replace the engineer review.

---

## Phase 1 — Validate the Story

Before touching any table, confirm both of the following:

**User story format:**
- Written as "As a [actor], I [want/need] [capability], So that [value/outcome]"
- Actor is specific — "GRG Creator" or "SOF Operator", not a generic "user"
- The "So that" clause ties to a real workflow outcome, not a feature description

**Scenarios:**
- At least one scenario per distinct user path through the story
- Scenarios cover the workflow end to end — from entry point through completion
- No gaps between steps — each step hands off cleanly to the next

If either fails, rewrite the story before proceeding to Phase 2.

---

## Phase 2 — Document Each Component

For each scenario, fill the table row by row:

| Task | Component / Interaction | TAK UI Native? | Escape Hatch (ATAK)? | Notes / Risk |

**Task**
- Written as action verb + noun — "Tap detect button", "Draw section boundary on map"
- One interaction per row — never combine two distinct steps into one row

**Component / Interaction**
Look up in this order before making a call:
1. Check `initial-findings_takui.md` — if listed under "What TAK-UI Covers" → Native; if listed under "What TAK-UI Does NOT Cover" → Escape Hatch, and use the exact class name from the findings
2. Check `tak-ui-framework-mapping.csv` — look up the XML file and component name to confirm what Android component is being used
3. Grep the plugin source at `rise8-atak-grg-plugin/` — search for the class or feature area. If the file imports `com.atakmap.*` → likely Escape Hatch. If no ATAK imports → may have a TAK UI path. This gives Abel and Jonathan a preliminary call to validate with engineers before going to Nathan.
4. If still uncertain after all three references → Unknown

Always name the actual class or component (`ActionBarView`, `PolygonCreationTool`, `GridTransformer`) — never leave this as a vague description.

**TAK UI Native / Escape Hatch / Unknown**
- ✅ Native: confirmed working in TAK UI — cite the source (Josh's findings or Nathan confirmation)
- ❌ Escape Hatch: confirmed ATAK native required — name the specific API or class
- ⚠️ Unknown: genuine uncertainty after checking both references — becomes a question for Nathan. Never leave a row blank.

**Notes / Risk**
- Flag anything that changes scope, adds effort, or has no clear TAK UI path
- If the same component appears in multiple steps (e.g. floating toolbar), note the pattern once and reference it in subsequent rows
- If a component maps to a VSM pain point (e.g. SwipeRelabelManager = worst UX in the workflow), call it out explicitly

---

## Phase 3 — Story Assessment

After all scenario tables are complete, write 3-4 sentences. Reference the relevant scenario(s) by name for each point.

**Rules:**
- State facts from the assessment — no intensifying adjectives or adverbs (not "highest-priority," "critical," "significant," "anywhere," "fully")
- Name recurring escape hatch patterns and which scenarios they appear in (e.g. "`ActionBarView` appears in Scenario 1 and Scenario 2 as the entry point for both interactions")
- Name components with no confirmed TAK UI path and no known BAH timeline
- Name unknowns that need engineer validation before a call can be made
- Leave interpretation to the engineers and team — the assessment opens the discussion, it does not close it

---

## Phase 4 — Nathan Decision Points

For every escape hatch or unknown, write one block using this format:

**[Component / Class Name]** — Escape Hatch / Unknown
In [Scenario N], when the [actor] [does the specific task], this component handles [what it does]. [One sentence — what it is and why it is escape hatch or unknown.]
- Any feedback or insights we should know before we proceed?
- Is this on your sprint? If yes, when?
- Before we decide on a path — is there anything in TAK UI today we should be looking at for this, or guidance on where to look?
- If nothing surfaces: "If there's nothing available, we see two paths: stay on the escape hatch, or Rise8 contributes a native version. What would you recommend?"

The context sentence anchors each block in the user workflow so the reader does not lose sight of what the GRG Creator is trying to do. Keep it one sentence — scenario reference, actor action, and component role only.

Lead with Nathan's guidance first. Only surface the contribution or escape hatch options once Nathan has had the opportunity to point to an existing path or roadmap item. Never open with "should Rise8 contribute" — let Nathan direct the answer before the two paths are named.

---

## Done Criteria

The spike is ready to bring to Nathan when all of the following are true:

- [ ] User story is in correct "As a / I want / So that" format with a specific actor
- [ ] All scenarios cover the end-to-end workflow with no gaps
- [ ] Every table row has a call — Native, Escape Hatch, or explicitly Unknown. No blanks.
- [ ] Story Assessment is written (3-4 sentences, facts only, scenarios referenced)
- [ ] At least one Nathan Decision Point block exists

---

## Output

The completed spike artifact lives in:
`TAK-ALL/takui-migration-workflows.md`

Follow the existing story format exactly:
- `## Story N: [Title]`
- User story statement
- `**Scenario N: [Name]**` with table
- `**Note:**` (optional — use for deferred scenarios or open questions)
- `**Story Assessment:**`
- `**Nathan Decision Points:**`

Reference completed Stories 1-4 in that file as the format baseline.
