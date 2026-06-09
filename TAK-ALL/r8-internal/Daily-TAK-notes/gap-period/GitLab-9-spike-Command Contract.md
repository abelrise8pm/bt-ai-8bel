

## Summary

This document is the **wire-level catalog** of every model that crosses between TAK  
devices on the Arclight mesh. For each model it records:

* **Fields** — what is on the wire (name, type, meaning).  
* **Phase** — which step of the peer lifecycle the model is shared during.  
* **Trigger** — whether the exchange is **Automatic** (driven by the SDK runtime / background service) or **Manual** (driven by an explicit operator action such as drawing a route, marking a hostile, or admitting a peer).

## Lifecycle phases

| \# | Phase | What happens | Default trigger |
| :---- | :---- | :---- | :---- |
| 0 | **Transport** | Every message is wrapped, signed, sequenced, acked | Automatic |
| 1 | **Discovery & handshake** | Peers find each other on a radio and exchange identity | Automatic |
| 2 | **Admission / membership** | A peer asks to join a session; a sponsor admits/denies | **Manual** (gated by operator) |
| 3 | **Mesh routing** | Multi-hop reachability is advertised across the mesh | Automatic |
| 4 | **Mission content sync** | Missions, routes, hostiles, GRGs, team roster replicate | **Manual** author → Automatic replicate |
| 5 | **Live presence & telemetry** | Position/PLI streams between members | Automatic |
| 6 | **Reconciliation & hydration** | Peers compare Merkle roots and backfill missing docs | Automatic |

## Phase 0 — Transport envelope (AUTO)

Everything below is carried inside an Envelope. The envelope is never sent by hand;  
the runtime builds, signs, sequences, and routes it.

### Envelope — AUTO

| Field | Type | Meaning |
| :---- | :---- | :---- |
| message\_id | string | Unique id for dedup / ack correlation |
| sequence | uint64 | Per-sender monotonic counter |
| sent\_at\_epoch\_ms | int64 | Send timestamp |
| sender | PeerIdentity | Who emitted this envelope |
| type | MessageType | HELLO / WELCOME / PING / PONG / GOODBYE / HEARTBEAT / ERROR / DATA / ACK |
| body | oneof | One of the control or Data payloads |
| signature\_algorithm | string | Algorithm used to sign |
| signature | string | Signature over the envelope |

### Data — AUTO (carrier for all Phase 4–6 content)

| Field | Type | Meaning |
| :---- | :---- | :---- |
| namespace | string | Logical channel (e.g. mission collection) |
| payload | bytes | Serialized domain object |
| encryption\_algorithm | string | Cipher, if encrypted |
| recipient\_peer\_id | string | Target peer for directed/encrypted payloads |
| nonce | bytes | Encryption nonce |
| encryption\_key\_id | string | Key reference |
| sync\_class | SyncClass | CONTROL / DURABLE / EPHEMERAL |

### Ack — AUTO

| Field | Type | Meaning |
| :---- | :---- | :---- |
| accepted\_message\_id | string | Envelope being acknowledged |
| accepted\_type | MessageType | Type of the acked envelope |
| accepted | bool | Accepted vs rejected |
| detail | string | Reason / note |
| accepted\_at\_epoch\_ms | int64 | Ack timestamp |
| scope | string | Ack scope |

### Error — AUTO

| Field | Type | Meaning |
| :---- | :---- | :---- |
| code | string | Error code |
| message | string | Human-readable detail |

\---

## Phase 1 — Discovery & handshake (AUTO)

Emitted automatically by the foreground/runtime service when a radio link appears or  
a liveness tick fires. No operator action.

### PeerIdentity — AUTO

| Field | Type | Meaning |
| :---- | :---- | :---- |
| peer\_id | string | Stable peer identifier |
| nickname | string | Display name |
| public\_key | string | Identity public key |
| identity\_signature | string | Self-signed identity proof |
| signature\_algorithm | string | Algorithm used |
| supported\_modalities | Modality\[\] | BLE / WIFI\_DIRECT / LAN / TAK\_SERVER |

### Hello — AUTO (link opener)

