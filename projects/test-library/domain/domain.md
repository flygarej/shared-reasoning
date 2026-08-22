# Domain knowledge — Shared Reasoning test bench

## Purpose

Capture stable conceptual knowledge needed to test Shared Reasoning itself without duplicating the full collaboration framework.

## Generator: authority and persistence are separate dimensions

The identity and epistemic role of a project artefact do not depend on where it is stored.

- Git/local repository can be authoritative for framework and project source material.
- An LLM-side Library can act as a writable cache for selected project artefacts.
- A monolithic prompt is a serialized bootstrap/transport representation.
- Absence of persistent LLM-side storage changes who performs persistence, not what maintenance means.

This separation allows the same Shared Reasoning maintenance model to operate across environments with different storage capabilities.

## Boundary: framework self-modification

Do not treat a convenient writable project cache as authority for the framework that governs collaboration.

For this project, `protocol.md`, `rationale.md`, and common framework artefacts remain under deliberate human/Git control. The project cache may record observations about framework behavior and propose changes, but framework changes are tested/reviewed separately before acceptance.

## Generator: reconstruction validates more than component correctness

Correctly maintained component artefacts do not by themselves prove that the next collaborator will receive a coherent project.

For substantial maintenance, especially when artefacts cross a persistence boundary:

1. maintain the component artefacts;
2. persist/replace them in the authoritative project tree;
3. regenerate the monolithic bootstrap;
4. when practical, review the assembled result for reconstruction failures.

Assembly mistakes, omissions, duplication, and loss of load-bearing relationships can appear only after serialization.

## Generator: references are evidence; state/domain are curated knowledge

Reference material may have high local authority but does not automatically become accepted project knowledge.

Before grounding state/domain in a reference, establish its relevance, scope, version/applicability, and relationship to observations or existing accepted knowledge. Promote only verified or explicitly accepted conclusions.

## Generator: test abstractions by withholding implementation conveniences

A discriminating portability test should state the missing capability or constraint but avoid prescribing the expected fallback behavior.

Example: tell a fresh collaborator that persistent Library storage is unavailable, then later request maintenance naturally. If it derives the correct artefact-return workflow, the abstraction is doing useful work. If the test prompt tells it exactly how to return files, the framework itself has not been tested.

## Anchor: ambiguity is unresolved until discriminated

A plausible expansion of an abbreviation, homonym, shorthand, or culturally loaded phrase is still an inference when multiple interpretations remain credible.

Observed example: `PD` was interpreted as "Professional Development" but meant "Public Domain".

Surface the ambiguity when local context does not discriminate it; do not silently promote the most plausible interpretation to resolution.

## Working model: collaboration architecture should be mostly invisible to naïve users

The collaborator should normally carry the bookkeeping burden of deciding whether new material belongs in project state, domain knowledge, references, observations, history, or TODOs.

A user should be able to say ordinary things such as "we proved X", "here is a manual", or "save where we got to" without first learning the internal knowledge architecture.

This is a working model to be tested in fresh naïve-user conversations.

## Working model: productive meanders are not automatically scope loss

Exploration of adjacent ideas can expose useful analogies, assumptions, or new approaches. The collaborator should preserve a recoverable thread to the active project and return to it when the meander ceases to contribute, rather than rigidly suppressing tangents.

This behavior is desirable but should not cause conversational material to be promoted into project knowledge unless it contributes to future reasoning.
