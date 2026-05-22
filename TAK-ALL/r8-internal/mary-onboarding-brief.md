# AI GRG Plugin: New Team Member Briefing
**As of May 4, 2026**

---

## The Domain

**ATAK (Android Team Awareness Kit)** is the U.S. military's primary mobile situational awareness application for field operations. Built on Android and deployed on ruggedized devices, ATAK gives operators a common operational picture: blue force tracking, map layers, communications overlays, and mission-specific plugins. The TAK ecosystem also includes WinTAK (Windows), TAKX (iOS), and WebTAK, all running on the same architecture and plugin framework.

**SOFMC (Special Operations Forces Mission Critical)** is a SOCOM program office responsible for acquiring and maintaining mission-critical software for Special Operations Forces. **SOCOM (United States Special Operations Command)** is the combatant command that oversees and synchronizes special operations forces across all U.S. military branches.

**SOF Team Leaders and Operators** plan and execute direct action, reconnaissance, and other sensitive missions in complex, denied, and time-compressed environments. Planning windows are short, often measured in hours. Ground intelligence must be current, precise, and quickly shareable across the team.

**The Pain Point:** A Gridded Reference Graphic (GRG) is a map overlay that labels buildings for target reference and team communications during missions. Operators currently build GRGs with limited automation, identifying and labeling buildings one by one. At scale (200+ buildings), this process consumes a significant portion of the available planning window. Any building missed or mislabeled creates communication risk during execution.

---

## What the AI GRG Plugin Does

The AI GRG Plugin is a TAK plugin that automates the creation of Gridded Reference Graphics on Android devices. Operators define a geographic area, the plugin retrieves satellite imagery, and an AI/ML model automatically detects and labels buildings. Operators then review, correct, and export a completed GRG to their team in a fraction of the time required for manual creation.

The plugin is delivered as a signed `.mil` APK through SOCOM's TAK Forge Package Registry, compatible with ATAK SDK versions 5.4 and 5.6.

---

## Current State

**Challenges**

Maintaining two release branches (5.4 and 5.6) while developing on 5.7 creates parallel maintenance overhead on a small team. The plugin's UI relies on workarounds for the majority of its components because TAK UI, the shared framework that enables cross-platform compatibility, does not yet cover those components. Rise8 does not yet have direct access to end users; SOCOM PMs serve as proxies for operator feedback.

**Problems**

22 to 23 DT-reported defects arrived late in the sprint cycle, requiring triage and scope decisions against a hard May 15 contract deadline. The TAK UI contribution process is new territory; Rise8 is executing its first end-to-end contribution with an unproven review-and-merge workflow.

**Opportunities**

Rise8 is positioned to shift from TAK UI consumer to active contributor, influencing which native components get prioritized in the TAK UI v1.0 release. The GOTS evaluation work is opening a path to direct operator feedback that has not previously been available. A measurable outcome hypothesis is now in place: SOF Team Leaders produce accurate GRGs in less time and with less effort, with a working target of 50% reduction in manual labeling time for a 200-building GRG.

---

## Accomplished as of May 4, 2026

- Signed `.mil` APK built, validated on device, and delivered to SOCOM via TAK Forge Package Registry
- CI/CD pipeline producing stable, signed builds on both 5.4 and 5.6 maintenance branches; ProGuard and reflection issues resolved
- App-crashing GRG export defect resolved and confirmed stable on both versions
- User manual delivered in-app and accessible to SOCOM
- Sliding window building detection improvement shipped and demonstrated (before/after comparison at April 22 demo)
- Tile caching and imagery status notification shipped: operators see imagery availability before detection runs, not after launching blind
- TAK UI radial menu component built and ready for BAH review, Rise8's first end-to-end framework contribution
- TAK UI Migration Assessment document underway; Stories 1 and 2 workflow analysis complete
- GOTS maneuver domain working session with SOCOM completed; operator input validated real mission phase interconnections
- Collaboration structure with BAH (Nathan Biddell, Kelly PM) formally established with contribution process agreed

---

## Aim to Accomplish by May 14, 2026

- Deliver the TAK UI Migration Assessment report to SOCOM (due May 15), including cost and timeline estimate for migrating the AI GRG to the TAK UI framework
- Complete workflow analysis for Stories 3, 4, and 5 and incorporate into the assessment document
- Submit radial menu contribution to TAK UI and complete Rise8's first end-to-end contribution cycle through Nathan's review
- Triage DT defect backlog and scope priority fixes for 5.6 operator stability within the remaining sprint
- Sprint 3 demo on May 6: showcase the operator imagery status feature to SOCOM
- Confirm GOTS and MOSA evaluation status with Kevan and Jonathan; validate all contract deliverables are on track for May 15

---

## Future / Ideal State

**For the Operator:** A GRG is produced in a fraction of current time. The operator defines the area, the plugin handles detection and labeling with high accuracy, and the map is ready for distribution before the planning window closes. The interface is intuitive enough that training overhead is minimal.

**For the Platform:** The AI GRG plugin is maintained as a single codebase deployable across ATAK, WinTAK, TAKX, and WebTAK, eliminating per-platform rebuild cycles. TAK UI is the shared UI framework, and Rise8 is a recognized contributor to that framework alongside BAH.

**For SOCOM:** The AI GRG deploys to operators through a reliable, automated release pipeline with no per-cycle manual intervention. The plugin consistently clears Fortify scan thresholds and the SOCOM DT regression process without blockers.

**The Long Horizon:** SOF Team Leaders produce complete, accurate GRGs even under the most time-compressed planning conditions, and operators execute missions with a more current and reliable common operating picture.

---

*Prepared for team onboarding. Current as of May 4, 2026.*
