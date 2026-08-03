# Deferred Domain Activation

## Purpose

Some projects require large bodies of reference material:

- manuals;
- standards;
- source listings;
- reference programs;
- historical documents;
- large domain capsules;
- logs and observations;
- implementation-specific documentation.

Loading all of that material into every conversation wastes context and can
weaken reconstruction by giving low-level detail the same weight as central
concepts.

Deferred Domain Activation separates:

- knowledge visibility;
- knowledge residency;
- knowledge retrieval.

The startup prompt reconstructs the conceptual graph and tells the collaborator
what detailed knowledge exists.

Detailed material is loaded only when the active investigation reaches the
relevant branch.

---

## Core Principle

> Reconstruct the conceptual graph first. Load detailed domain material only
> when the current investigation requires it.

The initial context should preserve enough information to answer:

- What knowledge branches exist?
- What is each branch for?
- Which source or capsule should be loaded for a particular uncertainty?
- What is the provenance and authority of that material?
- What should not be inferred without retrieving it?

It does not need to contain the full detail of every branch.

---

## Conceptual Model

```text
startup prompt
    ↓
conceptual graph and lookup capsules
    ↓
active investigation
    ↓
local semantic uncertainty or detailed task
    ↓
retrieve one relevant branch or source
    ↓
continue reasoning with explicit provenance
    ↓
promote only verified or accepted results
```

This resembles hierarchical storage:

- the namespace remains visible;
- the contents may be offline;
- retrieval occurs when needed;
- retrieval does not change the identity of the material.

---

## Repository Architecture

A deferred domain should expose a compact top-level capsule and store detailed
material below it.

Recommended pattern:

```text
domain/
    jsys.md
    jsys/
        about-this-domain.md
        jsys-interface.md
        monitor-designators.md
        reset.md
        ...
```

The top-level file, such as `domain/jsys.md`, is included in the generated
project prompt.

Files below `domain/jsys/` are not included automatically. They are retrieved
selectively.

The same pattern can be used for reference collections:

```text
domain/
    references.md
    references/
        tops-20-monitor-calls.md
        gorin.md
        small-executive.md
```

The top-level lookup file preserves the visible namespace. The subordinate
files preserve the detailed content.

---

## The Top-Level Lookup Capsule

A lookup capsule should be compact but operationally useful.

It should describe:

### Purpose

Why the branch exists and what kind of work it supports.

### Conceptual scope

The major concepts, families, or subsystems represented by the branch.

### Available deferred material

For each file or source:

- path;
- subject;
- role;
- provenance;
- authority;
- when to retrieve it.

### Retrieval triggers

Examples of uncertainties or tasks that should cause the collaborator to
request a particular file.

### Boundaries

What must not be inferred from the compact lookup capsule alone.

### Promotion status

Whether the material contains:

- accepted knowledge;
- documentation-derived candidate knowledge;
- observations;
- historical reasoning;
- reference-only detail.

---

## Example Lookup Entry

```markdown
## TOPS-20 Monitor Calls Reference Manual

Path:

`domain/references/tops-20-monitor-calls.md`

Role:

Primary reference for exact documented JSYS interfaces, accumulator layouts,
flags, return paths, and errors.

Retrieve when:

- exact local JSYS semantics matter;
- a flag or field must be confirmed;
- two similar monitor calls may differ;
- documentation is preferred over inference.

Do not use it alone for:

- introductory conceptual explanation;
- project history;
- proof that behavior matches the live monitor;
- automatic promotion into Project State.
```

This is enough to make the source visible without loading the source itself.

---

## Retrieval Workflow

When the active investigation enters a deferred branch, the collaborator should:

1. identify the missing concept or local semantic detail;
2. consult the loaded lookup capsule;
3. request the smallest relevant deferred file or original source;
4. state why the material is needed;
5. continue with the new material explicitly marked as retrieved;
6. preserve provenance in resulting conclusions;
7. avoid loading neighboring material unless the investigation reaches it.

A good request is specific:

> Please upload `domain/jsys/monitor-resource-lifecycles.md`. The current
> uncertainty concerns whether acquisition, activation, and release are
> separate stages.

A poor request is broad:

> Upload all JSYS documentation.

---

## Retrieval Granularity

Prefer the smallest material that can resolve the uncertainty.

Possible retrieval levels:

### Distilled capsule

Use when the conceptual model is missing but exact manual detail is unnecessary.

### Anchor or boundary file

Use when a nearby inference trap is known.

### Reference program

Use when several generators must be seen composing in working code.

### Original source excerpt

Use when exact wording, flags, fields, or version-specific semantics matter.

### Full original source

Use only when the investigation cannot be bounded to a smaller section.

---

## Provenance Rules

Retrieving material into a conversation does not automatically make it accepted
project knowledge.

Classify conclusions according to their provenance:

- Verified by inspection
- Reconstructed from related artefacts
- Documentation-derived candidate
- Observation
- Hypothesis
- Verified conclusion
- Not reconstructed

The original source remains authoritative only within its documented scope.

A retrieved manual entry may establish documented behavior but not necessarily:

- behavior of the current live system;
- absence of errata;
- compatibility across versions;
- conceptual importance;
- project acceptance.

---

## Promotion Rules

After retrieval, new knowledge may be promoted only when appropriate.

Possible destinations include:

### Project State

For accepted current knowledge needed for future work.

### Domain generator

For compact principles that reconstruct many related facts.

### Anchor

For exact local distinctions that prevent nearby inference drift.

### Boundary

For limits on safe reconstruction.

### Session Log

For the history of how the conclusion was reached.

### Observation

For evidence not yet promoted into accepted knowledge.

### Reference index

For source location and retrieval guidance.

Do not copy large reference sections into Project State.

---

## Context Discipline

