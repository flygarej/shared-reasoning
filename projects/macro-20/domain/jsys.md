# JSYS Domain Index

## Purpose

This file is the compact entry point for the JSYS domain.

It should be included in the generated `macro-20.md` project prompt.

The detailed capsules live under:

```text
projects/macro-20/domain/jsys/
```

They are intended for selective inspection when work enters the relevant
part of the TOPS-20 monitor interface.

The objective is to preserve a compact conceptual map without loading the
entire monitor-call reference model into every session.

---

## Deferred domain

Detailed JSYS material is stored under:

`projects/macro-20/domain/jsys/`

This branch uses the repository's Deferred Domain Activation mechanism.

Before retrieving detailed JSYS capsules for the first time in a session,
request and read:

`deferred-domain-activation.md`

For branch organization or maintenance, request:

`projects/macro-20/domain/jsys/about-this-domain.md`

---

## Status

The material in this directory was mined from the **TOPS-20 Monitor Calls
Reference Manual**, TOPS-20 Version 7.0, revised November 1990.

It is currently:

- documentation-derived candidate domain knowledge;
- consistent with the accepted MACRO-20 project model where overlap exists;
- not automatically promoted into Project State;
- subject to refinement through use, comparison with existing capsules,
  and verified programs.

The reference manual is authoritative for exact documented local
semantics, but it assumes prior familiarity and is not itself a conceptual
tutorial.

---

## Central Model

A TOPS-20 monitor call is a structured transition between user code and
the monitor:

```text
prepare arguments in accumulators and/or argument blocks
                         ↓
                     execute JSYS
                         ↓
              monitor performs a service
                         ↓
             return through defined paths
                         ↓
       receive results in accumulators or storage
```

Monitor calls should be understood through:

- their argument model;
- the designators and handles they accept;
- their return-control convention;
- their resource lifecycle;
- the subsystem to which they belong;
- exact local semantics established by documentation or experiment.

---

## Detailed Capsules

### `jsys-interface.md`

The common monitor-call interface: accumulators, argument blocks,
returned data, symbolic call names, and monitor entry.

### `monitor-designators.md`

The typed designators used to identify memory, strings, files, devices,
processes, pages, sections, and other monitor-visible objects.

### `monitor-resource-lifecycles.md`

The recurring separation between identifying, acquiring, activating,
using, closing, and releasing monitor resources.

### `jsys-return-model.md`

Return paths, error handling, and the principle that control flow is part
of the monitor-call interface.

### `jsys-functional-families.md`

The major conceptual families into which the monitor calls cluster.

### `jsys-anchors.md`

Documentation-derived facts selected to prevent nearby inference drift.

### `reset.md`

The process-wide cleanup semantics of `RESET`, preserved separately
because its breadth is easy to underestimate from small example programs.

### `jsys-boundaries.md`

Limits on safe reconstruction from the common JSYS model.

---

## Use

Read this index during initial reconstruction.

Inspect detailed capsules only when needed for:

- program construction;
- exact JSYS-family reasoning;
- diagnosing a local semantic uncertainty;
- evaluating a candidate generator or anchor;
- extending a verified reference program.

Do not infer exact AC layouts, flag meanings, return conditions, or
designator encodings from this index alone.

For family-level questions, request the matching family capsule before
falling back to the original reference. Use the original reference 
directly when no family capsule exists or exact local semantics exceed 
the capsule’s scope.

---

Detailed branch organization:

If repository organization or restructuring becomes relevant,
retrieve:

    projects/macro-20/domain/jsys/about-this-domain.md
	
---

## When a question requires exact local JSYS semantics:

1. Determine the conceptual subsystem.
2. Retrieve jsys-functional-families.md if necessary.
3. Retrieve the smallest family capsule likely to answer the question.
4. If insufficient, retrieve the original reference for that family or the
   JSYS reference manual.
5. Distill only if reusable conceptual knowledge emerges.

---

## Reference fallback

If no detailed capsule covers the required monitor call or local semantic
question, request the original indexed reference source:

`projects/macro-20/references/JSYS_REFERENCE.MEM.txt`

Retrieve and inspect only the relevant JSYS entry or nearby supporting
sections.

Material obtained this way is:

- documentation-derived candidate knowledge;
- authoritative for the documented interface and stated version;
- not automatically accepted into Project State;
- a candidate for later distillation into a generator, anchor, boundary,
  or dedicated JSYS capsule.

Do not answer exact local JSYS questions from model knowledge merely
because no detailed capsule currently exists.
