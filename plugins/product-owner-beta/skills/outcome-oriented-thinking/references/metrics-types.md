# Metric Types: Rates, Ratios, and Composites

This reference covers how to construct specific metric types. For foundational principles (AAA framework, OMMTM, leading vs lagging), see `metrics-fundamentals.md`.

## Rate and Ratio Metrics

### Rate Metrics

**Definition:** Frequency of events over time.

**Formula:**
```
Rate = (numerator / exposure) x K
```

Where K is a constant for readability (e.g., 1,000 for "per 1k users").

**Examples:**
- Incidents per 1,000 users, per week
- Deployments per team, per day
- Errors per million requests

**When to use:**
- Measuring tempo or throughput
- Comparing performance across different time periods
- Normalizing by population size

**Example:**

Service A: 500 errors with 50M requests = 10 errors per 1M requests

Service B: 50 errors with 10k requests = 5,000 errors per 1M requests

Despite Service A having more absolute errors, Service B has a higher error rate and needs attention.

### Ratio Metrics

**Definition:** Comparative relationship between two quantities (not necessarily time-based).

**Formula:**
```
Ratio = (numerator / denominator) x 100
```

Often expressed as percentages.

**Examples:**
- On-time delivery percentage
- Conversion rate
- Test pass rate
- First-call resolution rate

**When to use:**
- Measuring effectiveness or efficiency
- Comparing success to total opportunity
- Tracking quality metrics

**Example:**

Team A: 90 successful deploys out of 100 attempts = 90% success rate

Team B: 45 successful deploys out of 50 attempts = 90% success rate

Both teams have equal deployment quality despite different volumes.

### Why Delivery Teams Use Rate/Ratio Metrics

**Apples-to-apples comparability:**
Normalizing enables fair comparison across different scales. "500 errors with 50M requests" vs. "50 errors with 10k requests" becomes comparable: 0.01 vs. 5 per 1k requests.

**Fair performance signals:**
Teams of different sizes can be evaluated equitably. Rate/ratio metrics avoid penalizing large teams for having more volume.

**Decision-ready levers:**
Both numerator and denominator offer improvement opportunities. To improve error rate, either reduce errors (numerator) or handle more requests successfully (denominator).

**Forecasting capability:**
Plug-and-play for capacity projections. "If traffic grows 50%, expect 1.5x errors given current rate."

**Experiment clarity:**
Results remain interpretable despite traffic variations. A/B test outcomes don't require complex traffic normalization.

**Benchmarking alignment:**
Enables setting meaningful thresholds and SLOs. "99.9% uptime" is an industry-standard ratio metric.

**Executive communication:**
Simplifies complex performance into stable narratives. "Error rate decreased 40%" is clearer than "Errors went from 500 to 400 but traffic increased 20%."

### Five Denominator Patterns

| Pattern | Use Case | Example |
|---------|----------|---------|
| **Time exposure** | Tempo/throughput | Deploys per week |
| **Population at risk** | User-based fairness | Incidents per 1k users |
| **Opportunity set** | Effectiveness | Test pass rate % |
| **Asset/capacity units** | Productivity | Sorties per aircraft-day |
| **Size normalization** | Unit economics | Defects per KLOC |

Choose denominators that:
- Represent the risk pool or opportunity set
- Enable fair comparison across contexts
- Connect to capacity planning
- Align with industry benchmarks

### Best Practices for Rate/Ratio Metrics

**Always display both numerator and denominator:**

Bad: "Error rate is 0.5%"

Good: "Error rate is 0.5% (250 errors / 50k requests)"

Showing components enables:
- Understanding absolute magnitude
- Identifying whether numerator or denominator changed
- Debugging unexpected trends

**Use rolling windows to reduce seasonality:**

Bad: Comparing Monday to Saturday (different usage patterns)

Good: Trailing 28-day window centered on each date

Rolling windows smooth out daily/weekly variations and reveal true trends.

**Aggregate using sums, not averages:**

Bad: Average of daily error rates

Good: Sum(errors) / Sum(requests)

Averaging rates can produce misleading results due to Simpson's Paradox. Always aggregate numerators and denominators separately, then divide.

**Set minimum thresholds before reporting:**

Bad: "100% success rate!" (2 successes / 2 attempts)

Good: Only report when denominator >= 30 (statistical significance)

Small denominators create volatile metrics that mislead more than inform.

