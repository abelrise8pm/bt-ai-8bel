# Metrics Fundamentals

## Overview

Data and Metrics Collection is the systematic approach to capturing, governing, and interpreting evidence that validates whether products, services, or delivery processes achieve desired outcomes.

The core principle: **Measure only what enables learning and decision-making.** Avoid metrics collected "for metrics' sake."

## Six Foundational Principles

### 1. Outcomes Over Outputs

Focus on user behavior changes and system impacts that drive mission results, not feature delivery counts.

**Output metric:** "Deployed 15 features this quarter"

**Outcome metric:** "Users complete tasks 40% faster, support calls decreased 25%"

### 2. Questions Precede Dashboards

Begin with decisions that need making, then collect data minimally to inform those decisions.

**Wrong approach:** "Let's instrument everything and see what's interesting"

**Right approach:** "What behavior change indicates success? What data proves this change occurred?"

### 3. Quality Trumps Quantity

Prioritize accuracy, freshness, and coverage over volume of metrics.

**Quality dimensions:**
- **Accuracy** - Is the data correct?
- **Freshness** - Is the data current enough to drive action?
- **Coverage** - Does the sample represent the population?
- **Consistency** - Is measurement stable over time?

### 4. Leading Indicators First

Guide early course corrections with forward-looking metrics. Validate with lagging indicators later.

Use leading indicators to steer; lagging indicators to prove impact.

### 5. Version Metric Definitions

Treat metric definitions as code with governance and change logs. When formulas change, track versions to preserve historical comparability.

**Metric definition template:**
```
Name: [Metric name]
Purpose: [What decision does this inform?]
Owner: [Who maintains this metric?]
Formula: [Exact calculation]
Data Sources: [Where does data come from?]
Calculation Window: [Time period and cadence]
Target: [Success threshold]
Version: [1.0, 1.1, etc.]
Change Log: [What changed and when]
```

### 6. Ethical by Design

Minimize data collection and protect sensitive information. Collect only what's necessary; delete when no longer needed.

**Privacy considerations:**
- Anonymize user data when possible
- Aggregate before sharing
- Set retention policies
- Document PII handling

## Evaluating Metric Quality (AAA Framework)

Before defining specific metrics, evaluate them against three criteria. A metric that fails any of these will not drive the behavior change needed.

### Actionable

**Definition:** The metric drives behavioral change and decision-making.

**Test questions:**
- If this metric moves, what action would we take?
- Can the team influence this metric through their work?
- Does improving this metric actually improve outcomes?

**Contrast with vanity metrics:** Vanity metrics (likes, downloads, page views) look impressive but don't drive action. They answer "how big?" without answering "so what?"

**Example:**
- Vanity: "1 million app downloads"
- Actionable: "40% of downloaders complete onboarding within 7 days"

The actionable metric tells whether downloads translate to engaged users and points to onboarding as the lever.

### Accessible

**Definition:** The metric is understandable and memorable, enabling quick feedback loops between action and results.

**Test questions:**
- Can a new team member understand this metric in under 2 minutes?
- Can we check this metric frequently enough to course-correct?
- Is the data available when decisions need to be made?

**Characteristics of accessible metrics:**
- Simple formula (avoid complex composites when simpler metrics work)
- Available in near-real-time for leading indicators
- Displayed where teams naturally look (not buried in reports)
- Named clearly (avoid jargon or acronyms without context)

**Example:**
- Inaccessible: "Weighted customer lifetime value adjusted for cohort seasonality"
- Accessible: "30-day retention rate" (% of users active 30 days after signup)

### Auditable

**Definition:** The metric maintains credibility with sponsors and skeptics through transparent, verifiable definitions.

**Test questions:**
- Can someone outside the team verify how this was calculated?
- Is the data source trustworthy and consistent?
- Are edge cases and exclusions documented?

**Auditability requirements:**
- Documented formula with numerator and denominator
- Named data sources with refresh frequency
- Version history when definitions change
- Exclusions and edge case handling specified

**Why auditability matters:**
- Stakeholders trust metrics they can verify
- Prevents "cherry-picking" accusations
- Enables debugging when metrics behave unexpectedly
- Supports compliance and governance requirements

### Applying AAA

When proposing a new metric, validate it passes all three:

