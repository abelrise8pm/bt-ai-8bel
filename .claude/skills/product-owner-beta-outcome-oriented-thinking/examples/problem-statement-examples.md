# Problem Statement Examples

This file contains real-world problem statement examples across various domains, demonstrating both comprehensive and streamlined formats.

## Software Engineering & DevOps

### Example 1: Developer Platform - Deployment Issues

**Comprehensive Format:**

```
I am a junior developer
I'm trying to deploy my application to staging
but the deployment process fails with cryptic errors 40% of the time
because the documentation assumes expert knowledge of our infrastructure
which makes me feel frustrated and incompetent
and contributes to 40% of deployment attempts failing, delaying releases by 2-3 days on average
```

**Streamlined Format:**

```
Current Situation: Deployment pipeline requires manual configuration and assumes infrastructure expertise
Problem: 40% of deployment attempts fail with unclear error messages; average 4-6 hours troubleshooting per failure
Actor Effects: Junior developers waste time troubleshooting; senior engineers interrupt work to help; releases delayed 2-3 days
Desired Target Results: 90%+ first-time deployment success; self-service deployment in <30 minutes; <1 hour for troubleshooting failures
```

### Example 2: Production Incidents - Debugging

**Comprehensive Format:**

```
I am a backend engineer
I'm trying to identify which microservice is causing production errors
but our logging doesn't correlate requests across services
because we implemented logging before adopting distributed tracing
which makes me feel blind to system behavior and worried about missing critical issues
and contributes to 4-hour average MTTR and 12 production incidents per month affecting customers
```

**Streamlined Format:**

```
Current Situation: Logging predates distributed tracing adoption; no request correlation across microservices
Problem: 4-hour average MTTR for production incidents; engineers manually grep 8+ log sources to correlate events
Actor Effects: Backend engineers spend 30% of on-call time correlating logs; customers experience extended outages
Desired Target Results: <30 minute MTTR; automatic request tracing across all services; single-query incident diagnosis
```

### Example 3: Test Automation Gap

**Comprehensive Format:**

```
I am a QA engineer
I'm trying to ensure new features don't break existing functionality
but our test suite takes 6 hours to run and has 15% false positive rate
because tests were written without clear ownership and maintenance practices
which makes me feel like testing is a bottleneck rather than an enabler
and contributes to delayed releases (2-day testing cycles) and production defects (8 bugs/month) escaping to customers
```

## Healthcare

### Example 4: Patient Appointment Scheduling

**Comprehensive Format:**

```
I am a patient managing chronic diabetes
I'm trying to schedule follow-up appointments with my care team
but I have to call during business hours and 70% of calls go to voicemail
because the clinic's online scheduling system doesn't support specialist appointments
which makes me feel frustrated and disconnected from my care
and contributes to missed care windows, suboptimal A1C management, and 2x higher hospitalization risk
```

**Streamlined Format:**

```
Current Situation: Patients must call during business hours to schedule specialist appointments; online system limited to primary care
Problem: 70% of calls go to voicemail; 2+ day callback wait times; patients miss care windows
Actor Effects: Patients experience delayed care; staff spend 60% of time on phone tag; specialists have unfilled slots despite demand
Desired Target Results: 80%+ patients self-schedule within 24 hours; <10% no-show rate; staff focus on clinical work
```

### Example 5: Medical Records Access

**Comprehensive Format:**

```
I am a patient with chronic conditions seeing multiple specialists
I'm trying to ensure all my doctors have my complete medical history
but my glucose monitor, prescription records, and lab results are in 3 different systems
because healthcare IT systems don't share data across providers
which makes me feel like I have to be my own medical coordinator
and contributes to duplicate tests (costing $800+ annually), drug interactions (3 emergency room visits in 2 years), and suboptimal care coordination
```

**Streamlined Format:**

```
Current Situation: Patient data fragmented across 3+ systems (glucose monitor, prescriptions, labs) with no integration
Problem: Duplicate tests ordered due to missing records; drug interactions undetected; patients manually coordinating care
Actor Effects: Patients experience care gaps; physicians make decisions on incomplete data; $800+ annual duplicate testing costs per patient
Desired Target Results: Single integrated patient record; 90%+ data availability at point of care; <5% duplicate test rate
```

