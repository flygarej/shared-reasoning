# Implementation Contracts

## Purpose

Preserve the load-bearing contracts between pipeline components without
requiring their complete implementation artefacts to remain in session
context.

These anchors support architectural reasoning.

They do not establish exact field mappings, syntax, conversion behaviour,
or implementation-local semantics.

## Parsing and normalization

rsyslog performs source-specific parsing and emits NDJSON.

jq performs final canonical normalization before database insertion.

This distinction prevents source parsing and canonical normalization from
being treated as interchangeable responsibilities.

## Database insertion

Normalized events enter PostgreSQL through `insert_event(jsonb)`.

The insertion function is the database contract presented to the import
pipeline. Callers should not rely directly on the physical layout of
`firewall.events`.

Exact accepted input fields and conversion behaviour must be verified
from the current jq and database implementation artefacts.

## Persistence

`event_staging` is transient.

`firewall.events` is the canonical persistent event model used by
investigations.

Staging representation must not be treated as canonical event semantics.

## Import identity

Imported source files are recorded by `(host, path, SHA-256)`.

The import ledger prevents replay of an identical recorded file identity.

This anchor does not by itself establish the behaviour for renamed,
modified, partially imported, or concurrently imported files; those cases
require implementation inspection or experiment.

## Derived evidence

`mirai_signature` is a generated indication of Mirai-like behaviour.

It is not proof, classification, or attribution.

Investigation must corroborate it using additional packet fingerprints
and raw evidence.

## Implementation-reference boundary

DDL, Bash scripts, rsyslog configuration, jq programs, and investigation
SQL are reference artefacts for exact local semantics.

Begin work from project state and the relevant domain capsules.

Load implementation artefacts only when the current question depends on:

* exact field names or mappings;
* type conversions or null handling;
* timestamp behaviour;
* duplicate and transaction behaviour;
* SQL expressions, constraints, indexes, or generated columns;
* parser, shell, jq, or query syntax;
* configuration precedence or runtime behaviour.

After inspection or experiment, promote only accepted contracts,
boundaries, anchors, working models, and open questions into the compact
knowledge artefacts. Do not copy implementation detail into domain
capsules merely because it was inspected.