| Metric Candidate | Actionable? | Accessible? | Auditable? | Verdict |
|-----------------|-------------|-------------|------------|---------|
| Monthly active users | Weak (what action?) | Yes | Yes | Needs pairing with behavior metric |
| Task completion rate | Yes (improve UX) | Yes | Yes | Good metric |
| Revenue | Yes | Yes | Yes | Good lagging indicator |
| "User happiness score" | Yes | Vague | Undefined | Needs rigorous definition |

If a metric fails any criterion, either improve it or choose a different metric.

## One Mission Metric That Matters (OMMTM)

### The Metric Tree Structure

Effective metric programs flow from mission to action through a hierarchical structure:

```
Mission
    -> One Mission Metric That Matters (OMMTM)
            -> Supporting Leading KPIs (limit to 5)
            -> Supporting Lagging KPIs (limit to 5)
```

The **OMMTM** is the single north-star metric that best represents mission success. All other metrics support and predict movement in this metric.

**Key principles:**
- Collaborate with stakeholders to define mission impact outcomes
- Identify ONE metric that matters most (not five "priorities")
- Limit supporting KPIs to five leading and five lagging indicators
- Every metric should connect back to the OMMTM

### OMMTM Examples by Domain

**Healthcare/VA:**
- **Mission:** AI-powered tools preventing harm for Veterans
- **OMMTM:** Eliminate annual treatment-failure deaths (target: 0; current: 22,500)
- **Supporting KPIs:** Patient Safety Indicators, readmission rates, medication adherence, infection rates

**Department of State:**
- **Mission:** Enable Americans to travel and conduct business abroad
- **OMMTM:** On-time passport delivery rate
- **Supporting KPIs:** Application completeness rate, interview-slot availability, processing time

**Air Force:**
- **Mission:** Deliver airpower when and where needed
- **OMMTM:** Mission-capable rate (aircraft available for tasking)
- **Supporting KPIs:** Sorties generated per aircraft-day, maintenance turnaround time

**Space Force:**
- **Mission:** Protect and defend space assets
- **OMMTM:** On-orbit mission availability
- **Supporting KPIs:** Resident space object custody time, anomaly detection rate

### Building Your Metric Tree

**Step 1: Start with the mission**
What ultimate impact does your organization exist to create?

**Step 2: Identify the OMMTM**
What single metric best indicates mission success? This should be:
- Directly connected to mission impact
- Measurable and unambiguous
- Something the organization can influence

**Step 3: Map supporting KPIs**
What leading indicators predict OMMTM movement? What lagging indicators confirm it?

**Step 4: Limit ruthlessly**
If everything is important, nothing is. Force prioritization to five or fewer supporting KPIs in each category.

## Leading vs. Lagging Indicators

### Leading Indicators (Forward-Looking)

**Definition:** Inputs you can influence now that predict future outcomes.

**Characteristics:**
- Actionable in the present
- Predict future performance
- Change quickly based on interventions
- Enable proactive adjustments

**Examples:**
- **Feature adoption rate** - Predicts long-term engagement
- **Page load speed** - Predicts conversion and retention
- **Appointment availability** - Predicts patient satisfaction
- **Test coverage** - Predicts defect rates
- **Deployment frequency** - Predicts time-to-market

**Use for:** Steering decisions, early course corrections, experimentation feedback

### Lagging Indicators (Backward-Looking)

**Definition:** Outputs that confirm past performance after results occur.

**Characteristics:**
- Measure outcomes after they happen
- Validate strategy effectiveness
- Change slowly over time
- Prove impact to stakeholders

**Examples:**
- **Retention rate** - Confirms long-term value delivery
- **Readmission rate** - Confirms care quality
- **Customer satisfaction score** - Confirms experience quality
- **Revenue growth** - Confirms business model
- **Incident rate** - Confirms system reliability

**Use for:** Validating hypotheses, reporting progress, strategic planning

### Balancing Leading and Lagging

Effective metric programs use both:

**Lead to steer:**
- Monitor daily/weekly
- Drive operational decisions
- Enable rapid experimentation
- Guide team focus

**Lag to prove:**
- Report monthly/quarterly
- Validate strategic direction
- Communicate to executives
- Justify investment

**Example pairing (reducing claim processing time):**

| Leading Indicators | Lagging Indicators |
|-------------------|-------------------|
| % claims submitted complete on first attempt | Average claim processing time |
| Average evidence request turnaround time | % claims processed within 30 days |
| Pre-submission checklist usage rate | Veteran satisfaction score |
| Automated validation accuracy | Claims backlog size |

