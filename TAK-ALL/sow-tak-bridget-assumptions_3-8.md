Stakeholder Network
Team Structure & Role Clarity
Product & Technical Requirements
Scope, Timeline & Budget Constraints
Delivery Model & Reporting

# 1. Stakeholder Network

## Assumptions

**[Misc]** We believe the Program Management Office (PMO) decision authority and escalation paths will be clarified during the March 11th kick-off meeting (SOW 4.2.5).
Why it matters: Without knowing who in the Government approves scope/schedule changes, we risk blocked decisions and missed deadlines.
> Jordan Boring
> Brittany Boucher

**[Misc]** We believe Government-side participants for the weekly product management meeting (SOW 4.2.6) — focused on task accomplishment, logistics, and issue resolution — will be identified at kick-off.
Why it matters: SOW 4.2.6 requires weekly syncs "with the Government" but doesn't specify who attends; without this, we can't confirm the right decision-makers are in the room.

**[Desirability]** We believe Special Operations Forces Mission Command (SOFMC) is the primary Government intermediary for accessing USSOCOM end users and validating product feedback (SOW lines 17, 50-51).
Why it matters: SOFMC develops, tailors, and fields TAK to operators — assuming direct USSOCOM access without SOFMC involvement may not reflect how feedback actually flows.

**[Misc]** We believe DefenseWERX (DWX) and its innovation hub SOFWERX act as contracting intermediaries (SOW Section 2), not technical stakeholders requiring regular product updates.
Why it matters: SOW Section 2 directs requirements to SOFWERX specifically — DWX and SOFWERX appear related but distinct; misidentifying our contracting counterpart creates communication and compliance risk.

**[Misc]** We believe we will establish a direct contact at the TAK Product Center (TPC) within the first 2 weeks to confirm the SDK release schedule our work depends on (SOW 4.3.1).
Why it matters: Without a TPC contact, SDK release timing is an unmanaged external dependency that could block delivery.

## Facts

- USSOCOM is the primary customer (SOW line 4, 12)
- Weekly product management meetings with the Government are required (SOW 4.2.6)
- Kick-off meeting required within 3 business hours of contract start (SOW 4.2.5)
- Government PMO program execution requirements review is required (SOW 4.2.3.3)

## Noise

- Historical background on how DefenseWERX (DWX) was created
- SOF Acquisition, Technology & Logistics (SOF AT&L) internal office structure
- Previous contractors' stakeholder engagement approaches

# 2. Team Structure & Role Clarity

## Assumptions

**[Misc]** We believe a RACI exercise with Kevan and Sharon will clarify PM, technical lead, and Government liaison roles within the first 2 weeks.
Why it matters: Without defined ownership, deliverables like the Integrated Master Schedule (IMS) and weekly updates risk falling through the cracks or being duplicated.

**[Misc]** We believe Abel is the primary contractor Product Manager (PM) responsible for the Integrated Master Schedule (IMS), weekly management updates, and Government reporting (SOW 4.2.1, 4.2.2.1, 4.2.6).
Why it matters: SOW 4.2 assigns these responsibilities to "the contractor" without specifying individuals; this assumption needs confirmation with Kevan and Sharon.

**[Misc]** We believe Kevan and Sharon split Government liaison and technical leadership responsibilities, with one owning Program Management Office (PMO) communication and the other owning architecture and technical decisions (SOW 4.2.3.3).
Why it matters: This is an internal assumption not grounded in the SOW; it must be confirmed with Kevan and Sharon before kick-off — without it, Government touchpoints may be duplicated or missed.

**[Misc]** We believe program execution requirements review with the Government PMO (SOW 4.2.3.3) has not yet occurred and will be scheduled around the March 11th kick-off.
Why it matters: If this review already happened without our involvement, we may be missing baseline requirements that affect scope and delivery.

**[Misc]** We believe Abel, as PM, owns facilitation of the Government sprint resource planning collaboration required each sprint (SOW 4.2.3).
Why it matters: If Government participation in sprint planning is passive rather than collaborative, resource alignment gaps could surface mid-sprint.

