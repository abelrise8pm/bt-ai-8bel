# Problem Statement Framing

## Overview

Problem statement framing is a structured approach to synthesize, refine, and prioritize problems before exploring solutions. This prevents solution-first thinking and ensures teams address root causes, not symptoms.

## The Four-Step Process

### Step 1: Identify and Contextualize

Start by experiencing the problem firsthand in its natural environment. Gather perspectives from multiple sources.

**Key questions:**
- What symptoms indicate this problem exists?
- Who experiences it, and when/where does it occur?
- What measurable business or mission impact exists today?
- What triggered the need to solve this now?

**Perspective sources:**
- Support teams who hear complaints
- Stakeholders who fund the work
- Users who experience the problem
- Data that quantifies the impact

**Evidence to collect:**
- User complaints or support tickets
- Analytics showing behavior patterns
- Business metrics showing impact
- Qualitative feedback from observations

### Step 2: Find Root Cause

Dig deeper to understand why the problem exists. Surface symptoms often mask underlying causes.

**Three method categories:**

#### Qualitative Approaches
- **5 Whys** - Ask "why" repeatedly until reaching root cause
- **User interviews** - Direct conversations with affected users
- **Focus groups** - Group discussions revealing shared pain points

#### Observational Methods
- **Value Stream Mapping** - Identify process bottlenecks and waste
- **Usability testing** - Watch users struggle with current solutions
- **Session recordings** - Review actual user behavior
- **Analytics** - Quantify where users drop off or struggle

#### Framework-Based Methods
- **Journey mapping** - Map user experience across touchpoints
- **Service Blueprint mapping** - Visualize service delivery components
- **Affinity diagramming** - Cluster and organize insights
- **DDD Event Storming** - Model domain events and workflows

**Root cause characteristics:**
- Explains why symptoms occur
- Addresses systemic issues, not one-off events
- Points to actionable intervention points
- Connects to measurable impact

### Step 3: Refine Problem Statements

Craft clear, concise problem statements using one of two templates.

#### Comprehensive Format

```
I am a [persona]
I'm trying to [goal]
but [problem/challenge]
because [root cause]
which makes me feel [emotion]
and contributes to [business impact]
```

**When to use:** Complex problems requiring empathy and emotional understanding.

**Example - Developer Platform:**

```
I am a junior developer
I'm trying to deploy my application to staging
but the deployment process fails with cryptic errors
because the documentation assumes expert knowledge of our infrastructure
which makes me feel frustrated and incompetent
and contributes to 40% of deployment attempts failing, delaying releases by 2-3 days
```

**Example - VA Benefits:**

```
I am a veteran applying for disability benefits
I'm trying to submit my claim with all required documentation
but I don't know which medical records are needed
because the application doesn't explain evidence requirements
which makes me feel anxious about my claim being denied
and contributes to 60% of claims requiring additional evidence requests, adding 30+ days to processing time
```

**Example - State Department Visa Processing:**

```
I am a consular officer reviewing visa applications
I'm trying to verify applicant information against security databases
but I have to manually check 8 different systems
because the systems aren't integrated
which makes me feel overwhelmed and worried about missing critical information
and contributes to processing delays averaging 45 days and security review backlogs of 12,000+ applications
```

#### Streamlined Format

```
Current Situation: [Describe existing conditions]
Problem: [Core issue causing pain]
Actor Effects: [Impact on specific users/stakeholders]
Desired Target Results: [Measurable outcomes when solved]
```

**When to use:** Technical problems or stakeholder communication requiring clarity over emotion.

**Example - Developer Platform:**

```
Current Situation: Deployment pipeline requires manual configuration and assumes infrastructure expertise
Problem: 40% of deployment attempts fail with unclear error messages
Actor Effects: Junior developers waste 4-6 hours troubleshooting; senior engineers interrupt work to help
Desired Target Results: 90%+ first-time deployment success; self-service deployment in <30 minutes
```

**Example - Healthcare System:**

```
Current Situation: Patients must call to schedule appointments during business hours
Problem: 70% of calls go to voicemail; callback wait times exceed 2 days
Actor Effects: Patients miss care windows; staff spend 60% of time on phone tag
Desired Target Results: 80%+ patients self-schedule within 24 hours; staff focus on clinical work
```

**Example - Financial Services:**

