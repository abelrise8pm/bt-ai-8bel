# The TAK ecosystem: a complete taxonomy for product managers

**TAK (Team Awareness Kit / Tactical Assault Kit) is a government-owned geospatial situational awareness platform with 500,000+ users spanning military, law enforcement, and civilian sectors.** Originally built at the Air Force Research Laboratory in 2010 for Special Operations, TAK has grown into a family of clients, servers, plugins, and protocols that provide a shared common operating picture on commercial smartphones. This taxonomy maps every major concept across seven dimensions so a Senior PM can navigate the ecosystem with precision — and speak the right language with engineers and operators alike.

> ⚠️ **Terminology flag** indicators throughout this document mark places where official TAK naming diverges from practitioner/colloquial usage. These are the landmines that trip up new PMs in technical conversations.

---

## 1. Platform and distribution

The TAK product family spans Android, iOS, Windows, and browser clients, all governed centrally by the TAK Product Center but distributed through divergent channels.

### 1.1 Client applications

**ATAK (Android Team Awareness Kit)**
*Hierarchy: Core client → Android → Flagship*
The original, most mature TAK client. Android-based (Java), supports 250+ plugins, runs on Android 5.0+. Current version 5.6.x. Three sub-variants exist with critical distribution differences:

| Sub-variant | Classification | Distribution | Plugin support |
|---|---|---|---|
| **ATAK-CIV** | EAR99 (no ITAR) | Google Play, TAK.gov, GitHub (source) | Full |
| **ATAK-GOV** | ITAR restricted | Gov-hosted sites, Direct Commercial Sales | Full |
| **ATAK-MIL** | Military sensitive | Gov-hosted sites only (no DCS) | Full + mil-specific |

**PM relevance (18 words):** ATAK is the reference client — features ship here first, the plugin ecosystem lives here, and the largest user base operates here.

> ⚠️ **Terminology flag — "ATAK" itself:** Military documents expand ATAK as "Android **Tactical Assault** Kit." Civilian contexts use "Android **Team Awareness** Kit." The Google Play listing explicitly notes this dual naming. Use "Team Awareness Kit" with civilian stakeholders; "Tactical Assault Kit" is DoD nomenclature only.

> ⚠️ **Terminology flag — "ATAK" vs. "TAK":** Community members use "ATAK" and "TAK" interchangeably, but officially **TAK** is the umbrella ecosystem (all clients + server + protocol) while **ATAK** is specifically the Android client. The subreddit is r/ATAK, reinforcing Android-centric framing even in ecosystem-wide discussions.

> ⚠️ **Terminology flag — "CivTAK" vs. "ATAK-CIV":** "CivTAK" is a widely used community term (CivTAK.org is the main community site). The official government designation is **ATAK-CIV**. The discontinued **ATAK-PR** (Public Release, 2020) was a non-plugin-capable predecessor — some legacy docs still reference it.

---

**WinTAK (Windows Team Awareness Kit)**
*Hierarchy: Core client → Windows → Desktop/Command Center*
Written from scratch for Windows 10/11 64-bit (not a port of ATAK). Designed for command centers and mission planning on larger displays. Different plugin architecture than ATAK — plugins are **not cross-compatible**. Being superseded by TAKX.

**PM relevance (18 words):** Bridges field operators on Android with command staff on Windows, but is sunset-bound — TAKX is the designated replacement arriving in 2026.

---

**TAKX (TAK Cross-Platform)**
*Hierarchy: Core client → Desktop → Next-generation successor to WinTAK*
Combines WinTAK and RaptorX into a single cross-platform C2 application. Supports Linux (Ubuntu, Fedora, RHEL) in addition to Windows. Includes specialized variants: TAKX-RF (spectrum visualization), Network Survey, TAKX Mounted (vehicle platforms). Has approved **ATO with USMC for NIPR/SIPR**. Available on TAK.gov in beta.

**PM relevance (22 words):** TAKX is the future of desktop TAK — any PM roadmap for command-post features should target TAKX, not WinTAK. WinTAK sunsets in 2026.

---

**iTAK (iOS Team Awareness Kit)**
*Hierarchy: Core client → iOS → Subset capability*
iOS variant developed by Syzygy Integration under DHS S&T contract, sponsored by the U.S. Secret Service. Available free on Apple App Store. Requires iOS 17.6+. Supports iPhone, iPad, macOS (Apple Silicon), watchOS, and visionOS.

**Key limitations vs. ATAK:** No traditional plugin architecture (Apple sandboxing prevents it), no native off-grid mesh radio support, no CASEVAC tool, no GRG builder, reduced icon/marker sets. Unrecognized icons in ATAK mission packages can cause iTAK to **reject the entire package**. Only a civilian version exists.

**PM relevance (24 words):** Critical because ~80% of wildland firefighter devices are iOS. The plugin gap is the single biggest interoperability risk between Android and iOS TAK users.

> ⚠️ **Terminology flag — iTAK vs. TAK Aware:** "TAK Aware" is a separate third-party iOS TAK client on the App Store — not the same as iTAK. Different sponsors, different codebases.

---

**WebTAK**
*Hierarchy: Core client → Browser → Lightweight COP viewer*
Browser-based TAK client served directly by TAK Server on port 8446. No installation required. Provides map display, chat, video feeds, overlays, and mission sync data. No plugin support, no offline capability, no native GPS.

**PM relevance (20 words):** Gives command staff and executives instant browser access to the common operating picture without any app installation — ideal for operations centers.

> ⚠️ **Terminology flag:** WebTAK is **not a standalone product** — it's a feature built into TAK Server. Engineers may refer to it as a server capability, not a client.

---

