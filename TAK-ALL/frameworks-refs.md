# ASSUMPTION DRAFTING GUIDELINES
## Framework: David J Bland
---
### Why Test Assumptions

An assumption is a thing accepted as true or certain to happen, without proof. We all make assumptions, but it is important to be aware of them and to test them.

> "Your assumptions are your windows on the world. Scrub them off every once in a while, or the light won't come in." — Isaac Asimov

Your perception of true does not make it true.

### Rules for Writing Assumptions

- Do not write them as questions. They are statements that would have to be true for this to succeed.
- Based on what I or we know today.
- Looking towards 2 to 6 months out.
- Begin each assumption with:
  - **We believe** (for the team)
  - **I believe** (for an individual)
- One sentence per assumption. It should fit on a single sticky note.
- Write in the positive, unless you are trying to disprove a negative (null hypothesis).
- Do not worry about perfect. You can always refine later.

### The 4 Categories

#### Desirability - Do They Want it?
**Definition:** Statements on whether your customer or user has an unmet need. What would have to be true for operators, warfighters, or mission planners to actually want and use this?

**In military and government mission-oriented domains**, the "customer" is split. The end user is the operator or warfighter in the field. The buyer is the program office or contracting officer. Their needs may not align. Adoption is not driven by preference alone — it is constrained by doctrine, training, command direction, and workflow fit. An unmet need in this domain means a real mission risk or operator burden that has no adequate solution today.

**Key questions to pressure-test desirability assumptions:**
- Will operators actually use this in the field, or will they work around it?
- Does command care enough to direct adoption, or will it remain optional?
- Does the solution fit existing doctrine, training, and standard operating procedures?
- Is the unmet need validated by actual users, or assumed by the team?

**Guardrails:**
- Do not confuse program office interest with operator need. They are not the same actor.
- Do not assume adoption will happen because the capability exists.
- Do not write desirability assumptions about features. Write them about behavior change and unmet need.

**Example patterns:**
- We believe operators will adopt this capability without requiring command-directed mandates.
- We believe the unmet need exists at the operator level, not just at the program office level.
- We believe the current workaround creates enough mission risk that operators are motivated to change behavior.

#### Viability - Should we do it?
**Definition:** Statements on whether the solution can be sustained, funded, and expanded. In commercial contexts this is about revenue and profit. In military and government contexts, viability means whether this becomes a lasting capability or ends when the contract does.

**In military and government mission-oriented domains**, there is no revenue model. Viability is about contract sustainability, follow-on funding, program office support, and whether the solution fits within acquisition constraints and budget authority. A viable solution in this domain has a path to program of record status or a follow-on contract — not just a successful delivery.

**Key questions to pressure-test viability assumptions:**
- Will the program office fund follow-on work based on what we deliver?
- Does this solution fit within existing contract scope and acquisition authority?
- Is there a path to program of record status, or is this always a bridge contract?
- Are the costs of compliance (ATO, CMMC, TAK Forge) sustainable within the contract vehicle?
- Does the value delivered justify continued government investment?

**Guardrails:**
- Do not conflate delivery success with program viability. Delivering on contract does not guarantee follow-on funding.
- Do not assume the program office has budget authority. Confirm it.
- Do not write viability assumptions about features or technical outcomes. Write them about funding, scope, and sustainability.

**Example patterns:**
- We believe the program office has budget authority and intent to fund a follow-on contract based on Sprint 1 through 4 deliverables.
- We believe the deliverables from this contract are sufficient to initiate a program of record conversation with SOCOM.
- We believe the cost of ATO and security compliance is within the scope the government is willing to fund on a follow-on contract.

#### Feasibility - Can We do it?
**Definition:** Statements on whether you can build and deliver. In commercial contexts this is about access to technology, IP, and key partners. In military and government contexts, feasibility is constrained by classified system access, network limitations, hardware requirements, security compliance, and partner dependencies outside your control.

**In military and government mission-oriented domains**, the most common feasibility blockers are: access to data and classified systems, ATO and CMMC compliance timelines, DDIL network and hardware constraints, TAK Forge pipeline dependencies, and partner relationships with entities like BAH and TPC that are not fully under your control.