```
Current Situation: Loan approval process requires 15 document uploads across 3 portals
Problem: 55% of applications abandoned due to complexity
Actor Effects: Applicants frustrated; underwriters receive incomplete applications
Desired Target Results: <10 minute application completion; 80%+ completion rate
```

### Step 4: Validate and Next Steps

Before advancing to solutions, validate the problem statement:

**Quality checklist:**
- [ ] Current situation and context are clear
- [ ] Specific who/what is affected
- [ ] Baseline metrics present (current impact quantified)
- [ ] Language is clear and specific
- [ ] Statement remains objective without prescribing solutions
- [ ] Root cause identified, not just symptoms

**Common validation questions:**
- Does this statement describe reality today, not wishes for tomorrow?
- Can we measure whether this problem improves?
- Is the root cause actionable, or should we dig deeper?
- Would affected users recognize themselves in this statement?

**Next steps after validation:**
- Track assumptions continuously
- Run Impact Mapping exercises to connect solutions to outcomes
- Develop outcome-oriented roadmaps
- Design experiments to test hypotheses

## Key Quality Criteria

### 1. Current Situation & Context
Clear description of existing conditions where the issue occurs. Provides background explaining why it matters now.

### 2. Affected Actors
Specific users, stakeholders, or systems impacted. Name personas, not vague groups.

### 3. Measurability
Benchmarks and metrics for tracking progress. Quantify baseline impact.

### 4. Clarity & Conciseness
Simple, jargon-free language. Avoid technical terms without definition.

### 5. Specificity
Concrete details about scope, not vague generalities. "40% deployment failure rate" not "deployments often fail."

### 6. Objectivity
Facts without bias or presupposed solutions. Describe the problem, not the answer.

### 7. Root Cause
Systemic issues, not symptoms. "Because documentation assumes expertise" not "because users don't read docs."

## Causal Chain Structure

Effective problem statements follow a causal chain:

```
Because of [context]
our [actor] experiences [pain-point]
which causes [mission impact]
```

**Example:**

```
Because of fragmented security databases
our consular officers experience manual verification across 8 systems
which causes 45-day processing delays and 12,000+ application backlogs
```

This structure ensures every problem statement connects user pain to organizational impact.

## Anti-Patterns to Avoid

### Solutions in Disguise

❌ **Bad:** "We need a mobile app for scheduling"

✅ **Good:** "Patients can't schedule appointments outside business hours, resulting in 70% of calls going to voicemail and 2-day callback delays"

### Vague Generalities

❌ **Bad:** "Users find the system confusing"

✅ **Good:** "Junior developers experience 40% deployment failure rates due to cryptic error messages and expert-level documentation"

### Symptom Focus

❌ **Bad:** "Support ticket volume is high"

✅ **Good:** "Users must call for appointment scheduling because online system requires 15+ clicks across 3 portals, generating 200+ daily support calls"

### Missing Measurement

❌ **Bad:** "The process takes too long"

✅ **Good:** "Loan applications require 15 document uploads across 3 portals, causing 55% abandonment and 45-day average completion times"

### Assumed Audience

❌ **Bad:** "Everyone struggles with this"

✅ **Good:** "Junior developers (hired within 12 months) experience 40% deployment failures, while senior engineers have 5% failure rates"

## Common Pitfalls

### Pitfall 1: Jumping to Solutions
Teams often frame problems as missing features: "We don't have a dashboard" instead of "Managers can't identify bottlenecks without manually reviewing 50+ Jira tickets daily."

**Fix:** Describe the pain and impact, not the desired solution.

### Pitfall 2: Ignoring Root Causes
Surface symptoms mask deeper issues. "Users abandon forms" might be a symptom of "Forms don't save progress, causing 30+ minute investments to be lost on connection drops."

**Fix:** Use 5 Whys or other root cause analysis methods.

### Pitfall 3: Unmeasured Impact
"This is important" lacks specificity. Without baseline metrics, there's no way to know if solutions work.

**Fix:** Quantify current impact with metrics.

### Pitfall 4: Vague Actors
"Users" or "customers" are too broad. Different personas experience different problems.

**Fix:** Name specific personas with specific pain points.

### Pitfall 5: Hidden Assumptions
Unstated beliefs about causes or solutions creep in. "Users don't understand the process" assumes user knowledge, not design.

**Fix:** State facts about observed behavior, not judgments about users.

## Template Selection Guide