**CloudTAK**
*Hierarchy: Community client → Browser → Full-featured alternative to WebTAK*
Open-source, cloud-native browser client developed by the Colorado Division of Fire Prevention and Control (DFPC-COE) for the COTAK (Colorado TAK) program. Richer feature set than WebTAK. Compatible with official TAK Server, FreeTAKServer, and OpenTAKServer.

**PM relevance (16 words):** A community-built browser client with more features than WebTAK — relevant for state/local agencies exploring browser-first deployments.

> ⚠️ **Terminology flag:** "COTAK" is Colorado's statewide TAK program/infrastructure; "CloudTAK" is the specific software. These are frequently conflated.

---

**TAK Tracker**
*Hierarchy: Lightweight client → Android + iOS → Send-only tracking*
Standalone lightweight app that broadcasts location, chat, and emergency messages to a TAK Server. No mapping, no full SA consumption. Available on Google Play and Apple App Store.

**PM relevance (20 words):** For personnel who only need to be tracked, TAK Tracker eliminates the complexity and resource demands of full ATAK — dramatically simplifying deployment.

> ⚠️ **Terminology flag — "TAK Lite":** There is **no official product called "TAK Lite."** Community members use this term colloquially, but the actual product is **TAK Tracker**. Some also misuse "TAK Lite" to mean iTAK.

---

### 1.2 Server infrastructure

**TAK Server (Official)**
*Hierarchy: Server layer → Primary → Government product*
Java-based (Spring Boot) tactical information management platform. Routes CoT messages, manages certificates/PKI, stores data in PostgreSQL 15 + PostGIS, supports federation, hosts WebTAK. Deployment options: on-premises Linux, Docker, cloud (AWS/Azure/GovCloud), Raspberry Pi. **Open-sourced June 2022** (Distribution A). Available on TAK.gov and GitHub.

Key processes: **takserver-messaging** (CoT routing), **takserver-api** (REST API / Marti dashboard), **takserver-config** (configuration management). Default ports: 8089 (TLS client connections), 8443 (HTTPS admin/API), 8446 (WebTAK/enrollment), 8087 (unencrypted TCP, not recommended).

**PM relevance (22 words):** The backbone enabling multi-user TAK operations. Without a server, TAK is limited to ~32 users on a local network via multicast peer-to-peer.

> ⚠️ **Terminology flag — "MARTI" vs. "TAK Server":** This is the most persistent terminology confusion in the ecosystem. **MARTI** was the original BBN Technologies project name. It is NOT a separate product. However, the admin dashboard URL is still `https://<server>:8443/Marti`, all API endpoints are prefixed with `/Marti/`, and the database user is `martiuser`. Engineers encounter "Marti" constantly in configuration files while official documentation uses "TAK Server." New PMs will hear both terms — they refer to the same system.

---

**FreeTAKServer (FTS)**
*Hierarchy: Server layer → Community alternative → Python*
Independent Python 3 reimplementation of a TAK Server by the FreeTAKTeam (Eclipse Public License). Not a fork of the official server. Version 2.x uses DigitalPy framework with ZeroMQ. Much lighter resource footprint than official server. Does not support full Protobuf TAK Protocol or Federation Hub.

**PM relevance (22 words):** The most popular community server alternative — widely used for training, civilian deployments, and development. Lacks official ATO standing for government operations.

**Other community servers:** OpenTAKServer (Python/Flask, includes video streaming), GoATAK (Golang), taky (lightweight Python), MultiTAK (JavaScript relay).

**Commercial TAK-as-a-Service (TaaS):** PAR Government Sit(x)/TeamConnect, GoTAK TAKOS, ArgusTAK, DS2, Alpha 56 — managed TAK Server hosted in cloud environments including FedRAMP-compliant AWS GovCloud.

---

### 1.3 Governance and ownership

**TAK Product Center (TPC)**
*Hierarchy: Governance → Primary authority*
The central U.S. Government organization that develops, sustains, and releases all official TAK products. Led by Director Ryan McLean. Located within **DEVCOM C5ISR Center** → **Army Futures Command**. Funded by **PEO-SOF Digital Applications (PEO-SDA)** under USSOCOM.

**PM relevance (18 words):** TPC controls releases, signing, configuration, and the official development pipeline — they are the single authority for all official TAK products.

> ⚠️ **Terminology flag — "TAK Product Center" vs. "TAK Product Group":** Based on all current sources (TAK.gov, army.mil, GitHub, LinkedIn), the organization is **TAK Product Center (TPC)**. No evidence of a rename to "TAK Product Group" was found. Verify before using "Group" in official communications.

**TAK Configuration Steering Board (CSB):** The governance body chaired by PEO-SDA. Reviews requirements, configuration changes, and hosts the annual TAK Offsite (~600+ attendees).

> ⚠️ **Terminology flag — "ATAK Working Group":** The primary governance body is the **TAK CSB**, not an "ATAK Working Group" under AFCEA. AFCEA's role is media/events/networking (SIGNAL Magazine, TechNet conferences) — not direct governance.

---

### 1.4 Distribution channels

| Channel | What's available | Access requirements |
|---|---|---|
| **TAK.gov** | All variants, SDK, plugins, server, docs | US IP only, registration + MFA, ~25K accounts |
| **Google Play Store** | ATAK-CIV (arm64 only), some plugins | Public, free |
| **Apple App Store** | iTAK, TAK Tracker | Public, free |
| **GitHub** | ATAK-CIV source, TAK Server source | Public (TAK-Product-Center org) |
| **CivTAK.org** | ATAK-CIV APK, community resources | Community site, password-protected downloads |
| **Sideloading** | Full ATAK-CIV APK (all architectures) | Direct file transfer |
| **Enterprise MDM** | Pre-configured ATAK/iTAK packages | Samsung Knox, supported MDM providers |
| **Classified networks** | ATAK-MIL, hardened TAK Server containers | NIPR/SIPR, Iron Bank containers |
| **FirstNet App Store** | TAK Server, ATAK | First responder verification |