**Key questions to pressure-test feasibility assumptions:**
- Do we have access to the data, systems, and networks required to build and test?
- Can we meet ATO, CMMC, and TAK Forge compliance requirements within the contract timeline?
- Do we have the right partner relationships in place to deliver?
- Can we build and validate on hardware and network conditions representative of actual field use?
- Are there clearance or access requirements the team does not yet have?

**Guardrails:**
- Do not assume data access. In military domains, training data and field feedback are often controlled, classified, or simply nonexistent.
- Do not assume partner cooperation. BAH, TPC, and TAK Forge operate on their own timelines and priorities.
- Do not write feasibility assumptions about what you hope to access. Write them about what would have to be true for access to be confirmed and usable.

**Example patterns:**
- We believe we can access sufficient training data to improve the model without relying on production field data.
- We believe the TAK Forge pipeline can be configured to support signed .mil APK delivery within this contract period.
- We believe we can build and validate the plugin under DDIL-representative conditions without access to classified operational networks.
- We believe our key partner dependencies with BAH and TPC will not block or delay delivery within the 8-week timeline.

#### Miscellaneous
**Definition:** If an assumption does not fit cleanly into desirability, viability, or feasibility, capture it here. Miscellaneous assumptions may relate to macroeconomics, environment, usability, competition, sustainability, or adaptability.

**Guardrails:**
- Use this category sparingly. If you find yourself putting most assumptions here, revisit the other three categories.
- Miscellaneous assumptions are still assumptions. Apply all the same rules: no questions, positive framing, one sentence, We believe or I believe.

# Problems, Risk and Blockers + COA's Course of Actions

RISK If {Condition or Context} is true, then {consequence}

BLOCKER Template: Because of {condition/context} we're more or less likley to {event} resiltresulting in {consequence(s)}
REQUEST HELP:
- Course of Actin (COA) {person(s)} is doing/delivering {action} by {date}
- Ask: We need {person or group} to help with {action item} by {time-frame or date} so that {impact}

===

From Rise8's Educ8

## Managing Assumptions & Risk
### What is it?
We should always expect to deal with both assumptions and risks when executing projects, and delivering products and services. It's also very easy to form the opinion that assumptions and risks are the same thing. Afterall, every assumption carries a potential consequence, thus a risk! While this statement is true, there are intentional practices that we employ to best manage these for specific purposes.

Said another way, attempting to eliminate all risks is not only futile due to limited resource constraints, it is also an anti-pattern to not take bold, calculated, risks when shipping software with assumptions that can only truly be validated once we are in production. Therefore, this practice is both an art and a science. We need to surface assumptions and risks early and often, quantify them, track them, and deliberately burn down the most critical items through experiments, engineering practices, and operational guardrails—so we ship outcomes in prod with confidence and pace.

Below is a high-level framing to help ground ourselves in the differences between Assumptions Management and Risk Management before we get into the details.

**TABLE**

Columns: Practice, What are they, When do they come into play?, Timing Example

Assumption Management
- What are they?: Things we believe to be true, with varying degress of confidence, that we want to test and validate with empirical evidence to support timely, strategic, decision-making. (think play calling)
- When do they come into play?: Everytime we're in a decision-making flow, based on available signals (i.e. anything between a gut feeling to having non-causal data or insights), and we desire at least an absolute conclusion.
- Timing Example: Supporting every strategic decision → A reseach guide consolidates assumptions we want to validate and learn about current conditions; Ideation for solving user pain-points that lead to mission impact aligns teams on assumptions we test before or after launching them; Preparing story's and questions for a stakeholder call that influences alignment, prioritizes assumptions that we will validate with realtime reactions and decisions.

Risk Management:
- What are they?: Things that could impact our ability to achieve our goals, ranging from annoyance to completely blocking or killing our efforts. (think blocking and tackling)
- When do they come into play?: Risks can show up as early as prior to, or at the start of, a new project. Constraints could exist before we even attempt to deliver a new product or service.
- Timing Example: Before we even begin our contract → Because it takes 6 months to obtain AWS accounts from our supplier, we’re less likely to ship our MVP product before end of fiscal year, resulting in 0% percent chance of securing next fiscal year funding.