Deferred Domain Activation is not merely directory organization.

It is a context policy.

The startup prompt should load:

- collaboration protocol;
- rationale;
- accepted project state;
- relevant session history;
- central domain generators;
- compact lookup capsules.

It should not automatically load:

- large reference manuals;
- complete source listings;
- detailed subsystem capsules;
- dormant observations;
- every anchor for every possible branch.

The goal is to keep the active context close to the current conceptual working
set.

---

## Concatenation Guidance

Prompt-building scripts should include only top-level domain files.

For example:

```bash
find "$project_dir/domain" -maxdepth 1 -type f -name '*.md'
```

This includes:

```text
domain/jsys.md
```

and excludes:

```text
domain/jsys/reset.md
domain/jsys/jsys-interface.md
```

Subdirectories therefore act as deferred storage.

If a project needs finer control, an explicit startup manifest may be used, but
it is not required when depth-limited concatenation already provides the desired
behavior.

---

## Naming Convention

Recommended pattern:

```text
domain/
    <branch>.md
    <branch>/
        about-this-domain.md
        ...
```

Examples:

```text
domain/jsys.md
domain/jsys/about-this-domain.md

domain/references.md
domain/references/about-this-domain.md

domain/networking.md
domain/networking/about-this-domain.md
```

The top-level capsule is the public interface to the branch.

The subdirectory contains deferred implementation detail.

Avoid generic `README.md` files whose scope becomes unclear when moved or viewed
outside their original archive.

---

## `about-this-domain.md`

Each deferred branch may contain an `about-this-domain.md` file explaining:

- why the branch is deferred;
- how its files are organized;
- which top-level lookup capsule exposes it;
- expected provenance of its contents;
- how retrieval should occur;
- whether files are generators, anchors, boundaries, references, or historical
  material.

This file is normally not part of the startup prompt.

It supports repository maintenance and later restructuring.

---

## Reference Material

Reference sources often have:

- high local authority;
- low context density;
- weak conceptual organization;
- many details irrelevant to the current task.

They are therefore ideal candidates for deferred storage.

The lookup capsule should preserve:

- title;
- version;
- date;
- implementation or platform scope;
- authority;
- known limitations or errata;
- local repository path;
- retrieval triggers.

Original sources should remain distinct from mined domain capsules.

A manual is evidence.

A generator is a model distilled from evidence.

A verified program is executable evidence.

These artefacts should not be silently merged.

---

## Failure Modes

### Loading everything at startup

Consumes context and flattens importance.

### Lookup capsules that contain too much detail

Defeat deferred loading by becoming replacement manuals.

### Vague lookup entries

Fail to tell the collaborator which file to request.

### Hidden material with no visible index

Makes knowledge effectively nonexistent during reconstruction.

### Automatic promotion after retrieval

Confuses documentation, observation, inference, and accepted knowledge.

### Retrieval by filename alone

Encourages filesystem navigation instead of conceptual reasoning.

The request should arise from the missing concept. The filename is only the
storage location.

###

When the visible branch has no suitable distilled capsule, fall back to the branch’s indexed original source rather than abandoning retrieval or answering from ungoverned model knowledge.

---

## Design Test

A deferred branch is well designed if a fresh collaborator can:

1. reconstruct that the branch exists;
2. explain what it covers;
3. identify when more detail is needed;
4. request the correct file or source;
5. state why that material is relevant;
6. continue reasoning without loading unrelated branches;
7. preserve provenance after retrieval.

If the collaborator must guess which file to request, the lookup capsule is
insufficient.

If the collaborator never needs to retrieve subordinate material because the
lookup capsule already contains everything, the branch is not meaningfully
deferred.

---

## Relationship to Generators, Anchors, and Boundaries

Deferred Domain Activation controls **when** knowledge enters active context.

Generators, anchors, and boundaries control **how** that knowledge guides
reasoning.

Together:

```text
lookup capsule
    ↓
select branch
    ↓
deferred retrieval
    ↓
generator reconstructs
anchor constrains
boundary stops
    ↓
verified or accepted result
```

This mechanism complements knowledge compression rather than replacing it.

---

## Deferred Domain Resolution Boundary

Deferred domain activation is an attempt to obtain missing project
knowledge.

It does not by itself establish that the missing knowledge was found.

After retrieving deferred domain material, determine whether the
correctness-relevant uncertainty is:

* resolved;
* partially resolved;
* or unresolved.

### Resolved

The retrieved material directly establishes the required semantics,
constraint, relationship, or fact.

Proceed using the retrieved material and identify its provenance when
useful.

### Partially resolved

The retrieved material constrains the uncertainty but does not determine
a unique conclusion.

Preserve the remaining alternatives explicitly.

Do not silently choose the most plausible interpretation.

### Unresolved

The retrieved material does not establish the correctness-relevant fact.

Before continuing, explicitly warn that further reasoning would depend
on inference outside accepted project knowledge.

Use wording appropriate to the situation, for example:

> The deferred domain material does not establish this point. Any answer
> beyond here would be an inference rather than verified project
> knowledge.

Then do one of the following:

* request a more specific deferred artefact;
* consult authoritative documentation;
* ask the collaborator for domain knowledge;
* propose the smallest discriminating experiment;
* or continue with a clearly labelled hypothesis if that is useful.

Retrieval success must not be confused with semantic resolution.

A retrieved artefact may be relevant without being sufficient.

---

## Summary

Deferred Domain Activation separates the conceptual map from detailed domain
content.

The startup prompt carries the map.

The repository carries the leaves.

The conversation retrieves a leaf when reasoning reaches that branch.

The result is lower context use, clearer provenance, more targeted inspection,
and a scalable way to organize large bodies of reference material without
making them disappear from the collaboration.

---
