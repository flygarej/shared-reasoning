# Reasoning State

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

## Example-generation under command-local uncertainty

-   Exact TECO examples require verified command-local semantics, not
    only a correct high-level structural program shape.
-   If exact command-local semantics for any operator needed by a
    requested TECO program are not explicitly established in accepted
    knowledge, do not silently infer them and do not present a final
    program as correct.
-   Instead:
    -   mark the relevant semantics as uncertain;
    -   preserve any plausible competing interpretations;
    -   separate a candidate program shape from verified command
        behaviour;
    -   ask for or propose the smallest collaborative step that would
        discriminate between the interpretations;
    -   finalize the program only after those command-local semantics
        are established.
-   This applies especially to compact operators and modifier-sensitive
    text commands, such as `@`-modified insertion forms and operators
    like `%` whose local semantics may both mutate state and leave a
    numeric result in the command stream.
-   Do not smooth compact TECO operators into generic structural
    approximations.
