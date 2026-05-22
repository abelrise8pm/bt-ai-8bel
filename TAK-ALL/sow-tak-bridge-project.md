
## 1 BACKGROUND

**DEFENSEWERX (DWX)** primary objective is to provide services for the United States Special
Operations Command (USSOCOM) to increase the likelihood of success in the conduct of
cooperative or joint activities with small business firms and educational institutes. This will be accomplished by stimulating technology development, and by promoting the outbound and
inbound transfer of technology between Special Operations Forces Acquisition, Technology and
Logistics (SOF AT&L) and academia, industry, and Federal Laboratories.
<> Abel's takes:
* What is or who is DWX, DEFENSEWERX? are they they our stakeholders? Are they a special office within USSCOM?
* Are we one of those "business firms" thy want to increase success and cooperative joint activities? 
* USSOCOM is the the main customer and user base?
* I need to "dig" in here to determine what matters for a succesful partnership and define some goals for that.
* Who is SOFT AT&L and do we interact with them?
</>

Special Operations Forces Mission Command (SOFMC) Tactical Assault Kit (TAK) software is a
critical tactical situational awareness tool that automates many aspects of joint operations,
serving as a key enabler for the Special Operations Forces (SOF) operators decision cycle. It
enhances force responsiveness and availability by leveraging near real-time data, advanced
information management, and knowledge-based application tools with data-driven decision-
making capabilities. 
<> Abel's takes:
* TAK enables SOF (Special Ops Forces) operators with the following (which could be linked to outcomes):
- decision cycle
- force responsiveness
- force availability" (what does this mean? I need examples)
- provides near real-time data
- "advanced information management" What exactly is that?
- data-driven decisions making
</>
When integrated with other fielded USSOCOM and Department of War
(DoW) systems, tactical end-user devices, and relevant data interfaces, SOFMC provides an
automated, fused mission planning and operations environment through a variety of software
applications. This includes mission rehearsal, assessment and analysis, and execution applications that streamline and accelerate critical mission command activities for special operations forces.
<> Abel's takes:
* Integration with other systems, devices and data interfaces is essentioal
* What is and or who's SOFMC?
* Some of the capabilities that these integrations have are: automated, fused mission planning and operations environment 
* Some Use cases, that could have potential Outcomes and Impacts
- mission rehearsal
- assessment and analysis
- streamline and accelerate critical mission command activities
</>

TAK and associated TAK plug-in applications are key components of mission planning and
execution systems. TAK has transformed into an ecosystem with development occurring across
several DoW labs, supported by multiple programs serving as transition agents, investors, and
implementation arms. TAK is available in multiple form factors and is widely used within the
DoW. The SOFMC Program develops tailors, and fields TAK and all its variants to SOCOM
users for mission planning and execution across the air, ground, and maritime domains.
<> Abel's takes:
* Mission Planning and Mission Execution appear to be the phases TAK can serve
* TAK has tranformed into an ecosystem across multiple gov/mil programs

## 2 PURPOSE

The purpose of this Statement of Work (SOW) is to provide SOFWERX with the requirements
for TAK software development and modernization efforts over a period of 3 months.
The Government intends for the Agreement structure to be flexible within the scope of work
established by the SOO. The requirements will be agreed upon with the Performer’s agile
planning cycle, with the intent of the contractor to propose output in response to budget, pricing
of overall teams, and other cost variables. 
<> Abel's takes:
* I am assuming that we are the "performers" and the "contractors" if that's true, then I need to understand what it means in plain english "to propose output in response to budget, pricing
of overall teams, and other cost variables."
</>
The objective is to maintain with current software releases using as the baseline the software delivered as a prototype for the Artificial Intelligence/Machine Learning (AI/ML) Gridded Reference Graphic (GRG) capability that allows a user to store, manage, analyze, edit, output, and visualize patterns, relationships, and geographic context in relation to a tactical plan. The objective included decreasing the cognitive workload by generating an AI/ML GRG.
Note: Our team at Rise8 was the team who already developed a version of this "the prototype"
<> Abel's takes:
* So, does this mean that the baseline for release process is whatever the team who delivered the prototype set? 
* These sound like the features and our capabilities:allows a user to store, manage, analyze, edit, output, and visualize patterns, relationships, and geographic context in relation to a tactical plan, aka the outputs
* An this feels like an outcome "decreasing the cognitive workload by generating an AI/ML GRG." Which I am under the impression we already accomplished that. 
- 
</>