Team monitors leading indicators daily to course-correct. Leadership reviews lagging indicators quarterly to validate the strategy.

## Implementation Framework

### Six-Step Approach

#### Step 1: Identify Outcomes and Assign Ownership

Define what behavior changes drive mission impact. Assign owners accountable for each outcome.

**Example:**
- Outcome: Users complete claim submissions 80%+ first time
- Owner: Product Manager for Claims Portal

#### Step 2: Start with Questions

Ask what behavior changes drive mission impact. Avoid "let's track everything."

**Key questions:**
- What decision does this metric inform?
- What behavior change indicates success?
- What would we do differently if this metric changed?

If a metric doesn't inform a decision, don't collect it.

#### Step 3: Define Metrics Formally

Use the metric definition template for every metric:

```
Name: First-Time Claim Completion Rate
Purpose: Measure whether pre-submission improvements reduce rework
Owner: Product Manager - Claims
Formula: (Claims requiring no evidence requests) / (Total claims submitted) x 100%
Data Sources: VBMS claims database
Calculation Window: Trailing 28 days, updated daily
Target: 80% by Q4 2025
Version: 1.0
Change Log: Initial definition Jan 2025
```

#### Step 4: Instrument and Automate Collection

Use industry-standard tools to collect data automatically.

**Common tooling:**
- **Application metrics:** DataDog, New Relic, Prometheus
- **User analytics:** Google Analytics, Mixpanel, Amplitude
- **Custom dashboards:** Grafana, Tableau, Looker

**Instrumentation principles:**
- Capture at source (avoid manual reporting)
- Version tracking (timestamp and user for every event)
- Privacy-preserving (anonymize PII)
- Low overhead (don't slow production systems)

#### Step 5: Analyze and Share Findings

Create accessible dashboards that surface insights, not just data.

**Dashboard best practices:**
- Lead with the decision: "Should we invest more in Feature X?"
- Show trend over time (not just current value)
- Display both leading and lagging indicators
- Include context (targets, benchmarks, prior periods)
- Link to runbooks (what to do when metric degrades)

#### Step 6: Continuously Improve

As products and questions evolve, metrics must evolve too.

**Review cadence:**
- Weekly: Operational dashboards
- Monthly: Leading indicators review
- Quarterly: Lagging indicators and metric definitions review
- Annually: Strategic metric portfolio review

**Questions to ask during reviews:**
- Are we still making decisions based on this metric?
- Has the formula or target changed without documentation?
- Are there new metrics we need to add?
- Can we sunset any metrics no longer used?

## Anti-Patterns to Avoid

### Counting Events Without Tied Decisions

Collecting data that never informs action wastes engineering effort and creates noise.

**Example:** Tracking page views on every page without asking "what would we do if this number changed?"

**Fix:** For every metric, answer "what decision does this enable?"

### Silently Changing Definitions

Updating formulas without versioning breaks historical comparisons.

**Example:** Changing "active user" from "logged in past 30 days" to "performed action past 7 days" without noting the change.

**Fix:** Version all metric definitions; document changes in change log.

### Over-Indexing on Vanity Metrics

Celebrating numbers that don't correlate with outcomes creates false confidence.

**Example:** "We have 1M users!" (but 99% never returned after signing up)

**Fix:** Pair vanity metrics with engagement or outcome metrics.

### Declaring Wins Prematurely

Celebrating lagging indicator improvements before confirming leading indicators moved.

**Example:** "Retention increased!" (but due to seasonal factors, not product changes)

**Fix:** Validate causation by checking leading indicators and running controlled experiments.

### Owning Orphaned Dashboards

Creating dashboards without runbooks means metrics don't drive action.

**Example:** Dashboard shows "error rate spiked" but no one knows who to page or what to do.

**Fix:** Every dashboard needs ownership and runbooks documenting response procedures.

## Summary

Effective data and metrics collection:

1. **Focuses on outcomes over outputs** - Behavior changes, not feature counts
2. **Starts with questions** - What decisions need making?
3. **Evaluates metrics with AAA** - Actionable, Accessible, Auditable
4. **Establishes an OMMTM** - One north-star metric connected to mission
5. **Balances leading and lagging** - Lead to steer, lag to prove
6. **Versions definitions** - Maintains historical comparability
7. **Automates collection** - Reduces manual reporting burden
8. **Drives decisions** - Metrics inform action, not just reporting

Measure what matters, measure it well, and act on what you measure.