**PM relevance (24 words):** The Play Store ATAK-CIV is arm64-only and missing bundled plugins due to size limits. TAK.gov provides the complete package but requires US-based registration.

---

## 2. Architecture layers

TAK follows a client-server architecture with an extensible plugin layer and flexible data transport.

### 2.1 Client layer architecture

ATAK's internal architecture operates as a modular plugin host. The core app provides a **custom OpenGL map engine** supporting multiple projections, offline tiles (MBTILES), WMS/WMTS, and 3D terrain. All extended functionality — including many features users consider "built-in" — is delivered via the plugin framework.

Three architectural primitives define every ATAK component: **MapComponent** (handles geographic/visual elements, analogous to Android Activity), **DropDownReceiver** (manages UI side-panel elements, analogous to Android Fragment), and **PluginLifecycle** (main entry point handling ATAK lifecycle callbacks). The system uses Android Broadcast Receivers for internal pub/sub event communication.

**WinTAK** is written independently for Windows — it shares the CoT protocol but has a different internal architecture and plugin system. **iTAK** follows Apple Human Interface Guidelines and has no comparable plugin loading mechanism. **WebTAK** is a thin browser client consuming TAK Server's WebSocket API.

**PM relevance (20 words):** Cross-platform feature parity gaps stem from fundamentally different codebases — ATAK features cannot be trivially ported to WinTAK, iTAK, or WebTAK.

---

### 2.2 Server layer architecture

TAK Server runs three Java processes: **takserver-messaging** (real-time CoT routing), **takserver-api** (REST endpoints and web admin), and **takserver-config** (configuration management). Data persists in **PostgreSQL 15 with PostGIS** (database named `cot`, user `martiuser`). The server handles certificate management (PKI), role-based access control, data package distribution, mission sync, and WebTAK hosting.

**Federation** connects TAK Server instances for cross-organization data sharing. Server-to-server connections use **TLS mutual authentication with Protobuf/gRPC** (more compact than XML: ~376 bytes vs. ~530 bytes). The **Federation Hub** is a separate package (`takserver-fed-hub`) that manages multi-server star topologies with configurable filtering policies (CoT type filters, group-based policies, file-type blocking). Disruption tolerance is configurable — default 12 hours of offline buffering.

> ⚠️ **Terminology flag:** "Federation Hub" is a **separate package** from TAK Server — it must be downloaded and deployed independently. Engineers may casually say "federation" meaning either the server's built-in federation capability or the separate Federation Hub product.

---

### 2.3 Data flow patterns

TAK supports two fundamental transport modes:

**Peer-to-peer (serverless):** Clients broadcast CoT via **UDP multicast** on default address **239.2.3.1:6969** (called "Mesh SA" mode). Works on any shared LAN. Practical limit ~32 users. No encryption, no persistence, no routing intelligence.

**Server-mediated:** Persistent **TCP/TLS** connections to TAK Server on port 8089. Server acts as message broker — routes based on groups and filters, stores messages, supports federation. Additional transport option: **QUIC** (port 8090) for unreliable network conditions.

Data flows: Client → TAK Server (messaging process) → PostgreSQL storage → routes to subscribed clients → if federated, forwards to peer servers via gRPC/TLS → peer servers distribute to their clients.

**Map tiles** use MBTILES (SQLite-based) for offline, MOBAC XML configs for online XYZ/TMS sources, and WMS/WMTS for real-time tile services. Elevation data uses DTED/SRTM. GeoPackage is supported for vector/raster storage.

**PM relevance (24 words):** The serverless-vs-server decision shapes every deployment. Serverless works for small local teams; anything cross-network, encrypted, or persistent requires TAK Server infrastructure.

---

## 3. Data and standards

### 3.1 Cursor on Target (CoT) — the lingua franca

CoT is an **XML-based data exchange format** conceived by MITRE in 2002 for communicating "What, Where, When." It is transport-agnostic (TCP, UDP, SOAP, FTP). Every integration in the TAK ecosystem must speak CoT. Version 2.0 is the current schema.

**Core XML structure:**
```xml
<event version="2.0" uid="unique-id" type="a-f-G-E-V-C"
       time="2026-03-04T12:00:00Z" start="..." stale="..." how="h-e">
  <point lat="38.8977" lon="-77.0365" hae="26.7" ce="9999999" le="9999999"/>
  <detail>
    <contact callsign="Alpha-1" endpoint="192.168.1.10:4242:tcp"/>
    <__group name="Yellow" role="Team Lead"/>
    <status battery="85"/>
    <takv platform="ATAK-CIV" device="Samsung" os="Android" version="5.6.0"/>
    <track speed="1.5" course="270.0"/>
  </detail>
</event>
```

**Key attributes:** **uid** (unique event identifier), **type** (hierarchical classification — see below), **time/start/stale** (temporal validity window that controls marker expiry), **how** (coordinate derivation method: "h-e" = human entered, "m-g" = machine GPS), **point** (WGS84 lat/lon + height above ellipsoid + circular/linear error).

The **detail element** is an extensible container holding sub-schemas: `<contact>` (callsign, endpoint), `<__group>` (team color, role), `<status>` (battery), `<takv>` (platform info), `<track>` (speed/course), `<remarks>` (free text), `<link>` (relationships between objects), `<_flow-tags_>` (provenance tracking).

> ⚠️ **Terminology flag — "CoT" vs. "SA":** Engineers say "CoT message" (the data format). Operators say "push SA" (the outcome). **PLI** (Position Location Information) is a specific type of SA message — the periodic GPS position updates each client broadcasts. All three terms are used loosely and interchangeably in the community despite being technically distinct.

