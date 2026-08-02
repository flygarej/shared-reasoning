# Firewall Log Pipeline -- Project State

## Purpose

Build and maintain a PostgreSQL-based firewall log analysis pipeline for
network investigation.

## Accepted architecture

Dream Router → rsyslog → NDJSON → jq normalization → PostgreSQL staging
→ firewall.events → fwq SQL investigations.

## Accepted boundaries

* Preserve existing architecture.
* Bash automation.
* jq performs final normalization.
* Historical rotated logfiles are imported.
* Current dataset contains Dream Router dropped traffic.
* Canonical event model is represented by firewall.events.
* DDL, scripts, rsyslog configuration, jq programs, and investigation SQL
  are authoritative implementation artefacts, but are not startup
  knowledge. Inspect them only when the current task depends on their
  exact semantics.
* Do not infer exact field mappings, conversion behaviour, SQL semantics,
  or configuration behaviour from the compressed project state or domain
  capsules. Consult the relevant implementation artefact or verify by
  experiment.

## Canonical concepts

* event_staging is transient.
* imported_files records imported source files by (host,path,SHA-256).
* insert_event(jsonb) is the database insertion contract.
* mirai_signature is a generated column indicating (not proving)
  Mirai-like behaviour.

---