| Field | Type | Meaning |
| :---- | :---- | :---- |
| modalities | Modality\[\] | Radios this peer offers |
| wifi\_direct\_port | uint32 | Wi-Fi Direct listen port |
| lan\_port | uint32 | LAN TCP listen port |

### Welcome — AUTO (handshake reply)

| Field | Type | Meaning |
| :---- | :---- | :---- |
| modalities | Modality\[\] | Radios this peer offers |
| known\_peers | PeerSnapshot\[\] | Peers the responder already sees (gossip) |

### PeerSnapshot — AUTO

| Field | Type | Meaning |
| :---- | :---- | :---- |
| identity | PeerIdentity | The known peer |
| modalities | Modality\[\] | Its radios |
| wifi\_direct\_host | string | Reachable host |
| last\_seen\_epoch\_ms | int64 | Freshness |

### Heartbeat — AUTO

| Field | Type | Meaning |
| :---- | :---- | :---- |
| active\_modalities | Modality\[\] | Currently live radios |
| extensions | HeartbeatExtension\[\] | Optional piggybacked encrypted payloads |

### HeartbeatExtension — AUTO

| Field | Type | Meaning |
| :---- | :---- | :---- |
| namespace | string | Channel for the piggybacked data |
| payload | bytes | Serialized content |
| encryption\_algorithm / nonce / encryption\_key\_id | — | Encryption metadata |
| recipient\_peer\_id | string | Directed recipient |

### Ping / Pong / Goodbye — AUTO

| Model | Fields |
| :---- | :---- |
| Ping | ping\_id, payload |
| Pong | ping\_id, payload, received\_at\_epoch\_ms |
| Goodbye | reason |

\---

## Phase 2 — Admission / membership (MANUAL gate)

A peer \*\*requests\*\* to join (operator-initiated on the joining device); a sponsor  
\*\*decides\*\* (operator-initiated on the admitting device). The SDK transmits, but the  
allow/deny is a human decision.

### MembershipJoinRequest — MANUAL (joiner asks)

| Field | Type | Meaning |
| :---- | :---- | :---- |
| session\_id\_hint | string | Session the peer wants to join |
| peer\_identity | PeerIdentity | Requesting identity |
| requested\_at\_epoch\_ms | int64 | Request time |
| verification\_code | string | Out-of-band code to prove intent |

### MembershipDecision — MANUAL (sponsor decides)

| Field | Type | Meaning |
| :---- | :---- | :---- |
| session\_id | string | Session |
| subject\_identity | PeerIdentity | Peer being decided on |
| admitted | bool | Allowed or not |
| status | string | Status label |
| role | string | Granted role |
| sponsor\_peer\_id / sponsor\_nickname | string | Who admitted |
| membership\_revision | uint64 | Roster version after decision |
| decided\_at\_epoch\_ms | int64 | Decision time |
| detail | string | Reason / note |
| expires\_at\_epoch\_ms | int64 | Optional expiry |

### JoinRequest — AUTO\* (pending-roster entry, gossiped)

| Field | Type | Meaning |
| :---- | :---- | :---- |
| peer\_id, nickname | string | Identity |
| verification\_code | string | Code presented |
| public\_key\_fingerprint | string | Key fingerprint |
| trust\_model | string | Trust scheme |
| requested\_at\_epoch\_ms / last\_seen\_epoch\_ms | int64 | Timing |
| modalities | Modality\[\] | Radios |

### AdmissionPeer — AUTO\* (roster entry, replicated)

| Field | Type | Meaning |
| :---- | :---- | :---- |
| peer\_id, nickname | string | Identity |
| status, role | string | Membership state and role |
| verification\_code | string | Code |
| public\_key\_fingerprint | string | Key fingerprint |
| trust\_model | string | Trust scheme |
| sponsor\_peer\_id | string | Who admitted |
| decided\_at\_epoch\_ms / last\_seen\_epoch\_ms | int64 | Timing |

### AdmissionState — AUTO\* (whole-session roster snapshot)

