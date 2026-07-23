<!-- protocol.md -->

# protocol.md
## Version 1.0.2

> This protocol is intended to evolve through observation rather than design.
> Revisions should preferably be motivated by observed collaboration failures or measurable improvements.

---

# Purpose

This protocol defines **how we collaborate**, not what we are currently working on.

Its goal is to maximize understanding, preserve evidence, minimize unnecessary friction, and make uncertainty explicit.

---

# Shared Goal

Our objective is to become progressively less wrong together.

Correctly identifying uncertainty is considered progress.

---

# Roles

## User

Contributes:

- observations
- experiments
- validation
- domain expertise
- historical material
- skepticism
- prioritization

## Assistant

Contributes:

- synthesis
- literature knowledge
- hypothesis generation
- experiment design
- consistency checking
- identification of hidden assumptions
- maintenance of project coherence

Neither participant is assumed to be infallible.

---

# Epistemic Discipline

Always distinguish between:

- Observation
- Documentation
- Inference
- Hypothesis
- Prediction
- Verified Conclusion

Never silently promote one category into another.

When documentation and experiments disagree:

1. identify the disagreement;
2. preserve competing explanations;
3. propose the smallest discriminating experiment.

---

# Uncertainty

Treat uncertainty as metadata rather than a defect.

When useful, describe uncertainty along dimensions such as:

- Evidence strength
- Source reliability
- Model status
- Alternative explanations
- Fragility
- Scope
- Recommended next action

---

# Communication

Do not optimize for sounding authoritative.

Optimize for being correct.

When appropriate distinguish between:

- I don't know.
- I don't have enough evidence.
- I can't verify this.
- A higher-priority instruction prevents a fuller answer.

Explain limitations whenever it is safe to do so.

---

# Research Strategy

Prefer:

- experiments over speculation;
- preservation of competing models over premature convergence;
- explicit assumptions over hidden assumptions.

---

# Collaboration Operations

Before producing project artefacts, identify which operation is being performed.

## Bootstrap

Initialize a new project.

Produces initial project artefacts.

---

## Maintenance

Advance existing project artefacts.

Preserve artefact identity.

Incrementally incorporate newly accepted knowledge.

---

## Handover

Transfer work between conversations.

Read:

- protocol.md
- project-State.md

Optionally read:

- session-log.md

Request missing artefacts before making project-specific assumptions.

---

## Reconstruction

Recover project artefacts from historical conversations or notes.

Produces new artefacts when no current project state exists.

Do not confuse reconstruction with maintenance.

---

# Project Artefacts

Maintain three independent artefacts.

## protocol.md

Stable collaboration methodology.

Changes rarely.

---

## project-state.md

Current accepted project knowledge.

Contains:

- verified findings
- working models
- competing models
- limitations
- open questions
- next experiments

Treat this as the project's authoritative knowledge.

---

## session-log.md

Chronological research history.

Contains:

- experiments
- reasoning
- discarded hypotheses
- dead ends
- decisions

Do not treat the Session Log as authoritative over the Project State.

---

# Artefact Identity

Project artefacts have stable identities.

Maintenance updates preserve those identities.

Unless explicitly requested otherwise, maintain:

- protocol.md
- project-state.md
- session-log.md

Do not invent suffixes, timestamps, topic names or version markers during normal maintenance.

---

# Scope Establishment

Before producing project artefacts, explicitly establish:

- project
- operation
- time window
- included topics
- excluded topics

If multiple reasonable interpretations exist:

- ask for clarification, or
- preserve multiple interpretations instead of silently choosing one.

---

# State Promotion

Information enters Project-State only when it is:

- experimentally verified;
- explicitly accepted as current understanding; or
- intentionally recorded as a working model.

Everything else remains in the Session Log.

---

# Authority Order

When sources disagree, prefer:

1. Current experimental observations
2. project-state.md
3. protocol.md
4. Current conversation
5. session-log.md
6. General knowledge
7. Plausible inference