**[Feasibility]** We believe the current team has skills in SDK modernization, Artificial Intelligence/Machine Learning (AI/ML) model development, security scanning via TAK Forge, and offline containerized deployment to meet all delivery requirements within 3 months (SOW 4.2.3.1, 4.3.1, 4.4.3, 4.5.2).

Why it matters: Skill gaps in any one of these areas translate directly to missed deliverables at the end of the performance period.

## Facts

- Contractor shall plan, organize, integrate, and execute all SOW requirements within cost and schedule (SOW 4.2.1)
- Contractor shall develop an Integrated Master Schedule (IMS) covering tasks in sections 4.2 and 4.3 (SOW 4.2.2.1)
- Contractor shall conduct 2-week sprints with sprint reviews and demonstrations (SOW 4.2.3)
- Contractor shall build and deliver a team composition per the SOW Summary of Deliverables Table (SOW 4.2.3.1)
- Contractor shall review with Government PMO and define program execution requirements (SOW 4.2.3.3)
- Contractor shall provide a final report summarizing technical performance, schedule, cost, tradeoffs, and risks (SOW 4.2.3.2)

## Noise

- Rise8's standard team composition on other contracts
- How previous TAK contractors structured their internal roles
- Generic Responsible, Accountable, Consulted, Informed (RACI) templates not specific to this effort
- Contractor's Progress and Status Report (CPSR) funds and man-hours reporting (SOW 4.2.4) — likely owned by Kevan/Sharon, not PM

# 3. Product & Technical Requirements

## Assumptions

**[Misc]** We believe the bridge contract scope covers four tracks: SDK modernization of the GRG plug-in (SOW 4.3.1), research and cost/timeline estimate for rewriting the plug-in into the TAK UI framework (SOW 4.3.2), AI/ML model improvements (SOW 4.3.3), and Government Off-The-Shelf (GOTS) software evaluation (SOW 4.3.4).
Why it matters: Without confirming all four tracks, we risk under-planning or missing a deliverable the Government expects. Note: a TAK UI audit has been discussed informally but is not explicitly named in the SOW — confirm scope at kick-off.

**[Misc]** We believe the full rewrite of the GRG plug-in into the TAK UI framework is NOT expected during this bridge contract — only the research and cost/timeline estimate to inform a future effort (SOW 4.3.2).
Why it matters: If the Government expects the rewrite delivered — not just scoped — effort and timeline are significantly larger than planned.

**[Misc]** We believe "re-write" refers to officially enabling and integrating the prior team's 8-week prototype into the TAK UI framework to establish TAK UI Bridge language cross compatibility — not a ground-up rebuild (SOW 4.3.2).
Why it matters: Misunderstanding what "re-write" means leads to over- or under-scoping the effort from day one.

**[Misc]** We believe "modernization" refers specifically to updating the GRG plug-in to the latest Software Development Kit (SDK) release from the TAK Product Center (TPC), not a broader architectural overhaul (SOW 4.3.1).
Why it matters: Scope of modernization is undefined; misalignment drives timeline and effort estimates in the wrong direction.

**[Misc]** We believe the TAK Product Center (TPC) SDK release schedule is knowable and will be confirmed at kick-off so we can plan our sprint cadence around it (SOW 4.3.1).
Why it matters: If TPC releases follow a Scaled Agile Framework (SAFe) Program Increment (PI) planning cycle, our 2-week sprints may need to align with their external cadence.
> Jonathan Miller (TAK tech POC)
> Part of Comms

**[Feasibility]** We believe the AI/ML GRG plug-in can be updated to the current SDK while maintaining SOCOM release compatibility within the 3-month performance period (SOW 4.3.1).
Why it matters: SDK updates may introduce breaking changes requiring rework that exceeds available time.

**[Feasibility]** We believe security scan thresholds — zero critical, zero high, less than 10 moderate, less than 20 low findings — are achievable with current dependencies via TAK Forge (SOW 4.4.3).
Why it matters: If core dependencies carry known vulnerabilities, we may need waivers or replacements before delivery.

**[Feasibility]** We believe 80% unit test coverage and containerized offline deployment for Windows and Android are achievable within the sprint cadence (SOW 4.5.2, 4.5.8).
Why it matters: These are hard delivery requirements; underestimating the effort creates risk of a non-compliant final submission.