| Field | Type | Meaning |
| :---- | :---- | :---- |
| session\_id | string | Session |
| policy, trust\_model | string | Admission policy |
| local\_status, local\_role | string | This device's standing |
| membership\_revision | uint64 | Roster version |
| admitted\_peers | AdmissionPeer\[\] | Current members |
| pending\_join\_requests | JoinRequest\[\] | Awaiting decision |
| denied\_peers | AdmissionPeer\[\] | Rejected |

\---

## Phase 3 — Mesh routing (AUTO)

Advertised continuously by the runtime so multi-hop paths stay current. No operator  
involvement.

### RouteOriginator — AUTO

| Field | Type | Meaning |
| :---- | :---- | :---- |
| origin\_peer\_id / origin\_nickname | string | Route source |
| origin\_public\_key\_fingerprint | string | Source key |
| sequence | uint64 | Anti-replay / freshness |
| hop\_count | uint32 | Hops so far |
| ttl | uint32 | Remaining hops allowed |
| previous\_hop\_peer\_id | string | Last relay |
| modalities | Modality\[\] | Radios on this path |
| reachable\_hosts | string\[\] | Addresses to reach origin |
| link\_score | uint32 | Path quality |
| emitted\_at\_epoch\_ms / expires\_in\_ms | int64 | Validity window |

\---

## Phase 4 — Mission content sync (MANUAL author → AUTO replicate)

These are the artifacts operators actually plan with. An operator **creates/edits** the object (manual); They are serialized into Data payloads with sync\_class \= DURABLE.

### Mission — AUTO\*

| Field | Type | Meaning |
| :---- | :---- | :---- |
| mission\_id | string | Mission key |
| name, description | string | Label / details |
| status | string | Lifecycle status |
| created\_at\_epoch\_ms / updated\_at\_epoch\_ms | int64 | Timing |

### Route — AUTO\* (route planning)

| Field | Type | Meaning |
| :---- | :---- | :---- |
| route\_id | string | Route key |
| name | string | Label |
| points | GeoPoint\[\] | Ordered waypoints |
| mission\_id | string | Owning mission |
| color | string | Display color |
| updated\_at\_epoch\_ms | int64 | Timing |

### TeamMember — AUTO\* (roster / order of battle)

| Field | Type | Meaning |
| :---- | :---- | :---- |
| member\_id | string | Member key |
| callsign | string | Callsign |
| team\_id, role | string | Team and role |
| device\_id, arclight\_peer\_id | string | Device / peer linkage |
| icon\_2525b | string | MIL-STD-2525B symbol |
| color | string | Display color |
| equipment | string\[\] | Equipment list |
| capabilities | string\[\] | Capability list |
| notes | string | Free text |
| updated\_at\_epoch\_ms | int64 | Timing |

### Hostile — AUTO\* (threat contact)

| Field | Type | Meaning |
| :---- | :---- | :---- |
| hostile\_id | string | Contact key |
| label | string | Display label |
| type | string | Contact type |
| confidence | string | Confidence level |
| icon\_2525b | string | MIL-STD-2525B symbol |
| color | string | Display color |
| updated\_at\_epoch\_ms | int64 | Timing |

### Grg — AUTO\* (Gridded Reference Graphic)

| Field | Type | Meaning |
| :---- | :---- | :---- |
| grg\_id | string | GRG key |
| name | string | Label |
| bounds | GeoPoint\[\] | Footprint polygon |
| source\_data\_ids | string\[\] | Linked source assets |
| updated\_at\_epoch\_ms | int64 | Timing |

### SourceDataRef — AUTO\* (binary asset pointer: imagery/files)

| Field | Type | Meaning |
| :---- | :---- | :---- |
| source\_id | string | Asset key |
| name, kind | string | Label / category |
| cid | string | Content id |
| sha256 | string | Content hash |
| media\_type | string | MIME type |
| size\_bytes | uint64 | Size |
| uri | string | Fetch location |
| updated\_at\_epoch\_ms | int64 | Timing |

### DurableDocument — AUTO (envelope for every Phase-4 object)

