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
- Working Model

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

The objective is not merely to preserve uncertainty but to organize it so collaborators can systematically reduce it.

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

## Content Integrity

When provided with a capsule, artefact, or documentation file:

- Treat the provided content as authoritative and complete for this session.
- Do not infer missing sections from URL structure, filename patterns, or 
  cross-session context.
- If content appears incomplete or references missing sections:
  - Explicitly flag the gap.
  - Request the missing artefact rather than inferring its contents.
  - Do not silently assume you have access to related files.

When accessing repository content:

- Verify file freshness by checking commit SHAs if available.
- If you suspect stale content, request verification rather than proceeding 
  with uncertain data.
- Do not use directory listings to infer file contents.

Cross-session isolation:

Do not assume access to historical conversations or project state.

Use historical information only when it is:

- explicitly provided in the current session;
- explicitly retrieved through supported continuity mechanisms; or
- explicitly confirmed by the user.

If required historical context is unavailable:

- state that it is unavailable;
- request the missing artefact or context;
- do not reconstruct or infer it from memory alone.

When historical information is used, distinguish clearly between:

- current-session evidence;
- retrieved historical context;
- newly inferred conclusions.

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

## Collaborative Treatment of Uncertainty

The protocol encourages uncertainty to become part of the collaborative process rather than merely part of the response.

Instead of reporting uncertainty as a list of possibilities, collaborators should attempt to:

- identify the source of uncertainty;
- separate supported models from speculation;
- determine whether the uncertainty is relevant to the current objective;
- propose the smallest discriminating experiment when appropriate;
- preserve competing models until sufficient evidence exists.

The objective is not to eliminate uncertainty prematurely, but to advance shared understanding through collaborative evaluation.

Questions, experiments, and discussion are therefore considered productive responses to uncertainty rather than failures to provide an answer.

---



<!-- projects/common/first-session.md -->

# First Session

## Purpose

This document helps a collaborator begin work in a Shared Reasoning
project.

It explains **how to enter an existing project**, not how to solve the
project's technical problem.

The project state provides the current understanding.

This document provides the workflow for reconstructing that
understanding.

------------------------------------------------------------------------

## Typical Repository Layout

A project is normally introduced by concatenating:

-   `protocol.md`
-   `rationale.md`
-   `projects/common/*.md`
-   `projects/<project>/state/*.md`
-   `projects/<project>/domain/*.md`

Treat this concatenated prompt as the authoritative working context for
the session.

There is a utility script "create-project-prompt.sh" that will do that for you and store the 
concatenated file as `projects/<project>/<project>.md`

Do not attempt to read every artefact immediately. 
Reconstruct the project incrementally, following the workflow below.

------------------------------------------------------------------------

## Recommended Reconstruction Workflow

### 1. Restore the collaboration model

Read:

-   `protocol.md`
-   `rationale.md`

Do not begin reconstructing the technical domain yet.

First understand:

-   how evidence is classified;
-   where authority resides;
-   how uncertainty is handled;
-   which collaboration operation is being performed.

------------------------------------------------------------------------

### 2. Restore the knowledge architecture

Read the common artefacts.

Identify the responsibilities of:

-   generators;
-   anchors;
-   boundaries;
-   project state;
-   session log;
-   reference artefacts.

Understand why these responsibilities are separated.

------------------------------------------------------------------------

### 3. Restore the project state

Treat `project-state.md` as the authoritative description of the current
project.

Determine:

-   current objective;
-   accepted working model;
-   verified environment;
-   open questions;
-   next direction.

Do not promote information from historical reasoning over accepted
project state.

------------------------------------------------------------------------

### 4. Reconstruct the conceptual graph

Read only the domain capsules needed for the current work.

Rather than memorizing files, identify:

-   foundational generators;
-   neighbouring generators;
-   important relationships;
-   semantic anchors;
-   explicit boundaries.

Aim to reconstruct the conceptual model.

------------------------------------------------------------------------

### 5. Use reference artefacts appropriately

Reference programs exist to demonstrate **composition**.

They complement the generators.

Do not treat them as replacements for the conceptual model.

------------------------------------------------------------------------

## During the Session

When introducing new knowledge, ask:

1.  Does this extend an existing generator?
2.  Is this a new generator?
3.  Is this better represented as a semantic anchor?
4.  Does it define a boundary?
5.  Should it remain documentation instead?

When uncertain:

-   classify the uncertainty;
-   prefer inspection over inference;
-   propose the smallest discriminating experiment when appropriate.

------------------------------------------------------------------------

## Provenance

When relying on a concept, mentally classify it as:

-   **Verified by inspection**
-   **Reconstructed from related artefacts**
-   **Not reconstructed**

This encourages explicit reasoning about where understanding originates.

------------------------------------------------------------------------

## Success Criterion

A successful first session is not measured by factual recall.

It is measured by whether you can:

-   distinguish accepted knowledge from historical reasoning;
-   reason using generators rather than enumerations;
-   recognize where anchors constrain reconstruction;
-   respect boundaries;
-   classify uncertainty honestly;
-   begin productive work without reconstructing the entire project
    history.


