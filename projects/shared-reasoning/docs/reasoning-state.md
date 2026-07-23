# Reasoning State

The project discovered that restoring an LLM's reasoning state is a
different optimization problem from writing documentation or summaries.

Reasoning capsules are intended to reconstruct the correct conceptual
model using the smallest amount of information that prevents important
incorrect inferences.

Guiding principles:

-   Store principles rather than examples.
-   Store relationships rather than isolated facts.
-   Add structural constraints only when experience shows they prevent
    recurring reasoning failures.
-   Allow reliable inference to regenerate routine details.
-   Record exceptions and open questions explicitly.

Maintenance workflow:

1.  Observe a reasoning failure.
2.  Identify the missing conceptual constraint.
3.  Add the smallest durable statement that prevents that class of
    errors.
4.  Retest before enlarging the capsule.

This process treats reasoning failures as evidence for improving
knowledge representation rather than merely correcting isolated
mistakes.