### Why do it?
Throughout a product’s lifecycle, it’s helpful for teams to articulate, prioritize, track and regularly revisit their assumptions and risks. If you haven’t released software in awhile, your product is likely full of assumptions that may or may not solve a real problem for your users, or meaningfully impact the mission. This is certainly the case when we are in the early stagees of a product’s lifecycle, delivering an MVP experiment to prod.

**The Seasaw Graph**
- vertical axis = Risk goes up from building the wrong stuff
* --> red line, risk increases without user validation
- horizontal axis = time spent building stuff
* --> blue line, risk stays low with frequent validation

Here are some principles to live by when managing assumptions and risks

* Outcomes over outputs - Writing down the assumptions and risks about the product, our users, technical feasibility, dependencies, solutions etc. helps the team gain a shared understanding of what underlying beliefs the team has about what needs to be true in order for a product or our current project to be successful.

* Learning velocity - Systematic assumption testing and continuous delivery reduce the cost and risk of change—empowering us to learn in prod.
Mission and compliance - RMF + continuous monitoring turns security/privacy risk into a daily habit, not a once-a-year scramble; it’s also foundational to cATO.

* Prioritize resource energy - It’s important to understand, as a team, which assumptions are the riskiest (i.e. which ones, if proven wrong, could risk the success of our product or current project) so you can engage in activities to help de-risk those assumptions.

* Maintaining flow - Tracking the assumptions and the evidence that adds validity (or removes validity) to the assumption is helpful in making decisions on whether to pivot or persevere. If a key assumption you made early on in the product life cycle turns out to be incorrect- it’s important to evaluate how that assumption being invalidated informs what you do next as a product team.
* Comfortable accepting risk - Tracking and de-risking assumptions also allows teams to feel more confident that the product they’re building and releasing will be desirable, viable & feasible to build.

How to do it?
Facilitate a recurring conversation
Assumption and risk management starts with a facilitated conversation that focuses on generating concerns that may cause us to not meet our goals, or not achieve desirable outcomes in production with our customers. Whether you're using sticky notes, or a digital whiteboarding solution, we recommend checking out our Assumptions/Risks Workshop Play for a detailed guide on how to facilitate this conversation. Running this formal exercise should happen as often as the team makes strategic prioritization decisions, because managing risk is a critical component of establishing and managing strategy.

Risk tracking
Whether you're completing formal exercises as part of contract kick-off, starting a new project, or simply recognizing new risks on a day-to-day basis, it's important that delivery teams make risks visibile to everyone, so that we can prioritize and strategize how we will manage them. At Rise8 we recommend teams create their own copy of our Risks Tracker template to do this. Below you'll find detailed definitions to assist in your adoption of this standard artifact.

Risk categorization
When discussing risks, we categorize potential issues within the areas of product, technology, customer, and team. Teams always have the flexibility to add additional categories that are relevant to their situations. Here's an example of how to categorize risks across these areas:

Product
Value Risk: The risk that customers won't find the product useful or valuable.
Usability Risk: The risk that users won't be able to use the product effectively.
Business Viability Risk: The risk that the product won't fit the strategic goals.
Customer
Customer Experience Risk: Risks related to poor customer service, negative perceptions, or failure to meet customer expectations
Customer Management Risk: Shifts in customer preferences, or changes in the competitive landscape can impact customer relationships
Technology
Technical Feasibility: The risk that the team can't build or maintain the product due to technical challenges.
Technology Failures: Issues with system failures, bugs, data breaches, or the failure to adopt new technologies.
Cybersecurity: Risks associated with data breaches, malware, and unauthorized access to technology systems.
Operational & Third-Party Risks: Failures in technology systems, downtime, or issues with vendors providing technology services.
Team
Resource Allocation: Lack of internal resources, including the right technology.
Skill Shortages: Not having enough people with the necessary skills to meet project needs.
Organizational & Project Management Risks: Inefficiencies in internal processes, poor planning, or misalignment with project goals.

Risk/Blocker, course of actions (COA) & support asks statement format expectations
Below are examples of our preferred format for capturing risk statements, because they clearly and succinctly specify the causal effect between the conditions that lead to a measurable impact.

If [conditional context] is true, then [measurable consequence]

