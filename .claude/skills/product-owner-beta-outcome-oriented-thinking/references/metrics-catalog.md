# Metrics Catalog

This reference provides specific metrics organized by category. For foundational principles, see `metrics-fundamentals.md`. For metric construction techniques, see `metrics-types.md`.

## Delivery Health Metrics

These metrics measure the health of delivery processes, not just product outcomes.

### DORA Metrics

The DevOps Research and Assessment (DORA) metrics measure software delivery performance:

| Metric | Definition | Leading/Lagging |
|--------|------------|-----------------|
| **Deployment Frequency** | How often code deploys to production | Leading |
| **Lead Time for Changes** | Time from commit to production deploy | Leading |
| **Change Failure Rate** | Percentage of deployments causing failures | Leading |
| **Time to Restore Service** | Time to recover from production incidents | Lagging |

**Why DORA matters for outcomes:**
- High-performing teams deploy more frequently with lower failure rates
- Lead time predicts time-to-market for customer value
- MTTR indicates organizational resilience

**Performance levels (from DORA research):**

| Metric | Elite | High | Medium | Low |
|--------|-------|------|--------|-----|
| Deployment Frequency | On-demand (multiple/day) | Weekly-monthly | Monthly-biannually | Biannually+ |
| Lead Time | <1 hour | 1 day - 1 week | 1-6 months | 6+ months |
| Change Failure Rate | 0-15% | 16-30% | 16-30% | 16-30% |
| MTTR | <1 hour | <1 day | 1 day - 1 week | 1 week+ |

### Flow Metrics

Flow metrics measure how work moves through the delivery process:

| Metric | Definition | Use Case |
|--------|------------|----------|
| **Lead Time** | Total time from request to delivery | End-to-end efficiency |
| **Cycle Time** | Time from work started to completed | Team efficiency |
| **Throughput** | Items delivered per time period | Capacity measurement |
| **Work in Progress (WIP)** | Items currently being worked | Bottleneck detection |
| **Item Aging** | How long items have been in progress | Stale work identification |

**Key relationships:**
- **Little's Law:** Lead Time = WIP / Throughput
- Reducing WIP often improves both lead time and quality
- High item aging signals blocked work or scope creep

### Quality Metrics

| Metric | Definition | Use Case |
|--------|------------|----------|
| **Escaped Defects** | Bugs found in production | Quality gate effectiveness |
| **Defect Rate** | Defects per unit of work (KLOC, story points) | Normalized quality |
| **Test Coverage** | Percentage of code covered by tests | Quality investment indicator |
| **Code Review Turnaround** | Time from PR open to merge | Collaboration health |

### Planning Metrics

| Metric | Definition | Use Case |
|--------|------------|----------|
| **Velocity** | Work completed per iteration | Capacity planning |
| **Sprint Burndown** | Work remaining in current sprint | Progress tracking |
| **Epic/Release Burn-up** | Work completed toward larger goal | Roadmap tracking |
| **Commitment Reliability** | % of committed work delivered | Predictability |

**Caution:** Velocity measures capacity, not value delivered. Don't confuse output (story points completed) with outcome (behavior changed).

## User and Usage Metrics

These metrics measure how users interact with products and whether behavior changes occur.

### User Metrics

| Metric | Definition | Role |
|--------|------------|------|
| **New Users** | First-time users in period | Acquisition |
| **Daily Active Users (DAU)** | Unique users per day | Engagement |
| **Weekly Active Users (WAU)** | Unique users per week | Engagement |
| **Monthly Active Users (MAU)** | Unique users per month | Reach |
| **Activation Rate** | Users completing key action | Onboarding success |
| **Churn Rate** | Users who stop using product | Retention failure |

**DAU/MAU Stickiness Ratio:** A leading indicator of habit strength. Higher ratios indicate users return frequently.

**Calculating stickiness:**
```
Stickiness = DAU / MAU
```

- 50%+ = Very sticky (users engage almost daily)
- 20-50% = Moderately sticky
- <20% = Low engagement (users check in occasionally)

### Usage Metrics

| Metric | Definition | Role |
|--------|------------|------|
| **Sessions per User** | Average visits per user | Engagement depth |
| **Events per Session** | Actions taken per visit | Usage intensity |
| **Feature Adoption** | % users using specific feature | Feature success |
| **Task Completion Rate** | % users completing intended workflow | UX effectiveness |
| **Funnel Conversion** | % progressing through multi-step flow | Journey success |