**[Desirability]** We believe Artificial Intelligence/Machine Learning (AI/ML) model improvements will be validated with the Government team — not field operators directly — to confirm they reduce cognitive workload in context (SOW 4.3.3).
Why it matters: SOW 4.3.3 says "engaging with the government team," not operators in the field. Who on the Government side represents end-user needs must be confirmed at kick-off — without it, model improvements may not reflect actual operator experience.

**[Misc]** We believe the Government Off-The-Shelf (GOTS) software evaluation (SOW 4.3.4) will be led by the engineering team with the Product Manager (PM) coordinating the final briefing to the Program Management Office (PMO), and that the Government will define what "modularity and scalability" criteria apply.
Why it matters: Without Government-defined criteria, the team risks conducting a GOTS assessment with no agreed baseline for what a passing evaluation looks like.

## Facts

- Contractor shall modernize the AI/ML GRG plug-in to current SDK while maintaining SOCOM compatibility (SOW 4.3.1)
- Contractor shall research and provide cost/timeline estimate for re-writing plug-in to TAK UI framework (SOW 4.3.2)
- Contractor shall conduct research to improve the AI/ML model for the GRG plug-in (SOW 4.3.3)
- Contractor shall evaluate Government Off-The-Shelf (GOTS) software capabilities for modularity and scalability and brief the PMO (SOW 4.3.4)
- Security scan must pass via TAK Forge: 0 critical, 0 high, <10 moderate, <20 low findings (SOW 4.4.3)
- Containerized build and deployment required for offline Windows and Android environments (SOW 4.5.2)
- TAK SDK must be leveraged for the frontend (SOW 4.5.7)
- 80% unit test code coverage required (SOW 4.5.8)
- Software Bill of Materials (SBOM) required for all software and open-source dependencies (SOW 4.5.14)
- 48-hour resubmission window granted in the event of a deployment failure (SOW 4.5.15)
- All data must be unclassified and free of US Persons (USPER) data (SOW 4.5.11)

## Noise

- Internal Rise8 engineering standards not specific to TAK requirements
- AI/ML frameworks not approved or relevant to the GRG plug-in context
- General containerization best practices outside the offline Windows/Android constraint
- Prior prototype's technical stack decisions made by previous contractor team

# 4. Scope, Timeline & Budget Constraints

## Assumptions

**[Misc]** We believe the 3-month performance period begins March 11th kick-off and ends approximately June 11th, with no extensions anticipated (SOW Section 2, 4.2.5).
Why it matters: All delivery planning, the Integrated Master Schedule (IMS), and sprint cadence depend on confirmed start and end dates.

**[Misc]** We believe "propose output in response to budget, pricing of overall teams, and other cost variables" (SOW Section 2) means we demonstrate what deliverables we can deliver within the agreed budget — not that we re-propose our own pricing.
Why it matters: Misreading this requirement affects how we communicate scope commitments and tradeoffs to the Government.

**[Misc]** We believe the prior Rise8 team's 8-week prototype serves as the confirmed technical and functional baseline for this bridge contract (SOW Section 2).
Why it matters: If the Government expects a different or higher baseline, scope and rework estimates change significantly from day one.

====

**[Misc]** We believe clarifying the boundary of "modernization" at kick-off requires the Government to confirm which dimensions are in scope. Rise8 proposes organizing modernization across four areas — architecture, infrastructure/Development Security Operations (DevSecOps), User Experience/User Interface (UX/UI), and observability/operations — as a working framework for scoping discussions. These four categories are not defined in the SOW (SOW 3.1, 4.3.1).
Why it matters: "Modernization" appears multiple times in the SOW without a defined boundary. Without Government confirmation of scope, the team risks planning against a framework the Government has not agreed to.

===

**[Misc]** We believe the Integrated Master Schedule (IMS) serves as both the formal Government schedule artifact and the team's internal planning roadmap — not two separate documents maintained in parallel (SOW 4.2.2.1).
Why it matters: If the Government requires a separate IMS format from our internal roadmap, the PM must maintain two artifacts, adding overhead.