**Pair rates with absolute counts:**

Dashboard shows both:
- Error rate: 0.5% (trending metric)
- Total errors: 250 (absolute impact)

Context matters. Low rates with high volumes still create significant absolute impact.

### Seven Pitfalls to Avoid

**1. Context Loss**

Showing percentages without components hides whether improvement came from better numerator or worse denominator.

**Fix:** Always display numerator and denominator alongside the ratio.

**2. Denominator Drift**

When the population changes composition (e.g., more novice users), rates can worsen even as absolute performance improves.

**Fix:** Stratify by cohort or use adjusted denominators that account for mix changes.

**3. Gaming**

Teams optimize the formula without real progress (e.g., rejecting difficult requests to inflate success rates).

**Fix:** Pair outcome metrics with access/usage metrics to detect gaming.

**4. Over-Normalization**

Beautiful percentages hide whether the absolute impact matters.

**Fix:** Show both normalized and absolute values. "0.01% error rate" might still be 10,000 errors if traffic is high.

**5. Seasonality**

Weekly/monthly cycles create misleading trends if not smoothed.

**Fix:** Use rolling windows (trailing 7/28 days) instead of calendar periods.

**6. Scope Misalignment**

Numerator and denominator measuring different populations.

**Example:** "First-call resolution rate = resolved tickets / total tickets" fails if some tickets require inherently multiple contacts.

**Fix:** Ensure numerator is a subset of denominator, or explicitly define exclusions.

**7. Hidden Disparities**

Overall metrics mask segment-level gaps.

**Example:** "90% uptime overall" might hide that mobile users experience 70% uptime while desktop users see 98%.

**Fix:** Stratify critical KPIs by device, region, user segment to reveal where support is needed most.

## Composite Metrics

### Definition

A composite metric is a **single number created by combining multiple indicators** to evaluate multidimensional outcomes without relying on one performance measure.

### When to Use Composite Metrics

**Ideal scenarios:**
- Outcomes require measuring multiple dimensions (quality, speed, safety)
- Leadership needs one decision lever for prioritization
- Teams want an auditable, blended "north star" metric
- Trade-offs between metrics need explicit weighting

**Avoid using when:**
- One metric clearly dominates the outcome
- The composite would obscure critical trade-offs
- Incentives could be gamed by over-optimizing individual components
- Components aren't truly independent

### Five-Step Building Process

#### Step 1: Select Components (3-5 maximum)

Choose independently measurable dimensions of success.

**Criteria:**
- Each component measures a distinct aspect
- Components don't duplicate information
- All components are actionable (teams can influence them)
- Set includes both quality and speed dimensions when relevant

**Example (Citizen Service Index):**
1. On-time completion rate
2. Appointment availability speed
3. Customer satisfaction score
4. Accessibility conformance

#### Step 2: Normalize to 0-1 Scale

Convert each component to a comparable range.

**Higher-is-better formula:**
```
normalized = clamp(value / target, 0, 1)
```

**Lower-is-better formula:**
```
normalized = clamp(target / value, 0, 1)
```

**Example:**

Component: On-time completion rate
- Current value: 82%
- Target: 90%
- Normalized: min(0.82 / 0.90, 1) = 0.91

Component: Average wait time (lower-is-better)
- Current value: 15 days
- Target: 10 days
- Normalized: min(10 / 15, 1) = 0.67

#### Step 3: Weight Each Component

Assign importance weights summing to 1.0.

**Weighting approaches:**

**Stakeholder input:**
Survey leadership on relative importance. Average their responses.

**Data-driven:**
Analyze correlation between components and ultimate outcome (e.g., revenue, retention). Weight by correlation strength.

**Equal weighting:**
Use 1/N when no clear priority exists. Simplest but least strategic.

**Example weights (Citizen Service Index):**
- On-time completion: 35% (most important)
- Appointment speed: 25%
- Customer satisfaction: 25%
- Accessibility: 15%

Total: 100%

#### Step 4: Aggregate Using Appropriate Function

Choose aggregation based on desired trade-off behavior.

**Compensatory (weighted average):**

```
Composite = Sum(weight x normalized_value)
```

Allows trade-offs; strong components offset weak ones.

**When to use:** General performance where balance is good but not critical.