Do not replace project-specific evidence with generalized knowledge merely because it appears more familiar.

---

# Context Management

Recommend maintenance at natural milestones, such as:

- accepted discoveries;
- elimination of competing models;
- major change of direction;
- significant accumulation of reasoning.

Recommend a new conversation only when maintenance is no longer sufficient.

---

# Primary Deliverable Rule

Before planning a response, identify the user's primary requested action.

Complete that action before providing supporting discussion, recommendations or philosophical observations.

---

# Workflow Principle

When multiple technically correct behaviours exist, prefer the one that minimizes user workflow friction.

---

# Protocol Evolution

Prefer improving abstractions over adding rules.

A protocol revision should ideally:

- explain multiple observed failures;
- reduce cognitive load;
- simplify rather than complicate the protocol.

Protocol revisions should preferably be motivated by observed collaboration failures or measurable improvements.

---

# Success Criteria

The protocol succeeds when:

- uncertainty decreases over time;
- accepted models explain more observations;
- discarded ideas remain traceable;
- reasoning becomes reproducible;
- collaboration becomes progressively easier;
- workflow friction decreases.

The objective is not to appear intelligent.

The objective is to become progressively less wrong together.


<!-- rationale.md -->

# rationale.md

> This document explains the reasoning behind the collaboration protocol.
>
> **protocol.md** defines *how* we collaborate.
> **rationale.md** explains *why* the protocol is structured the way it is.
>
> The protocol should evolve from observed behaviour rather than design intuition.
> This document preserves that reasoning.

---

# Design Philosophy

The protocol is intended to improve collaboration rather than constrain it.

It should define principles instead of procedures.

Whenever possible, a better abstraction should replace several special-case rules.

The protocol should become simpler as understanding improves.

---

# Ultimate Objective

A successful collaboration does not merely converge on correct answers.

It progressively aligns the participants' mental models, making future collaboration both more accurate and more efficient.

The protocol therefore aims not only to improve individual answers, but also to improve the quality of future collaboration.

---

# Fundamental Principles

## Preserve information rather than compress it

Premature compression loses distinctions that often become important later.

Examples include:

- uncertainty
- competing hypotheses
- project scope
- historical reasoning
- domain-specific context

Compression should occur only after sufficient evidence exists.

---

## Externalize state

Long-running projects should not depend on conversational memory alone.

Accepted knowledge, collaboration methodology and research history should exist as independent artefacts.

The protocol encourages explicit state rather than reconstruction.

---

## Standardize intent rather than behaviour

The protocol should describe the properties of good collaboration.

Different language models may legitimately implement those properties differently.

Interoperability should arise from shared intent rather than identical execution.

---

## Shared context is more valuable than isolated facts

Clarification is not only a mechanism for obtaining missing information.

It is also a way to establish shared context.

When useful, distinguish between missing:

- factual context
- conceptual context
- cultural context

Understanding the user's context often improves future collaboration more than answering the immediate question.

Stories frequently transmit context more effectively than isolated facts.

---

## Separate responsibilities

Assign each responsibility to the component best suited for it.

Examples:

- Language model
  - reasoning
  - synthesis
  - explanation
  - hypothesis generation

- Project-State
  - accepted knowledge

- Session-Log
  - historical reasoning

- Protocol
  - collaboration methodology

- Git
  - history
  - provenance
  - releases

- Agent
  - time
  - monitoring
  - scheduling
  - long-term continuity

Components should complement each other rather than duplicate responsibilities.

---

# Design Decisions

## Why three project artefacts?

Methodology, accepted knowledge and research history evolve at different rates.

Therefore they should remain separate.

protocol.md

: Collaboration methodology.

project-state.md

: Current accepted understanding.

session-log.md

: Chronological research history.

This separation reduces reconstruction errors and improves continuity.

---

## Why maintain consistency between Project State and Session Log?

The two artefacts intentionally serve different purposes, but they are expected to remain conceptually consistent.

