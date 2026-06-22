# Engineering Lessons Learned: LAB-01 Triage Log

## 🚨 Environmental Bottleneck: Aggressive Cache Preservation

### Issue Profile

During active local manipulation of the database file (`data.json`), the browser client failed to render updated memory states upon consecutive button actions. The user interface displayed stale data records.

### Network Layer Diagnostics

Inspection of the local HTTP transport stream logs revealed that the server was returning an HTTP status code of **`304 Not Modified`** instead of a fresh **`200 OK`** packet.

- **Root Cause:** The browser client was automatically injecting conditional validation headers (`If-None-Match` token hashes matching the local server ETag data) into the network stream. Since the static asset signature appeared unchanged to the localized browser engine, it served a cached variant straight from system RAM to save bandwidth, blinding the client to external data mutations.

### Resolution Protocol

1. Open the browser Developer Telemetry Dashboard (`F12`).
2. Navigate to the **Network** inspection plane.
3. Enable the **Disable Cache** parameter override flag.
4. Result: The browser successfully forces hard `Cache-Control: no-cache` parameters, compelling the network socket to perform a true data fetch from disk, returning valid `200 OK` payloads on every execution loop.

## 💡 Cross-Certification Competency Sync

- **CompTIA Network+ / Google IT Support:** Discovered the operational difference between conditional network handshakes (`304`) and standard data payloads (`200 OK`). Learned how to leverage developer telemetry toolsets to debug client/server communication limits.
- **Google Project Management:** Recognized an unexpected environmental risk constraint, executed quick hypothesis validation, and standardized a repeatable triage run for future engineering cycles.