**[Misc]** We believe the Contractor's Progress and Status Report (CPSR) for funds and man-hours expenditure (SOW 4.2.4) is owned by Kevan or Sharon, not the Product Manager (PM).
Why it matters: If this falls to the PM, it's an unplanned reporting obligation that needs to be scoped into the PM's capacity.

**[Feasibility]** We believe four parallel workstreams — SDK modernization, TAK UI rewrite estimate, AI/ML model improvements, and Government Off-The-Shelf (GOTS) evaluation — are achievable within 3 months with the current team (SOW 4.3.1, 4.3.2, 4.3.3, 4.3.4).
Why it matters: Four concurrent tracks with a small team in 3 months risks quality and on-time delivery across all workstreams.

**[Misc]** We believe our 3-month delivery window will not be blocked by the TAK Product Center (TPC) SDK release schedule — the SDK version we need will be available before our final delivery date (SOW 4.3.1). Note: confirming whether the SDK schedule is knowable is addressed in Category 3; this assumption is specifically about whether TPC's release cadence threatens the budget and timeline commitment.
Why it matters: If the required SDK version drops after our performance period ends, we cannot deliver a compliant modernization — this is a hard schedule and budget dependency that must be resolved at contract start.

**[Misc]** We believe there is an agreed process for surfacing and resolving scope-budget tradeoffs — specifically, that the Government and contractor will jointly decide what gets cut or deprioritized if budget constrains delivery across the four tracks (SOW Section 2).
Why it matters: SOW Section 2 describes a "flexible" agreement structure, but without a defined tradeoff process, scope cuts can happen without Program Management Office (PMO) visibility or formal agreement — creating delivery risk and accountability gaps.

## Facts

- Performance period is 3 months (SOW Section 2)
- Agreement structure is intended to be flexible within established scope (SOW Section 2)
- Contractor shall develop an Integrated Master Schedule (IMS) covering all tasks in sections 4.2 and 4.3 (SOW 4.2.2.1)
- Contractor shall provide a final report with technical performance, schedule, cost implications, tradeoffs, and risks (SOW 4.2.3.2)
- Contractor shall develop and submit a Contractor's Progress and Status Report (CPSR) specific to this effort (SOW 4.2.4)
- Overall scope includes research, software development, and modernization for the AI/ML GRG plug-in and TAK UI (SOW 3.1)
- Prototype baseline is the AI/ML Gridded Reference Graphic (GRG) capability delivered prior to this contract (SOW Section 2)
- Four defined research and development tracks: SDK modernization (4.3.1), rewrite estimate (4.3.2), AI/ML model improvements (4.3.3), GOTS evaluation (4.3.4)

## Noise

- Government's internal budget approval processes above the contract level
- Pricing negotiations and contract vehicle history between DWX and Rise8
- Scope from other concurrent TAK contracts not assigned to this team
- SAFe Program Increment (PI) planning details from other DoD programs not directly blocking this effort

# 5. Delivery Model & Reporting

## Assumptions

**[Misc]** We believe GitLab can serve as the Performance Management System (SOW 4.2) — covering planning, monitoring, and reporting — without requiring a separate Government-mandated tool.
Why it matters: If the Government expects a different system (e.g., Microsoft Project), we need to confirm early and plan for dual-tool maintenance. GitLab must also satisfy the SOW's auditability requirement — confirm Government accepts GitLab output as compliant before kick-off.

**[Misc]** We believe the weekly Government management update (SOW 4.2.6) and the 2-week sprint review/demo (SOW 4.2.3) are separate meetings with different audiences and purposes — not the same event.
Why it matters: Conflating them risks missing either Government reporting obligations or internal team sprint cadence.

**[Misc]** We believe sprint reviews and demonstrations (SOW 4.2.3) are conducted with Government stakeholders present, not just as internal team ceremonies.
Why it matters: If the Government expects to attend demos, logistics and preparation need to be factored into each sprint.
> Meetings, Comms and Documentation

**[Misc]** We believe the Government will accept GitLab exports — Git history, security scans, sprint artifacts — as compliant submission of all Project Management and DevSecOps artifacts (SOW 4.5.13). Submission format and portal to be confirmed at kick-off.
Why it matters: SOW 4.5.13 references "Artifacts from Jira" as an example — not GitLab. If the Government expects a Jira-based format or a specific submission portal, the team needs to know before the first delivery sprint ends.
> Meetings, Comms and Documentation