Project State records the project's current accepted understanding.

Session Log records the observations, experiments, hypotheses, decisions and discarded ideas that led to that understanding.

The relationship is therefore complementary rather than redundant.

Project State answers:

> What do we currently believe?

Session Log answers:

> Why do we currently believe it?

The Session Log is not authoritative over the Project State.

However, the Project State should normally be explainable from the evidence preserved in the Session Log.

Consequently, inconsistencies between the two artefacts are often valuable diagnostic signals rather than problems to be silently corrected.

They may indicate:

- missing maintenance;
- incomplete project history;
- mixed project artefacts;
- accidental loss of provenance;
- or conclusions that were promoted without sufficient supporting evidence.

When such inconsistencies are discovered, they should generally prompt investigation rather than automatic reconciliation.

---

## Why Git?

Git already provides:

- history
- provenance
- branching
- release tagging

The protocol should integrate with those capabilities rather than duplicate them.

---

## Why explicit uncertainty?

Confidence is not a single dimension.

Useful uncertainty includes:

- evidence strength
- source reliability
- competing explanations
- model maturity
- fragility
- recommended next action

Representing uncertainty explicitly leads to better reasoning than reducing everything to a single confidence value.

---

## Why collaboration operations?

Experience showed that several apparently similar requests are actually different operations.

Bootstrap

: Create initial project artefacts.

Maintenance

: Incrementally update existing artefacts.

Handover

: Continue work in a different conversation.

Reconstruction

: Recover project artefacts from historical material.

Recognizing the operation reduces ambiguity.

---

## Why artefact identity?

Maintenance should preserve identity.

Updating `project-state.md` is different from creating `project-state-search.md`.

Identity belongs to the project rather than today's topic.

---

## Why workflow matters

Many technically correct behaviours exist.

The preferred behaviour is generally the one that minimizes unnecessary work for the collaborator.

Correctness and usability are complementary goals.

---

## Why not simulate missing capabilities?

A language model should reason from reliable information supplied by the surrounding architecture rather than simulate capabilities that other components can provide more accurately.

Examples:

- clocks provide current time;
- monitoring systems provide history and anomalies;
- version control provides evolution;
- project artefacts provide accepted state;
- agents provide continuity.

The language model's role is to integrate those sources into coherent reasoning.

---

# Protocol Evolution

The protocol should evolve through observation.

New rules should preferably emerge from:

- observed failures;
- successful experiments;
- repeated patterns;
- reduced workflow friction.

Whenever possible, improve abstractions instead of accumulating special-case rules.

---

# Future Directions

The following ideas have emerged but intentionally remain outside the protocol until supported by further experience.

- agent notebooks
- automated maintenance suggestions
- protocol regression tests
- project health metrics
- temporal project analytics
- collaborative state beyond project state

These ideas should mature through practical use before becoming part of the protocol.

---

# Closing Principle

The protocol should not compensate for the weaknesses of a particular language model.

It should improve collaboration between humans and language models regardless of future model capabilities.

The measure of success is therefore not whether an individual answer is better.

The measure of success is whether the collaboration itself becomes progressively more effective over time.


<!-- projects/common/collaboration-state.md -->

# Collaboration (common/collaboration-state.md)

## Purpose

Restore the collaboration model.

-   Shared Reasoning optimizes collaboration rather than prompts.
-   Distinguish methodology from project knowledge.
-   Evidence precedes inference.
-   Preserve working models until verified.
-   Prefer the smallest discriminating experiment.
-   Separate accepted knowledge from historical reasoning.
-   Improve abstractions before adding rules.
-   Ask for missing context rather than silently inventing it.

The objective is rapid reconstruction of productive collaboration rather
than explanation of the methodology.

---



<!-- projects/common/inference-policy.md -->

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



<!-- projects/common/knowledge-architecture.md -->

# Knowledge Representation (common/knowledge-arhitecture.md)

## Purpose

Restore the project knowledge architecture.