**Example:**
```
Composite = (0.35 x 0.91) + (0.25 x 0.80) + (0.25 x 0.85) + (0.15 x 0.95)
         = 0.319 + 0.200 + 0.213 + 0.143
         = 0.875 (or 87.5%)
```

**Non-compensatory (geometric mean):**

```
Composite = Product(normalized_value^weight)
```

Penalizes weak links; requires balanced performance.

**When to use:** Safety-critical domains or when all components must be strong.

**Example:**
```
Composite = (0.91^0.35) x (0.80^0.25) x (0.85^0.25) x (0.95^0.15)
         = 0.968 x 0.950 x 0.959 x 0.992
         = 0.873 (or 87.3%)
```

**Minimum function (hard gates):**

```
Composite = min(normalized_value_1, ..., normalized_value_N)
```

Composite cannot exceed weakest component.

**When to use:** When any single failure is unacceptable.

**Example:**
```
Composite = min(0.91, 0.80, 0.85, 0.95) = 0.80
```

**Gates/Penalties:**

Apply hard rules like "if accessibility < 95%, cap overall score at 0.60."

**When to use:** Protecting critical quality standards that cannot be traded away.

### Real-World Example: Citizen Service Index

**Context:** Government service wants one metric blending speed, quality, and accessibility.

**Components:**

1. **On-time completion rate** (35% weight)
   - Target: 90%
   - Higher-is-better

2. **Appointment availability** (25% weight)
   - Target: Within 7 days
   - Lower-is-better (days to appointment)

3. **Customer satisfaction** (25% weight)
   - Target: 4.5 / 5.0
   - Higher-is-better

4. **Accessibility conformance** (15% weight)
   - Target: 100% WCAG 2.1 AA
   - Higher-is-better

**Month A Performance:**

| Component | Value | Target | Normalized |
|-----------|-------|--------|------------|
| On-time | 85% | 90% | 0.944 |
| Availability | 10 days | 7 days | 0.700 |
| Satisfaction | 4.2 / 5 | 4.5 / 5 | 0.933 |
| Accessibility | 98% | 100% | 0.980 |

**Composite (weighted average):**
```
(0.35 x 0.944) + (0.25 x 0.700) + (0.25 x 0.933) + (0.15 x 0.980)
= 0.330 + 0.175 + 0.233 + 0.147
= 0.885 (or 88.5%)
```

**Month B Performance:**

| Component | Value | Target | Normalized |
|-----------|-------|--------|------------|
| On-time | 92% | 90% | 1.000 |
| Availability | 6 days | 7 days | 1.000 |
| Satisfaction | 4.6 / 5 | 4.5 / 5 | 1.000 |
| Accessibility | 88% | 100% | 0.880 |

**Without gate:**
```
(0.35 x 1.0) + (0.25 x 1.0) + (0.25 x 1.0) + (0.15 x 0.88)
= 0.35 + 0.25 + 0.25 + 0.132
= 0.982 (or 98.2%)
```

**With accessibility gate (<95% caps composite at 60%):**
```
Composite = 0.60 (capped due to accessibility failure)
```

The gate ensures accessibility cannot be traded for speed or satisfaction.

### Key Governance Practices

**Document everything:**
- Numerator and denominator for each component
- Normalization formulas
- Weight rationale
- Aggregation function choice
- Target values and their sources

**Assign ownership:**
- Overall composite: Senior leader
- Each component: Specific team

**Maintain change log:**
```
Version 1.0 (Jan 2025): Initial definition
Version 1.1 (Apr 2025): Increased accessibility weight from 10% to 15%
Version 2.0 (Jul 2025): Added new component for mobile performance
```

**Display component metrics alongside composite:**

Dashboard shows:
- Composite: 88.5%
- On-time: 85% (0.944 normalized)
- Availability: 10 days (0.700 normalized)
- Satisfaction: 4.2 (0.933 normalized)
- Accessibility: 98% (0.980 normalized)

This prevents masking issues when composite score looks good but one component is failing.

## Summary

**Rate metrics** measure frequency over time. Use when measuring tempo, throughput, or comparing across time periods.

**Ratio metrics** compare quantities as percentages. Use when measuring effectiveness, quality, or success rates.

**Composite metrics** blend multiple indicators into one. Use when outcomes are multidimensional and leadership needs a single decision lever.

For all metric types:
- Display components alongside computed values
- Use rolling windows to smooth seasonality
- Stratify to reveal hidden disparities
- Document formulas and version changes
