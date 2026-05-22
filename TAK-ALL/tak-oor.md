# General Project Info

# Mission / Vision Statement

# Problem We Are Solving / The Opportunity

# Mission Impact

# Enabling Outcomes


**Working Draft — TARGET Enabling Outcome (April 9, 2026)**
**Workstream:** Deployment and Release Infrastructure

**Output** Keystore path fix and CI/CD pipeline configured to produce a signed .mil APK on every merge


**Mission Impact:** Operators received a signed, field-deployable build without waiting on Rise8 or TPC to troubleshoot the release path each cycle.

*Still needs validation: does "repeatable" hold after a second clean cycle? Which epic does this belong to — FEATURE-TAK-Bridge-0004 or 0005?*

---

**Working Draft — TARGET Enabling Outcome (April 15, 2026)**
**Workstream:** TAK UI Migration

**Problem:** The AI GRG plugin relies on workarounds for 80% of its UI components because TAK UI's current coverage is limited, documentation is outdated, and no formal roadmap exists, leaving Rise8 dependent on BAH's sprint decisions rather than contributing to the framework SOFMC/USSOCOM expects both contractors to build together.

**Output:** Research spikes, user stories with effort estimates, and established contributor status within SOFMC/USSOCOM's PI planning cadence, giving both Rise8 and BAH a shared backlog to work from.

**Enabling Outcome:** Rise8 team shifted from TAK UI consumer to key contributor, influencing native component prioritization for TAK UI v1.0 release.

**Mission Impact:** SOCOM ceased rebuilding platform-specific plugin versions, deploying the AI GRG once across WinTAK, TAKX, WebTAK, and OASIS.

*Still needs validation: confirm Rise8 contributor status is formally recognized within SOFMC/USSOCOM's PI planning cadence.*

# Mission Outcomes

**Working Draft — TARGET Mission Outcome (April 15, 2026)**
**Workstream:** Model Improvements

**Problem:** The manual effort required to configure and correct GRGs grows disproportionately with building count, consuming the available planning window and forcing creators to submit an incomplete GRG rather than miss the mission window entirely.

**Output:** Improved AI building detection capability, including tile caching and sliding window detection, that reduces the number of manual corrections required to complete a GRG.

**Mission Outcome:** SOF Operators increased their focus on the mission environment, as the frequency and manual effort required for configuring and correcting GRGs on the device screen is reduced.

**Mission Impact:** By reducing the cognitive burden of navigating a complex UI, operators are able to maintain a more consistent focus on their surroundings, minimizing the distraction caused by the device during the planning and execution windows.

*Still needs validation: confirm with Nik or Jonathan Miller that reduced manual correction effort is the right framing for what operators experience in the field.*

--

**Output:** We shipped an AI powered plugin for TAK (mil version) that allows automated creation of labeled Gridded Reference Graphics (maps with buildings labeled for mission use/comms)

**Target Mission Outcome:**  Operators produce accurate GRGs in less time and with less effort.
> How do we validate this in the mission
* SCENARIO
* Signal
> Time 

**Target Mission Impact:** Forces are provided with more complete GRGs, even when time is short, so less bad things happen during the mission.


*Still needs validation: To verify this we need to connect with end users (currently not provided, but we are trying to make inroads to get to them within bridge contract). Right now we can say it's true from our own testing and from a SOCOM SOFMC PM (standing in as a user representative) experience - we have been able to demonstrate fast, complex GRG creation with good accuracy.*

---