---

### 3.2 CoT event type hierarchy

The **type string** is the most consequential field in CoT — it determines what symbol renders on every user's map. The hierarchy uses a dash-delimited string where **case convention is critical**: lowercase = CoT-defined fields, UPPERCASE = MIL-STD-2525 fields.

**Root types:** `a` (atoms — physical things, most common), `b` (bits — metadata/sensor/imagery), `r` (reservation/restriction), `t` (tasking/orders), `c` (communications), `y` (reply to task).

**For atoms (type "a"), the structure is:**

| Position | Meaning | Example values |
|---|---|---|
| 1 | Root: atoms | `a` |
| 2 | Affiliation (CoT-defined, lowercase) | `f`=friendly, `h`=hostile, `u`=unknown, `n`=neutral |
| 3 | Battle dimension (MIL-STD-2525, UPPERCASE) | `G`=Ground, `A`=Air, `S`=Sea Surface, `U`=Subsurface |
| 4+ | Function codes (MIL-STD-2525, UPPERCASE) | `E-V-C`=Equipment-Vehicle-Civilian |

**Example:** `a-f-G-E-V-C` = atom → friendly → Ground → Equipment → Vehicle → Civilian. The type tree contains ~3,000+ CoT types, with ~1,000 mapping directly to MIL-STD-2525 symbol identification codes.

**PM relevance (22 words):** Type strings control symbology on every user's map. Incorrect type assignments cause wrong icons — a PM must understand this drives interoperability requirements.

---

### 3.3 TAK Protocol (Protobuf) vs. XML CoT

**TAK Protocol Version 0** is plain XML CoT — the original, universal format. All clients must decode it. **TAK Protocol Version 1** uses Google Protocol Buffers (protobuf v3) for ~30% smaller messages (~376 bytes vs. ~530 bytes for identical content). Messages are identified by a magic byte header: `0xBF` followed by version (`0x00` = XML, `0x01` = Protobuf).

Two transmission formats exist: **Mesh format** (UDP: `0xBF 0x01 0xBF <payload>`) and **Stream format** (TCP: `0xBF <varint length> <payload>`). Federation between servers always uses Protobuf/gRPC for bandwidth efficiency. The protobuf schema preserves CoT semantics, with an `xmlDetail` fallback field for extensions not mapped to specific protobuf fields.

**PM relevance (20 words):** Protobuf matters most on bandwidth-constrained tactical radios. Most integration work uses XML CoT. Both must be supported for full interoperability.

> ⚠️ **Terminology flag:** Community says "protobuf" or "TAK protobuf." The official name is **"TAK Protocol Version 1"** — it includes magic byte headers and framing beyond raw protobuf encoding.

---

### 3.4 Coordinate systems, geospatial formats, and military standards

**Coordinates:** CoT always stores positions as **WGS84 decimal degrees** (lat/lon) with height above ellipsoid in meters. ATAK displays multiple formats: decimal degrees, DMS, degrees-minutes, and **MGRS** (Military Grid Reference System). MGRS is the preferred military display format for voice communication of positions. Internally, it's always lat/lon — MGRS is a UI/display concern, not a data format concern.

**Geospatial formats:** **KML/KMZ** is the primary overlay format (import, export, authoring, network KML links). **GeoJSON** has growing but not native support — typically used via conversion pipelines (Node-RED TAK nodes, OpenTAKServer). **Shapefiles** are supported for export and GIS interchange. **Data packages** are ZIP archives containing a `MANIFEST/manifest.xml`, certificates (.p12), configuration (.pref XML), KML/KMZ overlays, plugin APKs, and map sources.

> ⚠️ **Terminology flag — "Data package":** This term is used very broadly. It can mean: server connection credentials with certificates, shared map overlays, mission planning files, or any bundle of files. Always clarify what's inside when someone says "send the data package."

> ⚠️ **Terminology flag — iTAK data package structure:** iTAK requires certificates and config.pref at the **root** of the ZIP (no folder nesting) — different from ATAK/WinTAK structure. This is a common source of interoperability failures.

**Military symbology:** TAK implements **MIL-STD-2525** (Common Warfighting Symbology) — primarily the 2525B conventions in its CoT type encoding. CoT type strings encode 2525 Symbol Identification Codes (SIDC). NATO APP-6 is harmonized with 2525, enabling coalition interoperability. Versions: 2525B (most referenced in TAK), 2525C (2008), 2525D (2014, restructured to 20+ character SIDC), 2525E (latest).

**Chat:** Implemented as CoT messages (type `b-t-f`). Supports broadcast ("All Chat Rooms"), group chat (by team), and direct messages (by UID). XMPP chat integration available for cross-platform interoperability but requires separate M-Link infrastructure.

**Video:** **RTSP** is the primary streaming protocol. Built-in TAK ICU (Integrated Camera Unit) streams device camera. Supports UDP multicast, RTSP, MJPEG playback. **WebRTC** is emerging (OpenTAKServer provides WebRTC links alongside RTSP) but not native to core ATAK. Video feeds are shared as CoT messages containing RTSP URLs.

---

## 4. Extensibility and plugin architecture

### 4.1 ATAK plugin framework mechanics

Plugins are Android APKs that load dynamically at runtime within ATAK's process space. They are **not standalone apps** — they extend ATAK without modifying the core. The framework exposes two primary component types: **MapComponent** (geographic/visual elements on the tactical map) and **DropDownReceiver** (UI side-panel elements). Both use Android Broadcast Receivers for pub/sub event communication.

