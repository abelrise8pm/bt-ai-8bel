# Hypothesis Validation and Failure

## Overview

Hypotheses will be invalidated. This is not failure—it's learning. The goal is to invalidate bad ideas quickly and cheaply before investing heavily in them.

This reference covers how to recognize invalidation, decide next steps, communicate to stakeholders, and extract learning from failed hypotheses.

## Recognizing Invalidation

A hypothesis is invalidated when evidence shows the cause-and-effect chain is broken.

### Clear Invalidation Signals

- Leading indicators don't move despite intervention (the solution doesn't change behavior)
- Leading indicators move but lagging indicators don't follow (behavior change doesn't drive impact)
- Metrics move in the wrong direction (unintended negative consequences)
- Sample size is sufficient and timeframe is adequate, but targets are missed by a wide margin

### Not Yet Invalidated (Needs More Time/Data)

- Metrics haven't had time to move (leading indicators need 2-4 weeks minimum)
- Sample size too small to draw conclusions
- External factors (seasonality, outages) confound results
- Partial movement toward targets suggests the approach is directionally correct

### Timeframes for Evaluation

Different metrics require different evaluation windows:

| Metric Type | Minimum Evaluation Period | Rationale |
|-------------|--------------------------|-----------|
| Feature adoption (leading) | 2-4 weeks | Users need time to discover and try |
| Behavior change (leading) | 4-8 weeks | Habits take time to form |
| Satisfaction (leading/lagging) | 4-6 weeks | Perception changes gradually |
| Retention (lagging) | 30-90 days | By definition requires time to pass |
| Business impact (lagging) | 1-2 quarters | Downstream effects take time to materialize |

Don't declare failure before the minimum evaluation period. Don't delay decisions beyond when sufficient data exists.

## The Pivot, Persevere, or Kill Decision

When evidence accumulates, make an explicit decision:

### Persevere

Continue the current approach when:
- Leading indicators show positive movement toward targets
- Early qualitative feedback supports the hypothesis
- Lagging indicators haven't had time to move yet, but leading indicators predict success

### Pivot

Change direction while preserving learnings when:
- The problem is validated but the solution isn't working
- A different behavior change might drive the same impact
- User feedback points to a better approach
- The hypothesis is partially valid—some elements work, others don't

### Kill

