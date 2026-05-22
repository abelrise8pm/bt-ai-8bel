---
name: tak-issue-triage
description: Synthesize raw team conversations (Slack, email, meetings, files) into a structured PM-level insight card. Surfaces what's broken, why it matters, the risk, what's being done, and what done looks like — without assumptions or editorializing.
argument-hint: "[paste the conversation directly, or reference specific files to read]"
---

# TAK Issue Triage

A synthesis skill for the TAK Bridge contract. Abel brings raw team conversation — Slack threads, email chains, meeting notes, or file references — and this skill produces a structured PM-level insight card that is accurate, neutral, and free of assumptions.

This skill sits upstream of `/tak-issuedrafting`. Triage first, then draft.

---

## Collaboration Workflow

Follow this sequence every time:

1. **Abel provides input** — a pasted conversation, a file reference, or both.
2. **Scan for context** — read any files Abel explicitly points to. Always auto-scan the latest `tak-daily-{month}_{date-range}.md` file in `TAK-ALL/r8-internal/Daily-TAK-notes/`.
3. **Check for multiple issues** — before generating any output, identify whether the source contains more than one distinct issue or theme. If it does, list each issue and state the reason it is considered separate. Then ask Abel: "I identified [N] issues. Should I produce a separate card for each, or address them together?" Wait for confirmation before proceeding.
4. **Flag and clarify before generating output:**
   - Identify anything that could not be determined from the provided context. State it explicitly rather than filling in the gap.
   - Identify any engineer-heavy terms or methods that Abel may need explained in plain language. Offer a one-line layman explanation for each.
   - Ask only what is genuinely needed to produce an accurate card. Do not ask questions that can be answered from the context.
5. **Generate the PM Card** — only after gaps and terms are addressed.
6. **Close with a prompt** — after the card is delivered, ask: "Do you need clarification on anything in this card, or are you ready to move this to `/tak-issuedrafting`?"

---

## PM Card Format

**[Card Title]** — a single phrase or sentence that captures the broader issue or opportunity at a glance. Used as the header for the full card.

---

**What's broken / the opportunity:** *{one-line italic headline}*
{Concise summary in PM and stakeholder terms. Uses accurate technical and domain language but describes it at the level of product risk, feasibility, and viability. No implementation detail.}

**Source / How it surfaced:** {Date, place, scenario, and key people. Under 14 words.}

**Why:** *{one-line italic headline}*
{The motivation behind why this matters to the project. Tied to delivery, field use, or contract outcomes.}

**Blocker or Risk if not addressed:** *{one-line italic headline}*
{What is at stake if this is not resolved. Stated as a consequence, not a prediction.}

**What we're doing about it:** *{one-line italic headline}*
{What the team has agreed to do, who owns it, and at what scope. Only what was explicitly stated.}

**What done looks like:** *{one-line italic headline}*
{The observable outcome that signals this is resolved. Stated in terms Abel can confirm without deep technical knowledge.}

**How to prompt the engineers / suggested next steps:**
{Two to three specific questions Abel can ask the relevant engineer or lead to confirm ownership, timeline, and acceptance criteria. Framed as prompts, not directives.}

---

## Discipline Rules

These apply to every card generated. No exceptions.

- **No assumptions.** If something was not explicitly stated in the provided context, flag it as unknown rather than infer it.
- **No intensifier adverbs or adjectives.** Do not use words like "critical," "severe," "alarming," "major," "deeply," or similar language that editorializes severity. State the facts. Abel assesses the severity.
- **No injected framing.** The card reflects what was said, not what Claude thinks should be emphasized.
- **Flag gaps explicitly.** If context is missing, name what is missing and where it would need to come from.
- **Explain technical terms.** If engineer-heavy language appears in the source, offer a plain-language explanation before generating the card. Do not assume Abel knows the term.

---

## Multi-Issue Handling

If more than one distinct issue or theme is identified in the source:

1. List each issue by name
2. State the reason each is considered a separate issue
3. Ask Abel: "I identified [N] issues. Should I produce a separate card for each, or address them together?"
4. Wait for confirmation before generating any card

Do not produce multiple cards without explicit confirmation from Abel.

---

## Scope

**Do:**
- Accept any format of input: raw paste, file reference, or both
- Auto-scan the latest daily notes file every time
- Flag what could not be determined before generating output
- Explain technical terms before generating the card
- Check in with Abel before producing multiple cards
- Prompt for `/tak-issuedrafting` after every card

**Don't:**
- Generate the card before gaps and terms are addressed
- Fill in missing context with assumptions
- Use evaluative or intensifying language
- Automatically produce multiple cards without Abel's confirmation
- Apply this skill outside the TAK Bridge contract context
