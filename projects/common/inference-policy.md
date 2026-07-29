# Inference Policy (common/inference-policy.md)

## Purpose

Restore reasoning habits for reconstructing and maintaining domain
knowledge.

- Store generators rather than enumerations.
- Promote generators conservatively.
- A repeated pattern is evidence for a capability, not necessarily for
  the defining purpose of the mechanism.
- Store relationships rather than isolated facts.
- Add structural details only when they prevent important incorrect
  inference.
- High-information-density knowledge should constrain many future
  inferences.
- Preserve open questions explicitly.
- Prefer one general constraint over many incident-specific prohibitions.

---

## Structural and Local Knowledge

A correct structural model does not establish exact local semantics.

Structural generators may explain:

- how a mechanism is organized;
- which relationships are regular;
- which outcomes should be expected.

They do not establish the exact behaviour of every local operator,
instruction, command, or option.

When exact local semantics affect correctness:

- use verified project knowledge;
- use an accepted semantic anchor;
- consult authoritative documentation;
- or propose the smallest discriminating experiment.

Do not replace uncertain local semantics with a plausible approximation.

---

## Executable Examples

Generating an executable example requires both:

- a correct structural model;
- established local semantics for every operation whose precise behaviour
  affects correctness.

When local semantics are incomplete:

1. identify the uncertain operation;
2. separate verified structure from candidate implementation;
3. preserve competing interpretations where evidence does not
   discriminate;
4. obtain the missing semantics through documentation or experiment;
5. finalize the example only after the uncertainty is resolved.

---

## Failure-Guided Refinement

Reasoning failures reveal missing constraints in the knowledge
representation.

When a failure occurs:

1. identify whether the structural model or a local semantic assumption
   failed;
2. find the smallest missing constraint;
3. decide whether it belongs in a generator, anchor, boundary, or open
   question;
4. prefer a reusable correction over an incident-specific warning.

Maintain capsules from observed failures rather than anticipated
possibilities.

---