### Performance and Reliability Metrics

| Metric | Definition | Role |
|--------|------------|------|
| **Availability/Uptime** | % time system is operational | Reliability |
| **Latency (p95)** | Response time at 95th percentile | Performance |
| **Error Rate** | Failed requests / total requests | Stability |
| **Crash Rate** | App crashes per session | Quality |
| **Core Web Vitals** | LCP, FID, CLS (Google's UX metrics) | User experience |

**Why p95 over average:**
Average latency hides the experience of users hitting slow responses. P95 shows "95% of users experience this or better" — a more honest representation.

## Domain-Specific Examples

### Healthcare/VA

| Metric | Role | Significance |
|--------|------|--------------|
| % Complete & Accurate med list | Leading | Enables safe care |
| Refill reminder reach/CTR | Leading | Drives adherence |
| Time-to-appointment | Leading | Access drives outcomes |
| 30-day medication adherence | Lagging | Confirms behavior |
| 30-day readmission rate | Lagging | Clinical outcome proof |
| Patient Safety Indicators (PSI) | Lagging | Harm prevention |

### Department of State

| Metric | Role | Significance |
|--------|------|--------------|
| Application completeness rate | Leading | Reduces rework |
| Interview-slot availability | Leading | Drives wait times |
| Online vs. paper submission % | Leading | Process efficiency |
| On-time passport delivery | Lagging | Service outcome proof |
| Citizen satisfaction score | Lagging | Experience confirmation |

### Air Force / Defense

| Metric | Role | Significance |
|--------|------|--------------|
| Sorties generated per aircraft-day | Leading | Operational tempo |
| Maintenance turnaround time | Leading | Aircraft availability |
| Spare parts availability | Leading | Maintenance enablement |
| Mission-capable rate | Lagging | Force readiness |
| Mission success rate | Lagging | Operational effectiveness |

### Commercial SaaS

| Metric | Role | Significance |
|--------|------|--------------|
| Page load p95 | Leading | Drives conversion |
| Feature adoption % | Leading | Predicts retention |
| DAU/MAU stickiness | Leading | Habit strength |
| Time-to-value (onboarding) | Leading | Activation predictor |
| Net Revenue Retention (NRR) | Lagging | Business health |
| 90-day retention | Lagging | Durable value proof |
| NPS/CSAT | Lagging | Experience signal |

## Metric Pairing Patterns

Effective programs pair leading and lagging indicators. Common patterns:

### Acquisition to Retention

```
New Users (leading) --> Activation Rate (leading) --> 30-day Retention (lagging)
```

Track the funnel from acquisition through activation to retention.

### Feature to Impact

```
Feature Adoption % (leading) --> Task Completion Rate (leading) --> Mission Impact (lagging)
```

Confirm features drive behavior change that creates impact.

### Quality to Trust

```
Test Coverage (leading) --> Change Failure Rate (leading) --> Incident Rate (lagging)
```

Investment in quality predicts production stability.

### Speed to Satisfaction

```
Lead Time (leading) --> On-time Delivery (leading) --> Customer Satisfaction (lagging)
```

Delivery speed predicts customer experience.

## Quick Reference: Metric Selection

| Question | Metric Category | Example |
|----------|-----------------|---------|
| Are we deploying safely and quickly? | DORA | Deployment Frequency, Change Failure Rate |
| Is work flowing efficiently? | Flow | Cycle Time, WIP, Throughput |
| Are users engaging? | User | DAU/MAU, Activation Rate |
| Are users succeeding? | Usage | Task Completion, Funnel Conversion |
| Is the system reliable? | Performance | Availability, Latency p95, Error Rate |
| Is the team delivering predictably? | Planning | Velocity, Commitment Reliability |

## When to Load This Reference

Load `metrics-catalog.md` when:
- Looking for specific metrics in a category (DORA, flow, user, etc.)
- Needing domain-specific metric examples
- Wanting to understand metric pairing patterns
- Searching for the right metric for a use case

For how to define and evaluate metrics, see `metrics-fundamentals.md`.
For how to construct rate/ratio/composite metrics, see `metrics-types.md`.