| Use Comprehensive Format When | Use Streamlined Format When |
|------------------------------|----------------------------|
| Empathy and emotional impact matter | Technical or operational problems |
| Building stakeholder buy-in | Internal team alignment |
| Human-centered design focus | Process optimization focus |
| Complex multi-stakeholder problems | Clear, single-actor problems |
| Qualitative insights drive understanding | Quantitative metrics drive understanding |

Both formats require:
- Current state description
- Affected actors
- Root cause analysis
- Measurable impact
- Objectivity

Choose based on audience and problem type.

## Real-World Examples by Domain

### Software Engineering

**Comprehensive:**
```
I am a backend engineer
I'm trying to identify which microservice is causing production errors
but our logging doesn't correlate requests across services
because we implemented logging before adopting distributed tracing
which makes me feel blind to system behavior
and contributes to 4-hour average MTTR and 12 production incidents per month
```

**Streamlined:**
```
Current Situation: Logging predates distributed tracing adoption; no request correlation across services
Problem: 4-hour average MTTR for production incidents; engineers manually grep 8+ log sources
Actor Effects: Backend engineers spend 30% of on-call time correlating logs
Desired Target Results: <30 minute MTTR; automatic request tracing across services
```

### Healthcare

**Comprehensive:**
```
I am a patient managing chronic diabetes
I'm trying to track my glucose levels and share them with my care team
but I have to manually log readings in a paper journal
because the glucose monitor doesn't sync with the patient portal
which makes me feel disconnected from my care team
and contributes to suboptimal A1C management and 2x higher hospitalization risk
```

**Streamlined:**
```
Current Situation: Glucose monitors don't integrate with patient portals; manual paper logging required
Problem: Care teams lack real-time glucose data; patients manage chronic conditions without feedback
Actor Effects: Patients with suboptimal A1C control; clinicians make decisions on stale data
Desired Target Results: Real-time glucose data sharing; proactive care team interventions
```

### Government Services

**Comprehensive:**
```
I am a small business owner applying for federal contracts
I'm trying to register in the System for Award Management (SAM)
but the process requires 30+ pages of forms and takes 3-4 weeks
because multiple agencies require duplicate information without data sharing
which makes me feel overwhelmed and discouraged
and contributes to 40% of small businesses abandoning applications and reduced competition on contracts
```

**Streamlined:**
```
Current Situation: SAM registration requires 30+ pages across 8 agencies; no data sharing between systems
Problem: 3-4 week registration process; 40% small business abandonment rate
Actor Effects: Small businesses discouraged; contracting officers see reduced competition
Desired Target Results: <1 week registration; 80%+ small business completion rate
```

## Integration with Other Frameworks

Problem statement framing is the foundation for other outcome-oriented practices:

**Feeds into Impact Mapping:**
- Problem statement identifies the mission impact to optimize
- Actor identification becomes the "actors who can help/hinder" layer
- Root cause analysis informs which behaviors to change

**Enables Value Stream Mapping:**
- Problem context defines which value stream to map
- Actor effects point to process handoffs worth examining
- Measurable impact becomes the improvement target

**Drives Metric Design:**
- Baseline metrics in problem statement become the lagging indicators
- Root causes suggest leading indicators to monitor
- Desired target results define success thresholds

**Structures Outcome-Oriented Roadmaps:**
- Problem statement becomes the "Problem/Opportunity" section
- Measurable impact informs the "Impact" definition
- Root cause analysis guides hypothesis formation

## Facilitation Tips

When facilitating problem framing sessions:

1. **Start with individual reflection** - Have participants write problem statements independently first
2. **Share and compare** - Look for common themes and divergent perspectives
3. **Probe for root causes** - Ask "why" repeatedly; resist premature solutions
4. **Demand metrics** - If someone says "too slow," ask "how slow?" and "slow compared to what?"
5. **Challenge assumptions** - When someone uses "obviously" or "clearly," dig deeper
6. **Seek diverse perspectives** - Include support, operations, compliance, not just engineering
7. **Timebox ruthlessly** - Spend 90 minutes on current state, save solutions for later

## Summary

Effective problem statements:
- Describe current reality, not desired futures
- Name specific actors experiencing pain
- Quantify baseline impact with metrics
- Identify root causes, not symptoms
- Remain objective without prescribing solutions
- Use causal chains connecting context → pain → impact

Master problem framing to avoid building solutions in search of problems.
