# SKILL revamp

### tak-experiment-prioritization
A Balance Team pairing session that reviews shipped outputs and ranks which are worth turning into production experiments. Surfaces the riskiest assumption per output (4 lenses), checks the causal chain to a Mission Outcome, and places each on a risk×evidence 2×2. Runs after tak-outcomes, before tak-hypothesis.

### tak-outcomes
Identifies and articulates outcomes for the TAK Bridge contract using Rise8's framework: Mission Impact (strategic why), Mission Outcome (user behavior change), and Enabling Outcome (internal). Use when writing backlog items, sprint reports, drumbeats, or SOW deliverables and you need to name outcomes.


Skill Outline
Working name: tak-output-assumptions (alternatives: tak-orphaned-outputs, tak-output-review, your call)

One-line purpose: Take one shipped output (solution only) and reconstruct the latent, unvalidated assumption behind it, stated as a testable bet ready to drop into the Experiment Card.

Where it sits:


[tak-output-assumptions]  orphaned output → stated assumption
        → experiments-framework.md  (Experiment Card)
        → hypothesis
It stops at the assumption. It does not pick the final riskiest assumption, draft the If/then, or design the test. Those belong to the Experiment Card and downstream. If an output turns out to imply a brand-new outcome, it points you to tak-outcomes rather than inventing one.

Inputs / sources:

The output candidate lists in gap-tak-june_1-5.md (Competition + Bridge, lines 594-690). Explicitly not outputs-outcomes-tak.md (stale).
tak-oor.md for the outcomes already named, to check whether an output maps to one or reveals a new one.
Each output's own source citations (e.g. pre-sow-tak-competitions.md:398).
Workflow (solo with you, one output and one question at a time):

Pick the output. You name it or point to the line.
Starting-point check. State plainly what's known from the docs (cited) versus what's missing. The orphaned diagnosis: we have the solution, we lack pain/who/outcome/baseline.
Surface candidate assumption(s). Run the 4 lenses, but lead with the fact that feasibility is mostly closed (it shipped). Live lenses: desirability (will operators value it?), usability (will they use it?), viability (worth keeping/scaling?). Note any residual feasibility risk.
Propose the assumption statement, then stop. One clean falsifiable line: "We assume [user] will [behavior/value] because [pain] is reduced." You confirm or adjust before anything is finalized.
Baseline check. Do we have any measured number from competition/bridge work? yes / partial / none, cited.
Finalize the card to the artifact, formatted to pre-fill the Experiment Card's opening (Big Idea, Desired Outcome, Assumption).
The card it produces (per output):

Output (solution), source's words + citation
Starting point: known vs missing
Pain + who, cited where it exists, 🩷 tagged where inferred
Candidate assumption(s), by lens
Nominated riskiest (a nomination, not the final pick)
Baseline: yes / partial / none + citation
What's needed to test it (often: a real OTA user)
Guardrails (your standing rules):

Never the em dash character.
Cite, don't infer. Only state what's in the source; tag inferences 🩷 pink.
Real names, not descriptions. Terms tagged source's-words / standard-term / your-read.
Don't put you in the engineer's seat.
Stop at the assumption. Do not run ahead into the Experiment Card.
Output artifact: one card per output, written to a file (proposed: TAK-ALL/r8-internal/output-assumptions.md), not dumped inline. Summary plus next step in the reply.

Two small things for you to settle before I draft: the name, and the artifact path. Redline anything else and I'll write the SKILL.md.


tak-output-assumptions



TAK-ALL/r8-internal/Daily-TAK-notes/gap-period
tak-all-outputs.md

Feedback and updates for Section 1 of 7 - Purpose / Single Responsibility




---



Feedback and updates for Section 2 of 7 - Where this skill fits with the others



---



Feedback and updates for Section 3 of 7 - Purpose / Single Responsibility

---


====

Purpose: Take one shipped output (solution only) and surface the unstated, unvalidated assumption behind it, stated as a testable bet ready to drop into the Experiment Card.

The skill is the front door, Part 1 of a process. You feed it an output, it hands you an assumption, and that assumption flows into the Experiment Card and then the hypothesis:

