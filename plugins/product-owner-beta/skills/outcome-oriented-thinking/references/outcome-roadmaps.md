# Outcome-Oriented Roadmaps

## Overview

An outcome-oriented roadmap is a strategic communication device that aligns team execution with organizational mission and key metrics. Rather than committing to specific deliverables, it emphasizes measurable changes in user or system behavior leading to mission results.

The roadmap frames work as hypothesis-driven experiments, preserving team autonomy while maintaining stakeholder alignment.

## Core Structure

Each roadmap item represents one hypothesis-driven experiment with four components:

### 1. Problem/Opportunity

**Purpose:** Describe unmet user needs and current mission impact

**Content:**
- Current situation description
- Affected users or systems
- Quantified baseline impact
- Why this matters now

**Format:**
```
Problem/Opportunity:
[Current state description]

Users affected: [Specific personas]
Current impact: [Quantified metrics showing pain]
```

**Example:**
```
Problem/Opportunity:
Veterans submit disability claims with incomplete evidence, requiring additional requests that delay processing.

Users affected: 150,000 annual claimants
Current impact: 60% of claims require evidence requests; average processing time 90 days vs. 30-day target
```

### 2. Hypothesis

**Purpose:** State beliefs about how solutions drive behavior changes and lead to mission impact

Use the canonical hypothesis format from SKILL.md, which includes quantified baselines "(from X to Y)" and leading indicators with timeframes.

This makes assumptions explicit and defines the cause-and-effect chain being tested.

**Example:**
```
We believe implementing a pre-submission checklist with required evidence
will drive veterans to submit complete claims on first attempt (from 40% to 75%)
and lead to reduced claim processing time (from 90 days to 50 days)
```

**Key characteristics:**
- States the proposed solution
- Specifies measurable behavior change
- Connects to strategic mission impact
- Remains falsifiable (can be proven wrong)

### 3. Outcome

**Purpose:** Define measurable evidence of behavior change

Outcomes are leading indicators that predict whether the mission impact will be achieved. See the canonical hypothesis format in SKILL.md for the validation criteria structure.

**Example:**
```
Our hypothesis is valid if:
- 70%+ of veterans view the checklist before submitting claims
- Evidence requests decrease from 60% to 35% of claims within 3 months
- Average time to complete claim form decreases from 45 minutes to 30 minutes
- Veteran satisfaction with submission process increases from 3.2 to 4.0+ out of 5
```

**Outcome characteristics:**
- Observable and measurable
- Focused on behavior, not features
- Time-bound when possible
- Mix of quantitative and qualitative measures

### 4. Impact

**Purpose:** Measurable mission/business results representing lagging indicators

**Format:**
```
If successful, expect:
- [Mission metric 1 improvement]
- [Mission metric 2 improvement]
- [Business value realization]
```

Impact metrics are strategic outcomes that matter to leadership and customers.

**Example:**
```
If successful, expect:
- Average claim processing time decreases from 90 days to 50 days (44% improvement)
- Claims backlog reduces from 125,000 to 75,000 (40% reduction)
- Support call volume decreases by 30% due to clearer submission guidance
- $2M annual savings from reduced processing overhead
```

**Impact characteristics:**
- Strategic-level metrics
- Lagging indicators (confirm after outcomes change)
- Connected to organizational goals
- Quantified with targets

## Outcome Categories

Outcomes fall into two categories:

### Supporting Outcomes

**Definition:** Enable organizational capabilities without directly delivering user value

**Examples:**
- Continuous delivery pipeline reduces deployment time from 2 weeks to 1 day
- Automated testing catches 90%+ of defects before production
- Developer onboarding time decreases from 4 weeks to 1 week
- Infrastructure costs decrease by 30% through optimization

**When to use:**
- Technical enablement work
- Platform and tooling improvements
- Process optimization
- Organizational capability building

**Why separate these:**
Supporting outcomes don't immediately affect end users but enable faster, higher-quality user-facing delivery.

### User-Facing Outcomes

**Definition:** Deliver direct value to end users through behavior changes

**Examples:**
- Veterans submit complete claims 75%+ of the time (up from 40%)
- Patients schedule appointments without calling (80% self-service)
- Developers deploy code without operations team involvement (90% autonomous)
- Citizens find information in <2 minutes (vs. 10+ minutes previously)