**Plugin lifecycle:** APK installed on device → ATAK discovers plugin via AndroidManifest.xml → listed in Plugin Manager (jigsaw icon) → user activates → PluginLifecycle initializes MapComponent → plugin interacts with MapView context (UI) and plugin context (background processing).

**Signing is the critical governance mechanism.** Development builds use a self-generated debug keystore with the developer ATAK APK (shows "Development Build" watermark). **Production plugins require dual-signing** — both the developer's certificate AND the official TAK signing system. The Google Play version of ATAK **will not load** improperly signed plugins. ATAK maintains an `AtakPluginRegistry.ACCEPTABLE_KEY_LIST` whitelist.

> ⚠️ **Terminology flag — "Keying" vs. "Signing":** The official TAK term for the authorization process is **"keying"** — it encompasses the full build + sign + version-lock pipeline. Community members just say "signing." Keying is broader: it includes source code submission, automated Fortify security scanning, dependency checks, and version-specific binding.

**PM relevance (24 words):** The dual-signing requirement creates a governance bottleneck — plan 2-4 weeks for TPC keying. A third-party signing service exists but produces a visible trust indicator.

---

### 4.2 Plugin types taxonomy

**Client-side plugins ("TAK plugins" / "ATAK plugins"):** Run on the end user device within ATAK/WinTAK. Extend client functionality. Categories include:

- **Communications:** WAVE VoIP (Motorola), QuickChat, ESChat
- **Radio/Network:** WAVE Relay (Persistent Systems MPU5), goTenna Pro X/X2, TrellisWare, Beartooth, Meshtastic atak-forwarder
- **UAS/Counter-UAS:** UAS Tool (drone telemetry/FMV/C2), NINJA (drone detection)
- **Reporting:** 9-line/SALUTE (built into core), SSE Slant Report
- **Navigation:** Vehicle Navigation System (VNS), OpenTakNavigation, ARES-N (AR heads-up)
- **Sensor/ISR:** ADS-B (aircraft tracking), TAK-ML (machine learning), Point Mensuration Tool
- **Off-grid comms:** HAMMER (acoustic modem over voice radios), Somewear (satellite hotspot)
- **SA/Mission:** DataSync, WASP (Wide Area Search), ExCheck (execution checklists), GRG Builder

**Server-side plugins ("TAK Server plugins"):** Run within the TAK Server Java process. Intercept, modify, or inject messages at the server level. The TAK Server Plugin SDK defines six types: **MessageSender**, **MessageReceiver**, **MessageInterceptor** (modify messages before broadcast), **SubmitDataPlugin** (REST API ingestion at `/Marti/api/plugins/<name>/submit`), **SenderReceiverPlugin**, and **PeriodicPlugin** (scheduled HTTP polling).

> ⚠️ **Terminology flag — "TAK Plugin" vs. "MARTI plugin":** "MARTI plugin" is colloquial but technically incorrect. There is no separate product called MARTI. The correct term is **"TAK Server plugin."** The `/Marti/` path prefix in APIs is a legacy naming artifact. When people say "MARTI API," they mean the TAK Server REST API.

> ⚠️ **Terminology flag — "WAVE Relay" vs. "WAVE":** **WAVE Relay** is Persistent Systems' mesh radio integration. **WAVE** (Motorola) is a VoIP push-to-talk integration. Completely different vendors, completely different plugins, confusingly similar names.

> ⚠️ **Terminology flag — "Plugin" vs. "Tool":** In ATAK's UI, some capabilities appear under the "Tools" menu and are called "tools" by users. "Plugin" is the correct architectural term for extensibility. "Tools" refers to built-in capabilities accessible from the ATAK toolbar. They overlap but are technically different.

---

### 4.3 Notable plugins in detail

**HAMMER (Handheld Acoustic Modem for Mobile Exchanges with Radios)** encodes CoT data as audio tones transmitted over any voice radio — walkie-talkies, HF, VHF. Enables TAK interoperability with legacy radio infrastructure where no IP networking exists. Open-sourced. Available on Google Play.

**Meshtastic atak-forwarder** forwards CoT over ~$30 LoRa mesh radio hardware. Hugely popular in the community as a low-cost DIY alternative to commercial mesh radios. Practical throughput: ~5 map markers/minute, ~2 chats/minute due to LoRa bandwidth constraints.

**goTenna Pro X/X2 plugin** provides ATAK integration with goTenna's commercial mesh radios. Tested at 55+ mile range. Supports PLI, messaging, 2525B symbology, encryption. Each ATAK version requires a matching goTenna plugin version. goTenna is an official TAK Licensee.

**UAS Tool** integrates unmanned aircraft systems for telemetry, full-motion video, and C2. Supports DJI platforms (with SDK limitations), custom UAS via MAVLink. One of the most-used plugins across military and public safety.

---

## 5. Developer surface

### 5.1 ATAK SDK contents and capabilities

The SDK contains: `atak.apk` (developer build with watermark), `main.jar` (core library to compile against), `atak-javadoc.jar`, `atak-gradle-takdev.jar` (Gradle plugin), ProGuard mapping, development guides (PDF), and plugin examples including a HelloWorld template. SDK 5.5 added **Jetpack Compose** support.

**SDK versioning:** Versions map directly to ATAK releases (SDK 5.5 → ATAK 5.5.x). The TPC maintains a **120-day development cycle** with posted feature freeze dates. Plugin APK filenames encode version: `ATAK-Plugin-<name>-<PLUGIN_VERSION>-<flavor>-<ATAK_VERSION>.apk`. Build flavors: `civDebug`/`civRelease` (civilian) and `milDebug`/`milRelease` (military).

**Key SDK classes:** MapView (map interaction context), MapComponent (plugin initialization/lifecycle), DropDownReceiver (UI panels), PluginLifecycle (ATAK lifecycle callbacks), PluginTool (toolbar entry), AtakPluginRegistry (key validation).