```
tak-output-assumptions   →   experiments-framework.md   →   hypothesis
   (PART 1: you are here)        (Experiment Card)
   output in, assumption out

```
It does one job and hands off. It won't try to be the Experiment Card. And if an output points at a brand-new outcome you haven't named, it sends you to tak-outcomes instead of inventing one.

While you use it, the skill tells you up front that you're in Part 1, and repeats at the handoff what comes next (Experiment Card, then hypothesis), so you always know where you are in the process.

When you point it at an output, it reads:

tak-all-outputs.md, the standalone outputs list (Competition and Bridge).
tak-oor.md for the outcomes you've already named, so it can tell whether an output maps to one you have or points to a new one.
Each output's own source citations (e.g. pre-sow-tak-competitions.md:398) so every claim traces back to a real line.
It does not read outputs-outcomes-tak.md (stale).

Solo pass with you, one output at a time, one question at a time.

1. Pick the output. You name it or point to the line in tak-all-outputs.md.
2. Starting-point check. It lays out what's known from the docs (cited) and what's missing, so you both see where you're starting from.
3. Surface the assumption. It walks Bland's categories to find the bet: Desirability (do they want it?), Viability (should we do it?), Feasibility (can we do it?), Misc (anything that doesn't fit). For an already-shipped output, feasibility is mostly answered, so it leans on the others. For an in-progress or just-considered output, feasibility may still be live.
4. Propose the assumption, then stop. Bland sticky format: We believe [statement]. One sentence, positive, no questions, 2 to 6 months out, tagged by category. It does not add the "we will know this is true if" clause, that's the Experiment Card's job. You confirm or rewrite before it's finalized.
5. Baseline check. Do we have a measured number already, yes / partial / none, cited.
6. Write the card to the artifact, then point you to the next step (the Experiment Card).

Note baked into the skill: usability is not a standalone category here. If a Balance Team member pushes for it, the skill flags it so you can hear the argument, check whether it actually overlaps with desirability (or another category), and pivot to accommodate it if it genuinely stands on its own.

#4 Assumption becomes two parts:

Claude's inferred assumption(s) to get you going, each tagged 🟧 (my inference from the output's pain/problem context, not from the source), in Bland sticky format with a category.
1 or 2 questions to the Balance Team that use the pain point behind the output to get your juices flowing: is my inference right, and what else could be assumed or observed.
On the #11 example:

Assumption (🟧 Claude's inference from the pain context, react to it):
[Desirability] We believe GRG creators will edit GRGs mid-task instead of avoiding edits, because the manual re-sequencing burden is removed.

For the Balance Team:

Is "no longer avoiding edits" the real behavior shift, or is the bigger one something else (relabel faster, trust the output more)?
Beyond re-sequencing, what other pain did this output touch that we should turn into its own assumption?

---

Template:

Output: [the solution in the source's own words] (source:line)

Pain + who: [who feels it and what the pain is]. Cited where the docs say it; 🟧 where it's an inference.

Assumption (🟧 Claude's inference from the pain context, react to it):
[Category] We believe [statement].
(one or more; Desirability / Viability / Feasibility / Misc)

For the Balance Team:

[question 1: is the inferred assumption right?]
[question 2: what else could be assumed or observed from this pain?]
Riskiest (only if more than one assumption): [nominates the one to test first; a nomination, not the final pick]

Baseline: yes / partial / none (source:line)

To test it: [what's needed, often access to users in prod]

-

Filled on #11 (Automatic renumbering):

Output: Automatic renumbering of marker sequences on edit; swipe gesture adjusts order. (pre-sow-tak-competitions.md:386-387)

Pain + who: GRG creators. "Fixing numbering sequences after hundreds of labels... extremely frustrating and time-consuming" (:246-250).

Assumption (🟧 Claude's inference from the pain context, react to it):
[Desirability] We believe GRG creators will edit GRGs mid-task instead of avoiding edits, because the manual re-sequencing burden is removed.

For the Balance Team:

Is "no longer avoiding edits" the real behavior shift, or is the bigger one something else (relabel faster, trust the output more)?
Beyond re-sequencing, what other pain did this output touch that we should turn into its own assumption?
Riskiest: single assumption, no nomination needed.

Baseline: partial. 9-12% of labels needed correction (:247); no in-field behavior measure.

To test it: an operator creating GRGs in prod. Blocked until we have access to users in prod.


