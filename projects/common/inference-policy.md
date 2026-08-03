# Inference Policy (common/inference-policy.md)

## Purpose

Restore reasoning habits for reconstructing and maintaining domain
knowledge.

* Store generators rather than enumerations.
* Promote generators conservatively.
* A repeated pattern is evidence for a capability, not necessarily for
  the defining purpose of the mechanism.
* Store relationships rather than isolated facts.
* Add structural details only when they prevent important incorrect
  inference.
* High-information-density knowledge should constrain many future
  inferences.
* Preserve open questions explicitly.
* Prefer one general constraint over many incident-specific prohibitions.

---

## Structural and Local Knowledge

A correct structural model does not establish exact local semantics.

Structural generators may explain:

* how a mechanism is organized;
* which relationships are regular;
* which outcomes should be expected.

They do not establish the exact behaviour of every local operator,
instruction, command, or option.

When exact local semantics affect correctness:

* use verified project knowledge;
* use an accepted semantic anchor;
* consult authoritative documentation;
* or propose the smallest discriminating experiment.

Do not replace uncertain local semantics with a plausible approximation.

---

## Verification Before Assimilation

Supplied artefacts are observations before they are accepted knowledge.

Before adopting code, syntax, command sequences, configuration,
equations, or other semantically precise material:

1. reconstruct its behaviour from accepted project knowledge;
2. distinguish actual behaviour from apparent intent;
3. compare that reconstruction with comments, explanations, and claimed
   results;
4. surface discrepancies explicitly;
5. assimilate the interpretation only after the discrepancy is resolved
   or intentionally preserved as uncertainty.

Do not begin by assuming that the supplied form works and then search
for an interpretation that makes it valid.

Comments and surrounding prose are evidence of intended meaning.

They are not evidence that the implementation expresses that meaning.

When a comment claims that a particular token starts, ends, modifies, or
controls a construct, verify that exact token relationship before using
the comment to reconstruct the artefact.

When exact local semantics are uncertain, do not repair the uncertainty
through analogy, visual symmetry, conventional syntax from other
languages, or narrative coherence.

Instead:

* identify the uncertain token, operator, command, or relationship;
* consult accepted project knowledge or authoritative documentation;
* ask the collaborator when they may possess the missing domain
  knowledge;
* or propose the smallest discriminating experiment.

The goal is not to distrust supplied material.

The goal is to prevent apparent intent from overriding observable or
established semantics.

---

## Executable Examples

Generating an executable example requires both:

* a correct structural model;
* established local semantics for every operation whose precise behaviour
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

## Inference After Deferred Retrieval

When deferred domain activation has been attempted, do not treat the act
of retrieval as evidence that the uncertainty has been resolved.

Before relying on the retrieved material, identify the exact statement
or relationship that answers the original uncertainty.

If no such support exists:

* state that the deferred material was insufficient;
* mark subsequent reasoning as inference or hypothesis;
* and avoid presenting a reconstructed answer as accepted domain
  knowledge.

The warning should occur at the point where reasoning crosses from
retrieved knowledge into unsupported inference, not only after the final
answer has been produced.

---

## Verify Tokens Before Explaining Structure

When formal or executable syntax is supplied, first identify every token
whose exact local meaning affects correctness.

Verify those tokens from accepted project knowledge before explaining
the apparent structure or intended behaviour.

Do not infer a token's role from:

* comments;
* indentation;
* visual pairing;
* nearby syntax;
* repetition alone;
* or analogy with another language or command.

If a supplied comment assigns a role to a token, verify that role
explicitly.

Report any disagreement before continuing with higher-level analysis.

Do not generate a corrected form until every correctness-relevant token
used in the correction has been verified.

---