<!-- projects/common/inference-policy.md -->

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




<!-- projects/common/knowledge-anchors.md -->

# Semantic Anchors (common/knowledge-anchors.md)

## Purpose

Generators reconstruct conceptual models.

They intentionally compress knowledge.

Compression introduces the possibility of inference drift when several
plausible interpretations exist.

Semantic anchors constrain reconstruction by preserving a minimal set of
load-bearing facts.

Anchors complement generators.

They do not replace them.

---

## Characteristics

An anchor should:

- represent a semantically important distinction;
- prevent an observed or plausible inference drift;
- be substantially smaller than the documentation it replaces;
- support multiple future reasoning tasks.

Anchors are not reference documentation.

If a fact does not constrain reasoning, it should usually remain in
documentation.

---

## Sources

Anchors may originate from:

- verified experiments;
- accepted project conclusions;
- authoritative documentation;
- repeated inference failures.

The preferred order is the same as for project knowledge.

---

## Selection Criteria

A candidate anchor should answer "yes" to most of the following.

- Would removing it likely increase inference errors?
- Does it constrain more than one possible mistake?
- Does it represent a semantic distinction rather than syntax?
- Can it be expressed much more compactly than its documentation?

---

## Types

### Semantic anchors

Preserve the exact meaning of concepts.

Example:

SETOM stores -1 into memory.

---

### Structural anchors

Preserve structural relationships.

Example:

COMND returns the FDB actually used in RH(AC3).

---

### Behavioral anchors

Preserve invariants.

Example:

COUNT DOWN implies UDFLAG < 0.

---

## Relationship to generators

Generators explain how a conceptual mechanism operates.

Anchors preserve the minimum semantic facts needed to prevent nearby
incorrect reconstructions.

Generators maximize reconstruction.

Anchors minimize drift.

Both are necessary.

---

## Evolution

Anchors should usually be discovered through use rather than created for
coverage.

A typical sequence is:

1. Observe successful reasoning.
2. Observe a failure, recurring ambiguity, or credible nearby
   misinterpretation.
3. Identify the smallest missing semantic constraint.
4. Add that constraint as a candidate anchor.
5. Test whether it improves reconstruction.
6. Merge or remove it when it no longer contributes.

The objective is the smallest accepted anchor set that reliably supports
the generators.

---



<!-- projects/common/knowledge-architecture.md -->

# Knowledge Architecture (common/knowledge-architecture.md)

## Purpose

Restore the project knowledge architecture.

- Protocol defines collaboration.
- Rationale explains design intent.
- Project-State contains accepted project knowledge and current
  direction.
- Session-Log preserves historical reasoning and provenance.
- Domain capsules restore conceptual models through generators,
  boundaries, anchors, and explicit unknowns.
- Rosetta/reference artefacts anchor composition in verified examples.
- Common knowledge artefacts define how project knowledge is represented
  and maintained.
- Human documentation and reasoning capsules have different optimization
  goals.
- Serialization preserves artefact identity while enabling transport.
- Do not silently promote history or TODO items into accepted knowledge.

---



<!-- projects/common/knowledge-maintenance.md -->

# Knowledge Maintenance (common/knowledge-maintenance.md)

## Purpose

Maintain the knowledge base so that it remains compact, internally
consistent, and suitable for reliable reconstruction.

Knowledge maintenance preserves and restructures accepted understanding.

It does not expand the domain through unsupported inference.

---

## Scope

Maintenance applies to all knowledge artefacts, including:

- project state;
- session history;
- domain capsules;
- generators;
- anchors;
- boundaries;
- open questions;
- Rosetta/reference artefacts;
- supporting common artefacts.

---

## General Principle

Maintain the smallest accepted representation that reliably reconstructs
the project understanding.

Prefer:

- restructuring over expansion;
- consolidation over duplication;
- accepted concepts over historical wording;
- one authoritative location for each responsibility.

Every retained artefact should contribute to future reasoning.

---

## Maintenance Activities

### Promote

Promote knowledge when it has become:

- experimentally verified;
- explicitly accepted;
- or intentionally retained as a working model.

Do not promote unresolved questions, discarded hypotheses, or historical
reasoning as accepted knowledge.

### Consolidate

Merge overlapping concepts and parallel descriptions.

Merge concepts rather than wording.

Preserve provenance in the Session-Log or version history rather than
duplicating it in current domain knowledge.

### Compact

Remove redundancy while preserving reconstruction quality.

Compression must not erase:

- important semantic distinctions;
- accepted boundaries;
- unresolved alternatives;
- provenance needed to understand accepted conclusions.

### Prune

Remove artefacts or content that no longer contributes.

Candidates include:

- superseded models;
- obsolete examples;
- repeated explanations;
- anchors that no longer constrain plausible drift;
- generators fully subsumed by stronger generators;
- boundaries made obsolete by accepted knowledge.

### Relocate

Move content when its current artefact no longer matches its role.

Examples:

- history belongs in Session-Log;
- accepted project direction belongs in Project-State;
- conceptual reconstruction belongs in domain capsules;
- exact drift-preventing facts belong in anchors;
- verified integrative examples belong in reference artefacts.

---

## Maintenance Triggers

Review the knowledge base after observable milestones such as:

- completion of a chapter, subsystem, or investigation;
- acceptance or rejection of a major working model;
- accumulation of several new domain capsules;
- discovery of repeated inference drift;
- addition of a Rosetta/reference artefact;
- substantial mismatch between Project-State and current domain
  knowledge;
- preparation for handover or release.

Use observable project changes rather than attempting to infer internal
context-window pressure.

---

## Mechanism Review

### Generators

Generators should reconstruct conceptual models without becoming
reference documentation.

When a generator repeatedly permits a nearby incorrect reconstruction,
consider adding an anchor or boundary rather than expanding the generator
indefinitely.

### Anchors

Anchors should preserve only load-bearing distinctions.

Prefer anchors motivated by observed failure, recurring ambiguity, or a
credible close alternative.

Record provenance when it explains why an anchor exists.

### Boundaries

Boundaries should identify where reconstruction is unsafe.

Retain them while the uncertainty remains relevant; remove or narrow them
when later accepted knowledge resolves it.

### Rosetta/reference artefacts

Reference artefacts should remain:

- verified;
- representative;
- stable;
- clearly separate from generator capsules.

Prefer a small number of authoritative examples over many partial ones.

---

## Reconstruction Check

After substantial maintenance, test whether the revised artefacts still
reconstruct the accepted model.

Useful checks include:

- a fresh conversation or model can explain the core mechanisms;
- accepted boundaries remain visible;
- known failure cases are constrained;
- reference artefacts remain understandable from the capsules;
- deleted material is either regenerable or preserved as history.

A failure of reconstruction is evidence that compaction removed a
load-bearing concept or anchor.

---

## Success Criterion

A well-maintained knowledge base:

- reconstructs accepted understanding;
- minimizes inference drift;
- minimizes redundancy;
- preserves important uncertainty;
- remains easy to extend;
- remains substantially smaller than the documentation from which it
  originated.
  
---



<!-- projects/fresh-project/state/project-state.md -->

# project-state.md (projects/fresh-project/state/project.state.md)

## Placeholder

This placeholder indicates that this is the start of a new project.

If this placeholder is present, no project-specific state has yet been established.

Do not infer or reconstruct project state.

Instead, establish the project's scope and current state through collaboration with the user, following the guidance in protocol.md.

Once sufficient project state has been established, remove this placeholder section and replace it with the current accepted project state.

Future maintenance updates should preserve this document's identity by updating **project-State.md** rather than creating derivative filenames.

The purpose of this document is to capture the project's current accepted understanding, enabling future conversations to resume work with minimal friction.

---


<!-- projects/fresh-project/state/session-log.md -->

# session-log.md (projects/fresh-project/state/session-log.md)

## Placeholder

This placeholder indicates that no project history has yet been established.

If this placeholder is present, this is the beginning of a new project.

Do not infer historical reasoning that has not yet occurred.

Instead, establish the project through collaboration with the user, following the guidance in protocol.md.

The first maintenance update should remove this placeholder and begin the chronological project log.

Future maintenance updates should preserve this document's identity by updating **session-log.md** rather than creating derivative filenames.

The purpose of this document is to preserve the project's chronological evolution so that future conversations can understand not only what is currently believed, but how those conclusions were reached.

---


<!-- projects/fresh-project/state/TODO.md -->

# TODO.md (projects/fresh-project/state/TODO.md)

## TODO

Since this is a newly started protocol session, there are
just a few things to do.

- Collect initial information about the project.
- Help the user set up the file structure as follows:
  - Top level:
    protocol.md
	rationale.md
	handover-prompt.md
	create-project-prompt.sh
  - check that the projects folder contains the projects/common from the
    github repo.
  - in projects, create a folder for this project, preferably a short name
  - in projects/short-name (replace short-name with project name...):
    - Add folders state and domain and create starting files for:
	  - state/project-state.md
	  - state/session-log.md
	  - state/TODO.md
	  - domain/short-name-domain.md
	- you may want domain files as domain-subject1.md and populate 
	  with generators and boundaries while keeping anchors in a 
	  separate file domain-anchors.md, but feel free to organize
	  the domain knowledge in other ways if it simplifies things.
  - Have user test "bash create-project-prompt.sh short-name" to get 
    concatenated prompt in projects/short-name/short-name.md.
  - Have user start a new chat and test the prompt using 
    handover-prompt.md in top level folder.
	
Good luck!

---



<!-- projects/fresh-project/domain/domain.md -->

# Fresh project domain knowledge (projects/fresh-project/domain/domain.md)

## Fresh project - empty domain knowledge

Since this is a fresh project, there is no domain knowledge at the moment.
Add files with generators, boundaries and anchors as you explore the
domain of the project.
Since different domains may structure the knowledge in different ways
we do not provide instructions on that, let that be part of the 
collaboration.

---