| Field | Type | Meaning |
| :---- | :---- | :---- |
| document\_id | string | Doc key |
| collection | string | Doc type/collection (e.g. Route, Hostile) |
| revision | uint64 | Monotonic version (last-writer / CRDT merge) |
| author\_peer\_id | string | Who wrote it |
| updated\_at\_epoch\_ms | int64 | Timing |
| deleted | bool | Tombstone flag |
| schema | string | Payload schema id |
| payload | bytes | Serialized domain object |
| payload\_hash | string | Integrity hash |

### DurableMutation / DurableMutationBatch — AUTO

| Model | Field | Type | Meaning |
| :---- | :---- | :---- | :---- |
| DurableMutation | collection | string | Target collection |
|  | document\_id | string | Target doc |
|  | schema | string | Payload schema |
|  | payload | bytes | New value |
|  | deleted | bool | Tombstone |
|  | tracked\_entity | bool | Whether this doc is a live-tracked entity |
| DurableMutationBatch | batch\_id | string | Batch key |
|  | source | string | Originating subsystem |
|  | mutations | DurableMutation\[\] | Folded set of changes |

### MissionRecordUpdate / DurableDocumentUpdate — AUTO (delivery notifications)

| Field | Type | Meaning |
| :---- | :---- | :---- |
| document | DurableDocument | The synced doc |
| value | bytes | Decoded value |
| deleted | bool | Tombstone |
| sender\_peer\_id / sender\_nickname | string | Source peer |
| received\_at\_epoch\_ms | int64 | Receipt time |
| modality | Modality | Radio it arrived on |

\---

## Phase 5 — Live presence & telemetry (AUTO)

High-rate position data. Once an entity is registered, the runtime streams it  
automatically; sync\_class \= EPHEMERAL.

### PliSnapshot — AUTO (position location info)

| Field | Type | Meaning |
| :---- | :---- | :---- |
| latitude, longitude | double | Position |
| altitude\_hae | double | Height above ellipsoid |
| circular\_error, linear\_error | double | Accuracy |
| speed\_mps | double | Speed |
| course\_degrees | double | Heading |
| observed\_at\_epoch\_ms | int64 | Fix time |

### GeoPoint — AUTO\* (shared coordinate primitive; used in routes/GRG bounds)

| Field | Type | Meaning |
| :---- | :---- | :---- |
| latitude, longitude | double | Position |
| altitude\_hae | double (opt) | Altitude |

### TeamPresence — AUTO (blue-force track: identity \+ latest PLI)

| Field | Type | Meaning |
| :---- | :---- | :---- |
| team\_id, member\_id | string | Roster linkage |
| device\_id, arclight\_peer\_id | string | Device / peer |
| callsign, role | string | Display \+ role |
| pli | PliSnapshot | Latest position |
| observed\_at\_epoch\_ms | int64 | Observation time |
| state\_revision\_seen | uint64 | Roster revision the sender had |

### TelemetryFrame — AUTO (compact own-position frame)

| Field | Type | Meaning |
| :---- | :---- | :---- |
| mission\_id, mission\_epoch | string/uint64 | Mission scope |
| short\_id | uint32 | Compact entity alias |
| sequence | uint64 | Per-owner counter |
| observed\_at\_epoch\_ms | int64 | Fix time |
| encoding\_mode | string | Encoding variant |
| lat\_e7, lon\_e7 | int64 | Position ×1e7 |
| altitude\_cm, speed\_cmps, course\_cdeg | int64 (opt) | Alt/speed/course, integer-scaled |

### TelemetryObservation — AUTO (a frame attributed to an owner, with expiry)

| Field | Type | Meaning |
| :---- | :---- | :---- |
| mission\_id, mission\_epoch | string/uint64 | Mission scope |
| short\_id | uint32 | Entity alias |
| owner\_peer\_id | string | Whose track this is |
| owner\_sequence | uint64 | Owner's counter |
| observed\_at\_epoch\_ms / expires\_at\_epoch\_ms | int64 | Validity window |
| encoding\_mode | string | Encoding variant |
| lat\_e7, lon\_e7 | int64 | Position ×1e7 |
| altitude\_cm, speed\_cmps, course\_cdeg | int64 (opt) | Alt/speed/course |

### TelemetryRollup — AUTO (batched observations for a mission)