**Developers can:** Create map markers/shapes/overlays, subscribe to and publish CoT messages, access device GPS/sensors/camera, create custom UI panels, integrate external hardware, access TAK Server APIs. **Developers cannot:** Modify ATAK core code, load unsigned plugins into production ATAK, access military-only APIs from the CIV SDK, or run plugins standalone outside ATAK.

**Documentation quality** is historically described as "rather sparse" by community developers. Community blogs (Ballantyne, RIIS, Toyon/LearnATAK) fill significant gaps. The TAK Discord is the primary real-time developer support channel.

**PM relevance (22 words):** The 120-day development cycle makes feature freezes predictable for planning. SDK documentation gaps mean developer onboarding requires community resources beyond official docs.

---

### 5.2 TAK Server REST API (the "Marti API")

All endpoints are prefixed with `/Marti/` on port 8443 (HTTPS) with certificate authentication. Official Swagger/Redoc documentation at `docs.tak.gov/api/takserver`. Key endpoint families:

| API family | Key endpoints | Purpose |
|---|---|---|
| **Mission** | `PUT/GET/DELETE /Marti/api/missions/<name>` | Create, query, delete missions; manage subscriptions and roles |
| **File Sync** | `POST /Marti/sync/missionupload`, `GET /Marti/sync/search` | Upload/download data packages and content by hash |
| **CoT/SA** | `GET /Marti/api/cot`, `GET /Marti/api/cot/xml/<uid>` | Query CoT events, get SA data |
| **Clients** | `GET /Marti/api/clientEndPoints` | List connected clients and subscriptions |
| **Groups** | `GET /Marti/api/groups/all` | Manage group membership and permissions |
| **Certificates** | `POST /Marti/api/tls/signClient/` | Certificate enrollment and TLS config |
| **Video** | `POST /Marti/vcm` | Video connection management |
| **Export** | `GET /Marti/ExportMissionKML` | Export mission data as KML |

**PM relevance (18 words):** The Marti API is well-defined and enables integrations beyond plugins — dashboards, IoT feeds, Node-RED automations, and custom analytics pipelines.

---

### 5.3 Build tooling and process

**Requirements:** Android Studio (latest stable), JDK 17 (for SDK 5.x; JDK 11 for 4.x), Gradle at the SDK-specified version (do NOT upgrade beyond specified version or builds break), Android SDK Platform 21 minimum. Custom Gradle plugin `atak-gradle-takdev.jar` provided in SDK.

**Build process:** Download SDK from TAK.gov → place plugin project two levels below SDK root → configure `local.properties` with keystore paths and TAK repo credentials → set build variant to `civDebug` → build with Gradle → deploy to device running developer ATAK → for production, submit unobfuscated source to TAK.gov automated pipeline (Fortify scan + dependency check + keying).

**Developer registration tiers on TAK.gov:** Government developers (full SDK access), contracted developers (same access), IRAD/off-contract developers (CIV SDK + third-party signing), FMS developers (private directories, code scan required). ~7,000 registered developers total.

---

### 5.4 Open-source ecosystem

Key open-source projects: **ATAK-CIV** (Java/C++, official), **TAK Server** (Java, official), **FreeTAKServer** (Python, community), **OpenTAKServer** (Python/Flask), **GoATAK** (Golang), **taky** (Python), **atak-forwarder** (Meshtastic bridge), **HAMMER** (acoustic modem), **tak.js** (JavaScript TAK library), **node-red-contrib-tak** (Node-RED integration), **CloudTAK** (browser client), **LearnATAK** (educational documentation).

**Community channels:** Public ATAK Discord (primary hub), FreeTAKServer Discord, r/ATAK subreddit, CivTAK.org, TAK.gov Confluence/Mattermost.

---

## 6. User and mission segments

### 6.1 Military users — from SOF origin to force-wide adoption

**SOF (Special Operations Forces)** created the demand for TAK. SOCOM needed lightweight SA on commercial smartphones for small teams in hostile territory — replacing expensive purpose-built hardware at a fraction of the cost. TAK is described as **"the backbone of SOF"** (Breaking Defense, 2025). Used for precision targeting, navigation, drone feeds on 3D terrain, and parachute jump planning. Samsung smartphones are chest-mounted on plate carriers.

**Conventional forces:** TAK is the foundational software for the Army's **Nett Warrior** program (23,000+ Samsung devices issued). In 2014, ATAK was selected over Esri's CJMTK at less than one-third the cost. The Marines are now deploying more robustly; the 31st MEU uses ATAK during maritime operations. USAF Security Forces deploy ATAK for base defense.

**Joint/Coalition:** The Army's **Mission Partner Kit (MPK)** — built on TAK — enables rapid multinational interoperability at brigade-and-below level. The British Army deploys ATAK as part of NATO's Enhanced Forward Presence. The Malaysian Air Force adopted TAK via GoTAK TaaS. SkyFi was selected for NATO's DIANA accelerator to make ATAK plugins available to NATO partners.

**Scale:** **500,000+ users globally** across DoD, DHS, coalition partners, and allied ministries of defense.

---

### 6.2 Law enforcement, emergency management, and civil users

**Law enforcement** uses TAK for tactical operations, surveillance, event security, and multi-agency manhunts. The FBI operates a **BYOD TAK Program** through the Law Enforcement Enterprise Portal (LEEP), providing TAK Server access nationally to state/local partners. The U.S. Secret Service sponsors iTAK and uses TAK for protective operations at National Special Security Events (Super Bowl, Presidential Inaugurations). CBP, DEA, ATF, Marshals, and Coast Guard are all active users. **Texas TAK** is the leading state-level deployment (~50 agencies federated with FBI, CBP, and Texas Military Department).