Because of [condition context], we’re more/less likely to [event], resulting in [measurable consequence]


Below are examples of our preferred format for capturing Course of Actions (COA) or Support Asks statements. Clearly and consistently describing the what, what, when and why in our risk response strategy is how we maintain alignment and accountability with all parties involved, and should be presented during risk review sessions. By including dates, we can more effectively communicate urgency with stakeholders, and acts as helpful signal for reassessing risks.

COA: [Who?], [is doing/delivering what?] [By when?].

Support Asks: We need [person(s)] to help with [action item(s)], by [date], so that [impact].


Risk/Blocker, COA, and Support Ask statement examples
Blocker: Because our team lacks AWS accounts, we’re blocked on delivering our platform and Assessors are blocked on control assessments, this will result in a failure to support launching mission critical capabilities by EOY.
COA: Joe will contact program COR and expedite funding by 07/09/2025
COA: Joe will contact internal services org to expedite account generation by 07/09/2025
COA: Sarah and Ray will build out IaC and compliance-as-code frameworks in our local environments to begin testing what we will apply later 07/23/2025

Risk tracker rating guidelines
Impact Rating
Relative impact refers to the potential consequences if a risk materializes. We often apply this as the X-axis when leveraging a 2x2 matrix to assess risk management prioritization

**TABLE**

Ratings & Descriptions

Probability Rating: Relative probability refers to the likelihood of a risk occurring. We often apply this as the Y-axis when leveraging a 2x2 matrix to assess risk management prioritization

Risk scoring: The risk score is calculated by multiplying the Impact Value by the Probability Rating. This score helps in ranking and prioritizing risks by providing a quantitative measure of their potential severity and likelihood.

Risks with higher scores (represented by colors like Red and Orange in the Tracker template) should be addressed with greater urgency and receive more resources for mitigation, allowing teams to focus on the most critical threats to the project.

Level of effort (LOE)
LOE refers to the resources and time required to mitigate or address a risk, and can be additional valuable context that helps the team make prioritization decisions. Teams should align on the LOE scale that works for their context. Below is an example that works for most software delivery teams.

What about timing of risks?
Many practicioners argue that timing can greatly influence decisions on the importance of a given risk item. Timing absolutely matters! In nearly all cases where timing comes up in assessing risks, it tends to be something that additionally influences one or both of the previous rating criteria during discussions.

Risk treatment strategies

2x2 matrix risk management
If a team prefers to leverage a 2x2 matrix to assess the impact and probability of their risks instead of the formulas provided in the Risk Tracker template, we've provided a helpful guide on how to interpret the quadrant results below. As you'll see in the table below, we often follow a zig-zag pattern when prioritizing quadrant results of a 2x2 exercise (e.g. For risks this looks like 1 - Critical, 2 - High, 4 - Medium and then 3 - Low).

## Assumption tracking
Similarly to risk tracking, whether you're completing formal exercises as part of contract kick-off, starting a new project, or simply generating new assumptions about users, problems and solutions on a week-to-week basis, it's important that delivery teams make assumptions testing visibile to everyone, so that we can maintain context continuity at all times. At Rise8 we recommend teams create their own copy of our Assumptions Tracker template to do this. Below you'll find detailed definitions to assist in your adoption of this standard artifact.

Assumption categorization and organization
Because teams will generate a lot of assumptions across many different topics, it's helpful to categorize assumptions in a way that makes it easier to organize, filter, search, and prioritize them for their different purposes (e.g. an experiment for our next release is very different when compared to experiment we run internally to improve delivery performance). Because assumption categories are very context specific, there is no one size fits all approach to accomplishing this. Below are some techniques, and examples, to consider when leveraging an Assumptions Tracker:

Abreviated assumption category labels
One way to organize asssumptions could be to apply tags that are relevant to current team focus areas

User workflow xyz
Screen xyz
Feature xyz
User sentiment
Research guide xyz
Release xyz
Goal xyz
Retrospective mm/dd/yyyy
etc.
Assumption Tracker tabs
Another way to consider organizing assumptions is by duplicating Assumption Tracker Template tabs, and managing assumptions across discovery cycles, releases, and/or experiment headlines.

