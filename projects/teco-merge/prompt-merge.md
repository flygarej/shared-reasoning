# Conceptual Model Synthesis

Treat this as a **conceptual model synthesis** task rather than a summarization or document merge task.

The input consists of multiple **independently extracted conceptual models** describing the same domain.

Your objective is to synthesize the smallest accepted conceptual model that best reconstructs the domain while minimizing future incorrect inference.

---

## Inputs

You are provided with:

* collaboration methodology;
* reasoning capsules;
* multiple independently extracted domain knowledge capsules;
* multiple documentation overviews.

Treat each domain capsule as an independent observation of the same underlying conceptual model.

Do **not** assume that differences indicate errors.

Differences may reflect:

* different abstraction levels;
* complementary discoveries;
* different experimental coverage;
* independent conceptualization.

---

## Authority

Use the collaboration protocol.

Prefer:

1. Concepts independently supported by multiple capsules.
2. Concepts explicitly identified as experimentally verified.
3. Accepted working models.
4. Documentation only where consistent with accepted models.

Do not silently promote plausible inference into accepted knowledge.

---

## Primary Objective

Produce the smallest conceptual model that regenerates the accepted understanding represented across all input capsules.

Do **not** merge wording.

Merge concepts.

---

## Synthesis Strategy

Rather than merging sections sequentially:

1. Identify all conceptual generators.
2. Identify structural invariants.
3. Identify execution models.
4. Identify grammar or structural generators.
5. Identify boundary constraints that prevent overgeneralization.
6. Identify independently recurring concepts.
7. Replace multiple local rules with a more general generator whenever possible.
8. Preserve genuinely independent concepts.
9. Preserve unresolved disagreements explicitly rather than choosing one.

Do not optimize for completeness.

Optimize for reconstruction fidelity.

---

## Abstraction

When multiple capsules describe the same concept at different abstraction levels:

Prefer the highest abstraction that can regenerate the lower-level models without losing accepted distinctions.

Avoid retaining multiple descriptions of the same concept unless they convey genuinely different information.

---

## Boundary Constraints

Separate:

* conceptual generators;
* structural constraints;
* implementation-specific exceptions.

Exceptions should exist only to prevent important incorrect inference.

---

## Documentation

Treat documentation overviews as evidence about references rather than domain knowledge.

Produce an independent merged documentation overview.

Do not allow documentation structure to influence the conceptual model.

---

## Outputs

Produce two independent Markdown documents.

### domain-teco.md

Suggested structure:

```text
# TECO Domain Knowledge

## Purpose

## Core Conceptual Model

## Execution Model

## Structural Models

## Verified Invariants

## Boundary Constraints

## Implementation Differences

## Open Questions
```

### documentation-overview.md

For each significant source:

* scope;
* observed reliability;
* experimentally confirmed areas;
* important limitations;
* known disagreements with accepted knowledge;
* recommended use.

---

## Quality Check

Before finishing, evaluate the synthesis.

Ask:

* Have multiple local concepts been replaced by a smaller number of conceptual generators?
* Does every remaining section reduce future inference error?
* Are implementation-specific constraints isolated from the core conceptual model?
* Have disagreements been preserved rather than silently resolved?
* Could another LLM reconstruct essentially the same conceptual model from this document alone?

If not, improve the conceptual structure rather than adding more information.

---

## Success Criterion

A successful synthesis is **not** the union of all input documents.

A successful synthesis is a conceptual model that explains all accepted input models with the fewest concepts while preserving the constraints required for correct reconstruction.
