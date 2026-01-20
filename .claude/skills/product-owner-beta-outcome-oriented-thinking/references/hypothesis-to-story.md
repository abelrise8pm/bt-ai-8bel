# From Hypothesis to Story

This reference provides detailed guidance on transforming hypotheses into implementation-ready user stories.

## Why Stories Come From Hypotheses

A story without a hypothesis is just a feature request. It describes what to build but not why it matters or how we'll know it worked.

When stories originate from hypotheses:
- The "so that" clause contains a real behavior change, not a feature description
- Success metrics are defined before implementation begins
- The team understands what they're testing, not just what they're building

## The Transformation

### Hypothesis Structure

```
We believe [deliverable/solution]
will drive [behavior change] (from X to Y)
and lead to [mission impact] (from X to Y)

Our hypothesis is valid if:
- [Leading indicator with target and timeframe]
- [Leading indicator with target and timeframe]
```

### Story Structure

```
As a [actor from impact mapping],
I want [deliverable/solution from hypothesis]
so that [behavior change / mission impact from hypothesis].

Acceptance Criteria:
- GIVEN/WHEN/THEN for functional behavior

Success Metrics:
- Leading: [from hypothesis validation criteria]
- Lagging: [from mission impact]
```

### Element Mapping

| Hypothesis Element | Story Element | Notes |
|-------------------|---------------|-------|
| Actor (from impact mapping) | "As a [persona]" | Use specific persona, not generic "user" |
| Deliverable/solution | "I want [capability]" | The feature or change being built |
| Behavior change | "so that [outcome]" | How users will act differently |
| Mission impact | "so that [outcome]" | Can combine with behavior change |
| Leading indicators | Success Metrics | Measurable signals of progress |
| Validation criteria | Acceptance Criteria | Testable conditions for done |

## Example Transformation

### Starting Hypothesis

```
We believe a pre-submission checklist
will drive veterans to submit complete applications (from 40% to 75%)
and lead to faster claim processing (from 120 days to 90 days)

Our hypothesis is valid if:
- Checklist usage rate reaches 70% within 30 days
- Incomplete submission rate drops by 50% within 60 days
```

### Resulting Story

```
As a veteran filing a disability claim,
I want a pre-submission checklist
so that I submit complete applications and receive faster decisions.

Acceptance Criteria:

1. GIVEN a veteran on the claim submission page
   WHEN they view the checklist
   THEN they see all required evidence items for their claim type

2. GIVEN a veteran has checked all items
   WHEN they submit their claim
   THEN the system records checklist completion for analytics

3. GIVEN a veteran has unchecked items
   WHEN they attempt to submit
   THEN they see a warning about potentially missing evidence

Out of Scope:
- Automated evidence verification
- Integration with medical records systems
- Mandatory checklist completion (warning only)

Success Metrics:
- Leading: Checklist usage rate (target: 70% within 30 days)
- Leading: Incomplete submission rate (target: 50% reduction within 60 days)
- Lagging: Average claim processing time (target: 90 days within 6 months)
```

### What Transferred

| From Hypothesis | To Story |
|-----------------|----------|
| "veterans" (implied actor) | "As a veteran filing a disability claim" |
| "pre-submission checklist" | "I want a pre-submission checklist" |
| "submit complete applications" | "so that I submit complete applications" |
| "faster claim processing" | "and receive faster decisions" |
| "Checklist usage rate reaches 70%" | Success Metric (leading) |
| "Incomplete submission rate drops by 50%" | Success Metric (leading) |
| "120 days to 90 days" | Success Metric (lagging) |

## More Examples

### Example: Internal Tool Improvement

**Hypothesis:**
```
We believe automated deployment notifications in Slack
will drive developers to respond to failed deployments faster (from 45 min to 10 min)
and lead to reduced downtime incidents (from 8/month to 3/month)

Our hypothesis is valid if:
- 80% of deployment failures receive response within 15 minutes
- Mean time to acknowledgment drops below 10 minutes within 2 weeks
```

**Story:**
```
As a platform engineer on call,
I want automated Slack notifications for deployment failures
so that I can respond quickly and reduce downtime.

Acceptance Criteria:

1. GIVEN a deployment fails in any environment
   WHEN the failure is detected
   THEN a Slack message is posted to #deployments within 60 seconds

2. GIVEN a deployment failure notification
   WHEN an engineer reacts with the "eyes" emoji
   THEN the message updates to show who is investigating

3. GIVEN a deployment failure is resolved
   WHEN the fix is deployed
   THEN a follow-up message confirms resolution with duration

Success Metrics:
- Leading: Response within 15 minutes (target: 80%)
- Leading: Mean time to acknowledgment (target: <10 min within 2 weeks)
- Lagging: Downtime incidents per month (target: 3, from 8)
```

### Example: User-Facing Feature

**Hypothesis:**
```
We believe a saved search feature
will drive recruiters to use advanced filters regularly (from 15% to 60%)
and lead to faster candidate shortlisting (from 4 hours to 1 hour per role)

Our hypothesis is valid if:
- 50% of recruiters create at least one saved search within 2 weeks
- Repeat filter usage increases by 3x within 30 days
```

**Story:**
```
As a recruiter searching for candidates,
I want to save my search filters
so that I can quickly re-run common searches and shortlist candidates faster.

Acceptance Criteria:

1. GIVEN a recruiter has applied filters to a candidate search
   WHEN they click "Save Search"
   THEN they can name and save the current filter combination

2. GIVEN a recruiter has saved searches
   WHEN they visit the search page
   THEN they see their saved searches in a dropdown

3. GIVEN a recruiter selects a saved search
   WHEN the page loads
   THEN all saved filters are applied automatically

Success Metrics:
- Leading: Recruiters creating saved searches (target: 50% within 2 weeks)
- Leading: Repeat filter usage (target: 3x increase within 30 days)
- Lagging: Time to shortlist per role (target: 1 hour, from 4 hours)
```

## Common Mistakes

### Mistake: Output-focused "so that"

**Bad:**
```
As a user,
I want a search feature
so that I can search for items.
```

This is circular - it describes the feature, not the outcome.

**Good:**
```
As a warehouse worker,
I want to search inventory by SKU
so that I can locate items in under 30 seconds instead of 5 minutes.
```

### Mistake: Missing success metrics

**Bad:**
```
As a customer,
I want faster checkout
so that I have a better experience.
```

How do you measure "better experience"?

**Good:**
```
As a returning customer,
I want one-click reorder for previous purchases
so that I can complete repeat orders in under 10 seconds.

Success Metrics:
- Leading: One-click reorder usage (target: 40% of repeat orders)
- Lagging: Repeat purchase rate (target: increase from 25% to 35%)
```

### Mistake: No hypothesis lineage

If you can't trace a story back to a hypothesis, ask:
- What behavior are we trying to change?
- How will we know if this worked?
- What's our belief about cause and effect?

If these can't be answered, the story needs outcome framing before implementation.

## When Stories Need Outcome Framing First

Stories that arrive without hypothesis lineage often have these characteristics:

| Signal | Example | Problem |
|--------|---------|---------|
| Feature-only description | "Add export button" | No behavior change stated |
| Vague value | "Improve user experience" | Not measurable |
| Solution without problem | "Implement caching" | Why? What problem does it solve? |
| Missing "so that" | "As a user, I want X" | No outcome stated |
| Activity as outcome | "so that I can click the button" | Describes usage, not value |

When these signals appear, step back and frame the problem and hypothesis before writing the story.