## 3 SCOPE/INITIAL OBJECTIVES

* 3.1 Overall expectations for all efforts are to conduct research, software development, and
modernization for the AI/ML enabled GRG plug-in and TAK UI.
<> Abel's takes:
* We need to document all our research findings, and ensure they are constantly updated and make it an output/delivrable
* I want to understand what exactly are they refering to with "modernization" for each category: architecture, infastructure and DevOps, UX and UI, Observability and Operations(logging, monitoring)
</>

* `3.1.1` In the event of a conflict between the text of this SOW and the references cited herein, the
text of this document shall take precedence. Nothing in this document, however, shall supersede applicable laws and regulations, unless a specific exemption has been obtained from the Government.

> Commented [JCx]: Do we plan on having them propose a SOW or are we using this SOO as the requirement document for prototype?
> Commented [JV2Rx]: Great Question. The original plan was to provide SOO and have them propose back
with a SOW. However, it would save significant time for the Gov’t to propose a SOW, which would require
changing should to shall. Defer to the Government.
> Commented [JV3Rx]: SOO to be prosed as requirement and 3 days to redlon the soo if necessary

## 4 SPECIFIC TASKS

`4.1` General. The contractor shall provide product management, research and software
development in accordance with sections 4.2 and 4.3.

### `4.2` Product Management
- `4.2.1` General. The contractor shall plan, organize, integrate, and execute all requirements
included in this SOW within cost and schedule.
> Abel's takes: As the PM this sounds like lots of things that are up to me. I need to keep an eye on what they exactly mean by "all requirements" and most importantly once its confirm, what are the outcomes
</>
- `4.2.` Performance Management System. The contractor shall use its performance management system to plan, schedule, budget, monitor, manage and report cost, schedule, and performance for this development effort. The contractor’s performance management system serves as the single, formal, integrated system that meets both the contractor’s management requirements and
the requirements of the Government for timely, reliable, and auditable performance information. The contractor shall use the output of this system to form the basis for reporting detailed performance status at the weekly management updates.
> Abel's takes: Need to clarify with Keven and Sharon, what exactly is Performance Magement system, there are a lot of things in there, however GitLab can do; plan, monitor and even performance. Here is another thing that fall under my responsability; "The contractor shall use the output of this system to form the basis for reporting detailed performance status at the weekly management updates." checked! noted!
</>

- `4.2.2.1` Schedule. The contractor shall develop an Integrated Master Schedule (IMS) of activities required to execute tasks per sections 4.2 and 4.3.
> Abel's takes: So basically a roadmap it might be two artfifacts, we must show "the development effort, target dates, milestones, and we will do our outcomes, impacts,.. etc. 
<>

- `4.2.3` Agile Practices. The contractor shall conduct management of the effort in concert with agile practices. The contractor shall conduct resource planning for each development sprint in collaboration with the Government. The contractor shall hold 2-week sprint reviews and demonstrations within a single planning increment to cover requirement management for the developer and engineering teams.
> Abel's takes: pretty straight forward, 2 week sprints, and have a review at the end. I guess my only question will be about going to prod, do we wait or depend on some sort of "release train"?
<>

`4.2.3.1` The contractor shall build a team composition for the effort and delivery by the SOW Summary of Deliverables Table.

`4.2.3.2` The contractor shall provide to the Government, in the final report and briefing, with a summary of the technical performance, schedule, cost implications, tradeoffs and risks associated with this effort.
> Abel's takes: This is important, I and it goes hand in hand with what I said earlier about consistantly documenting all our insights. I need to provide this, and I should put together a template, this will be a living document.
<>