### Assumption statement format expectations
Below is an example of our preferred format for capturing assumption statements, because it represents team alignment on an assumption that we collectively believe to be true and have prioritized for testing. This format also keeps the team honest on how they will objectively validate or invalidate the assumption, similarly to how we design hypothesis-led experiments.

> We believe [conditional context]. We will know this is true if [measurable/observable evidence is present]


**Assumption statement examples**

* We believe that auto-generating personalized digital medication summaries (indicating what each drug is for, when to take it, and for how long) will result in greater Veteran understanding and adherence. We will know this is true if ≥60% of Veterans view the summary within 48 hours of their clinical visit, and ≥80% report that their medication plan is clear and easy to follow.
* We believe that scheduling an "IPM backlog pre-read" session on our calendars will lead to more consistent IPM sessions and improve our sprint goal success rate. We will know this is true if 100% of IPM sessions end on time or early, and sprint backlog delivery success rate improves >=25%.

### Assumption tracker rating guidelines
**Impact Rating**
Relative impact refers to the potential consequences if an assumption is validated as true. We often apply this as the X-axis when leveraging a 2x2 matrix when prioritizing assumptions.

**TABLE**

**Uncertainty Rating**
Relative uncertainty refers to our confidence about an assumption being a fact, or completely unknown. We often apply this as the Y-axis when leveraging a 2x2 matrix when prioritzing assumptions.

**TABLE**

**Assumption action recommendations**
Whether you're leveraging the Assumption Tracker or a 2x2 matrix, here is how we recommend managing resources for researching and testing assumptions.

**TABLE**

**Assumption validation testing techniques**
Testing assumptions is both essential to how we validate changes in user or system behavior as well as delivering mission impact, and it's arguable the most exciting part of delivering software! There are several techniques that we can deploy to validate, or invalidate, our assumptions. Applying them is not only an art and science, but also an important decision for delivery teams because it requires our own investment of resources to successfully conduct them. Below are just a handful of validation plays that we can leverage to test our assumptions:

**Pre-development**
- Problem-solution interviews: Conduct targeted interviews with potential users to explore their pain points, goals, and existing behaviors. This technique helps determine if the problem you are solving is significant enough for users to want a solution.
- Landing page tests (Fake door tests): Create a landing page for a product or feature that doesn't yet exist. The page describes the concept and prompts users to "Learn More" or "Sign Up." The call-to-action is then tracked to gauge interest.
- Concierge MVP: Rather than building a product, you manually perform the service for a small number of customers. This provides deep insight into the core value proposition and user experience before any code is written.
- Mock press release: Write a press release for the product you intend to build. This forces the team to articulate the product's core value and benefits in a way that resonates with customers.

**During development**
- Usability testing (with prototypes): Use low- or high-fidelity prototypes (e.g., paper sketches, clickable wireframes) to test user flows and feature concepts. Observing users interact with these prototypes helps identify usability issues and unmet expectations.
- "Wizard of Oz" MVP: Create a front-end experience that appears to be powered by AI or advanced technology, but is actually being controlled manually by a human behind the scenes. This is useful for testing feasibility and user expectations for complex features.
- Beta testing: Release a pre-production version of the product to a small, controlled group of external users. Beta testers provide feedback on bugs, performance, and usability in a real-world environment before the official launch.
- Feature flagging: Deploy new features or changes but keep them hidden from most users. Enable the features for specific users or segments to test performance and gather targeted feedback.

**Post-launch**
- A/B testing: Roll out a feature to two different user groups. One group sees version A (the control), and the other sees version B (the variant). By comparing key metrics, teams can validate which version performs better.
- Multi-variant Tests (MVT): Systematically evaluate multiple variables and their combinations to determine which combination produces the best outcome. Unlike A/B testing, which compares two or more versions of a single element, MVT tests multiple different elements at the same time to understand how they interact with each other and what their combined effect is on user behavior.
- Analytics and monitoring: Continuously track user behavior through analytics tools. This helps product teams validate that a new feature is being used as intended and provides the expected value.
- User engagement: Implement in-app surveys, customer satisfaction scores (CSAT), and Net Promoter Scores (NPS) to gather both quantitative and qualitative feedback from a large user base.