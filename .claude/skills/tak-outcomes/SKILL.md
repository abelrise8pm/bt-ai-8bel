---
name: tak-outcomes
description: TAK Bridge contract outcome identification. Use when writing backlog items, sprint reports, drumbeats, or SOW deliverables and you need to identify or articulate Mission Outcomes, Enabling Outcomes, or Mission Impact for the TAK work.
disable-model-invocation: true
---

# TAK Bridge: Outcome Identification

This skill helps Abel identify and articulate outcomes for the TAK Bridge contract (8-week SOFMC/SOCOM engagement). It applies Rise8's outcome-oriented framework to TAK-specific context.

## The Three Things You Are Trying to Name

**Mission Impact (WHY)**
The strategic-level change for SOCOM operators or the Program Office. Lagging indicator — confirms success after outcomes change. Always quantified, always tied to the mission.
Example for TAK: "Reduced tactical risk during building detection operations — operators spend more time on the mission environment and less time troubleshooting the tool."

---

**Mission Outcome (HOW — user-facing)**
A measurable change in the human behavior of an end user (Operator or GRG Creator) that solves a mission challenge.

- **Focus:** Human behavior, not tool functionality. If the subject is "the tool" or "the system," it is an Output, not an Outcome.
- **Structure:** `[Actor] + [Past-Tense Behavior Shift] + [Context], because [Friction/Pain] was reduced.`
- **Dojo Standard:** It is only a Mission Outcome if it describes what a person does differently in the real world.
- **Past Tense Rule:** Draft as an achieved state — "increased," "ceased," "reduced" — to ensure it is measurable.
- **Example:** SOF Operators increased their focus on the mission environment, as the frequency and manual effort required for configuring and correcting GRGs on the device screen was reduced.

---

**Enabling Outcome (HOW — internal)**
A measurable change in the behavior or capability of the Rise8 product and engineering team or from the customer and partners (SOCOM, SOFMC, TPC and even BAH).

- **Focus:** Organizational velocity, architectural runway, and team capacity — not operator experience.
- **Structure:** `[Internal Team] + [New Capability/Behavior Shift], which [Result/Metric] to [Mission Priority].`
- **Dojo Standard:** It must show how the team became more capable or efficient — not what the tool does.
- **Example:** The Engineering Team ceased platform-specific code porting, which reclaimed 40% of sprint capacity to accelerate AI auto-labeling features.

---

## The Causal Chain — The "So What?" Test

Every outcome must be checkable against this flow. If a link is missing, the synthesis is incomplete.

1. **Output (The What):** The technical delivery — e.g., keystore path fix, SDK bump, TAK UI prototype.
2. **Enabling Outcome (The Engine):** How the Rise8 team changed — e.g., pipeline now produces signed builds without manual intervention.
3. **Mission Outcome (The Behavior):** How the operator changed — e.g., operators ran detection once and trusted the result.
4. **Mission Impact (The Value):** Why the mission is better — e.g., reduced time troubleshooting, faster decisions in the field.

---

## The TAK Contract Context

**End Users:** SOCOM operators using the AI GRG plugin in the field on Android devices.
**Customer Proxies:** Nik (Program Office lead), Jonathan Miller (field feedback), Chad Molyet (SOCOM DT), Nathan and Kelly (BAH contractors)
**Four SOW Workstreams:**
1. Plugin SDK updates (5.4, 5.6, 5.7 version management)
2. TAK UI Migration (compliant first, native later)
3. Model Improvements (detection reliability and performance)
4. GOTS Evaluation (Trailblazer, Combat Swim, SpotPlot)

**The mission:** Get the AI GRG plugin reliably in the hands of SOCOM operators — signed, fielded, and trusted.

---

## How to Use This Skill

When Abel provides a backlog item, sprint update, drumbeat paragraph, or SOW task, do the following:

### Step 1: Identify the workstream
Which of the four SOW workstreams does this work belong to?

### Step 2: Classify the work
Is this:
- **Operator-facing** (changes what operators experience or can do)?
- **Enabling** (changes what the team can deliver, but operators don't feel it directly)?

### Step 3: Name the outcome
Use this format:

```
Workstream: [SDK / TAK UI / Model Improvements / GOTS Evaluation]
Type: [Mission Outcome / Enabling Outcome]
Outcome: [Observable behavior change — who does what differently]
Mission Impact: [What this enables for SOCOM operators or the Program Office]
```

### Step 4: Gut-check with the "So What?" test
Ask: "So what does this mean for an operator in the field?"
If the answer is "nothing yet" — it is an Enabling Outcome.
If the answer changes what the operator can do or trust — it is a Mission Outcome.

---

## TAK-Specific Outcome Examples

| Work | Type | Outcome | Mission Impact |
|------|------|---------|----------------|
| Keystore path fix in pipeline | Enabling Outcome | Pipeline produces signed .mil APK on every build | Operators receive a field-deployable build without manual workarounds |
| Zoom detection bug fix | Mission Outcome | Operators detect buildings accurately regardless of zoom level | Plugin is trusted for consistent results in the field |
| TAK UI Compliant plugin | Enabling Outcome | Plugin ships with every ATAK/WINTAK release automatically | Operators always have the latest version without manual installs |
| SDK 5.6 regression testing | Enabling Outcome | Plugin is verified to run on fielded SDK versions | Operators on 5.4 and 5.6 devices are not left behind |
| GOTS evaluation findings | Mission Outcome | Program Office has a recommendation on AI improvement opportunities across plugins | SOCOM reduces cognitive burden for operators across the plugin portfolio |

---

## Strict Rules

- **The Human Rule:** If the subject is "the tool" or "the system," it is an Output. Outcomes must have human actors — operators, creators, or the Rise8 team.
- **The Past Tense Rule:** Draft outcomes as achieved states — "increased," "ceased," "reduced." This forces measurability.
- **The Zero Redundancy Rule:** The Outcome (behavior) must be distinct from the Impact (result).
  - Incorrect: "Outcome: Saved 2 hours. Impact: Had 2 more hours."
  - Correct: "Outcome: Operators ceased manual re-runs of detection. Impact: Conducted a secondary sweep of the extraction point before mission launch."
- **The Grounded Rule:** Avoid jargon unless validated. Stick to the physical realities — tapping, swiping, correcting, re-running.

## Anti-Patterns to Avoid on TAK

- **Calling a pipeline fix a Mission Outcome.** Operators do not feel the pipeline — they feel the result of it. It is an Enabling Outcome.
- **Calling a tech debt ticket an outcome at all.** Frame it as an Enabling Outcome with a clear connection to what it unblocks for the team.
- **Writing outputs as outcomes.** "TAK UI research complete" is an output. "Rise8 team established a documented native vs. escape hatch baseline, enabling an informed conversation with Nathan at BAH" is an Enabling Outcome.
- **Skipping the Mission Impact line.** Every Enabling Outcome must trace to a Mission Impact or it should not be in the backlog.
- **Making the tool the subject.** "The plugin now detects buildings reliably" is an Output. "Operators ran detection once and trusted the result" is a Mission Outcome.

---

## Reference Framework

This skill applies Rise8's outcome-oriented thinking framework. For deeper methodology:
- Impact Mapping: `.claude/skills/product-owner-beta-outcome-oriented-thinking/references/impact-mapping.md`
- Outcome Roadmaps: `.claude/skills/product-owner-beta-outcome-oriented-thinking/references/outcome-roadmaps.md`
- Hypothesis Formation: `.claude/skills/tak-hypothesis/SKILL.md`