`4.2.3.3` The contractor shall review with Government PMO and define program execution Requirements.
> Abel's takes: Need to check in with Kevan and Shanon, understand if this has happened and when will it happen and are the requirements any diferent than waht we 

<>
`4.2.4` Funds and Man-Hours Expenditure Report. The contractor shall develop and submit a Contractor’s Progress and Status Report (CPSR) specific to this development effort.
> Abel's takes: dont think this applies to me.
<>

`4.2.5` Kick-Off Meeting. The contractor shall plan, host and conduct Kick-Off meeting with the Government. The contractor shall complete this meeting within 3 business hours of the start of the performance period.
> Abel's takes: Need to confirm with Sharon and Kevan if we need to do this March 11th ad then align on the proper level of kick-off activities. As this is not a spanking new engagement and the "bridge" aspect of 2 months has some specific requirements.
<>

`4.2.6` Management Updates. The contractor shall conduct weekly product management meetings with the Government, primarily focused on management task accomplishment, logistics, and issue resolution.
> Abel's takes: makes sense a good ole' weekly update sync. I can set that up. I guess I just need to know who and logitics

<>

### `4.3` Research and Software Development

`4.3.1` The contractor shall conduct research and software development to modernize the AI/ML enabled GRG plug-in up to date with the most current software release, specifically the Software Development Kit (SDK) delivered on an established schedule by the TAK Product Center (TPC),
while also maintaining compatibility with the SOCOM releases.
> Abel's takes: Again, the term "modernize" comes up again. It be good for us to understand what they expect specifically. Second, who is the TPC, TAK Product Center? Do we have a contact there and how depedent are we on their "established schedule" and last or third (might be related) The SOCOM releases, I heard there's Scale Agile sAFE, PI planning.. So we need to ensure we have that sorted out. I have some bad experiences working with those type of setups.
</>

`4.3.2` The contractor shall conduct research, while engaging with the government team, to provide a cost and timeline estimate for the effort required to re-write AI/ML enabled GRG plug-in into TAK UI development framework. The goal is to establish TAK UI Bridge language cross
compatibility.
> Abel's takes: Very interesting. Till this point it has been unclear what exactly is expected from us (contractors) to complete during the Bridge contract aside from updating the plugin version, auditing the TAK UI.. This section appears to give more info, My assumption is that it consist of 
a) cost and timeline estimate for the effort, 
b) re-write AI/ML enabled GRG plug-in into TAK UI development framework, 

it's essential for me to understand if this effort is what we should focus for the bridge contract, Naturally I am wondering what exactly do they mean by "re-write" I know the prior team took 8 weeks to present a working prototype with their requirements, but do they mean we have to "re-write that and officially "enable" it to the TAK framework? that needs to be clarify. I believe that might be the bulk of the effort and its essential that I, as a PM undersatnd what it entails and organize/plan it accordingly.
</>

`4.3.3` The contractor shall conduct research, while engaging with the government team, to make improvements to the model for the AI/ML enabled GRG Plug-in.
> Abel's takes: I mean, this feels normal. However for me as a PM I ned to determine what are some "categories" and our "themes" that I should keep track of that are consider best practices in "improving" models for the plug-in. Very important to establish that, have some baselines and ensure Kevan and the devs are aware of it.
</>

`4.3.4` The contractor shall evaluate existing program of record Government Off-The-Shelf (GOTS) software capabilities for modularity and scalability as directed by the Government. The contractor shall provide an assessment of these capabilities in a briefing to the PMO.
> Abel's takes: Ok so keywords here for me as a PM, evaluation of the GOTS capabilities. Obviously this is something engineers will lead, but from a PM sense it's important to ensure our recommendations are modular and scalable, because that equals flexibility. it's importnat for me to understand the components and future data and user volumes.
</>

### `4.4` Performance Measurement Criteria

`4.4.1` The contractor’s processes are aligned with an established agile methodology or subset discipline.

