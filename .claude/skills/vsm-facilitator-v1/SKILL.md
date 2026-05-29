---
name: vsm-facilitator-v1
description: Facilitates a Rise8 internal team through a current-state Value Stream Mapping workshop. Covers pre-work through final waste tagging across 9 ordered passes, with per-pass state saves and hand-off support so the arc can span multiple sessions. Use when an internal team wants to learn VSM by doing one — for a customer's value stream or a Rise8-internal one.
argument-hint: "[optional: state file path to resume a prior session, or a one-line description of the value stream subject]"
disable-model-invocation: true
---

# VSM Facilitator (v1) — Current-State Walkthrough

This skill helps Abel run an internal Rise8 team through a current-state Value Stream Map. It is designed for *learning-by-doing* sessions where the team is upskilling on VSM as a practice — whether the subject is a customer's value stream or a Rise8-internal one. It is not a customer-facing facilitation script.

The skill is grounded in three reference docs, all of which it points to rather than duplicates:

- [Mission-OS/vsm-reference-educ8.md](Mission-OS/vsm-reference-educ8.md) — the *why* and *what* of VSM (principles, wastes, metrics)
- [Mission-OS/vsm-facilitator-guide.md](Mission-OS/vsm-facilitator-guide.md) — the *how* (pass-by-pass prompts, prep checklists, calculation methods)
- [Mission-OS/vsm_mapping_tools_context.md](Mission-OS/vsm_mapping_tools_context.md) — *differentiation* (VSM vs. Journey Map, Service Blueprint, Event Storm, Process Map) and redirect language for mid-workshop derails

---

## When to Use This Skill