**[Misc]** We believe the final report and briefing (SOW 4.2.3.2) should be treated as a living document from day one, updated continuously throughout the contract with technical performance, cost, tradeoffs, and risks.
Why it matters: Building this document retroactively at the end of the contract creates risk of missed insights and last-minute scramble.
> Meetings, Comms and Documentation
> report format, software eval (CPSR?)

**[Misc]** We believe the Software Bill of Materials (SBOM) (SOW 4.5.14) is currently being maintained by the engineering team as a running document and is not a new artifact to create from scratch at delivery.
Why it matters: If no SBOM exists, creating one at the end of the contract is a significant effort that must be scoped in now.
> Jon said they did this for the 8 week prototype

**[Misc]** We believe TAK Forge sits within the Software Development Life Cycle (SDLC) as the Continuous Integration/Continuous Deployment (CI/CD) pipeline gate, and the team's end-to-end process should be mapped early to identify where scans, reviews, and deployments occur (SOW 4.4.3, 4.5.16).
Why it matters: Without a mapped SDLC, the PM has no visibility into where quality gates apply or where blockers could emerge. TAK Forge is for official use only — all work performed through it must be within contract scope and authorized by the Government.
> We got our stuff containerized as part of the prototype

**[Misc]** We believe production deployment of the updated GRG plug-in is not gated by an external TAK Product Center (TPC), SAFe Program Increment (PI), or SOCOM release cycle outside our control (SOW 4.3.1).
Why it matters: If delivery depends on TPC coordinating a broader release, our delivery date is not fully within our control — this needs to be confirmed at kick-off.

**[Misc]** We believe Rise8's Extreme Programming (XP) and lean iteration approach — short cycles, test-driven development, continuous integration — satisfies the SOW's agile methodology requirement (SOW 4.4.1).
Why it matters: If the Government expects Scrum-specific ceremonies (standups, retrospectives, story points), the team's XP-based delivery model may create confusion or compliance questions.

## Facts

- Contractor shall use a Performance Management System as the single, formal, integrated system for cost, schedule, and performance reporting (SOW 4.2)
- Contractor shall conduct 2-week sprint reviews and demonstrations with the Government (SOW 4.2.3)
- Contractor shall conduct weekly product management meetings with the Government (SOW 4.2.6)
- Contractor shall provide a final report and briefing summarizing technical performance, schedule, cost, tradeoffs, and risks (SOW 4.2.3.2)
- Contractor shall submit all Project Management and Development Security Operations (DevSecOps) artifacts for review, including GitLab artifacts, Git history, and security scans (SOW 4.5.13)
- Contractor shall submit a Software Bill of Materials (SBOM) for all software and open-source dependencies (SOW 4.5.14)
- Contractor shall provide deployment instructions; 48-hour resubmission window granted on failure (SOW 4.5.15)
- TAK Forge access provided for code scanning; 48-hour remediation window for critical/high Common Vulnerabilities and Exposures (CVEs) (SOW 4.5.16)
- All delivered code must be open-source or delivered with purpose/unlimited rights to the Government (SOW 4.5.17)

## Noise

- Specific artifact formatting preferences not mandated by the SOW
- Other contractor's reporting formats and cadence patterns
- Non-TAK Forge scanning tools used on other Rise8 contracts
- Internal Rise8 sprint ceremony formats not required by the Government
----









# Pre-Kick-off: Kevan Sync — Assumptions to Validate

## 1. Stakeholder Network

**[Misc]** We believe Kevan has working history with Jordan Boring (Acquisition Program Manager) and Jonathan Miller (Technical Point of Contact) from the prior 8-week prototype — and can brief us on their communication styles, priorities, and decision-making patterns before the March 11th kick-off.
Why it matters: Jordan and Miller are the two confirmed core collaborators. Walking into kick-off without that context means the team is building the relationship from scratch when Kevan may already have it.