| Field | Type | Meaning |
| :---- | :---- | :---- |
| mission\_id, mission\_epoch | string/uint64 | Mission scope |
| generated\_at\_epoch\_ms | int64 | Build time |
| observations | TelemetryObservation\[\] | Folded set of tracks |

### TrackedEntityRegistration / TrackedEntityHandle — MANUAL (declare what to track)

| Field | Type | Meaning |
| :---- | :---- | :---- |
| entity\_id | string | Entity key |
| collection | string | Collection |
| schema | string | Metadata schema |
| metadata\_payload | bytes | Entity metadata |

### LocationUpdate — AUTO (delivered live position with provenance)

| Field | Type | Meaning |
| :---- | :---- | :---- |
| entity\_id, collection, schema | string | Entity identity |
| metadata\_payload / metadata\_payload\_hash | bytes/string | Entity metadata |
| short\_id | uint32 | Compact alias |
| sequence | uint64 | Counter |
| pli | PliSnapshot | Position |
| sender\_peer\_id / sender\_nickname | string | Source |
| received\_at\_epoch\_ms | int64 | Receipt time |
| modality | Modality | Radio it arrived on |

\---

## Phase 6 — Reconciliation & hydration (AUTO)

Peers compare Merkle Search Tree roots, then backfill whatever they are missing. Pure  
SDK housekeeping.

### MstRootAdvert — AUTO

| Field | Type | Meaning |
| :---- | :---- | :---- |
| mission\_id | string | Mission scope |
| root\_hash | string | Top-level Merkle root |
| document\_count | uint32 | Docs covered |
| highest\_revision | uint64 | Newest revision held |
| generated\_at\_epoch\_ms | int64 | Build time |
| collection\_roots | MstCollectionRoot\[\] | Per-collection roots |

### MstCollectionRoot — AUTO

| Field | Type | Meaning |
| :---- | :---- | :---- |
| collection | string | Collection name |
| root\_hash | string | Collection Merkle root |
| document\_count | uint32 | Docs in collection |
| highest\_revision | uint64 | Newest revision in collection |

### HydrationMiss — AUTO (request a missing doc)

| Field | Type | Meaning |
| :---- | :---- | :---- |
| mission\_id | string | Mission scope |
| collection | string | Collection |
| document\_id | string | Wanted doc |
| short\_id | uint32 | Compact alias if known |
| requested\_by\_peer\_id | string | Requester |
| observed\_at\_epoch\_ms | int64 | Request time |

### ShortIdMappingDocument — AUTO (compact alias table)

| Field | Type | Meaning |
| :---- | :---- | :---- |
| short\_id | uint32 | Compact integer alias |
| collection | string | Collection |
| document\_id | string | Full doc id |
| mission\_epoch | uint64 | Epoch the alias is valid for |
| revision | uint64 | Mapping version |

\---

## Quick reference — model × phase × trigger

| Model | Phase | Trigger |
| :---- | :---- | :---- |
| Envelope, Data, Ack, Error | 0 Transport | AUTO |
| PeerIdentity, Hello, Welcome, PeerSnapshot, Heartbeat(+Extension), Ping, Pong, Goodbye | 1 Discovery | AUTO |
| MembershipJoinRequest | 2 Admission | MANUAL (joiner) |
| MembershipDecision | 2 Admission | MANUAL (sponsor) |
| JoinRequest, AdmissionPeer, AdmissionState | 2 Admission | AUTO\* (roster gossip) |
| RouteOriginator | 3 Routing | AUTO |
| Mission, Route, TeamMember, Hostile, Grg, SourceDataRef | 4 Content | AUTO\* (operator authors) |
| DurableDocument, DurableMutation, DurableMutationBatch, MissionRecordUpdate, DurableDocumentUpdate | 4 Content | AUTO |
| PliSnapshot, TeamPresence, TelemetryFrame/Observation/Rollup, LocationUpdate | 5 Telemetry | AUTO |
| TrackedEntityRegistration / Handle | 5 Telemetry | MANUAL (declare entity) |
| GeoPoint | 4/5 (primitive) | AUTO\* |
| MstRootAdvert, MstCollectionRoot, HydrationMiss, ShortIdMappingDocument | 6 Reconciliation | AUTO |

