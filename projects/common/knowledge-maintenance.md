# Knowledge Maintenance (common/knowledge-maintenance.md)

## Purpose

Maintain the knowledge base so that it remains compact, internally
consistent, and suitable for reliable reconstruction.

Knowledge maintenance preserves and restructures accepted understanding.

It does not expand the domain through unsupported inference.

---

## Scope

Maintenance applies to all knowledge artefacts, including:

- project state;
- session history;
- domain capsules;
- generators;
- anchors;
- boundaries;
- open questions;
- Rosetta/reference artefacts;
- supporting common artefacts.

---

## General Principle

Maintain the smallest accepted representation that reliably reconstructs
the project understanding.

Prefer:

- restructuring over expansion;
- consolidation over duplication;
- accepted concepts over historical wording;
- one authoritative location for each responsibility.

Every retained artefact should contribute to future reasoning.

---

## Persistence Boundary

Project artefact identity is independent of the mechanism used to persist it.

When persistent project storage is available, maintain project artefacts in
their established locations.

When persistent project storage is unavailable, maintenance should instead
return the changed artefacts to the collaborator using their stable filenames
and expected project-relative paths.

The collaborator is then responsible for replacing those artefacts in the
authoritative project structure before generating the next bootstrap prompt.

Do not create alternate filenames, derivative artefacts, or parallel copies
merely because persistent storage is unavailable.

The maintenance operation remains the same in both cases. Only responsibility
for persistence changes.

---

## Maintenance Activities

### Promote

Promote knowledge when it has become:

- experimentally verified;
- explicitly accepted;
- or intentionally retained as a working model.

Do not promote unresolved questions, discarded hypotheses, or historical
reasoning as accepted knowledge.

### Consolidate

Merge overlapping concepts and parallel descriptions.

Merge concepts rather than wording.

Preserve provenance in the Session-Log or version history rather than
duplicating it in current domain knowledge.

### Compact

Remove redundancy while preserving reconstruction quality.

Compression must not erase:

- important semantic distinctions;
- accepted boundaries;
- unresolved alternatives;
- provenance needed to understand accepted conclusions.

### Prune

Remove artefacts or content that no longer contributes.

Candidates include:

- superseded models;
- obsolete examples;
- repeated explanations;
- anchors that no longer constrain plausible drift;
- generators fully subsumed by stronger generators;
- boundaries made obsolete by accepted knowledge.

### Relocate

Move content when its current artefact no longer matches its role.

Examples:

- history belongs in Session-Log;
- accepted project direction belongs in Project-State;
- conceptual reconstruction belongs in domain capsules;
- exact drift-preventing facts belong in anchors;
- verified integrative examples belong in reference artefacts.

---

## Maintenance Triggers

Review the knowledge base after observable milestones such as:

- completion of a chapter, subsystem, or investigation;
- acceptance or rejection of a major working model;
- accumulation of several new domain capsules;
- discovery of repeated inference drift;
- addition of a Rosetta/reference artefact;
- substantial mismatch between Project-State and current domain
  knowledge;
- preparation for handover or release.

Use observable project changes rather than attempting to infer internal
context-window pressure.

---

## Mechanism Review

### Generators

Generators should reconstruct conceptual models without becoming
reference documentation.

When a generator repeatedly permits a nearby incorrect reconstruction,
consider adding an anchor or boundary rather than expanding the generator
indefinitely.

### Anchors

Anchors should preserve only load-bearing distinctions.

Prefer anchors motivated by observed failure, recurring ambiguity, or a
credible close alternative.

Record provenance when it explains why an anchor exists.

### Boundaries

Boundaries should identify where reconstruction is unsafe.

Retain them while the uncertainty remains relevant; remove or narrow them
when later accepted knowledge resolves it.

### Rosetta/reference artefacts

Reference artefacts should remain:

- verified;
- representative;
- stable;
- clearly separate from generator capsules.

Prefer a small number of authoritative examples over many partial ones.

---

## Reconstruction Check

After substantial maintenance, test whether the revised artefacts still
reconstruct the accepted model.

When maintenance is performed across a persistence boundary, regenerate the
bootstrap prompt after the collaborator has replaced the returned artefacts.

When practical, review the regenerated bootstrap before handover. This checks
both the maintained artefacts and their assembled representation.

Useful checks include:

- a fresh conversation or model can explain the core mechanisms;
- accepted boundaries remain visible;
- known failure cases are constrained;
- reference artefacts remain understandable from the capsules;
- deleted material is either regenerable or preserved as history.

A failure of reconstruction is evidence that compaction removed a
load-bearing concept or anchor.

---

## Success Criterion

A well-maintained knowledge base:

- reconstructs accepted understanding;
- minimizes inference drift;
- minimizes redundancy;
- preserves important uncertainty;
- remains easy to extend;
- remains substantially smaller than the documentation from which it
  originated.
  
---