**Emergency management:** TAK has supported the **rescue of 2,000+ people** across 7 major hurricanes (Harvey through Dorian). DHS S&T has 5,000+ personnel on TAK. The **WASP plugin** (Wide Area Search) developed by NGA enables coordinated grid search, victim triage, and SAR operations. Colorado's COTAK program provides statewide TAK infrastructure for wildfire response.

**Commercial/enterprise:** 100+ companies licensed ATAK as of 2020 via AFRL/TechLink. Use cases include physical security, event security, energy asset tracking, maritime, drone operations, and construction safety.

**Civil users:** iTAK and ATAK-CIV serve outdoor recreation, overlanding, and volunteer disaster response. Organizations like the Cajun Navy represent natural TAK adopters who need coordination capabilities for ad hoc rescue operations.

---

### 6.3 User personas

| Persona | Focus | Primary tools | Key concern |
|---|---|---|---|
| **Operator** | Field execution — navigate, track teammates, mark targets, share intel | ATAK/iTAK on smartphone | Simplicity, reliability, battery life, offline capability |
| **Administrator** | Infrastructure — TAK Server, certificates, federation, network config | TAK Server WebUI, CLI, PostgreSQL | Uptime, security, scalability, cross-agency interop |
| **Developer** | Integration — plugins, CoT integrations, sensor adapters, APIs | ATAK SDK, Android Studio, TAK Server API | Documentation quality, API stability, signing process |
| **Mission planner** | Preparation — routes, waypoints, objectives, data packages, terrain analysis | WinTAK/TAKX, route plugins, viewshed tools | Geospatial accuracy, offline map availability, plan distribution |
| **Commander** | Decision — COP monitoring, force disposition, cross-agency coordination | WinTAK/TAKX on large displays, WebTAK | Real-time accuracy, decision support, mission tempo |

> ⚠️ **Terminology flag — "Operator":** In the military community, "operator" specifically means SOF personnel. In the TAK/DHS community, "operator" means any field user (LE officer, firefighter, soldier). Context determines meaning.

---

### 6.4 Mission types

**Blue Force Tracking (BFT)** is TAK's foundational capability — every client broadcasts GPS position as CoT PLI at configurable intervals. All connected users see "blue dots" representing teammates. Reduces fratricide, eliminates radio position reports, enables coordinated movement.

> ⚠️ **Terminology flag — "BFT":** The Army has a legacy hardware satellite system literally named "Blue Force Tracking" (BFT-1/BFT-2). TAK provides software-based PLI — a fundamentally different technology. Stakeholders use "BFT" colloquially for both.

**ISR:** UAS Tool plugin provides drone telemetry/FMV/C2. ADS-B integration for aircraft tracking. SkyFi plugin for commercial satellite imagery. Camera footprints georeferenced in real-time.

**Incident command:** TAK provides the geospatial COP layer for ICS operations. Multi-agency force tracking, sector boundary mapping, integrated comms. Proven during Hurricane Harvey coordinating CBP, ICE, USSS, USCG, FEMA, and state/local on a single picture.

**Search and rescue:** WASP plugin for systematic grid search. Off-grid comms via HAMMER, Meshtastic, goTenna. ~50,000 SAR missions annually in the US.

**MEDEVAC/CASEVAC:** Digital 9-line request auto-populates grid coordinates from GPS. Eliminates verbal coordinate relay errors. Position still transmits even if the injured operator cannot communicate.

**Other mission types:** Direct action/tactical operations (SOF core), route planning/navigation (VNS plugin, ARES-N AR), fire support coordination (MIL version), border security (CBP/Texas DPS), maritime operations (Coast Guard, 31st MEU).

---

## 7. Regulatory and operational constraints

### 7.1 Classification levels and cross-domain operations

| Level | Network | TAK variant | Key requirements |
|---|---|---|---|
| **Unclassified** | NIPRNet / commercial | ATAK-CIV, ATAK-GOV | Standard ATO, component STIGs |
| **SECRET** | SIPRNet | ATAK-MIL | TACLANE encryptors, DISA STIGs, separate ATO, ITAR controls |
| **TS/SCI** | JWICS | Specialized | IL6 cloud authorization, NSA security requirements |

TAK Server has a single codebase across all levels — deployment configurations, hardening, and ATO requirements differ. Cross-classification data sharing requires DoD-approved **Cross-Domain Solutions (CDS)**. Federation Hub enables server-to-server connectivity, but crossing classification boundaries requires approved CDS hardware.

**ATO/compliance:** No TAK-specific STIG exists — deployments must apply component STIGs (OS, PostgreSQL, Java, web server). Cloud-hosted TAK requires FedRAMP Moderate minimum (IL2), DISA PA for IL4 (CUI), or IL5 for National Security Systems. PAR Government's TeamConnect is hosted in **FedRAMP-compliant AWS GovCloud**. The DoD RMF process (categorize → select controls → implement → assess → authorize → monitor) applies to all government TAK Server deployments.

---

### 7.2 Network environments and PACE planning

TAK is explicitly designed for **DDIL (Disconnected, Denied, Intermittent, Limited)** environments. Clients pre-load maps, overlays, and elevation data for fully offline operation. Edge TAK Servers on Raspberry Pi maintain local COP without internet. Federation syncs upstream when connectivity restores.

**TAK naturally maps to PACE plans:**