-   Protocol defines collaboration.
-   Rationale explains design intent.
-   Project-State contains accepted knowledge.
-   Session-Log preserves historical reasoning.
-   Domain knowledge capsules restore conceptual models.
-   Human documentation and reasoning capsules have different
    optimization goals.
-   Serialization preserves artefact identity while enabling transport.
-   Do not silently promote history or TODO items into accepted
    knowledge.


<!-- projects/common/reasoning-contraints.md -->

# Reasoning Constraints (common/reasoning-constraints.md)

## Purpose

Constrain inference where observed failures show that plausible reasoning
can outrun accepted knowledge.

- A correct structural model does not establish exact local semantics.
- Executable examples require verified semantics for every operation whose
  precise behaviour affects correctness.
- Do not replace uncertain local semantics with plausible approximations.
- Separate verified structure from candidate implementation.
- Preserve competing interpretations when evidence does not discriminate.
- Prefer the smallest discriminating experiment.
- Add constraints in response to observed failure classes rather than
  anticipated possibilities.
- Prefer one general constraint over many incident-specific prohibitions.

---



<!-- projects/shared-reasoning/state/project-state.md -->

# project-state.md

## Scope

Development and evaluation of the **Shared Reasoning** methodology as a general collaboration framework for long-running investigations between humans and LLMs.

This project focuses on the methodology itself rather than any individual research domain.

---

## Current Objective

Evaluate whether a lightweight protocol can improve the quality, continuity and trustworthiness of collaborative reasoning.

---

## Verified Conclusions

### Shared Reasoning is broader than a prompt

The project has evolved from a prompt into a collaboration methodology consisting of interacting artefacts:

* protocol.md
* rationale.md
* project-state.md
* session-log.md

The protocol alone is insufficient; the artefacts collectively establish collaboration.

---

### Separation of responsibilities is beneficial

The repository naturally separates into:

* repository-level methodology
* project-level investigations

Repository artefacts describe *how collaboration works*.

Project artefacts describe *what has been learned*.

---

### Evidence-first collaboration

Repeated use demonstrated value in distinguishing:

* observation
* documentation
* inference
* hypothesis
* verified conclusion

This discipline prevented several scope and reconstruction errors.

---

### Maintenance differs from handover

Maintenance updates existing artefacts while preserving identity.

Handover transfers collaboration between conversations using those maintained artefacts.

---

### Repository philosophy

The repository should remain intentionally lightweight.

Additional structure should be introduced only when supported by practical experience.

---

## Working Model

Shared Reasoning is best viewed as a methodology for preserving and evolving shared understanding across long-running collaborations.

The protocol establishes reasoning discipline.

Project State captures accepted knowledge.

Session Log preserves chronological reasoning.

RATIONALE records design intent.

---

## Evidence Strength

Current evidence:

* repeated successful use during TECO and MACRO-20 investigations;
* successful transfer between conversations using Project State and Session Log;
* positive initial external feedback.

Evidence remains limited by small sample size and early adopters.

---

## Open Questions

* Which parts of the methodology generalize across domains?
* Which artefacts, if any, should emerge only in specific projects?
* How should abstraction-level changes be handled explicitly during long conversations?
* How should retrieval-tool limitations best be represented within collaborative reasoning?

---

## Next Evaluation Goals

* Gather independent field reports.
* Observe adaptations in other technical domains.
* Identify recurring friction before modifying the protocol.
* Allow repository evolution to be driven by evidence rather than anticipation.

---


<!-- projects/shared-reasoning/state/session-log.md -->

# session-log.md

## Session Purpose

Evaluate and refine the Shared Reasoning methodology through practical use while preparing it for public release.

---

## Chronology

### Repository identity

Reviewed the public presentation of the project.

Concluded that the methodology had evolved beyond a prompt collection into a collaboration framework.

Repository identity shifted toward "Shared Reasoning."

---

### README review

Reworked the repository introduction to emphasize:

* collaboration rather than prompting;
* shared reasoning rather than individual answers;
* evidence-driven evolution.

Established the central statement:

> The goal is not better prompts. The goal is better collaboration.

---

### Repository architecture

Clarified separation between:

* methodology;
* project investigations.

Confirmed that projects remain living investigations rather than examples.

---

### Contribution philosophy

Reduced repository process substantially.

Adopted the principle that protocol evolution should follow observed experience rather than anticipated needs.

---

### Tooling observations

Repeated attempts to review the repository through web retrieval exposed limitations of retrieval tooling.

Rather than treating this as an isolated failure, the discussion distinguished:

* retrieval;
* evidence;
* reasoning.

This reinforced the protocol's emphasis on evidence before inference.

---

### Reflection

Compared early collaboration with the current collaboration.

Observed that reasoning increasingly challenged:

* evidence quality;
* scope;
* abstraction level;
* retrieval success.

Rather than merely challenging conclusions.

---

### Current state

Repository considered sufficiently coherent for initial public release.

Future protocol evolution should be driven by external experience rather than further speculative refinement.

---



<!-- projects/shared-reasoning/state/TODO.md -->

# TODO.md

This document collects observations, ideas and potential improvements that have emerged during practical use of Shared Reasoning.

Items recorded here are intentionally **not** part of the accepted methodology.

They are preserved so they can mature through repeated observation before being considered for promotion into:

- protocol.md
- rationale.md
- project-state.md

Most items are expected to remain here until multiple independent observations support the same abstraction.

The objective is to improve the methodology through evidence rather than anticipation.

---

# Potential changes to protocol.md

- Long-running collaborations should periodically re-establish the current abstraction level when rapidly switching between implementation, methodology, and philosophy.

- During long collaborations, restarting after a maintenance point reduces accidental mixing of implementation, methodology, and philosophical discussion while preserving accepted knowledge through the project artefacts.

# Potential changes to rationale.md

- The protocol is not primarily about overcoming context limits. It is about preserving conceptual integrity as a project evolves.

# Potential evolution

- Investigate whether Shared Reasoning should explicitly support transitions between collaboration phases.

  Current experience suggests the methodology provides the greatest value during periods of high uncertainty (discovery, investigation, requirements, reverse engineering, hypothesis formation).

  Once the project's conceptual model stabilizes, it may be beneficial to generate a lightweight handover prompt optimized for execution-oriented work (implementation, coding, optimization, routine engineering).

  The objective would not be to replace Shared Reasoning, but to allow the collaboration style to adapt as uncertainty decreases.

  Evidence needed:
  - Does this transition occur consistently across different domains?
  - Which information should be preserved in such a handover?
  - Can the transition be recognized automatically from project state?


<!-- projects/shared-reasoning/domain/collaboration.md -->

# Collaboration

## Purpose

Restore the collaboration model.

-   Shared Reasoning optimizes collaboration rather than prompts.
-   Distinguish methodology from project knowledge.
-   Evidence precedes inference.
-   Preserve working models until verified.
-   Prefer the smallest discriminating experiment.
-   Separate accepted knowledge from historical reasoning.
-   Improve abstractions before adding rules.
-   Ask for missing context rather than silently inventing it.

The objective is rapid reconstruction of productive collaboration rather
than explanation of the methodology.

---



<!-- projects/shared-reasoning/domain/knowledge-representation.md -->

# Knowledge Representation

## Purpose

Restore the project knowledge architecture.

-   Protocol defines collaboration.
-   Rationale explains design intent.
-   Project-State contains accepted knowledge.
-   Session-Log preserves historical reasoning.
-   Domain knowledge capsules restore conceptual models.
-   Human documentation and reasoning capsules have different
    optimization goals.
-   Serialization preserves artefact identity while enabling transport.
-   Do not silently promote history or TODO items into accepted
    knowledge.

---



<!-- projects/shared-reasoning/domain/reasoning-state.md -->

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



