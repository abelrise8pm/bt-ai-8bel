# Metrics Capability Maturity Model

This reference helps teams assess their metrics maturity and identify improvement areas. For foundational metrics principles, see `metrics-fundamentals.md`.

## Overview

Teams can assess their metrics maturity across nine dimensions, progressing from Beginner to Mastery. Use this model to:
- Identify current capability gaps
- Prioritize improvement investments
- Track progress over time
- Benchmark against expectations

## The Nine Dimensions

### 1. Metric Strategy & Framing

How well does the team connect metrics to mission and strategy?

| Level | Characteristics |
|-------|-----------------|
| **Beginner** | Basic KPI definition; metrics chosen ad-hoc |
| **Intermediate** | Metrics tied to outcomes; some OMMTM thinking |
| **Advanced** | Metric trees with clear OMMTM; leading/lagging balance |
| **Mastery** | Executive North Star with trade-off analysis; metrics drive resource allocation |

### 2. Measurement Design

How rigorously are metrics defined and governed?

| Level | Characteristics |
|-------|-----------------|
| **Beginner** | Ad-hoc definitions; "we know it when we see it" |
| **Intermediate** | Documented formulas; named owners |
| **Advanced** | Versioned definitions with change logs; formal review process |
| **Mastery** | Governance board; cross-team alignment; definition quality audits |

### 3. Instrumentation & Data Quality

How reliably is data captured?

| Level | Characteristics |
|-------|-----------------|
| **Beginner** | Manual data collection; spreadsheets |
| **Intermediate** | Basic event tracking; some automation |
| **Advanced** | Automated instrumentation; data quality checks |
| **Mastery** | SLA-driven monitoring; quality alerts; self-healing pipelines |

### 4. Analysis & SQL/Excel Skills

How sophisticated is data analysis capability?

| Level | Characteristics |
|-------|-----------------|
| **Beginner** | Simple queries and charts; basic Excel |
| **Intermediate** | Joins and aggregations; pivot tables; basic statistics |
| **Advanced** | Statistical analysis; cohort analysis; SQL optimization |
| **Mastery** | Semantic layers; self-serve analytics; automated insights |

### 5. Experimentation & Causality

How well does the team establish cause-and-effect?

| Level | Characteristics |
|-------|-----------------|
| **Beginner** | Before/after comparisons; correlation assumed as causation |
| **Intermediate** | A/B testing basics; control groups |
| **Advanced** | Multi-variant testing; statistical significance; sample size planning |
| **Mastery** | Sequential testing with early stopping; causal inference methods |

### 6. Forecasting & Modeling

How accurately can the team predict future performance?

| Level | Characteristics |
|-------|-----------------|
| **Beginner** | Moving averages; gut feel |
| **Intermediate** | Trend extrapolation; simple regression |
| **Advanced** | Predictive models; scenario planning |
| **Mastery** | Validated forecasts with confidence intervals; model performance tracking |

### 7. Decision Narratives

How effectively do metrics inform decisions?

| Level | Characteristics |
|-------|-----------------|
| **Beginner** | Labeled charts; "the numbers" |
| **Intermediate** | Insights with recommendations; some context |
| **Advanced** | Decision-focused dashboards; clear "so what" |
| **Mastery** | Executive decision memos; metrics-driven strategy sessions |

### 8. Operationalization

How embedded are metrics in daily operations?

| Level | Characteristics |
|-------|-----------------|
| **Beginner** | Shared spreadsheets; monthly reports |
| **Intermediate** | Shared dashboards; weekly reviews |
| **Advanced** | Alerting and runbooks; real-time monitoring |
| **Mastery** | Behavior-driving systems; automated actions; closed-loop feedback |

### 9. Ethics & Compliance

How responsibly does the team handle data?

| Level | Characteristics |
|-------|-----------------|
| **Beginner** | PII awareness; basic consent |
| **Intermediate** | Data retention policies; access controls |
| **Advanced** | Privacy-by-design; anonymization; bias detection |
| **Mastery** | Responsible measurement advisory; ethics review process |

## Self-Assessment Worksheet

Rate your team 1-4 on each dimension:

| Dimension | 1 (Beginner) | 2 (Intermediate) | 3 (Advanced) | 4 (Mastery) | Current |
|-----------|--------------|------------------|--------------|-------------|---------|
| Metric Strategy | | | | | |
| Measurement Design | | | | | |
| Instrumentation | | | | | |
| Analysis Skills | | | | | |
| Experimentation | | | | | |
| Forecasting | | | | | |
| Decision Narratives | | | | | |
| Operationalization | | | | | |
| Ethics & Compliance | | | | | |

**Interpretation:**
- **9-15:** Foundation building needed
- **16-24:** Growing capability; focus on weak areas
- **25-32:** Strong capability; push toward mastery
- **33-36:** Exceptional; share practices with others

## Prioritization Guide

Not all dimensions matter equally for every team. Prioritize based on context:

| If your biggest challenge is... | Prioritize these dimensions |
|---------------------------------|-----------------------------|
| "We don't know what to measure" | Metric Strategy, Measurement Design |
| "We can't trust our data" | Instrumentation, Ethics |
| "We have data but no insights" | Analysis Skills, Decision Narratives |
| "We can't prove impact" | Experimentation, Forecasting |
| "Metrics don't change behavior" | Operationalization, Decision Narratives |

## Common Progression Paths

### Path A: Data-First Teams

Teams with data engineering strength but weak product connection:

1. Start with **Metric Strategy** - Connect data to outcomes
2. Then **Decision Narratives** - Make data actionable
3. Then **Operationalization** - Embed in workflows

### Path B: Product-First Teams

Teams with strong product sense but weak data infrastructure:

1. Start with **Instrumentation** - Get reliable data
2. Then **Analysis Skills** - Extract insights
3. Then **Experimentation** - Prove causation

### Path C: Compliance-Driven Teams

Teams in regulated environments (healthcare, finance, government):

1. Start with **Ethics & Compliance** - Build trust
2. Then **Measurement Design** - Rigorous definitions
3. Then **Instrumentation** - Auditable pipelines

## Improvement Actions by Dimension

### Quick Wins (Weeks)

| Dimension | Action |
|-----------|--------|
| Metric Strategy | Define ONE mission metric (OMMTM) |
| Measurement Design | Create metric definition template |
| Instrumentation | Add one automated data capture |
| Analysis | Learn one new SQL pattern |
| Experimentation | Run one A/B test |
| Forecasting | Add trend lines to key metrics |
| Decision Narratives | Add "so what" to every chart |
| Operationalization | Set up one alert |
| Ethics | Document what PII you collect |

### Medium Investments (Months)

| Dimension | Action |
|-----------|--------|
| Metric Strategy | Build full metric tree with leading/lagging |
| Measurement Design | Implement versioning and change logs |
| Instrumentation | Deploy event tracking across product |
| Analysis | Build cohort analysis capability |
| Experimentation | Establish sample size calculator |
| Forecasting | Create 90-day forecast for key metrics |
| Decision Narratives | Create decision-focused dashboard |
| Operationalization | Build runbook for every alert |
| Ethics | Implement anonymization pipeline |

## When to Load This Reference

Load `metrics-maturity.md` when:
- Assessing team metrics capability
- Planning metrics program improvements
- Benchmarking against industry standards
- Identifying skill gaps to address

For how to define metrics, see `metrics-fundamentals.md`.
For specific metric examples, see `metrics-catalog.md`.
