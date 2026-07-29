# Knowledge Maintenance (common/knowledge-maintenance.md)

## Purpose

Maintain the knowledge base so that it remains compact, internally
consistent, and suitable for reliable reconstruction.

Knowledge maintenance preserves accepted understanding.

It does not expand the domain.

---

## Scope

Maintenance applies to all knowledge artefacts, including:

- project-state;
- domain knowledge capsules;
- generators;
- anchors;
- boundaries;
- Rosetta/reference artefacts;
- supporting common knowledge artefacts.

---

## General Principles

Maintain the smallest accepted representation that reliably reconstructs
the project understanding.

Prefer restructuring over expansion.

Prefer consolidation over duplication.

Every retained artefact should contribute to future reasoning.

---

## Maintenance Activities

### Promote

Promote verified knowledge into accepted artefacts.

Do not promote:

- unresolved questions;
- TODO items;
- historical reasoning;
- discarded hypotheses.

---

### Consolidate

Merge overlapping concepts.

Merge concepts rather than wording.

Avoid parallel descriptions of the same accepted knowledge.

---

### Compact

Reduce representation while preserving reconstruction quality.

Compression should remove redundancy rather than information.

---

### Prune

Remove knowledge that no longer contributes.

Candidates include:

- obsolete examples;
- superseded models;
- redundant explanations;
- anchors no longer required;
- generators fully subsumed by others.

Removal should not reduce reconstruction quality.

---

### Review

Review artefacts after significant project milestones.

Typical review questions:

- Does this still contribute?
- Is there unnecessary duplication?
- Can two concepts be merged?
- Has new evidence changed the accepted model?
- Has an inference become verified?
- Does this belong in another artefact?

---

## Generator Maintenance

Generators should:

- reconstruct conceptual models;
- remain domain-oriented rather than documentation-oriented;
- avoid unnecessary implementation detail;
- preserve accepted abstractions.

If a generator repeatedly permits incorrect reconstruction,
consider introducing an anchor rather than expanding the generator.

---

## Anchor Maintenance

Anchors should exist only where they measurably constrain
incorrect inference.

Candidate anchors usually originate from:

- verified failures;
- repeated ambiguity;
- semantic distinctions;
- structural relationships;
- behavioural invariants.

Each anchor should ideally have recorded provenance describing
why it exists.

Review anchors periodically.

Merge overlapping anchors.

Remove anchors that no longer improve reconstruction.

---

## Boundary Maintenance

Boundaries should identify where reconstruction becomes unsafe.

Add boundaries when repeated over-inference is observed.

Remove boundaries that unnecessarily restrict correct reasoning.

---

## Rosetta Artefacts

Reference programs and canonical examples should remain:

- verified;
- representative;
- stable.

Prefer one authoritative example over many partial examples.

---

## Success Criterion

A well-maintained knowledge base:

- reconstructs accepted understanding;
- minimizes inference drift;
- minimizes redundancy;
- remains easy to extend;
- remains substantially smaller than the documentation from which it
  originated.
  
---