Stop pursuing the opportunity when:
- The underlying problem assumption is wrong (users don't actually have this pain)
- The impact isn't achievable regardless of solution (market/regulatory constraints)
- Cost to continue exceeds potential value
- Multiple pivots have failed; the opportunity isn't viable

## How to Pivot

A pivot changes one element of the hypothesis while preserving others:

| Pivot Type | What Changes | What Stays |
|------------|--------------|------------|
| **Solution pivot** | The deliverable/feature | Problem, outcome, impact |
| **Outcome pivot** | The target behavior change | Problem, impact |
| **Actor pivot** | Who you're targeting | Problem, impact |
| **Problem pivot** | The problem you're solving | Impact (new problem, same mission goal) |

### Pivot Process

1. Document what was learned from the invalidated hypothesis
2. Identify which element of the hypothesis failed
3. Generate alternative approaches for that element
4. Form a new hypothesis with the changed element
5. Define new "valid if" criteria
6. Update the roadmap to reflect the pivot

## Communicating Invalidation to Stakeholders

Failed hypotheses can damage credibility if communicated poorly. Frame them as learning.

### Framing Language

**Don't say:** "The feature failed" or "We wasted 6 weeks"

**Do say:** "We tested whether [solution] would drive [behavior change]. The data showed [what happened instead]. We learned [insight]. Our next hypothesis is [new approach]."

### Key Messages for Stakeholders

- We defined success criteria upfront (we're not moving goalposts)
- We measured rigorously (the data is trustworthy)
- We learned something valuable (not a waste)
- We have a clear next step (not floundering)

### Stakeholder Trust Builders

- Share the "valid if" criteria before launching, not after
- Report on metrics regularly, not just when convenient
- Acknowledge when results are ambiguous, not just when they're good
- Show the pivot plan, not just the failure

## Learning Documentation

When a hypothesis is invalidated, document the learning:

```
## Hypothesis: [Original hypothesis]

### What We Tested
- Solution: [What we built/changed]
- Timeframe: [How long we ran the experiment]
- Sample size: [How many users/transactions]

### What We Expected
- [Leading indicator 1]: X → Y
- [Leading indicator 2]: X → Y

### What Actually Happened
- [Leading indicator 1]: X → Z (delta from expectation)
- [Leading indicator 2]: X → W (delta from expectation)

### Why We Think This Happened
- [Root cause analysis of the gap]

### What We Learned
- [Insight about users/problem/solution]

### Decision
- [ ] Persevere (continue current approach)
- [ ] Pivot (change: ____________)
- [ ] Kill (stop pursuing this opportunity)

### Next Hypothesis
[New hypothesis if pivoting]
```

## Common Failure Patterns

### Pattern: Solution Doesn't Enable Behavior Change

**Symptoms:** Feature shipped, adoption is low, behavior unchanged

**Likely causes:**
- Usability issues prevent adoption
- Wrong channel or touchpoint
- Insufficient user motivation
- Feature doesn't solve the actual friction

**Response:** Conduct user research to understand barriers; consider different solution approach

### Pattern: Behavior Changes but Impact Doesn't Follow

**Symptoms:** Leading indicators move, lagging indicators flat

**Likely causes:**
- Wrong behavior targeted (correlation assumed, not causation)
- Behavior-to-impact link was incorrect
- External factors dominate the impact metric
- Impact metric has too much latency

**Response:** Re-examine impact mapping; consider different outcome; validate the behavior-impact link

### Pattern: Negative Unintended Consequences

**Symptoms:** Target metrics improve but other important metrics degrade

**Likely causes:**
- Narrow optimization at expense of holistic experience
- Gaming or workarounds that inflate metrics
- System effects not anticipated (improving one area stresses another)

**Response:** Add guardrail metrics; consider holistic success criteria; examine second-order effects

### Pattern: Results Vary by Segment

**Symptoms:** Overall metrics flat but some segments improve while others degrade

**Likely causes:**
- Solution works for some personas but not others
- Power users mask struggles of new users
- Desktop experience differs from mobile
- Regional or demographic differences

**Response:** Stratify analysis by segment; consider segment-specific approaches; ensure equity across user groups

## Experiment Design Principles

To set hypotheses up for clear validation or invalidation:

### Define Success Criteria Upfront

Before launching, document:
- Specific metrics to track
- Target values for each metric
- Minimum sample size for conclusions
- Evaluation timeframe

### Use Control Groups When Possible

- A/B test: Random assignment to treatment vs. control
- Before/after: Same population, different time periods (weaker)
- Cohort comparison: Different user groups (risk of selection bias)

### Instrument Before Launching

- Ensure metrics are being collected before the intervention
- Establish baseline values
- Verify data quality and coverage

### Plan for Ambiguity

Define ahead of time:
- What constitutes "close enough" to target?
- What if results are mixed (some metrics improve, others don't)?
- What external factors might confound results?
- What's the minimum detectable effect given sample size?

## Integration with Other Frameworks

### Connection to Assumptions Tracking

High-risk assumptions identified during problem framing become the hypotheses most likely to fail. Prioritize testing these first.

### Connection to Outcome-Oriented Roadmaps

When a hypothesis is invalidated:
1. Update the roadmap item status
2. Document learnings in the hypothesis section
3. Either pivot (new hypothesis) or remove the item
4. Communicate changes to stakeholders

### Connection to Metrics

- Leading indicators provide early warning of failure
- Lagging indicators confirm whether pivots worked
- Guardrail metrics catch unintended consequences

## Summary

Effective hypothesis validation requires:

1. **Clear criteria** - Define "valid if" before launching
2. **Appropriate timeframes** - Don't declare failure too early or too late
3. **Explicit decisions** - Persevere, pivot, or kill based on evidence
4. **Structured pivots** - Change one element while preserving learnings
5. **Stakeholder communication** - Frame failures as learning
6. **Documentation** - Capture insights for future work

The goal is not to avoid failure but to fail fast, learn quickly, and redirect effort toward approaches that will actually drive mission impact.