**When to use:**
- Features and services users directly interact with
- Improving existing user experiences
- Solving user pain points
- Enabling new user capabilities

**Why separate these:**
User-facing outcomes directly move mission metrics that stakeholders and customers care about.

### Classification Rules

When uncertain, apply these rules:

| Behavior Change | Impact | Classification |
|-----------------|--------|----------------|
| External (end users/customers) | External | User-Facing |
| Internal (employees/systems) | Internal | Supporting |
| Internal (employees/systems) | External | User-Facing |

The third case matters: internal process improvements that drive external mission results (e.g., manufacturing efficiency → revenue growth) are user-facing because the impact reaches customers or mission beneficiaries.

## Why Use Outcome-Oriented Roadmaps

### 1. Aligns Daily Work with Product Vision

Teams understand how their work connects to strategic goals without being told exactly what to build.

**Traditional feature roadmap:**
"Q2: Build mobile app with these 10 features"

**Outcome-oriented roadmap:**
"Q2: Enable veterans to submit claims from mobile devices with 75%+ first-time completion rate"

The outcome provides direction without prescribing the exact solution, allowing teams to discover the best approach.

### 2. Maintains Flexibility for Agile Exploration

Prescriptive feature roadmaps become obsolete when assumptions prove wrong. Outcome roadmaps adapt as teams learn.

**Scenario:** Team builds the prescribed mobile app but discovers veterans prefer SMS-based submission over app installation.

**With feature roadmap:** Team built the wrong thing; roadmap is now invalid

**With outcome roadmap:** Team pivots to SMS solution; outcome remains valid

### 3. Preserves Team Autonomy

Teams choose solutions based on their expertise and learning, rather than following prescriptive requirements.

**Empowerment through outcomes:**
- Engineers propose technical solutions
- Designers explore UX alternatives
- Product managers validate with users
- Team collectively decides the approach

### 4. Builds Stakeholder Alignment

Stakeholders care about mission impact, not specific features. Outcome roadmaps communicate what matters.

**Executive question:** "When will claim processing time improve?"

**Feature roadmap answer:** "We'll ship the mobile app in Q2, desktop checklist in Q3, and API integration in Q4"

**Outcome roadmap answer:** "We expect 30% processing time improvement in Q2 based on increased first-time completion rates; will validate and iterate in Q3"

The outcome answer directly addresses the strategic concern.

## When to Implement

### Post-Discovery & Framing

After vision and priorities are settled but before detailed execution planning.

**Prerequisites:**
- Clear mission objectives established
- Problem statements validated
- High-level impact mapping completed
- Stakeholder alignment on priorities

**Readiness signals:**
- Team understands user pain points
- Baseline metrics are established
- Leadership agrees on success criteria
- Funding and resources allocated

### When Backlog Misalignment Exists

Current work doesn't clearly connect to strategic goals. Engineers ask "why are we building this?"

**Symptoms:**
- Teams deliver features but metrics don't improve
- Engineers can't explain how their work connects to mission
- Product backlog has 100+ stories with no clear priority
- Stakeholders question value of recent deliveries

**Outcome roadmap fixes this by:**
- Making impact explicit for every initiative
- Removing work that doesn't connect to outcomes
- Providing clear prioritization criteria

### Regular Cadences (Monthly/Quarterly)

Review and update roadmaps based on learning and changing priorities.

**Monthly:**
- Update outcome metrics with latest data
- Adjust hypotheses based on experiments
- Reprioritize based on impact evidence

**Quarterly:**
- Revise impact targets based on strategic changes
- Add new initiatives based on emerging needs
- Sunset completed or invalidated hypotheses

### After Releases Producing Empirical Evidence

Use production data to validate hypotheses and inform next steps.

**Post-launch review:**
- Did outcomes change as predicted?
- Which hypotheses were validated/invalidated?
- What should be the next experiment?
- What should be doubled down on or abandoned?

**Evidence-based reprioritization:**
If first-time completion increased from 40% to 55% (not 75% target), decide:
- Continue iterating on current solution?
- Pivot to different approach?
- Good enough; move to next priority?

## Creating an Outcome-Oriented Roadmap

### Step 1: Identify Strategic Priorities (30 minutes)

Start with organizational goals and mission metrics.

**Questions to answer:**
- What are our top 3 strategic goals this quarter/year?
- Which mission metrics indicate progress toward those goals?
- What baseline performance exists today?
- What target performance would constitute success?