`4.4.3` The deliverable shall pass Static Security Code scan analysis via TAK Forge (software pipeline of TAK.gov) with zero critical findings, zero high findings, less than ten (10) moderate findings, and less than twenty (20) low findings. TAK Forge is a platform or tool used in the development and security analysis of software, particularly for scanning and validating code to ensure it meets specific security standards by identifying critical, high, moderate, and low findings in the code.
> Abel's takes: As a PM I need to get familiar with TAK Forge, and with our security scans process. It would be valuable for me to map out our SDLC with the team, so that I know where things are at in the life-cycle and what areas are impacted etc.
</>

### `4.5` Software Delivery Expectations
> Abel's takes: from `4.5.1` to `4.5.12` i didnt leave Abel's takes because most of these are requirements for the engineers, If I have specific questions and takes.. I provided them.
</>

`4.5.1` Partition into separate directories for each service, with an accompanying instruction file.

`4.5.2` Configured for containerized build and deployment within an offline Windows and Android environment.

`4.5.3` Contain a Windows executable/Android APK file that shall be provided to build and run all service containers.

`4.5.4` Contain all required software and dependencies for the application to function properly.

`4.5.6` At a minimum, separated into frontend and backend services, however additional services for databases, model orchestration, etc. are permitted.

`4.5.7` Leverage TAK SDK for the frontend.

`4.5.8` Contain unit tests that cover at least 80% of the code used in the application.

`4.5.9` Contain test procedures to test against user story acceptance criteria.

`4.5.10` Include a README file that provides detailed information on the service's functionality,execution instructions (including containerization), unit test execution, and a list of dependencies.

`4.5.11` All data must be unclassified and not contain US Persons (USPER) data.

`4.5.12` All software, dependencies, and data are limited to Low Sensitivity, Routine, Public, and synthetic test/dummy data.

`4.5.13` The contractor will submit all Project Management and DevSecOps artifacts for review. Examples: Artifacts from Jira, Git history, security scans, etc.
> Abel's takes: when they say "submit" not sure I understand in what format?
</>

`4.5.14` The contractor will submit a Software Bill of Materials (SBOM) for all software submitted to include any open-source software leveraged in the delivery.
> Abel's takes: I would need ro confirm with our engieners if they have a running or live document where they list these things and keep it up to date..
</>

`4.5.15` The contractor will provide deployment instructions for the updated software. The deployment team will execute these instructions precisely. In the event of a deployment failure,the performer will be notified, provided with relevant error logs, and granted a single 48-hour extension to resubmit a corrected version.
> Abel's takes: Makes sense, I think it be useful for me to ensure our engineering team has all these documents and we keep them up to date, part of our deliverables/outputs
</>

`4.5.16` The contractor will be provided with access to code scanning tools through TAK Forge. TAK Forge is for official use only, any work performed in/on TAK Forge must be within the scope of work of the contract. If critical or high-severity Common Vulnerabilities and Exposures (CVEs) are identified in the submission, the performer will be notified and provided with the scanning tool output. The performer will have a 48-hour opportunity to resubmit a remediated version from time of notification.
> Abel's takes: OK, important for me as a PM to understand TAK Forge (have access to it as well) Understand where it "sits" in the SDLC, Ci/Cd pipeline processs, also how we conduct these scans, there seem to be a few types CVEs and there were others.. As a PM I want my engineers to lay out the land sort of speak and we need a map of our entire end to end process. MAYBE we do a "SIPOC" of the process? (a processcess mapping tool used to define the boundaries and key components of individual business processes in a single, bird’s-eye view.) 
</>

`4.5.17` All code delivered in support of this effort, including Government Off-The-Shelf (GOTS) software, must either be Open-Source or delivered with purpose rights or unlimited rights to the Government. The contractor shall ensure the GOTS software complies with all specified security, configuration, and functionality requirements, including compatibility with TAK Forge,associated SDKs, and deployment expectations.
> Abel's takes: noted and basically in line with what I said earlier about having a the full process mapped out and the appropriate documentation update to date as part of our deliverables and outputs. 
</>

## Meeting with Kevan March 9th 
 