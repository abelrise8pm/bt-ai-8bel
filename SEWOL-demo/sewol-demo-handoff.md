# SEWOL Demo - PM Hand-off Summary

Paste-ready context for a new session. Source of truth for detail is [sewol-demo-week1_jun8.md](./sewol-demo-week1_jun8.md); supporting docs are the [kickoff transcript](./SEWOL-demo-kickoff.md), [OVD](./SEWOL_Operational_Vision.md), and [Rise8 Technical Volume](./Rise8_Technical_Volume.md).

## TLDR

Rise8 is preparing a credible July demo of the SEWOL **Plan-Pair-Schedule** workflow (GEO-only) built on Mission O/S Core, to win a spot in a three-vendor, three-month Phase I competition. The team (Mary, Abel as PMs, plus engineers including Zach) paired and produced a stack-ranked plan with owners and COAs. Allocation of who works on the demo is still open (Dan to confirm with Max and Adam). Work that runs on sample data starts now; onboarding to Mission O/S Core gates anything that deploys or shows cATO.

## What the demo must show

The Plan-Pair-Schedule workflow end to end: an EWO ingests an STO from sample data (or creates one), manages GEO-only targets, sees them on a map, runs automated pairing with one command, sees the schedule on a Sync Matrix, and exports it. Plus an integrator can onboard and build on the framework. Credibility floor (Dan): ontology/schema for STO and SPINS, cATO, and SDK at platform and application level.

## Why it matters

July is the down-select gate. Government picks up to three vendors for a three-month competition (MVP target November), then down-selects one for Phase II (six months, $10M) and Phase III (to three years, $40M). Starting now also gives the August team a running start.

## How Dan framed winning

Build on Mission O/S Core; cATO as the lead differentiator; third-party integrators as first-class citizens (true MOSA, Rise8 not the center of gravity); SDK at platform and application level; AI/agentic as a core platform user; Rise8 agile/design process in the tabletop exercise. AI is not required for July, only evidence the team is thinking about it.

## Where we left off

The Week 1 recap is complete: chosen workflow, what the demo must show, what we know, assumptions, open items, and a stack-ranked plan with owners and COAs ([sewol-demo-week1_jun8.md](./sewol-demo-week1_jun8.md), "Where we can start" section).

## Immediate next actions (Start now)

1. **Ontology + schema for STO and target data** (Engineers). Confirm engineers have what they need. SPINS depth is gated on domain input from Berner and Clark (Mary has insights, call TBD); proceed on STO and target data without waiting.
2. **Operator experience flows** (PMs + Jonathan). Get access to Dan's prototype; draft an EWO process map of the Mission Planning workflow from the OVD and prototype.
3. **Pairing / scheduling domain service, GEO-only** (Engineers + PM assist). Prioritize the engine inputs/constraints; scope to a representative subset that makes pairing legible on screen.
4. **SDK criteria spike** (Engineers). Define what a third-party integrator needs to build without Rise8 engineers. This is the named differentiator and the least-defined item.
5. **Mission O/S Core onboarding** (PMs + Engineers). Reach out to Drew McFarland; onboard platform engineers first, rest of team after Dan confirms allocation.

Deferred: AI/agentic slice, live M2M with Project 7 (build the manual/resilient path instead), and other exceed-baseline items (Chatsurfer, MEO/LEO, digital support center, as scoping spikes only).

## Open decisions

- Allocation: who works on the demo, and what happens to SOAP, the TACLAN Manager prototype, and other current work. Dan to confirm with Max and Adam.
- Cadence and PM process setup (Mary, Abel with Dan).
- Tabletop exercise format (unknown).
- Name check: verify whether "Drew Knife" (item 1) and "Drew McFarland" (item 5) are the same person before the team works off the plan.

## How to work with Abel (PM)

Keep outputs plain and concise. Cite claims to the source doc or transcript line; do not infer or coin terms. Tag assumptions separately from sourced facts. Abel works one topic at a time and confirms before moving on. Inventories and syntheses go in files, not long inline responses.