**[Misc]** We believe Kevan can clarify Brittany Boucher's role and whether she is a decision-maker, a higher-level observer, or not a core collaborator for this contract — her name appears in the SOW draft but no communication history exists with the team (SOW Section 2).
Why it matters: Misidentifying Brittany's level of involvement — either over-engaging or ignoring her — creates stakeholder management risk, especially if she holds authority above Jordan Boring.

**[Misc]** We believe Kevan's input is needed to confirm who the Government will send to the kick-off stakeholder mapping exercise — specifically whether Jordan Boring and Jonathan Miller will be present and empowered to define engagement levels (Core Collaborator, Involved, Informed).
Why it matters: The stakeholder mapping exercise only works if the right people are in the room. If Kevan has a relationship with Jordan or Miller, he may be able to confirm attendance or flag if the exercise needs to be scoped differently.

## 2. Team Structure & Role Clarity

**[Misc]** We believe this bridge contract is execution-focused — the four delivery goals (SDK modernization, rewrite estimate, AI/ML model improvements, GOTS evaluation) function as a checklist to complete, not a prioritization exercise tied to mission impact or user outcomes.
Why it matters: Rise8's culture defaults toward outcome-driven, problem-solution thinking. If the team approaches this contract that way, it creates misaligned expectations with the Government and risks spending time on framing work that isn't in scope — confirm this internally with Kevan before kick-off.

## 3. Product & Technical Requirements

**[Misc]** We believe Kevan has context from prior Government conversations that can help define what "improving the AI/ML detection model" means — specifically, what metric or testable criteria the Government would accept as evidence of improvement (SOW 4.3.3).
Why it matters: SOW 4.3.3 provides no baseline, no metric, and no acceptance criteria. Without a defined experiment or measurable target, the engineering team has no way to know when this goal is complete — or if it was ever achieved.

**[Misc]** We believe Kevan can help define the scope of the Government Off-The-Shelf (GOTS) software evaluation — specifically, which software applications are in scope and what the Government means by "modularity and scalability" before we begin the assessment (SOW 4.3.4).
Why it matters: SOW 4.3.4 is broadly stated with no list of software to evaluate and no criteria for the briefing. Without scope boundaries, the team could spend significant effort evaluating software the Government doesn't care about — or miss the ones they do.

**[Misc]** We believe Kevan has enough context from the prior 8-week prototype to identify the target SDK version Jonathan Miller will accept — and can confirm or surface this question before the March 11th kick-off (SOW 4.3.1).
Why it matters: Without a confirmed target SDK version, the engineering team cannot size the modernization effort. This is the single most specific technical input needed to begin sprint planning.

## 4. Scope, Timeline & Budget Constraints

**[Misc]** We believe Kevan knows whether Scaled Agile Framework (SAFe) Program Increment (PI) planning is active within SOCOM and can confirm whether it creates any hard constraints on our 2-week sprint cadence or delivery window (SOW 4.3.1, 4.2.3).
Why it matters: If PI planning cycles govern when TAK Product Center (TPC) releases SDKs or when code can be accepted, our timeline may be externally gated in ways the SOW doesn't make explicit.

**[Misc]** We believe the key delivery dates in the SOW are incorrect and that Kevan can help us establish accurate milestones — including the confirmed start date, final demo date, and management status report deadline — before or during kick-off (SOW 4.2.5, 4.2.3.2).
Why it matters: The Integrated Master Schedule (IMS) and sprint cadence are built on these dates. Planning against incorrect dates creates compounding schedule risk from day one.

## 5. Delivery Model & Reporting

**[Misc]** We believe Kevan has signal from prior Government interactions — or from setting up the GitLab repository — on whether the Government will accept GitLab exports as compliant artifact submissions in place of Jira-based artifacts (SOW 4.5.13).
Why it matters: SOW 4.5.13 references "Artifacts from Jira" as an example. If the Government expects Jira and we surface this after sprint 1, we have a compliance gap with no time to course correct.

**[Misc]** We believe the Rise8 GitLab repository Kevan and Thomas already established is the correct single system for planning, story tracking, and artifact delivery — and that no parallel tool setup is needed before kick-off (SOW 4.2, 4.5.13).
Why it matters: If the Government mandates a separate system or if Kevan set up the repo under different assumptions, the team may be tracking work in a tool that can't satisfy the SOW's performance management or submission requirements.