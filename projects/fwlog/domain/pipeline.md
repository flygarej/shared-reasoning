# Pipeline Generator

Router → rsyslog parsing → NDJSON → jq normalization → staging →
insert_event(jsonb) → firewall.events.

Generators: - Source-specific parsing. - Canonical JSON normalization. -
Typed relational insertion.

Anchors: - Historical rotated logs are imported. - SHA-256 import ledger
prevents replay of identical files.
