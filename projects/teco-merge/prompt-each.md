# Domain Knowledge Extraction

Treat this as a **knowledge extraction** task rather than a summarization task.

The objective is **not** to explain the subject to a human.

The objective is to produce a compact knowledge capsule that allows another LLM to reconstruct the conceptual model developed during this conversation while minimizing incorrect inference.

---

## Scope

Extract knowledge **only** from the subject investigated in this conversation.

Do **not** expand into related technologies, historical context, implementation details from other systems, or general background unless they became accepted as part of the project's conceptual model.

When in doubt, preserve project focus rather than completeness.

---

## Authority

Use only information that became accepted during this conversation.

Prefer, in order:

1. Verified experiments.
2. Accepted project conclusions.
3. Documentation confirmed by experiments.
4. Explicitly accepted working models.

Do **not** include:

* historical reasoning;
* discarded hypotheses;
* dead ends;
* TODO items;
* unresolved speculation;
* documentation that was never accepted into the project model.

If documentation and experiments disagreed, preserve the accepted project model and mention the disagreement only if it materially constrains future reasoning.

---

## Compression Objective

Do **not** optimize for readability.

Optimize for restoring the reasoning model.

Prefer principles that generate many correct conclusions over enumerating facts.

Store:

* conceptual generators;
* invariants;
* execution models;
* evaluation order;
* grammar generators;
* structural relationships;
* distinctions that prevent incorrect inference.

Avoid:

* tutorials;
* examples;
* chronology;
* historical discussion;
* implementation trivia;
* exhaustive command lists;

unless they are required to prevent important reconstruction errors.

---

## Granularity

If many details are instances of one underlying rule, store the rule.

Only enumerate individual items when they cannot reasonably be regenerated from a more general principle.

---

## Representation

Produce a Markdown document named:

`domain-<project>.md`

Structure:

```text
# Domain Knowledge

## Purpose

One paragraph describing the conceptual model this capsule is intended to restore.

## Core Model

The smallest set of concepts that regenerate the accepted understanding.

## Execution Model

Evaluation order and execution semantics.

## Language / Structural Model

Grammar generators, structural relationships and invariants.

## Verified Invariants

Experimentally accepted invariants.

## Structural Exceptions

Only exceptions required to avoid important incorrect inference.

## Open Questions

Questions intentionally left unresolved.
```

---

## Quality Check

Before finishing, evaluate the result against these questions:

* Does every statement reflect accepted project knowledge rather than conversation history?
* Can a future LLM reconstruct the same conceptual model from this capsule?
* Have structural constraints been preferred over enumerations?
* Have unrelated but familiar topics been excluded?
* Is every remaining detail necessary to reduce future inference errors?

If not, improve the capsule by strengthening conceptual structure rather than adding more facts.

---

## Additional Deliverable

Also produce a second Markdown document named:

`documentation-overview.md`

Its purpose is to help a human relocate the project's source material.

For each significant reference, record:

* what it covers;
* its observed reliability;
* important limitations;
* disagreements with accepted project knowledge;
* when it should be preferred over other references.

Do not duplicate the conceptual model contained in the domain knowledge capsule.
