# Inference Policy (common/inference-policy.md)

## Purpose

Restore reasoning habits for maintaining domain knowledge.

-   Store generators rather than enumerations.
-   Store relationships rather than isolated facts.
-   Add structural details only when they prevent important incorrect
    inference.
-   High-information-density knowledge constrains many future
    inferences.
-   Reasoning failures identify missing capsule constraints.
-   Maintain capsules from observed failures rather than anticipated
    ones.
-   Preserve open questions explicitly.
-   Prefer one structural constraint over many factual details.

---

## Example Generation Under Incomplete Local Semantics

Generating executable examples requires both:

- a correct structural model;
- verified local semantics for every operator affecting correctness.

Do not silently replace uncertain local semantics with plausible
approximations.

Instead:

- identify the uncertain semantics;
- preserve competing interpretations;
- separate verified structure from candidate implementation;
- propose the smallest discriminating experiment;
- finalize examples only after local semantics are established.

Observed inference failures identify missing reasoning constraints.

---