Use this skill when:
- A Rise8 internal team wants to facilitate or practice a current-state VSM
- The team is mixed on VSM familiarity — some are skeptical, some default to Journey Maps / Service Blueprints / Event Storms / Process Maps
- You have at minimum a candidate value stream subject in mind (or want help converging on one in Pass 0b)
- You have ~60–90 min for a session (the full arc will span multiple sessions; that's expected)

Do **not** use this skill for:
- Live customer-facing workshops with stakeholders in the room (this is upskilling, not delivery)
- Target-state design (this skill stops at the current-state map; target state is a follow-on)
- Process mapping a single block in detail (that's a different tool — see [vsm_mapping_tools_context.md](Mission-OS/vsm_mapping_tools_context.md))

---

## Pre-Flight — Before Any Pass Runs

Ask Abel three questions, one at a time, and capture the answers. These set framing for everything downstream.

1. **Who is this VSM for — a Customer's value stream, or a Rise8-internal one?**
   This determines pronouns and tone for every prompt you suggest to the team. Default to **"the customer / their team / they"** if customer-facing. Use **"we / our"** only if the subject is a Rise8-internal stream.

2. **Are we starting fresh, or resuming a prior session?**
   If resuming, ask for the state file path under `Mission-OS/sessions/`. Read it, summarize where the team left off, and jump to the next pass.

3. **What's the working name (or topic) of the value stream subject?**
   This becomes the slug for the state file. If unclear, that's fine — Pass 0b will surface it.

Do not start Pass 0a until these three are answered.

---

## Skill Workflow — Nine Ordered Passes

Each pass is atomic.

**Before each pass:** scan the state file's `## Carried Items` section for entries tagged for this pass. Surface them at the appropriate prompt moment so they don't get re-asked or forgotten.

**After each pass:**
1. Capture the output to the state file at `Mission-OS/sessions/vsm-<subject-slug>-<YYYYMMDD>.md`
2. Update `## Carried Items` if any team suggestions surfaced during this pass that belong elsewhere. Tag each with the pass where it should resurface (or `branch annotation` / `out of scope` / `parked variant`). This prevents mid-pass detours into items that belong later, while ensuring nothing is dropped.
3. Ask Abel: *"Continue to the next pass, refine this one, or pause and hand off?"*
4. If pausing, run the **Hand-Off Protocol** (below).

---

### Pass 0a — Why VSM (and not Journey Map / Service Blueprint / Event Storm / Process Map)

**Purpose:** Defuse skepticism upstream of mapping. The friction in most internal sessions isn't "we don't know how to VSM" — it's "we'd rather use a tool we already know." Acknowledge the toolbox. Don't dismiss it.

**Facilitator prompt to suggest to Abel:**
> "Some of us are more comfortable with Journey Maps, Service Blueprints, Event Storms, or Process Maps. Those are all valid — and they each answer a different question. Before we map anything, let's align on what question we're trying to answer today."

**Reference to invoke:** [Mission-OS/vsm_mapping_tools_context.md](Mission-OS/vsm_mapping_tools_context.md) — specifically the sequencing principle (before/during/after VSM) and the tool-by-tool breakdown.

**Output to capture:** an explicit team statement that VSM is the right tool for *this* question. If the team's question is not "where is value stuck across the end-to-end flow?", stop the skill and recommend the appropriate alternative.

---

### Pass 0b — Macro-Level Similarities & Variations + Defining Value Stream Notes

**Purpose:** Resolve "there are too many parallels" and "the workflow isn't linear." Convert those objections into a *decision*: which value stream are we mapping, and how do we handle variation.

**Facilitator prompts to suggest to Abel** (adjust pronouns based on Pre-Flight Q1):

- *"What goods, services, products, or combinations does [the customer / our team] manage end-to-end?"*
- *"What customer types or segments do they serve?"*
- *"What conditions cause significant variation in how work gets done?"*

**Output to capture:**
- A shortlist of candidate value streams (one per line)
- For each: which customer segment it serves, and what causes variation
- An explicit decision for the session: *"map each parallel stream separately"* OR *"map the most common path; document branches as weighted variations"*
- The picked value stream for this session

**Redirect rule:** If a teammate insists "we can't VSM this because it isn't linear," reference the methodology — "Variability itself is waste. We map the most common path, then weight the branches by frequency." This is in [vsm-reference-educ8.md](Mission-OS/vsm-reference-educ8.md) under bottleneck/variability handling.

---

### Pass 1 — Set the Stage

**Purpose:** Establish the five anchors that the rest of the map hangs from.

Capture, in order:
1. **Mission impact** — *"What outcome does this value stream enable? Why does this stream exist?"*
2. **Initiator (supplier)** — *"Who starts the desired outcome?"*
3. **Triggering event / inputs** — *"What starts the process?"*
4. **End-user (customer)** — *"Who realizes the desired outcome?"*
5. **Outputs** — *"What does the customer receive?"*

If any of the five is unknown, log it as a parking-lot question and proceed with the best available assumption.

---

### Pass 2 — First Pass: Value Flow

**Purpose:** Map the process blocks from trigger to delivery.

**Method** (from [vsm-facilitator-guide.md](Mission-OS/vsm-facilitator-guide.md)):
1. Place the **last** block first (final step before outcome).
2. Place the **first** block second (what initiates the flow).
3. Fill in the middle. Aim for **5–15 blocks**.
4. For each block confirm:
   - Action verb + noun (e.g., "Lab tech runs blood test")
   - Function / department / team owner
   - Number of people required
   - Queuing and batching context

**Phrasing guardrail:**
- ❌ Too broad: "Testing happens"
- ✅ Just right: "Lab tech runs blood test"
- ❌ Too detailed: "Lab tech labels the sample"

**Mid-pass redirect rule:** If a teammate starts journey-mapping a block's user experience, or process-mapping its internal steps, redirect using language from [vsm_mapping_tools_context.md](Mission-OS/vsm_mapping_tools_context.md): *"That detail is real — let's flag this block as a hotspot for a follow-on session and keep moving. We need the full stream mapped before we go deep on any one block."*

---

### Pass 3 — Second Pass: Information Flow

**Purpose:** Overlay the IT systems supporting each block.

**Method:**
- Place a rectangle for each IT system between the customer block and the process blocks
- Connect systems to blocks with arrows showing direction:
  - Arrowhead at the block → data is viewed / retrieved
  - Arrowheads on both ends → data is entered and retrieved
  - Lightning ⚡️ → automatic flow (API calls, scheduled, event-based)
- Exclude generic tools (email, Word/Docs). Include systems that house data or drive decisions (Excel/Sheets, CRMs, ATAK, VBMS, etc.)

---

### Pass 4 — Third Pass: Metrics Flow

**Purpose:** Quantify performance per block, then roll up.

Capture for each block:
- **PT (Process Time)** — actual work time when not idle
- **LT (Lead Time)** — calendar time from arrival to handoff (includes waiting)
- **%C&A (Percent Complete & Accurate)** — share of work usable downstream without rework

**If no data exists:** team estimates are fine. Sample 5 recent cases. Flag low-confidence numbers.

Then calculate:
- Total PT, Total LT
- Activity Ratio = Total PT ÷ Total LT
- Rolled %C&A = multiply each block's %C&A as decimals (this is the standard summary metric)

**Calculation reference:** [vsm-facilitator-guide.md](Mission-OS/vsm-facilitator-guide.md) — "How to calculate % Complete & Accurate"

---

### Pass 5 — Fourth Pass: Visual Aides

**Purpose:** Layer context that quantitative metrics don't capture.

Add:
- 🔴 **Red sticky** — open questions
- 🩷 **Pink sticky** — assumptions
- ☁️ **Yellow-cloud kaizen burst** — potential improvement opportunity (don't design it yet, just flag it)
- 📚 Queue / batch icons where work accumulates
- ⚡️ Confirm push/pull/auto information flow arrows from Pass 3

---

### Pass 6 — Fifth Pass: Process Block Classification

**Purpose:** Classify each block by value contribution.

- 🟢 **Green** — Value Added (transforms the work; customer would pay for it)
- 🔵 **Blue** — Required Non-Value Added (regulatory/compliance/security; can streamline but not eliminate)
- 🟡 **Yellow** — Non-Value Added (waste; can be eliminated)

Classify one block at a time. Expect disagreement; let it surface.

---

### Pass 7 — Final Pass: Waste Categories

**Purpose:** Tag each block with one or more of the eight wastes, so the team has a precise vocabulary for improvement conversations.

Tag with:
- 🐞 **Defects** — rework due to errors
- 🏭 **Overproduction** — making more than needed
- ⛓️‍💥 **Over-processing** — work beyond customer need
- ⏳ **Waiting / Queuing** — idle time between steps
- 📋 **Inventory** — excess WIP not yet adding value
- 🛣️ **Transportation** — unnecessary movement of info/material
- 🔀 **Motion** — unnecessary movement of people / context-switching
- 🫙 **Unused Talent** — skills not leveraged

A block can carry multiple tags. After tagging, summarize: which blocks carry the most waste? That's the candidate constraint.

**End-of-arc note:** Target-state design and Transformation Action Plan are out of scope for this skill. Capture them as the natural next step.

---

## Hand-Off Protocol

The hand-off is the primary mechanism for surviving multi-session arcs. Run it after every pass *and* whenever context pressure hits.

### When to trigger

- **Default:** After every pass, ask *"Continue, refine, or pause and hand off?"*
- **Context-pressure fallback:** If the conversation is unusually long (rough heuristic: many lengthy exchanges, deep nested clarifications), proactively suggest: *"We've covered a lot. Want me to save state and generate a hand-off prompt so a fresh session can pick up?"*

### What to produce

1. **State file** at `Mission-OS/sessions/vsm-<subject-slug>-<YYYYMMDD>.md`. Overwrite on each save; the file is the source of truth.

   Required sections:
   ```
   # VSM Session — <subject>

   - **Framing:** Customer | Rise8-internal
   - **Subject:** <one-line description>
   - **Started:** <date>
   - **Current pass:** <e.g., "Paused after Pass 3">

   ## Pass 0a — Alignment on tool choice
   ## Pass 0b — Candidate streams + decision
   ## Pass 1 — Set the Stage (mission impact, initiator, trigger, customer, outputs)
   ## Pass 2 — Value Flow (block list: verb+noun | owner | # people | queuing)
   ## Pass 3 — Information Flow (IT systems + arrow directions)
   ## Pass 4 — Metrics (per-block PT/LT/%C&A + totals + Activity Ratio + Rolled %C&A)
   ## Pass 5 — Visual Aides (questions, assumptions, kaizen bursts)
   ## Pass 6 — Classification (VA / RNVA / NVA per block)
   ## Pass 7 — Waste Categories (tags per block)

   ## Carried Items (tagged by pass)
   ## Open Questions / Parking Lot
   ```

2. **TLDR resume prompt** — a paste-ready block Abel can drop into the next Claude session:
   ```
   I'm resuming a VSM workshop using the vsm-facilitator-v1 skill.
   Read the state file at: Mission-OS/sessions/vsm-<subject>-<date>.md
   We left off after Pass <N>. Pick up at Pass <N+1>.
   ```

### Confirm before writing

Always show Abel the file path and the TLDR prompt before writing. He may want to adjust the slug or location.

---

## Strict Rules

- **Map current state only.** No wishful thinking, no ideal state, no solutions. Those are follow-on work.
- **Action verb + noun for every block.** Nouns alone hide the work. Clicks expose too much.
- **One value stream per session.** If multiple emerge in Pass 0b, pick one and park the rest.
- **5–15 blocks.** Fewer hides constraints; more obscures them.
- **Human actors throughout.** Outputs ≠ outcomes. The subject of every block is a role, not "the system."
- **Use the pre-flight framing consistently.** If customer-facing, say "the customer / their team." If Rise8-internal, "we / our." Mixing the two contaminates the map.
- **Always do Pass 0b before Pass 1.** "Too many parallels" is the most common reason teams stall. Macro-level slicing prevents the stall.
- **When someone reaches for a different mapping tool mid-pass, redirect — don't dismiss.** Use the language from [vsm_mapping_tools_context.md](Mission-OS/vsm_mapping_tools_context.md). Park the insight as a hotspot.
- **Estimates beat no data.** If metrics are unknown in Pass 4, capture the best estimate and flag confidence. Refine later.
- **Save state after every pass.** No exceptions.

---

## Anti-Patterns

| Anti-pattern | Why it fails | Fix |
|---|---|---|
| Skipping Pass 0a | Skeptics disengage; sessions stall | Always start with tool-choice alignment |
| Skipping Pass 0b | "Too many parallels" becomes a derail mid-Pass-2 | Always do macro-level slicing first |
| Saying "we manage" when facilitating for a customer | Pulls Rise8 into the diagram | Use "the customer / their team / they" |
| "Testing happens" as a block | Too broad — hides the work | "Lab tech runs blood test" |
| "Click submit button" as a block | Too detailed — that's process mapping | Roll up to the function-level activity |
| Mapping the ideal state | Current reality is where constraints live | Map what actually happens, even if ugly |
| Substituting a Journey Map mid-VSM | Different question, different zoom | Park as hotspot; finish VSM first |
| Trying to finish all 9 passes in one sitting | 90 min is the soft ceiling | Pause after Pass 2 or Pass 4; save state |
| Designing improvements during current-state mapping | Premature; the constraint isn't identified yet | "Save your wishful thinking" — log it for target-state |
| Treating Pass 7 waste tags as the goal | The tags are inputs to the next conversation, not conclusions | Use them to anchor target-state work |

---

## Related Skills

- **[tak-outcomes](.claude/skills/tak-outcomes/SKILL.md)** — Frame the Mission Outcomes a target-state VSM would aim to enable. Run after the current-state map identifies a constraint worth resolving.
- **[tak-hypothesis](.claude/skills/tak-hypothesis/SKILL.md)** — Turn a VSM-surfaced constraint into a testable thin-slice experiment. The "We believe" statement should target the constraint; the success metrics should reference VSM metrics (LT, %C&A, Activity Ratio).
- **[tak-issuedrafting](.claude/skills/tak-issuedrafting/SKILL.md)** — Once the hypothesis is named, draft the backlog items that test it.

---

## References

- [Mission-OS/vsm-reference-educ8.md](Mission-OS/vsm-reference-educ8.md) — VSM principles, eight wastes, metrics, Rise8's three value streams
- [Mission-OS/vsm-facilitator-guide.md](Mission-OS/vsm-facilitator-guide.md) — pass-by-pass prompts, prep checklist, %C&A calculation methods, icon legend
- [Mission-OS/vsm_mapping_tools_context.md](Mission-OS/vsm_mapping_tools_context.md) — VSM vs. Journey Map / Service Blueprint / Event Storm / Process Map, plus redirect language for mid-workshop derails