## Government Services

### Example 6: VA Disability Claims

**Comprehensive Format:**

```
I am a veteran applying for disability benefits
I'm trying to submit my claim with all required documentation
but I don't know which medical records are needed for my specific conditions
because the application doesn't explain evidence requirements by claim type
which makes me feel anxious about my claim being denied or delayed
and contributes to 60% of claims requiring additional evidence requests, adding 30+ days to processing time and extending average wait from 30 to 90 days
```

**Streamlined Format:**

```
Current Situation: VA benefits application doesn't provide claim-type-specific evidence guidance
Problem: 60% of claims require evidence requests; average 90-day processing vs. 30-day target
Actor Effects: Veterans wait 90+ days for decisions; claims processors spend 30% of time requesting evidence; backlog of 125,000 claims
Desired Target Results: 75%+ claims submitted complete on first attempt; <50 day average processing time; backlog reduced by 40%
```

### Example 7: State Department Visa Processing

**Comprehensive Format:**

```
I am a consular officer reviewing visa applications
I'm trying to verify applicant information against security databases
but I have to manually check 8 different systems with separate logins
because the systems aren't integrated and each requires different search criteria
which makes me feel overwhelmed and worried about missing critical security information
and contributes to processing delays averaging 45 days and security review backlogs of 12,000+ applications affecting legitimate travelers
```

**Streamlined Format:**

```
Current Situation: Consular officers must manually query 8 separate security databases with different interfaces
Problem: 45-day average processing time; 12,000+ application backlog; officers spend 40% of time on database lookups
Actor Effects: Officers overwhelmed; legitimate travelers face delays; security checks incomplete under time pressure
Desired Target Results: <5 minute verification via single integrated query; <15 day processing; 90%+ security check completion rate
```

### Example 8: Small Business Federal Contracting

**Comprehensive Format:**

```
I am a small business owner applying for federal contracts
I'm trying to register in the System for Award Management (SAM)
but the process requires 30+ pages of forms across 8 agencies with duplicate information
because agencies don't share data and each has separate registration requirements
which makes me feel overwhelmed and tempted to give up
and contributes to 40% of small businesses abandoning applications, reducing competition on contracts and limiting small business access to federal opportunities
```

**Streamlined Format:**

```
Current Situation: SAM registration requires 30+ pages across 8 agencies; no data sharing between systems
Problem: 3-4 week registration process; 40% small business abandonment rate; duplicate data entry required
Actor Effects: Small businesses discouraged from federal contracting; contracting officers see reduced competition; economic opportunity lost
Desired Target Results: <1 week registration; 80%+ small business completion rate; single data entry with cross-agency sharing
```

## Financial Services

### Example 9: Loan Application Process

**Comprehensive Format:**

```
I am a first-time homebuyer applying for a mortgage
I'm trying to complete my loan application online
but the system requires 15 document uploads across 3 different portals
because the bank's systems weren't designed for integrated digital workflows
which makes me feel frustrated and tempted to switch banks
and contributes to 55% of applications being abandoned, 45-day average completion times (vs. 15-day target), and lost business worth $50M annually
```

**Streamlined Format:**

```
Current Situation: Mortgage application requires 15 document uploads across 3 separate portals; no progress saving
Problem: 55% application abandonment rate; 45-day completion time vs. 15-day target
Actor Effects: Applicants frustrated; underwriters receive incomplete applications; bank loses $50M annual business
Desired Target Results: <10 minute application completion; 80%+ completion rate; 15-day average processing time
```

### Example 10: Fraud Detection

**Comprehensive Format:**

```
I am a fraud analyst reviewing suspicious transactions
I'm trying to determine if a transaction is legitimate or fraudulent
but I have to manually review account history, transaction patterns, and external data across 5 systems
because our fraud detection tools don't provide integrated risk scoring
which makes me feel like I'm playing detective with one hand tied behind my back
and contributes to 30-minute average review time, 8-hour backlog during peak periods, and $2M annual fraud losses from delayed detection
```