**Example strategic priorities:**
1. Reduce veteran claim processing time from 90 to 30 days
2. Increase small business contract awards by 25%
3. Improve patient appointment adherence from 65% to 85%

### Step 2: Frame Problems (45 minutes per priority)

For each strategic priority, articulate the underlying problems using problem statement framework.

**Use comprehensive or streamlined template:**

```
Current Situation: [What exists today]
Problem: [Core issue causing pain]
Actor Effects: [Impact on specific users/stakeholders]
Desired Target Results: [Measurable outcomes when solved]
```

**Example:**
```
Current Situation: Veterans submit disability claims without understanding evidence requirements
Problem: 60% of claims require additional evidence requests, delaying processing
Actor Effects: Veterans wait 90+ days for decisions; claims processors spend 30% of time requesting evidence
Desired Target Results: 75%+ first-time completion rate; <50 day average processing time
```

### Step 3: Map Impact (60 minutes per priority)

Use impact mapping to work backward from mission impact through actors and outcomes to potential deliverables.

**Impact mapping layers:**
1. Mission Impact - Strategic goal
2. Actors - Who can influence this?
3. Outcomes - How should actors behave differently?
4. Deliverables - What might we build?

**Example (abbreviated):**

**Impact:** Reduce claim processing from 90 to 30 days

**Actors:**
- Veterans submitting claims
- Claims processors reviewing evidence

**Outcomes:**
- Veterans submit complete claims 75%+ of time (vs. 40%)
- Processors spend <5% of time requesting evidence (vs. 30%)

**Deliverables:**
- Pre-submission checklist
- AI document classification
- Guided claim wizard

### Step 4: Prioritize Using ICE (30 minutes)

Score each potential deliverable using Impact, Confidence, Effort.

**ICE Framework:**

**Impact (1-10):** How much does this move the outcome metric?
- 10 = Moves metric by 50%+
- 5 = Moves metric by 20-30%
- 1 = Moves metric by <5%

**Confidence (1-10):** How certain are we this will work?
- 10 = Strong evidence from data/research
- 5 = Moderate confidence from analogies
- 1 = Pure guess

**Effort (1-10):** How much time/cost to build?
- 10 = <1 week
- 5 = 1-2 months
- 1 = 6+ months

**ICE Score = (Impact × Confidence) / Effort**

**Example scoring:**

| Deliverable | Impact | Confidence | Effort | ICE Score |
|-------------|--------|-----------|--------|-----------|
| Pre-submission checklist | 8 | 9 | 9 | 8.0 |
| Guided claim wizard | 9 | 7 | 4 | 15.8 |
| AI document classification | 9 | 6 | 2 | 27.0 |
| VSO collaboration portal | 6 | 5 | 3 | 10.0 |

**Decision:** Start with pre-submission checklist (quick win), then wizard, then AI classification.

### Step 5: Frame Hypotheses (15 minutes per initiative)

Convert top-priority deliverables into testable hypotheses using the canonical hypothesis format from SKILL.md.

**Roadmap extension:** For roadmap items, also include lagging indicators that confirm success after hypothesis validation:
- **Leading indicators** (from canonical format) - Early signals during experiment
- **Lagging indicators** (roadmap extension) - Confirmation metrics after success

**Example:**
```
We believe implementing a pre-submission checklist with required evidence
will drive veterans to submit complete claims on first attempt (from 40% to 75%)
and lead to reduced claim processing time (from 90 days to 50 days)

Our hypothesis is valid if:
- 70%+ of veterans view the checklist before submitting
- Evidence requests decrease from 60% to 35% within 3 months
- Average form completion time decreases from 45 to 30 minutes

If successful, expect:
- Average processing time decreases from 90 to 50 days (44% improvement)
- Claims backlog reduces by 40%
- Support call volume decreases by 30%
```

### Step 6: Sequence and Timeline (30 minutes)

Arrange initiatives in a timeline showing dependencies and sequencing.

**Sequencing considerations:**
- Dependencies (what must come first?)
- Quick wins vs. strategic bets
- Capacity and team availability
- Risk mitigation (derisk unknowns early)

**Example roadmap structure:**

**Q1: Foundation**
- Initiative 1: Pre-submission checklist (quick win)
- Initiative 2: Baseline instrumentation for metrics

