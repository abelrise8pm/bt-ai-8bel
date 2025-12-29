# Experiment Design Selection

## Overview

Classic A/B testing (random assignment to treatment vs. control) is the gold standard for causal inference. However, it's often impractical in GovTech and enterprise contexts due to policy constraints, equity concerns, technical limitations, or small populations.

This reference covers alternative experiment designs and when to use each.

## Design Selection Guide

| Constraint | Recommended Design |
|------------|-------------------|
| Can randomly assign users | A/B Test |
| Can't randomize individuals, but can randomize groups | Cluster-Randomized |
| Rolling out in phases anyway | Difference-in-Differences |
| No control group possible | Interrupted Time Series |
| Geographic variation available | Geo-Experiment |
| Can alternate treatment over time | Switchback |
| Ranking/search optimization | Interleaving |

## A/B Test

**What it is:** Randomly assign users to treatment (new experience) or control (existing experience). Compare outcomes.

**When to use:**
- Sufficient traffic for statistical power
- Random assignment is technically feasible
- No policy/equity concerns with differential treatment
- Short feedback loops (days to weeks)

**When it doesn't work:**
- Policy requires equal treatment (common in government)
- Population too small for statistical significance
- Technical infrastructure doesn't support traffic splitting
- Changes affect shared resources (can't isolate groups)

**GovTech example:** Testing two versions of a form completion reminder email to veterans.

## Difference-in-Differences (Phased Rollout)

**What it is:** Roll out to one group first, compare their before/after change to a similar group's before/after change over the same period.

**When to use:**
- Phased rollout already planned
- Groups have similar pre-treatment trends
- External factors affect both groups equally
- Randomization not possible but group assignment is

**Key requirement:** Parallel trends assumption—both groups must show similar patterns before intervention.

**GovTech example:** Roll out new claims system to Region A in January, Region B in March. Compare Region A's improvement (Jan-Feb) against Region B's baseline change over the same period.

**Validation:** Plot pre-treatment trends for both groups. If lines aren't parallel, this design won't produce valid results.

## Cluster-Randomized Experiment

**What it is:** Randomly assign clusters (offices, regions, teams) rather than individuals to treatment/control.

**When to use:**
- Intervention delivered at group level
- Spillover effects between individuals in same cluster
- Individual randomization impractical
- Enough clusters for statistical power (typically 20+)

**Caution:** Requires more total participants than individual randomization. Statistical power depends on number of clusters, not individuals.

**GovTech example:** Randomly assign 30 VA regional offices to receive new training program. Compare claim processing quality between trained and untrained offices.

## Interrupted Time Series (ITS)

**What it is:** Measure outcome repeatedly before and after intervention. Look for level change or trend change at intervention point.

**When to use:**
- No control group available
- Intervention affects entire population simultaneously
- Historical data exists (ideally 8+ time points before/after)
- Outcome measured consistently over time

**Limitations:**
- Can't rule out external factors causing change
- Requires stable pre-intervention trend
- Weak against confounding events at same time as intervention

**Strengthening ITS:** Add comparison series (similar population not receiving intervention) to rule out external factors.

**GovTech example:** Track monthly claim processing time for 12 months before and 12 months after deploying automated document classification. Look for immediate drop and/or trend change at deployment.

## Geo-Experiment

**What it is:** Assign geographic regions to treatment/control. Compare outcomes across regions.

**When to use:**
- Geographic variation is natural unit
- Regions are relatively independent
- Enough regions for statistical power
- Regional differences can be controlled for

**GovTech example:** Test new outreach campaign in 15 states, use 15 similar states as control. Compare enrollment rate changes.

**Key consideration:** Match treatment/control regions on pre-treatment characteristics (demographics, baseline metrics, trends).

## Switchback Experiment

**What it is:** Alternate between treatment and control over time periods (hours, days, shifts). Compare outcomes across treatment vs. control periods.

**When to use:**
- Effects are short-lived (don't carry over between periods)
- Same population cycles through both conditions
- Time-based variation is acceptable
- Rapid feedback needed

**Caution:** Invalid if treatment effects persist into control periods (carryover effects).

**GovTech example:** Alternate between two call routing algorithms by day. Compare resolution rates on treatment days vs. control days.

## Interleaving (Ranking/Search)

**What it is:** For ranking systems, interleave results from two algorithms and measure which gets more engagement.

**When to use:**
- Optimizing search, recommendations, or rankings
- User preference is meaningful signal
- High traffic for statistical power
- Results from both algorithms can be merged

**How it works:** Mix results from Algorithm A and Algorithm B into single list. Track which algorithm's results users click/engage with more.

**GovTech example:** Test two search algorithms for benefits eligibility lookup. Interleave results, measure which algorithm's results users select.

## Choosing Sample Size

All designs require sufficient sample size for statistical power. Key factors:

- **Effect size:** Smaller expected effects need larger samples
- **Baseline variance:** Higher variance needs larger samples
- **Cluster designs:** Need enough clusters (20+), not just individuals
- **Time series:** Need enough time points (8+ before, 8+ after)

For cluster and geo designs, adding more individuals per cluster has diminishing returns. Prioritize more clusters over more individuals per cluster.

## Common Pitfalls

### Pitfall: Ignoring Spillover

Treatment affects control group through social/network effects.

**Fix:** Use cluster randomization where spillover is contained within clusters.

### Pitfall: Survivorship Bias

Only measuring users who completed the process, not those who dropped.

**Fix:** Define outcome on intent-to-treat basis (everyone assigned to treatment, regardless of completion).

### Pitfall: Novelty/Hawthorne Effects

Initial results inflated because users respond to any change, not the specific intervention.

**Fix:** Run experiments long enough for novelty to wear off. Use lagging indicators.

### Pitfall: Multiple Comparisons

Testing many metrics increases false positive risk.

**Fix:** Pre-register primary metrics. Apply statistical corrections for secondary metrics.

### Pitfall: Premature Stopping

Stopping experiment when results look good, inflating false positive rate.

**Fix:** Pre-commit to sample size and evaluation timeframe. Use sequential testing methods if early stopping is needed.

## Integration with Hypothesis Validation

When framing hypotheses (see SKILL.md canonical format), specify the experiment design:

```
We believe [solution]
will drive [behavior change] (from X to Y)
and lead to [mission impact] (from X to Y)

Our hypothesis is valid if:
- [Leading indicator with target and timeframe]
- [Leading indicator with target and timeframe]

Experiment design: [Design name]
- [Design-specific details: regions, clusters, time periods, etc.]
- [Sample size and power considerations]
- [Key assumptions to validate]
```

Selecting the experiment design upfront ensures the hypothesis is testable given real-world constraints.

## Summary

| Design | Randomization | Control Group | Best For |
|--------|---------------|---------------|----------|
| A/B Test | Individual | Yes | High-traffic digital products |
| Diff-in-Diff | None (natural) | Yes (delayed) | Phased rollouts |
| Cluster-Randomized | Group | Yes | Training, process changes |
| Interrupted Time Series | None | No | Policy changes affecting everyone |
| Geo-Experiment | Region | Yes | Marketing, outreach campaigns |
| Switchback | Time period | Yes (alternating) | Operations with short-term effects |
| Interleaving | Within-user | Yes (merged) | Search and ranking optimization |

Choose the strongest design feasible given constraints. Weaker designs require more caution in interpreting results.
