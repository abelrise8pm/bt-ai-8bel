---
name: tak-output-assumptions
description: Part 1 of the TAK experiment pipeline. Takes one output (shipped, in progress, or being considered) and surfaces the unstated, unvalidated assumption behind it as a David J Bland "We believe" statement, ready to hand to the Experiment Card. Claude infers candidate assumptions to prime the Balance Team, tags them as inferences, and prompts the team to confirm or expand. Runs BEFORE experiments-framework.md and the hypothesis. Use when reviewing shipped or candidate outputs to name the bet behind them before designing an experiment.
argument-hint: "[optional: name the output or point to its line in tak-all-outputs.md]"
disable-model-invocation: true
---

# TAK: Surface the Assumption Behind an Output

This skill helps Abel and the Balance Team take one output (shipped, in progress, or being considered) and surface the unstated, unvalidated assumption behind it, stated as a testable bet ready to drop into the Experiment Card.

These outputs were built to ship, not to validate. They carry the solution but not the bet: the pain, the user, and the expected behavior change were never written down. This skill makes that bet explicit so it can be tested once you have users in prod.

## Where This Sits in the Pipeline (Part 1)

```
tak-output-assumptions   ->   experiments-framework.md   ->   hypothesis
   (PART 1: you are here)         (Experiment Card)
   output in, assumption out
```

Tell the user up front they are in **Part 1**, and repeat at handoff what comes next (the Experiment Card, then the hypothesis), so they always know where they are. This skill stops at the assumption. It does not pick the final riskiest assumption, write the "we will know this is true if" clause, draft the If/then, or design the test. Those belong to the Experiment Card and downstream. If an output points at a brand-new outcome not yet named, send the user to `tak-outcomes` rather than inventing one.

## When to Use

When reviewing an output from the candidate list and you need to name the bet behind it before any experiment is designed. One output at a time.

## Sources

- `TAK-ALL/r8-internal/Daily-TAK-notes/gap-period/tak-all-outputs.md` (the outputs list, Competition and Bridge).
- `TAK-ALL/tak-oor.md` for the outcomes already named, to see whether an output maps to one or points to a new one.
- Each output's own source citations (e.g. `pre-sow-tak-competitions.md:398`).
- Default stops there. When the user presses for more context or evidence, widen the search into the `TAK-ALL/` folder. Never use `outputs-outcomes-tak.md` (stale).

## The Assumption Format (David J Bland)

Source of truth: `TAK-ALL/frameworks-refs.md`. Follow Bland's rules exactly:

- A statement, never a question. Something that would have to be true for this to succeed.
- Based on what we know today, looking 2 to 6 months out.
- Begin with **We believe** (team) or **I believe** (individual).
- One sentence, fits on a sticky note.
- Positive framing, unless deliberately disproving a negative.
- Tag with a category: **Desirability** (do they want it?), **Viability** (should we do it?), **Feasibility** (can we do it?), **Misc**.

Do **not** add the "We will know this is true if..." clause. That is the Rise8 format and it belongs to the Experiment Card, which is where it shines.

**Usability is not a standalone category here.** If a Balance Team member argues for it, surface the argument, check whether it actually overlaps with desirability or another category, and be willing to pivot to accommodate it if it genuinely stands alone.

## Reading the Outcome (Seiden / Gothelf)

**This is a reasoning lens, not output scaffolding.** Use it to think. Do **not** paste its labels into the visible response. Never cram "who / does what / by how much", "TARGET", or "sub-outcome" into the text. The response stays plain and readable, the way Abel writes. These frameworks inform the reasoning behind a response and serve as shared context when Abel asks for refinements; they are not the response itself.

Source of truth: `TAK-ALL/frameworks-refs.md` (Outcome Language section). Behind the scenes, read every outcome in `tak-oor.md` as **Who does what by how much** (Josh Seiden, Gothelf and Seiden):

- **Who** = the user or group/segment.
- **Does what** = the change in behavior, the outcome itself.
- **By how much** = the key result, the metric we measure by.

What this lens makes you do, expressed plainly in the response:

- Treat the `tak-oor.md` outcomes as targets, not settled, but say that in plain words only if it matters to the point.
- When you map an output to an outcome, write one plain line: which outcome it informs and how it differs from other outputs already pointing at that outcome. Not a bare yes/no, but no framework labels either.
- One outcome can be informed by more than one output. If an output seems to point somewhere new, mention it plainly as something for `tak-outcomes` to name later. Flag, do not name, and do not dress it up in framework terms.

## Collaboration Workflow

Solo pairing with the user, one output at a time, one question at a time.