**Q2: Iteration**
- Initiative 3: Guided claim wizard (building on checklist learnings)
- Initiative 4: Evidence request automation (supporting outcome)

**Q3: Scale**
- Initiative 5: AI document classification (strategic bet)
- Initiative 6: Integration with medical providers (enabler)

Each initiative includes:
- Problem/Opportunity
- Hypothesis
- Outcome (leading indicators)
- Impact (lagging indicators)

## Real-World Example: Veteran Claim Processing

### Q1 Initiative: Pre-Submission Checklist

**Problem/Opportunity:**
Veterans submit disability claims without understanding evidence requirements, causing 60% of claims to require additional evidence requests. This delays processing to 90+ days vs. 30-day target.

Users affected: 150,000 annual claimants
Current impact: 60% evidence request rate; 90-day average processing time

**Hypothesis:**
We believe implementing a pre-submission checklist showing required evidence for each claim type
will drive veterans to submit complete claims on first attempt (from 40% to 70%)
and lead to reduced claim processing time (from 90 days to 60 days)

**Outcome (Our hypothesis is valid if):**
- 70%+ of veterans view the checklist before claim submission
- Evidence requests decrease from 60% to 40% of claims within 3 months
- Average form completion time remains <35 minutes (ensuring checklist doesn't add friction)
- Veteran satisfaction with submission process increases from 3.2 to 4.0+ out of 5

**Impact (If successful, expect):**
- Average claim processing time decreases from 90 days to 60 days (33% improvement)
- Claims backlog reduces from 125,000 to 100,000 (20% reduction)
- Support call volume related to evidence questions decreases by 25%
- Claims processor time spent requesting evidence reduces from 30% to 15%

**Timeline:** 6 weeks (4 weeks build, 2 weeks rollout)

---

### Q2 Initiative: Guided Claim Wizard

**Problem/Opportunity:**
Building on Q1 checklist success (evidence requests reduced to 40%), veterans still struggle with complex claim types requiring 10+ evidence documents. These claims have 70% evidence request rates vs. 30% for simple claims.

Users affected: 45,000 annual complex claimants
Current impact: 70% evidence request rate on complex claims; 120-day average processing for this segment

**Hypothesis:**
We believe implementing a step-by-step guided wizard with context-sensitive help and progress saving
will drive veterans to submit complete complex claims on first attempt (from 30% to 60%)
and lead to reduced processing time for complex claims (from 120 days to 70 days)

**Outcome (Our hypothesis is valid if):**
- 80%+ of complex claim initiators use the wizard (vs. traditional form)
- Complex claim evidence requests decrease from 70% to 45% within 3 months
- Complex claim abandonment rate decreases from 25% to 10%
- VSO representatives report 50% reduction in time spent helping with complex submissions

**Impact (If successful, expect):**
- Average complex claim processing time decreases from 120 days to 70 days (42% improvement)
- Overall claim processing time (all types) decreases from 60 days to 45 days (25% further improvement)
- Complex claims backlog reduces by 35%
- Veteran satisfaction for complex claims increases from 2.8 to 3.8+ out of 5

**Timeline:** 10 weeks (8 weeks build, 2 weeks rollout)

**Dependencies:** Requires Q1 checklist completion for reusable evidence validation logic

---

### Q2 Initiative (Supporting): Evidence Request Automation

**Problem/Opportunity:**
Claims processors spend 15% of their time (down from 30% pre-Q1) manually drafting evidence request letters. Each letter requires 20 minutes to customize and send.

Users affected: 75 claims processors
Current impact: 1,125 hours/month spent on manual letter drafting; 5-day average turnaround for evidence requests

**Hypothesis:**
We believe implementing automated evidence request generation with pre-filled templates
will drive claims processors to send evidence requests in <2 minutes per request (from 20 minutes)
and lead to faster evidence request turnaround (from 5 days to 1 day)

**Outcome (Our hypothesis is valid if):**
- 90%+ of evidence requests use automated generation
- Average time to draft and send request decreases from 20 minutes to <2 minutes (90% reduction)
- Evidence request turnaround time decreases from 5 days to 1 day
- Processor satisfaction with evidence request workflow increases from 2.5 to 4.0+ out of 5

**Impact (If successful, expect):**
- 1,000+ hours/month freed up for processors to focus on claim reviews (supporting outcome)
- Overall claim processing capacity increases by 15% without adding staff
- Evidence request quality improves (fewer follow-up clarifications needed)
- Processing time further reduced by 5 days on average

**Timeline:** 6 weeks (4 weeks build, 2 weeks rollout)

**Dependencies:** None (can run parallel to wizard work)

## Template

Use this template for each roadmap initiative. The Hypothesis section follows the canonical format from SKILL.md:

```markdown
## [Initiative Name]

**Problem/Opportunity:**
[Current situation description]

Users affected: [Specific personas and numbers]
Current impact: [Quantified baseline metrics]

**Hypothesis:**
We believe [deliverable/solution]
will drive [behavior change with quantified targets]
and lead to [mission impact with quantified targets]

**Outcome (Our hypothesis is valid if):**
- [Leading indicator 1 with target and timeframe]
- [Leading indicator 2 with target and timeframe]
- [Leading indicator 3 with target and timeframe]
- [Qualitative indicator]

**Impact (If successful, expect):**
- [Mission metric 1 improvement with quantified target]
- [Mission metric 2 improvement with quantified target]
- [Business value realization]
- [Secondary benefits]

**Timeline:** [Duration]

**Dependencies:** [What must complete first, if anything]
```

## Communicating the Roadmap

### To Executives

**Focus on:**
- Mission impact (lagging indicators)
- Strategic alignment
- Resource requirements
- Risk mitigation

**Format:**
- One-page summary per quarter
- Impact metrics prominently displayed
- Gantt chart showing sequencing
- Quarterly business review presentation

### To Engineers

**Focus on:**
- Problem context and user pain
- Hypotheses being tested
- Success criteria (outcomes)
- Technical constraints and dependencies

**Format:**
- Detailed initiative briefs
- User research and data supporting hypotheses
- Technical spike results
- Sprint planning inputs

### To Stakeholders

**Focus on:**
- How their needs are addressed
- Expected timelines for impact
- Ways to provide feedback
- How success will be measured

**Format:**
- Monthly email updates
- Interactive roadmap board (Miro, ProductBoard)
- Office hours for questions
- Feedback channels

## Anti-Patterns to Avoid

### Feature Roadmaps Disguised as Outcome Roadmaps

❌ **Bad:** "Outcome: Users have a mobile app"

✅ **Good:** "Outcome: 75% of users submit claims from mobile devices with 80%+ first-time completion rate"

**Fix:** Ensure outcomes describe behavior changes, not feature availability.

### Vague Hypotheses

❌ **Bad:** "We believe the new feature will improve user experience"

✅ **Good:** "We believe the pre-submission checklist will drive 70%+ first-time claim completion (from 40%) and reduce processing time by 30%"

**Fix:** Quantify behavior changes and specify the mechanism (what drives what).

### Missing Measurement

❌ **Bad:** Launch feature, move to next item, never validate outcomes

✅ **Good:** Instrument metrics before launch, monitor post-launch, validate hypothesis, iterate or pivot

**Fix:** Treat "Our hypothesis is valid if..." as acceptance criteria, not aspirations.

### Output Commitments Instead of Outcome Goals

❌ **Bad:** "We will ship Feature X, Y, and Z in Q2"

✅ **Good:** "We aim to achieve 30% reduction in processing time in Q2; current plan involves testing Features X and Y"

**Fix:** Commit to outcomes, propose solutions, preserve flexibility to pivot.

### Ignoring Evidence

❌ **Bad:** Hypothesis invalidated by data, but team continues building anyway

✅ **Good:** Hypothesis invalidated, team pivots to alternative approach or sunsets initiative

**Fix:** Treat roadmap as living document that updates based on learning.

## Summary

Outcome-oriented roadmaps:

1. **Frame work as experiments** - Hypotheses about cause and effect
2. **Preserve team autonomy** - Specify outcomes, not solutions
3. **Align stakeholders** - Communicate mission impact, not feature lists
4. **Enable learning** - Validate or invalidate based on evidence
5. **Adapt to change** - Update as assumptions prove true or false

**Structure each initiative with:**
- Problem/Opportunity (current state and impact)
- Hypothesis (belief about solution → behavior → impact)
- Outcome (leading indicators validating hypothesis)
- Impact (lagging indicators proving mission results)

Use outcome-oriented roadmaps to maintain strategic alignment while empowering teams to discover the best solutions through experimentation and learning.