- **Primary:** Cellular/LTE/5G → TAK over standard internet to cloud TAK Server
- **Alternate:** Starlink/SATCOM → TAK over satellite (SpaceX received $70M DoD task order; GoTAK recommends Starlink Mini in every PACE plan)
- **Contingency:** Mesh radios → Persistent Systems WAVE Relay (IP MANET, used by SOF), goTenna Pro X (tested 55+ miles), Silvus StreamCaster (selected for IVAS), TrellisWare TSM (Army's threshold MANET waveform), Beartooth, Meshtastic ($30 LoRa)
- **Emergency:** HAMMER acoustic modem (CoT over voice radio audio), Iridium narrowband, Garmin inReach (PLI via INRCOT gateway)

---

### 7.3 Device constraints

**Android (ATAK):** Minimum Android 5.0 (API 21), requires GLES 3.0 GPU. Samsung Galaxy S9 or newer recommended. Play Store version is arm64-v8a only; TAK.gov version supports additional architectures. Approved/recommended devices include Samsung Galaxy series, Samsung XCover (ruggedized), Samsung Galaxy Tab S2+, and purpose-built **GoTAK EUDs** (Ulefone-based ruggedized, root-enabled, dual-boot Android 14, NDAA compliant).

**iOS (iTAK):** Requires iOS 17.6+. The plugin gap is the fundamental constraint — no mesh radio plugins, no drone control, no WASP SAR, no CASEVAC tool. DHS notes ~80% of wildland firefighters carry iOS devices, making this gap operationally significant.

---

### 7.4 ITAR and export considerations

**ATAK-CIV** was classified as **EAR99** by BIS in July 2016 after a feature-by-feature review — it is NOT ITAR controlled and can be freely distributed globally. **TAK Server** is Distribution A, open-source, no ITAR restrictions. **ATAK-GOV** is ITAR restricted (requires DDTC authorization for export). **ATAK-MIL** requires government-to-government FMS channels. Individual plugins (especially those integrating classified systems, targeting, or NSA Type 1 encryption) may carry separate ITAR/USML classifications.

FMS uses government-to-government transfer to maintain configuration control. Ten active FMS cases exist. ATAK-CIV is the easiest pathway for partner force integration — zero export restrictions.

---

## Comprehensive terminology reference

This table consolidates all terminology mismatches flagged throughout the taxonomy — **the essential cheat sheet for speaking the right language.**

| Official term | What practitioners actually say | Why it matters |
|---|---|---|
| **TAK** (the ecosystem) | "ATAK" (used interchangeably) | Stakeholders often say "ATAK" when they mean the whole ecosystem — always clarify scope |
| **Android Team Awareness Kit** (civilian) | "Android Tactical Assault Kit" (military) | Same acronym, different expansion — use "Team Awareness Kit" with civilian audiences |
| **ATAK-CIV** | "CivTAK," "civilian ATAK" | All refer to the same product. ATAK-CIV is the acquisition-correct term |
| **TAK Server** | "MARTI," "the Marti server" | MARTI is the legacy name, still in URLs (`/Marti/`) and config files. Not a separate product |
| **TAK Server plugin** | "MARTI plugin" | No product called MARTI exists independently |
| **TAK Product Center (TPC)** | "TAK Product Group," "TPC," "TAK PMO" | TPC is current. No confirmed rename to "Group" |
| **TAK Configuration Steering Board (CSB)** | "ATAK Working Group," "TAK Board" | CSB is the actual governance body |
| **Keying** (full build+sign+version-lock) | "Signing" | Keying is broader than cryptographic signing — includes Fortify scan and version binding |
| **TAK Tracker** | "TAK Lite" | No official "TAK Lite" product exists |
| **WebTAK** | Treated as standalone product | WebTAK is a TAK Server feature, not a separate deployment |
| **Federation Hub** | Conflated with TAK Server federation | Separate downloadable package, not built into TAK Server |
| **CoT** (data format) | "SA" (the outcome) | CoT is the protocol; SA is the capability. PLI is a specific CoT message type |
| **Data package** | Used for everything from certs to map tiles | Always clarify contents — connection profile, mission data, or offline maps |
| **EUD** (End User Device) | "Device," "handset," "phone," "the TAK" | EUD is the DoD acquisition term; "device" is fine for general discussion |
| **BFT** (in TAK: software PLI) | Also means legacy hardware BFT-1/BFT-2 | Fundamentally different systems sharing a name |
| **WAVE Relay** (Persistent Systems radio) | **WAVE** (Motorola VoIP) | Different vendors, different plugins, confusingly similar names |
| **Plugin** (architecture term) | "Tool," "module," "app" | Plugins run inside ATAK; tools are built-in toolbar features. Not interchangeable |
| **DataSync** | "Data Sync," "Enterprise Sync" | Enterprise Sync was the old server-side name |
| **TAK Protocol Version 1** | "Protobuf," "TAK protobuf" | Includes magic byte headers and framing beyond raw protobuf |
| **CloudTAK** (software) | "COTAK" (Colorado program) | Software vs. state program — frequently conflated |

---

## Conclusion

Three insights emerge from mapping this ecosystem. First, **TAK's power comes from its protocol, not any single app** — CoT is the true platform, and every client, server, plugin, and integration is ultimately a CoT producer or consumer. A PM who understands the CoT type hierarchy and data package structure can navigate any corner of the ecosystem.

Second, **the terminology gap between official and practitioner language is not cosmetic — it causes real confusion** in requirements documents, vendor evaluations, and cross-team communication. The MARTI/TAK Server conflation, the BFT ambiguity, and the CivTAK/ATAK-CIV split are the three highest-risk areas where imprecise language leads to misaligned expectations.

Third, **the plugin architecture is simultaneously TAK's greatest strength and its largest governance bottleneck**. The 250+ plugin ecosystem drives adoption, but the dual-signing requirement, 120-day SDK cycles, and the gap between Android and iOS plugin support create planning constraints that should shape every product roadmap decision. The iTAK plugin gap in particular — affecting 80% of wildland firefighter devices — represents the single largest interoperability risk in the ecosystem today.