1. **Pick the output.** The user names it or points to the line in tak-all-outputs.md.
2. **Starting-point check** (conversation, not a saved field). Briefly state what is known from the docs (cited) and what is missing, so you both see where you are starting from. End with one plain outcome-mapping line: which outcome this output informs and how it differs from other outputs on that outcome. Reason with the Seiden lens (see Reading the Outcome), but keep its labels out of the text.
3. **Surface the assumption(s).** Walk Bland's categories to find the bet. For an already-shipped output, feasibility is mostly answered, so lean on desirability, viability, and misc. For an in-progress or just-considered output, feasibility may still be live.
4. **Propose, then stop.** Offer one or more inferred assumptions in Bland sticky format, each tagged with an orange square as Claude's inference from the pain context (not from source). Then give 1 or 2 questions for the Balance Team to react to: is the inference right, and what else could be assumed or observed. The user confirms, rewrites, or adds before anything is finalized.
5. **Baseline check.** Do we have a measured number already, yes / partial / none, cited.
6. **Offer to write the card** to the artifact, only after the pairing on this card is complete (see Writing to the Artifact).

## The Card

**Template:**

> **Output:** [the named deliverable, the output's own name] (`source:line`)
> *What it does:* [the sourced/available description of what the output does]
>
> **Pain + who:** [who feels it and what the pain is]. Cited where the docs say it; 🟧 where inferred.
>
> **Assumption** (🟧 Claude's inference from the pain context, react to it):
> `[Category] We believe [statement].`
> *(one or more)*
>
> **For the Balance Team:**
> - [is the inferred assumption right?]
> - [what else could be assumed or observed from this pain?]
>
> **Riskiest** (only if more than one): [nominates the one to test first, a nomination not the final pick]
>
> **Baseline:** yes / partial / none (`source:line`)
>
> **To test it:** [what's needed, often access to users in prod]

Use the orange square character 🟧 to tag every inference (the assumption line, and any inferred pain). Never the heart.

**Example (output #11, Automatic renumbering):**

> **Output:** Automatic renumbering (`pre-sow-tak-competitions.md:386-387`).
> *What it does:* system automatically renumbers/updates marker sequences when changes are made; renumbering adjustable via a swipe gesture to optimize sequence for mission flow.
>
> **Pain + who:** GRG creators. "Fixing numbering sequences after hundreds of labels... extremely frustrating and time-consuming" (`:246-250`).
>
> **Assumption** (🟧 Claude's inference from the pain context, react to it):
> `[Desirability] We believe GRG creators will edit GRGs mid-task instead of avoiding edits, because the manual re-sequencing burden is removed.`
>
> **For the Balance Team:**
> - Is "no longer avoiding edits" the real behavior shift, or is the bigger one something else (relabel faster, trust the output more)?
> - Beyond re-sequencing, what other pain did this output touch that we should turn into its own assumption?
>
> **Riskiest:** single assumption, no nomination needed.
>
> **Baseline:** partial. 9-12% of labels needed correction (`:247`); no in-field behavior measure.
>
> **To test it:** an operator creating GRGs in prod. Blocked until we have access to users in prod.

## Guardrails

1. Never the em dash character. Use commas, periods, parentheses, or "e.g."
2. Cite for sourced claims; tag every inference with an orange square and say it is Claude's. Inferring assumptions is encouraged, but never stated as fact.
3. Real names, not descriptions. Tag wording as source's-words / standard-term / Claude's-read. No coined hybrid labels.
4. Stop at the assumption. No "we will know this is true if", no hypothesis, no test design, no target metrics.
5. Don't put the user in the engineer's seat. Open engineering questions are theirs to carry to the team.
6. One output at a time, one question at a time.
7. Usability stays out as a category, but hear the argument if pushed, check overlap, and pivot if it stands alone.
8. Default sources fixed (tak-all-outputs.md, tak-oor.md, each output's citations). Widen into TAK-ALL/ only when pressed for more. Never outputs-outcomes-tak.md.
9. Frameworks (Seiden / Gothelf outcome reading, Bland categories) are a reasoning lens, not output scaffolding. Keep their labels out of the visible response. Map an output to an outcome in one plain line, never a bare yes/no, never with framework vocab crammed in. Flag sub-outcomes and new outcomes plainly; do not name them (that is `tak-outcomes`). The response reads the way Abel writes.

## Writing to the Artifact

- File: `TAK-ALL/r8-internal/Daily-TAK-notes/gap-period/tak-output-assumptions.md`.
- All work happens in the chat. Suggest moving a card into the file only **after** the pairing on that card is complete. Never write ahead of the user's confirmation. If the user says "add it," add it.
- Cards are listed in the order worked, each noting its bucket (Competition or Bridge).

## Session Wrap

When the user says they are done, produce:

1. A **TLDR** of the work completed this session.
2. The list of **referenced and source files** used, for context.
3. A **hand-off prompt** ready to paste into a new context window.