## E-Commerce & Retail

### Example 11: Customer Support

**Comprehensive Format:**

```
I am a customer support agent helping shoppers with order issues
I'm trying to view customer order history and inventory availability
but I have to switch between 3 different systems to get complete information
because our e-commerce platform, warehouse system, and CRM aren't integrated
which makes me feel inefficient and worried about providing wrong information
and contributes to 8-minute average handle time (vs. 4-minute target), 45% first-call resolution rate, and customer satisfaction of 3.2/5
```

**Streamlined Format:**

```
Current Situation: Support agents must query 3 separate systems (e-commerce, warehouse, CRM) for customer information
Problem: 8-minute average handle time vs. 4-minute target; 45% first-call resolution rate; 3.2/5 customer satisfaction
Actor Effects: Agents frustrated by system switching; customers repeat information multiple times; 55% of issues require callbacks
Desired Target Results: <4 minute handle time; 75%+ first-call resolution; 4.5/5 customer satisfaction; single integrated agent interface
```

### Example 12: Inventory Management

**Streamlined Format:**

```
Current Situation: Inventory data syncs between warehouse and website every 4 hours
Problem: 12% of orders placed for out-of-stock items; customers notified of backorders 24+ hours after purchase
Actor Effects: Customers frustrated; warehouse staff process cancellations instead of shipments; $3M annual lost sales
Desired Target Results: Real-time inventory sync; <2% backorder rate; customer notified at checkout if item unavailable
```

## Education

### Example 13: Student Learning Platform

**Comprehensive Format:**

```
I am a high school student trying to catch up on missed lessons
I'm trying to find relevant video explanations and practice problems for concepts I don't understand
but the learning platform organizes content by chapter and date, not by concept
because the system was designed for teachers to upload materials, not for students to discover content
which makes me feel lost and demotivated
and contributes to 40% of students not using supplemental materials, lower test scores (15% below proficiency targets), and increased achievement gaps
```

**Streamlined Format:**

```
Current Situation: Learning platform organized by chapter/date rather than by concept; students can't easily find relevant help
Problem: 40% of students don't use supplemental materials; 15% below proficiency targets on assessments
Actor Effects: Students can't find relevant help when stuck; teachers field repetitive questions; achievement gaps widen
Desired Target Results: 75%+ students use supplemental materials when struggling; concept-based discovery interface; 10% improvement in assessment scores
```

## Template for Your Domain

Use these templates to frame problems in your context:

### Comprehensive Template

```
I am a [specific persona with relevant characteristics]
I'm trying to [concrete goal or task]
but [specific obstacle or challenge]
because [root cause, not symptom]
which makes me feel [emotional impact]
and contributes to [quantified business/mission impact with specific metrics]
```

### Streamlined Template

```
Current Situation: [Describe current state with relevant context]
Problem: [Core issue with quantified impact metrics]
Actor Effects: [Specific impacts on different personas]
Desired Target Results: [Measurable outcomes defining success]
```

## Key Patterns Across Examples

### Strong Problem Statements Include:

1. **Specific personas** - "Junior developer" not "developers"; "Patient with chronic conditions" not "patients"

2. **Quantified baseline** - "40% failure rate", "90-day processing time", "60% abandonment"

3. **Root causes** - "Because documentation assumes expertise" not "because users don't read docs"

4. **Observable impact** - Measurable effects on mission metrics

5. **Multiple affected actors** - Direct users and supporting stakeholders

### Avoid:

1. **Vague groups** - "Users" or "people"

2. **Unmeasured pain** - "Takes too long" without quantification

3. **Symptoms as causes** - "Because the system is slow" (symptom) vs. "Because database queries aren't optimized" (cause)

4. **Solutions disguised as problems** - "We need a mobile app" is not a problem statement

5. **Assumed solutions** - "Users don't understand" assumes user knowledge gap rather than design failure

Use these examples as inspiration to craft problem statements that drive outcome-oriented thinking in your domain.
