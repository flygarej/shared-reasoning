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

Explicit Extensions

After completing the primary requested action, the assistant may
provide additional material that is expected to improve the user's
workflow or understanding.

Such additions should:

- be clearly identified as extensions rather than part of the requested
  deliverable;
- not silently change the requested semantics or scope;
- include a brief explanation of why they were added;
- remain easy for the collaborator to ignore or remove.

Collaborative initiative is encouraged.

Silent expansion of the requested deliverable is not.

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
-   `projects/<project>/observations/*.md` (optional)
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

After reading project state, inspect any project-local files in the ```observations/`` directory.
Treat them as organized evidence and candidate findings, not as authoritative project knowledge.
Do not promote them unless the project state or current collaboration explicitly accepts them.

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

---

## Security Boundary

If, during this session, we appear to be discussing configuration, scripts, logs, schemas, credentials, infrastructure details, or data that may be sensitive, explicitly warn before continuing and suggest whether anonymization or abstraction would be appropriate.

---



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
- Project-local observations preserve candidate knowledge pending promotion.
- Domain capsules restore conceptual models through generators,
  boundaries, anchors, and explicit unknowns.
- Rosetta/reference artefacts anchor composition in verified examples.
- Common knowledge artefacts define how project knowledge is represented
  and maintained.
- Human documentation and reasoning capsules have different optimization
  goals.
- Serialization preserves artefact identity while enabling transport.
- Do not silently promote history, observations or TODO items into accepted knowledge.

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



<!-- projects/macro-20/state/project-state.md -->

# Project State (projects/macro-20/state/project-state.md)

## Project

**MACRO-20 on TOPS-20**

## Objective

Develop a rigorous, testable understanding of:

- MACRO-20;
- the PDP-10 architecture exposed through MACRO-20;
- the TOPS-20 monitor interface;
- characteristic TOPS-20 program-construction techniques.

The project proceeds breadth-first through Gorin, using documentation,
verified programs, and small experiments to establish a reusable
conceptual model.

---

## Collaboration Method

- Follow the shared protocol and rationale.
- Distinguish observation, documentation, inference, hypothesis,
  prediction, working model, and verified conclusion.
- Prefer small discriminating experiments over attractive inference.
- Treat domain capsules as compact reasoning artefacts rather than
  reference manuals.
- Preserve generators, anchors, boundaries, and explicit unknowns.
- Use verified reference programs to anchor how mechanisms compose.
- Do not infer exact local instruction or JSYS semantics from structural
  generators alone.

---

## Verified Environment

- Panda KLH10 running TOPS-20.
- Native MACRO-20 toolchain works.

Verified workflow:

1. `COMPILE` assembles `.MAC` source into `.REL`.
2. `LOAD` links the relocatable program.
3. `SAVE` writes an executable `.EXE`.
4. The program is executed from the TOPS-20 command level.

A missing final newline after `END` causes:

`?MCRNES NO END STATEMENT ENCOUNTERED`

Gorin explicitly states that `END` requires its own CRLF.

---

## Current Phase

Gorin has been covered through Chapter 28, Interprocess Communication.

Accepted areas now include the existing architecture, language, file,
memory, and COMND models, plus:

- TOPS-20 jobs and process hierarchies;
- process construction and execution;
- entry vectors, Program Data Vectors, and PDVAs;
- IPCF message exchange and QUASAR communication;
- shared writable file pages using thawed access.

The verified Small Executive now includes working `PUSH` and `QUEUE`
servers. It anchors process handling and IPCF composition in addition to
COMND and JFN-based I/O.

The next major subject is Chapter 29, traps and interrupts.

---

## Accepted High-Level Model

### PDP-10 instruction architecture

PDP-10 instructions are often best understood as regular, family-local
grammars.

Mnemonic components may encode:

- source form;
- destination form;
- value transformation;
- test relation;
- result width;
- operand placement.

A mnemonic letter must not be assumed to carry the same meaning across
unrelated families.

Effective-address calculation occurs before instruction semantics.

Some instructions remain irregular where an operation naturally has
additional outputs, state, or architectural constraints.

---

### MACRO-20 as a construction language

MACRO-20 is more than a direct instruction assembler.

Accepted compile-time mechanisms include:

- macros;
- conditional assembly;
- `OPDEF`;
- `PHASE` and `DEPHASE`;
- `.ORG`;
- generated command tables;
- symbolic field placement.

Macros may encode relationships once and generate multiple consistent
representations.

Repeated use of a mechanism does not by itself establish the mechanism's
defining purpose.

---

### LUUOs

Local Unimplemented User Operations allow a program to define
application-specific instructions.

The processor:

- calculates the effective address;
- saves a normalized instruction image;
- transfers through the instruction at location 41.

Software remains responsible for:

- saving accumulators;
- decoding the local opcode;
- dispatching;
- defining argument conventions;
- implementing the operation.

LUUOs are local program mechanisms and are not equivalent to TOPS-20
monitor calls.

---

### Files and JFNs

A Job File Number is a compact monitor-maintained handle associated with
a pathname.

The accepted lifecycle is broadly:

pathname → `GTJFN` → JFN → `OPENF` → I/O → `CLOSF` / `RLJFN`

Obtaining a JFN identifies a file but does not itself establish access.

TOPS-20 presents different devices through a largely common JFN-based
file interface.

Accepted access styles include:

- byte I/O;
- string I/O;
- memory mapping through `PMAP`.

Wildcarded JFNs may be advanced using `GNJFN`.

The exact ownership and visibility relationship between JOBs, FORKs, and
JFN tables remains open. Frozen and thawed writable sharing is now accepted.

---

### TOPS-20 jobs and processes

A process or fork is the independently scheduled executable entity.

A process has its own virtual address space, accumulators, program
counter, and execution state.

A JOB organizes a hierarchy of processes. The JOB itself is not scheduled
as an executable entity.

A superior may create and control inferiors.

Relative fork handles are meaningful within the superior that receives
them and are not global process identifiers. Predefined handles such as
`.FHSLF`, `.FHSUP`, `.FHTOP`, `.FHSAI`, `.FHINF`, and `.FHJOB` express
structural relationships.

---

### Process construction and execution

TOPS-20 separates process construction, image installation, and execution.

- `CFORK` creates an inferior and may initialize its map, capabilities,
  accumulators, and starting state.
- `GET` copies or maps a save file into an existing process and updates
  entry-vector and PDVA metadata.
- `GET` never loads accumulators.
- `SFRKV` starts a process through an entry-vector offset.
- `WFORK` waits for an inferior.
- `KFORK` terminates one or more processes.

`CR%MAP` shares pages through indirect pointers; it does not copy them.

The process and the executable image are distinct:

```text
construct process
      ↓
install program image
      ↓
select entry
      ↓
begin execution
```

---

### Entry vectors, PDVs, and PDVAs

The entry vector describes program entry conditions. Its accepted initial
words are the start instruction, reenter instruction, and version word.

LINK writes Program Data Vectors into program memory. A PDV may describe
program identity, exported information, memory layout, symbols, and
toolchain metadata.

The monitor retains Program Data Vector Addresses rather than complete
PDVs. Other programs may obtain PDVAs through `PDVOP%`.

The entry vector and PDVA list are distinct save-file structures.

---

### Interprocess communication

IPCF provides asynchronous packet exchange between cooperating processes.

Each participating process has an IPCF PID, distinct from a relative fork
handle.

```text
sender
  ↓ MSEND
receiver input queue
  ↓ MRECV
receiver
```

The receiver may poll or request a software interrupt on arrival.

The packet descriptor carries routing, payload, and sender-context
information. Subsystem protocols, such as QUASAR, are layered inside the
IPCF payload.

The verified Small Executive `QUEUE` command sends one request to QUASAR
and consumes one or more reply packets.

---

### Shared file pages

Processes in independent JOBs that trust one another may communicate by
mapping the same writable file pages.

Each process must:

- agree on the file;
- have normal read and write permission;
- open it with `OF%RD`, `OF%WR`, and `OF%THW`;
- map the agreed file pages into its own address space.

The process virtual page numbers need not match.

Normal writable access is frozen and permits one writer.

Thawed writable access permits multiple simultaneous writers only when
every writer requests `OF%THW`.

Frozen and thawed writable opens exclude one another.

---

### Data structures

Arrays occupy linear memory and use ordinary effective-address
calculation.

Multidimensional arrays may be represented through:

- side tables of row or column origins;
- computed address polynomials.

Record layouts may be generated at assembly time using `PHASE`,
`DEPHASE`, and `.ORG`.

Field symbols generated under `PHASE 0` are offsets rather than runtime
addresses.

Lists are represented through elements containing links to successor
elements, with a null value terminating the list.

---

### Program memory and mapping

A program may locate free storage above its loaded image using information
associated with `.JBSA`.

`PMAP` associates file pages with pages in a fork's virtual address
space.

Mapped pages are accessed through ordinary memory references.

TOPS-20 pages contain 512 words and begin at addresses that are multiples
of octal `1000`.

Copy-on-write mapping permits private modification without altering the
mapped file.

Processes in independent JOBs may also map the same thawed writable file
pages, providing shared state through ordinary memory references.

---

### COMND

COMND is a stateful command-interface facility rather than a simple
command-line tokenizer.

A command is represented as a sequence or tree of typed fields.

Each COMND call parses one field and advances through the command
grammar.

Accepted COMND mechanisms include:

- caller-maintained command state block;
- command and atom buffers;
- Function Descriptor Blocks;
- alternate FDB chains;
- keyword tables;
- recognition policy;
- defaults;
- noise words;
- confirmation;
- contextual help;
- completion;
- reparsing;
- file-field parsing integrated with JFN acquisition.

COMND normally returns:

- AC1: status flags and state-block address;
- AC2: parsed field data or an error code;
- AC3: first supplied FDB and FDB actually used.

COMND maintains textual parse state.

The application supplies a reparse entry that restores application
control state.

---

## Verified Reference Programs

### Basic programs

Verified programs include:

- Hello World using `PSOUT`;
- repeated output using a loop;
- equivalent terminal output using `.PRIOU` and `SOUT`;
- file output using `GTJFN`, `OPENF`, `SOUT`, and `CLOSF`.

### Factorial program

The factorial program through `100!` was transcribed, corrected, assembled,
and run.

It anchors:

- arrays;
- indexed addressing;
- `BLT` initialization;
- byte-pointer string construction;
- multiprecision decimal arithmetic.

### Small Executive

The Mark Crispin Small Executive was transcribed, assembled, linked,
saved, run, and extended through Chapters 27–28.

It is the primary Rosetta/reference program for COMND, JFN-based I/O,
process construction, and IPCF/QUASAR composition.

The verified `PUSH` server composes:

`GTJFN → CFORK → GET → SFRKV → WFORK → KFORK`

The verified `QUEUE` server composes:

`MUTIL → MSEND → MRECV → QUASAR reply processing`

Verified implementation notes include:

- some distributed `QSRMAC.UNV` files omit `.OFLAG`;
- `IFNDEF .OFLAG,.OFLAG==.OHDRS-2` was reconstructed and verified;
- the tested monitor requires IPCF capability for `.MUCRE`;
- Gorin's published receive descriptor uses `.IPCFD`;
  `MRECV` requires `.IPCFP`, verified by successful queue output.

The earlier `SETOM`/`SETM` transcription error remains an anchor for
nearby mnemonic distinctions.

The Small Executive is now a tested reference implementation whose
deviations from the source are retained with provenance.

---

## Knowledge Representation Status

The project uses:

- generator-oriented domain capsules;
- semantic, structural, and behavioural anchors;
- explicit boundaries and open questions;
- verified Rosetta/reference programs.

The first broad MACRO-20 anchor set has been created.

It is intentionally a candidate superset and should later be compacted
through reconstruction testing and observed inference failures.

The project domain is undergoing maintenance to:

- remove duplication;
- align names with conceptual scope;
- separate reference artefacts from domain generators;
- update state and history to reflect Chapters 19–26.

---

## Open Questions

### Processor and instruction semantics

- Hexadecimal constant syntax in MACRO-20.
- Detailed JSYS instruction encoding.
- Processor flags: AROV, FOV, CRY0, and CRY1.
- Architectural relationship between accumulators and low memory.
- Exact `IDIVM` and `DIVM` remainder behaviour.
- Exact floating-point field boundaries where the chapter transcription
  was ambiguous.
- Detailed stack instruction and procedure-linkage conventions.
- Byte-pointer bit-level representation.

### Macro processing

- Nested delimiter handling.
- Argument substitution and rescanning.
- Macro redefinition.
- Expansion order.
- Exact boundaries between textual substitution and assembler evaluation.

### Operating-system facilities

- Exact relationship between JOBs, FORKs, and JFN ownership.
- Whether and how JFNs are shared between FORKs.
- Detailed `.CMIFI` interaction with the COMND GTJFN argument block.
- Detailed capability policy beyond observed IPCF behaviour.
- Complete execute-only security rules.
- PSI, traps, and asynchronous control transfer.

### Knowledge representation

- Minimum useful MACRO-20 instruction-family anchor set.
- Which broad candidate anchors remain necessary after fresh-session
  reconstruction tests.
- Whether additional reference programs are needed beyond the factorial
  program and Small Executive.

---

## Next

1. Continue with Gorin Chapter 29 on traps and interrupts.
2. Expand the Small Executive as later chapters introduce asynchronous
   control facilities.
3. Complete maintenance of state, history, domain, anchors, and references.
4. Compact the candidate anchor set after fresh-session reconstruction tests.
5. Revisit JOB/FORK/JFN ownership when direct evidence appears.

---



<!-- projects/macro-20/state/session-log.md -->

# Session Log

## Bootstrap and first program

- Established the MACRO-20 project under the shared protocol.
- Verified the TOPS-20 MACRO-20 toolchain.
- Wrote, assembled, linked, saved, and ran a Hello World program using:
  - `SEARCH MONSYM`
  - `RESET`
  - `HRROI`
  - `PSOUT`
  - `HALTF`
- Discovered experimentally that `END` needs a final newline; later confirmed explicitly by Gorin.

## Architecture chapters covered

- 36-bit words and two's-complement representation.
- ASCII and ASCIZ packing.
- Instruction formats and recursive effective-address calculation.
- MOVE family and EXCH.
- JRST, JSR, JSP, JFCL, JFFO, XCT.
- Test and Boolean instruction families.
- BLT and shift/rotate families.
- Fixed, double-width, and floating-point arithmetic.

## Knowledge-representation development

- Split stable domain knowledge out of project state.
- Adopted generator-oriented capsules:
  - preserve rules that regenerate families;
  - preserve boundaries where inference fails;
  - preserve unknowns explicitly.
- Fresh-chat testing showed that missing domain capsules materially weakened explanations.
- Lowercase filenames adopted for project files.

## Macros

- `DEFINE` names assembly-source blocks.
- Parameters are substituted into macro text.
- Conditional assembly reuses the JUMP/SKIP relation vocabulary.
- `IFNDEF` can provide default symbol definitions.
- Gorin's `OPMAC`/`XX` example was examined:
  - one relationship generates synchronized operator and instruction tables;
  - the instruction table is later used with `XCT`.
- `macros.md` created.
- Detailed macro-processor semantics left as a TODO.

## LUUOs

- Established the core LUUO mechanism from Gorin.
- Added `luuos.md`.
- Examined photographed pages 198–202 of the worked example.
- Confirmed:
  - `OPDEF` gives symbolic names to user-defined operations;
  - the main program uses LUUOs such as `TTYSTR`, `TTYCHR`, and `ERROR` as instruction-like interfaces;
  - the handler preserves accumulator state, decodes the saved instruction, dispatches through a table, restores state, and returns;
  - the CPU supplies dispatch while software defines semantics.
- Photographs were readable enough for code analysis.

## Source organization

- Gorin introduces `SUBTTL` to label major sections in assembly listings.
- Form-feed separates related source components onto listing pages.
- `source-organization.md` added as a small organizational capsule.

## Current status

Chapter 18 complete.

Chapter 19–22
-------------
- Verified string I/O using SOUT and SIN.
- Established accepted JFN lifecycle.
- GTSTS introduced for post-I/O status inspection.
- RDTTY examined as terminal-oriented string input.

Chapter 23
----------
- Introduced wildcard iteration with GTJFN/GNJFN.
- Accepted working model of dynamic allocation using .JBSA.
- Deferred detailed directory iteration pending later need.

Chapter 24
----------
- Accepted conceptual model for linked lists.
- Verified PHASE/DEPHASE/.ORG record-layout mechanism.
- Established record-field offsets as compile-time abstraction.

Chapter 25
----------
- Accepted PMAP working model.
- Distinguished stream I/O from mapped I/O.
- Discussed copy-on-write semantics.
- Noted historical password-side-channel example illustrating
  consequences of virtual-memory mapping.

Chapter 26
----------
- COMND accepted as stateful parser rather than tokenizer.
- State block, FDBs, command tables and reparsing established.
- Small Executive selected as project Rosetta program.
- Program transcribed, assembled, linked and executed.
- Transcription error (SETM vs SETOM) discovered and corrected.
- The verified Small Executive shifted the project from isolated mechanism 
  studies to a stable reference program used to understand the composition
  of multiple TOPS-20 facilities.

Knowledge Representation
------------------------
- Introduced semantic anchors as complement to generators.
- Distinguished:
    generators
    anchors
    Rosetta/reference artefacts
- Added common knowledge-maintenance methodology.
- Began maintenance pass over repository.

---

## Chapter 27 — Processes, forks, and program execution

- Established that a process or fork is the independently scheduled
  executable entity, while a JOB organizes a hierarchy of processes.
- Each process has its own 512-page virtual address space, accumulators,
  program counter, and execution state.
- Established superior/inferior relationships and relative fork handles.
- Accepted predefined structural handles:
  `.FHSLF`, `.FHSUP`, `.FHTOP`, `.FHSAI`, `.FHINF`, and `.FHJOB`.
- Examined `CFORK` as a process constructor:
  - `CR%MAP` shares the superior's map through indirect pointers;
  - `CR%CAP` copies capabilities;
  - `CR%ACS` initializes accumulators from a supplied block;
  - `CR%ST` supplies a PC and starts the inferior.
- Confirmed that `CR%MAP` shares pages rather than copying them.
- Established the process/program-image split:
  `CFORK` constructs, `GET` installs an image, and `SFRKV` starts execution.
- Verified that `GET`:
  - maps sharable save files and copies nonsharable save files;
  - updates the entry vector and PDVA list;
  - never loads accumulators.
- Established entry-vector structure: start, reenter, version, and optional
  additional entry information.
- Resolved PDV/PDVA:
  - entry vector and PDVA list are distinct;
  - LINK writes PDVs into program memory;
  - the monitor retains only PDVAs;
  - `PDVOP%` exposes PDVA information.
- Examined virgin and execute-only process constraints.
- Implemented and verified the Small Executive `PUSH` server:
  `GTJFN → CFORK → GET → SFRKV → WFORK → KFORK`.
- Live demonstrations connected the model to normal use:
  `PUSH`/`POP`, EMACS inferiors, `REENTER`, `FINGER`, `SEND`, `ADVISE`,
  and batch submission.

## Chapter 28 — IPCF, QUASAR, and shared file pages

- Established IPCF as asynchronous queued packet exchange.
- Kept IPCF PIDs distinct from relative fork handles.
- `MSEND` enqueues a packet; `MRECV` consumes it.
- Reception may be polled or announced through a software interrupt.
- Distinguished the generic IPCF packet descriptor from subsystem payloads.
- Used the Small Executive `QUEUE` server to communicate with QUASAR.
- Verified:
  - `.OFLAG` is absent from `QSRMAC.UNV` on two independent systems;
  - `.OHDRS` evaluates to octal `5`;
  - `IFNDEF .OFLAG,.OFLAG==.OHDRS-2` is a working compatibility definition;
  - `.MUCRE` requires IPCF or WHEEL capability on the tested system;
  - a locally omitted `MOVEM C,IPCBLK+1` caused an invalid sender PID;
    the line is present in Gorin;
  - Gorin's published `.IPCFD` receive descriptor causes
    `?Error: Invalid message size`;
  - changing it to `.IPCFP` produces correct QUASAR queue output.
- The `.IPCFD`/`.IPCFP` correction is a verified source erratum.
- The Small Executive now anchors COMND, JFNs, process handling, IPCF,
  and QUASAR composition.
- Established two complementary cooperation models:
  - IPCF for arm's-length communication with explicit identity;
  - shared writable file pages for mutually trusting processes.
- Shared-file communication requires both processes to open the same file
  with `OF%RD`, `OF%WR`, and `OF%THW`, then map the same file pages.
- Process virtual page numbers need not match.
- Frozen writable access permits one writer.
- Thawed writable access permits multiple writers only when every writer
  requests `OF%THW`.
- Frozen and thawed writable opens exclude one another.

## Current status

Chapter 28 complete.

Next: Chapter 29, traps and interrupts.

---


<!-- projects/macro-20/state/TODO.md -->

# Potential changes to protocol.md

## Project TODO's

- Continue with Chapter 29, traps and interrupts.
  Expand the Small Executive as later chapters introduce pseudo-interrupts,
  traps, asynchronous control transfer and related facilities.
- Revisit MACRO-20 macro expansion semantics after the introductory chapters:
  nested angle brackets, argument substitution, rescanning, redefinition,
  and emitted source.
- Develop the minimum MACRO-20 instruction-family anchor set.
  Validate candidate anchors against fresh-session reconstruction before
  accepting them.
- Complete maintenance pass over common, state, domain and reference artefacts.
- After major maintenance, test reconstruction using a fresh session
  before further compaction.
- Evaluate whether later chapters introduce additional reference artefacts
  worthy of Rosetta status.
- Revisit exact JOB/FORK/JFN ownership when later chapters or primary
  documentation provide direct evidence.
- Long-term:
  Maintain the smallest accepted knowledge base that reliably reconstructs
  the project.

---


<!-- projects/macro-20/domain/addressing.md -->

# Addressing (projects/macro-20/domain/addressing.md)

## Generator

The PDP-10 separates **address calculation** from **instruction
semantics**.

Before an instruction performs its operation, the processor computes an
effective address (EA).

The instruction family then operates on the resolved operand.

------------------------------------------------------------------------

## Instruction Address Fields

A memory reference is determined by the instruction's addressing fields.

Accepted components include:

-   address field;
-   indirect bit;
-   index field.

These fields describe **how to locate an operand**, not what the
instruction ultimately does with it.

------------------------------------------------------------------------

## Effective Address Calculation

Normal instructions contain:

- an indirect bit `I`;
- an index field `X`;
- an address field `Y`.

The effective-address generator is:

1. Begin with `Y`.
2. If `X` is nonzero, add the contents of accumulator `X`.
3. If `I` is zero, the resulting value is the effective address.
4. If `I` is one, fetch the word at the resulting address and repeat the
   process using that word's `I`, `X`, and `Y` fields.

Indirection is therefore recursive rather than limited to one additional
memory reference.

Only after this process terminates does instruction-family semantics
begin.

------------------------------------------------------------------------

## Immediate Forms

Immediate instructions embed a value within the instruction itself.

The operand value is therefore obtained directly rather than through a
memory reference.

Immediate addressing changes operand acquisition but does not change the
conceptual operation performed by the instruction family.

Immediate forms use the resolved address value rather than fetching the
contents of the resolved address.

For example:

`MOVEI AC,E`

loads `0,,E` after effective-address calculation.

------------------------------------------------------------------------

## Address Stability

Once an effective address has been calculated, it remains the operand
address for the instruction.

Instructions such as `BLT` repeatedly operate using the established
addressing rules rather than recalculating new effective addresses for
each transferred word.

This distinction explains why address calculation belongs outside the
instruction-family generators.

------------------------------------------------------------------------

## Relationship to Other Generators

Addressing answers:

> Where does the operand come from?

Instruction families answer:

> What operation is performed on that operand?

Keeping these mechanisms separate greatly reduces inference drift.

------------------------------------------------------------------------

## Conceptual Model

``` text
Instruction
      ↓
Address fields
      ↓
Effective address calculation
      ↓
Operand located
      ↓
Instruction-family semantics
```

Addressing determines the operand.

Instruction families determine the operation.

------------------------------------------------------------------------

## Boundaries

Current project knowledge does **not** establish:

-   complete byte-pointer encoding;
-   all indexed-indirect corner cases;
-   architectural relationship between accumulators and low memory;
-   every specialised addressing mode.

Do not infer instruction semantics from addressing behaviour alone.

------------------------------------------------------------------------

## Open Questions

-   Exact byte-pointer representation.
-   Remaining specialised addressing forms.
-   Detailed interaction between addressing and selected monitor
    instructions.

------------------------------------------------------------------------

## Related Capsules

-   `instruction-families.md`
-   `arrays.md`
-   `records.md`
-   `program-memory.md`
-   `anchors.md`

---



<!-- projects/macro-20/domain/arithmetic.md -->

# Arithmetic (projects/macro-20/domain/arithmetic.md)

## Generator

PDP-10 arithmetic is organised into related instruction families.

Families vary independently along dimensions such as:

-   operand source;
-   destination;
-   result width;
-   numeric representation.

Learning the family structure allows many instructions to be
reconstructed from a small set of rules.

------------------------------------------------------------------------

## Destination Grammar

Several fixed-point arithmetic families share a common destination
grammar.

Destination forms include:

-   blank: memory operand, result to AC;
-   `I`: immediate operand, result to AC;
-   `M`: result to memory;
-   `B`: result to both AC and memory.

This grammar is shared by families such as:

-   `ADD`;
-   `SUB`;
-   `IMUL`.

Individual families may introduce exceptions.

------------------------------------------------------------------------

## Width Hierarchy

Arithmetic families frequently scale by operand and result width.

Accepted examples include:

### Multiplication

-   `IMUL` --- one-word result.
-   `MUL` --- doubleword result.
-   `DMUL` --- four-word result.

### Division

-   `IDIV` --- single-word dividend with quotient and remainder.
-   `DIV` --- doubleword dividend.
-   `DDIV` --- four-word dividend divided by a doubleword divisor.

Increasing width changes representation requirements and may introduce
additional architectural state.

------------------------------------------------------------------------

## Floating-Point Grammar

Floating-point instructions form their own family.

Accepted structure:

Single precision:

`F` + operation + optional rounding + destination form

Double precision:

`DF` + operation

Common operations include:

-   addition;
-   subtraction;
-   multiplication;
-   division.

------------------------------------------------------------------------

## Irregularities

Arithmetic families are highly regular but not perfectly uniform.

Operations producing more than one logical result, such as quotient and
remainder, naturally introduce architectural irregularities.

Treat these as explicit exceptions rather than forcing them into the
general family grammar.

------------------------------------------------------------------------

## Relationship to Other Generators

Instruction families describe the grammatical structure shared by
arithmetic instructions.

This capsule captures arithmetic-specific regularities and known
exceptions.

Exact instruction semantics remain anchored by verified documentation,
experiments, and semantic anchors where necessary.

------------------------------------------------------------------------

## Conceptual Model

``` text
Arithmetic instruction
        ↓
Identify family
        ↓
Determine width
        ↓
Determine destination form
        ↓
Apply family semantics
        ↓
Check family-specific irregularities
```

------------------------------------------------------------------------

## Boundaries

Current project knowledge does **not** establish:

-   every floating-point detail;
-   exact remainder placement for every division variant;
-   overflow handling for every arithmetic instruction;
-   all specialised arithmetic extensions.

Do not infer complete semantic equivalence across related families.

------------------------------------------------------------------------

## Open Questions

-   Exact semantics of `DIVM` and `IDIVM`.
-   Floating-point field details where documentation was ambiguous.
-   Overflow and processor flag interactions across arithmetic families.

------------------------------------------------------------------------

## Related Capsules

-   `instruction-families.md`
-   `data-representation.md`
-   `anchors.md`

---



<!-- projects/macro-20/domain/arrays.md -->

# Arrays (projects/macro-20/domain/arrays.md)

## Generator

An array is a contiguous region of memory whose elements are accessed
through effective-address calculation.

The PDP-10 instruction set has no dedicated array mechanism.

Arrays are constructed from ordinary memory together with address
calculation.

------------------------------------------------------------------------

## Linear Arrays

A one-dimensional array occupies consecutive PDP-10 words.

The address of an element is determined from:

-   array origin;
-   element index.

Iteration normally advances by changing the index rather than modifying
the array itself.

------------------------------------------------------------------------

## Multidimensional Arrays

Multidimensional arrays remain linear in memory.

Accepted construction techniques include:

-   row-major or column-major address calculations;
-   tables of row or column origins.

The chosen mapping determines how multidimensional indices become linear
addresses.

------------------------------------------------------------------------

## Address Calculation

Array access is an application of the addressing generator.

Conceptually:

``` text
Array base
     ↓
Element index
     ↓
Effective address
     ↓
Memory operand
```

The instruction family then operates on the resolved operand.

------------------------------------------------------------------------

## Relationship to Records

Arrays organise homogeneous collections.

Records organise heterogeneous fields.

Arrays answer:

> Which element?

Records answer:

> Which field?

The two mechanisms are complementary.

------------------------------------------------------------------------

## Relationship to BLT

`BLT` efficiently copies or initializes contiguous regions of memory.

It therefore naturally complements array construction and bulk array
operations without changing the conceptual array model.

------------------------------------------------------------------------

## Conceptual Model

``` text
Linear memory
      ↓
Choose origin
      ↓
Apply index calculation
      ↓
Effective address
      ↓
Element
```

Arrays are a view of memory rather than a distinct architectural object.

------------------------------------------------------------------------

## Boundaries

Current project knowledge does **not** establish:

-   language-specific array descriptors;
-   runtime bounds checking;
-   dynamically resized arrays;
-   compiler-generated array layouts.

Do not infer higher-level language features from the assembly model.

------------------------------------------------------------------------

## Open Questions

-   Common TOPS-20 runtime conventions for multidimensional arrays.
-   Typical library support for dynamic arrays, if any.

------------------------------------------------------------------------

## Related Capsules

-   `addressing.md`
-   `records.md`
-   `program-memory.md`
-   `blt.md`
-   `anchors.md`

---



<!-- projects/macro-20/domain/blt.md -->

# BLT (projects/macro-20/domain/blt.md)

## Generator

`BLT` performs bulk transfer over a contiguous region of memory.

It treats memory as a sequence of words rather than as individual
variables.

The instruction preserves the relationship between source and destination
while advancing through both regions automatically.

---

## Contiguous Memory

`BLT` operates on contiguous PDP-10 words.

Typical uses include:

- copying arrays;
- initializing storage;
- moving records;
- clearing work areas.

The data being copied is interpreted only by the surrounding program.

`BLT` copies words.

---

## Address Progression

The instruction establishes its effective source and destination
addresses before transfer begins.

Transfer then proceeds sequentially through memory.

This explains why effective-address calculation belongs to the
addressing generator rather than to `BLT` itself.

---

## Relationship Preservation

`BLT` preserves spatial relationships within the copied region.

If two fields are adjacent before the transfer, they remain adjacent
after the transfer.

The operation therefore preserves structure as well as contents.

---

## Source Organization

Programs sometimes place related storage definitions contiguously because
they are intended to be initialized or copied by a single `BLT`.

Source order may therefore express runtime relationships.

---

## Relationship to Other Generators

- `program-memory.md` explains the address space.
- `addressing.md` explains effective-address calculation.
- `arrays.md` explains contiguous collections.
- `records.md` explains symbolic layouts.

`BLT` provides an efficient operation over those structures.

---

## Conceptual Model

```text
Contiguous memory region
          ↓
Source / destination pair
          ↓
Sequential word transfer
          ↓
Equivalent contiguous region
```

The operation copies layout and contents together.

---

## Boundaries

Current project knowledge does **not** establish:

- optimal overlap strategies;
- interruptibility during long transfers;
- microarchitectural implementation;
- every corner case involving self-overlapping regions.

Do not infer byte-oriented behaviour from the word-transfer model.

---

## Open Questions

- Exact overlap semantics.
- Performance characteristics on different PDP-10 implementations.
- Typical monitor and library uses beyond the accepted examples.

---

## Related Capsules

- `addressing.md`
- `arrays.md`
- `records.md`
- `program-memory.md`
- `anchors.md`

---



<!-- projects/macro-20/domain/comnd.md -->

# COMND

## Generator

COMND and the application cooperate to execute a typed interactive
grammar.

COMND owns the interactive parsing process.

The application owns the command grammar and the command semantics.

Each call to COMND parses one field and advances the parse state.

------------------------------------------------------------------------

## Command State

The application owns the command state block.

The state block preserves the dialogue between successive COMND calls.

Accepted components include:

-   command buffer;
-   atom buffer;
-   input/output JFNs;
-   parsing pointers and counters;
-   GTJFN argument block pointer;
-   application reparse entry.

The command buffer contains the editable command.

The atom buffer contains the current parsed field.

------------------------------------------------------------------------

## Parsing Model

COMND parses one field at a time.

A complete command is therefore interpreted as a sequence (or tree) of
typed fields rather than as one monolithic command line.

The application advances through the grammar by selecting the next
Function Descriptor Block (FDB) chain.

COMND advances through the input by recognizing the next field.

------------------------------------------------------------------------

## Function Descriptor Blocks

An FDB describes one expected field.

Accepted FDB responsibilities include:

-   field type;
-   function-specific data;
-   help text;
-   default value;
-   alternate FDB;
-   optional break handling.

Alternate FDB chains allow one grammar position to accept several
different field types.

------------------------------------------------------------------------

## Command Tables

Keyword tables associate recognized command words with application data.

Application data commonly identifies the command server.

Recognition policy is controlled by keyword flags such as:

-   explicit abbreviations;
-   invisible aliases;
-   non-recognized entries.

The table therefore describes both recognition and dispatch.

------------------------------------------------------------------------

## Responsibility Split

COMND owns:

-   command-line editing;
-   recognition;
-   completion;
-   contextual help;
-   defaults;
-   field parsing;
-   textual parse state.

The application owns:

-   grammar;
-   FDB selection;
-   dispatch;
-   persistent state;
-   command semantics.

------------------------------------------------------------------------

## Interactive Behaviour

Accepted behaviour includes:

-   `?` displays help for the current field.
-   `ESC` performs recognition or completion.
-   Defaults may be supplied.
-   Noise words improve readability.
-   Confirmation is parsed explicitly.
-   Reparsing resumes from application-defined state.

------------------------------------------------------------------------

## Return Convention

Normally COMND returns:

-   AC1: status flags and command-state-block address.
-   AC2: parsed value or error code.
-   AC3: first supplied FDB and FDB actually used.

The FDB actually used identifies which alternative matched.

If reparsing is required and the command-state block supplies a reparse
entry, COMND transfers there instead of returning normally.

------------------------------------------------------------------------

## Conceptual Model

``` text
User
   ↓
Command buffer
   ↓
COMND
   ↓
Current FDB chain
   ↓
Parsed field
   ↓
Application
   ↓
Next FDB chain
   ↓
COMND
```

The monitor and the application jointly execute the command grammar.

------------------------------------------------------------------------

## Boundaries

Current project knowledge does **not** establish:

-   every COMND function code;
-   every field type;
-   internal parser implementation;
-   detailed interaction between `.CMIFI` and long-form `GTJFN`;
-   all command-state flags.

Do not infer undocumented COMND behaviour from the accepted model alone.

------------------------------------------------------------------------

## Open Questions

-   Detailed long-form `GTJFN` integration.
-   Complete FDB catalogue.
-   Reparse behaviour in more complex grammars.
-   Additional COMND field types introduced later in Gorin.

------------------------------------------------------------------------

## Related Capsules

-   `files-and-jfns.md`
-   `program-memory.md`
-   `anchors.md`


<!-- projects/macro-20/domain/comnd-reference-program.md -->

# COMND reference program

## SMALL EXECUTIVE

```MACRO-20
	TITLE	SMALL EXECUTIVE		; Mark R. Crispin 12/79
	SEARCH	MACSYM,MONSYM,QSRMAC
	SALL

; Compatibility definition: some QSRMAC.UNV versions lack .OFLAG
IFNDEF	.OFLAG,.OFLAG==.OHDRS-2

;  Accumulator defs
A=1			; JSYS Args and temp AC's 
B=2
C=3
D=4
P=17			; stack pointer

OPDEF	CALL	[PUSHJ P,]
OPDEF	RET	[POPJ P,]

; Standard version info
VWHO==2			; Who last edited program
VMAJOR==2		; major version
VMINOR==7		; minor version
VEDIT==13		; edit version

; Assembly switches
; Note that CMDBSZ and ATMBSZ take on default values that can
; be overridden by the inclusion of a header file

PDLEN==100	; length of pushdown stack
IFNDEF CMDBSZ,CMDBSZ==^D50	; length of command text buffer
				; (250 characters)
IFNDEF ATMBSZ,ATMBSZ==^D20	; atom buffer length (100 chars)

	SUBTTL	Useful macro definitions

; Parse tring of noise words
DEFINE	NOISE (STRING) <
	MOVEI	B,[FLDDB. .CMNOI,,<-1,,[ASCIZ/STRING/]>]
	COMND
	ERCAL	FATAL
	TXNE	A,CM%NOP
	JRST	ERROR	>	;Definition of noise

; Obtain confirmation. an end of line indication. Tie off command line
DEFINE	CONFIRM <
	MOVEI	B,[FLDDB. .CMCFM]
	COMND
	ERCAL	FATAL
	TXNE	A,CM%NOP
	JRST	ERROR	>	; definition of CONFIRM

; Call this macro to help build the command table. This macro is more complex
;(and more useful) than the CMD macro decribed earlier
;This macro explained in 26.2.9, page 380
DEFINE	TBL (NAME,FLAGS,DISP) <
IFNB <DISP>,<..DISP==DISP>		;; If a dispatch is given, use it
IFB  <DISP>,<..DISP==.'NAME>		;; If none, default to .NAME
IFB  <FLAGS>,<[ASCIZ/NAME/],,..DISP>	;; If no flags assemble name
IFNB <FLAGS>,<[FLAGS!CM%FW		;; if flags use them and set CM%FW
	ASCIZ/NAME/],,..DISP>		;;
	PURGE	..DISP >		; TBL MACRO

	SUBTTL	Data Storage Area

PDLIST:	BLOCK	PDLEN		; Pushdown list
SAVPDL: 0			; Save pushdown pointer
				; in case of reparse
CORBEG==.			; This storage zeroed at start

				; Storage used by COMND
CMDBUF:	BLOCK	CMDBSZ		; command buffer
ATMBUF:	BLOCK	ATMBSZ		; atom buffer
GTJBLK:	BLOCK	.GJATR+1	; GTJFN block

				; Other storage
UDFLAG:	0			; Up/down count flag for COUNT
INPJFN:	0			; Input JFN for TYPE

; Storage used by the PUSH command. See section 27, page 387
EXCJFN:	0			; JFN for PUSH
FKHAN:	0			; Fork handle for PUSH

; Storage used for the QUEUE command. The server for this command is
; explained in section 28.1, page 397
IPCBLK:	BLOCK	.IPCFP+1	;Storage for IPCF JSYS calls
MYPID:	0			; PID for this program
QSRPID:	0			; PID for Quasar
FIRSTP:	0			; Flag used in GETQRP

COREND==.-1			; end of area zeroed at START

; Command State Block
CMDBLK:	0,,CMRPRS		; flags,,address of reparse routine
	.PRIIN,,.PRIOU		; JFNS for command I/O
	-1,,[ASCIZ/Small Executive>/]	;Ctrl-R buffer
	-1,,CMDBUF		; ptr to start of buffer
	-1,,CMDBUF		; ptr to start of next input
	CMDBSZ*5-1		; size of command buffer in bytes
	0			; number of unparsed characters
	-1,,ATMBUF		; ptr to start of atom buffer
	ATMBSZ*5-1		; size of atom buffer in bytes
	GTJBLK			; pointer to GTJFN block

	SUBTTL	Top level, first command dispatch and command table

START:	RESET			; initialize all i/o
	MOVE	P,[IOWD PDLEN,PDLIST]	; Initialize stack ptr
	SETZM	CORBEG		; Initialize data area
	MOVE	A,[CORBEG,,CORBEG+1]
	BLT	A,COREND

TOPLEV:	CALL	GETCMD		; get a command and run it
	SETO	A,		; here on return from command
	CLOSF			; clean up any stray JFNS left behind
	ERCAL	FATAL		; should not happen...
	JRST	TOPLEV		; back to top level

GETCMD:	MOVEI	A,CMDBLK	; Register A points to state block
	MOVEI	B,[FLDDB. .CMINI]	; Initialize state block, watch for
	COMND			; CTRL/H. Do output prompt
	ERCAL	FATAL		; Should never happen
	MOVEM	P,SAVPDL	; Save stack ptr for reparse
CMRPRS:	MOVE	P,SAVPDL	; Restore stack ptr for reparse
	MOVEI	B,[FLDDB. .CMKEY,,CMDTAB,<A command>]
	COMND
	ERCAL	FATAL
	TXNE	A,CM%NOP	; Parse fail?
	JRST	ERROR		; yes, report and return
	HRRZ	B,(B)		; ger address of command server
	JRST	(B)		; dispatch to it

; This table format discussed in 26.2.9, page 380

CMDTAB:	CMDTBL,,CMDTBL	;Actual,,max no of entries
	TBL(COUNT)
	TBL(EXIT)
	TBL(HELL,CM%NOR,0)	; Hell is an illegal abbreviation
	TBL(HELLO)		; for hello
	TBL(HELP)
	TBL(PUSH)
	TBL(Q,CM%INV!CM%ABR,$QUEUE)	; Q and QU are invisible 
	TBL(QU,CM%INV!CM%ABR,$QUEUE)	; abbrevs for queue
$QUEUE:	TBL(QUEUE)
	TBL(QUIT,CM%INV,.EXIT)	; Quit is an invisible alias for EXIT
	TBL(TYPE)
CMDTBL==<.-CMDTAB>-1		; Entries in table

	SUBTTL	Command Servers
; Server for count command
.COUNT:	SETZM	UDFLAG	;Assume count up
	MOVEI	B,[FLDDB. .CMKEY,,UDCTAB,<a direction to count.>,UP,UPNUM]
	COMND
	ERCAL	FATAL
	TXNE	A,CM%NOP	
	JRST	ERROR
	HRRZ	C,C	; Get address of function descriptor used
	CAIN	C,UPNUM	; did we parse a number
	JRST	CNUM2	; yes, result in B
	HRRZ	B,(B)	; no, must be a command
	JRST	(B)	; dispatch to handler

UPNUM:	FLDDB.	.CMNUM,CM%SDH,^D10,<a number to count up to>

UDCTAB:	UDCTLN,,UDCTLN	;Secondary kbd table for count command
	TBL	(DOWN)
	TBL	(UP)
UDCTLN==<.-UDCTAB>-1

.UP:	NOISE	(TO)
	MOVEI	B,[FLDDB. .CMNUM,CM%SDH,^D10,a number to count up to,20]
	JRST	CNUM
.DOWN:	NOISE	(FROM)
	SETOM	UDFLAG
	MOVEI	B,[FLDDB. .CMNUM,CM%SDH,^D10,a number to count down from,20]
CNUM:	COMND
	ERCAL	FATAL
	TXNE	A,CM%NOP
	JRST	ERROR
CNUM2:	JUMPLE	B,NONEG	; A negative argument makes no sense
	MOVE	D,B	; Save number over CONFIRM
	CONFIRM		; Tie off command
			; here to actually do the counting
	SKIPGE	UDFLAG	;Counting up or down, skip if up
	JRST	COUNT0	; counting down, udflag=-1, max value
	MOVEM	D,UDFLAG	; UDFLAG is now upper bound
	SKIPA	D,[1]	;and for up counting D is initially 1
COUNT0:	MOVN	D,D	;down count, D is initially -n
			; D is lower boudn, UDFLAG is 
			; upper bound. For counting down we'll
			; actually cound a neg num up to -1
	MOVEI	A,.PRIOU	; Set up to output to terminal
COUNT1:	MOVM	B,D		; get magnitude of number to output
	MOVEI	C,^D10		; decimal radix
	NOUT			; output it
	ERCAL	FATAL	
	HRROI	B,CRLF		; output delimiting crlf
	SETZ	C,		; terminate on null
	SOUT
	CAMGE	D,UDFLAG	; if counting down UDFLAG is -1
	AOJA	D,COUNT1
	RET

NONEG:	HRROI	A,[ASCIZ/?I can't count down that far!
/]
	PSOUT
	RET

; Server for EXIT command to have a graceful way of getting out
.EXIT:	NOISE	(FROM SMALL EXECUTIVE)
	CONFIRM
	HALTF
	RET

; Server for HELLO command
; Format for printing version is MAJOR.MINOR(EDIT)-WHO
.HELLO:	CONFIRM
	HRROI	A,[ASCIZ/Hello this is the Small Executive.
Version /]
	PSOUT
	MOVEI	A,.PRIOU	; Numeric object to terminal
	MOVEI	C,10	;radix 8
	LDB	B,[POINT 9,VERSIO,11]
	NOUT
	ERJMP	.+1
	MOVEI	B,"."
	BOUT
	LDB	B,[POINT 6,VERSIO,17]	; Minor version
	NOUT
	ERJMP	.+1
	MOVEI	B,"("
	BOUT
	HRRZ	B,VERSIO	; edit number in parens
	NOUT
	ERJMP	.+1
	HRROI	A,[ASCIZ/)-/]
	PSOUT
	MOVEI	A,.PRIOU
	LDB	B,[POINT 3,VERSIO,2]	;Finally, who edited
	NOUT
	ERJMP	.+1
	HRROI	A,CRLF
	PSOUT
	RET

; Server for HELP command
.HELP:	NOISE (IN USING THE SMALL EXECUTIVE)
	CONFIRM
	HRROI	A,HLPMSG
	PSOUT
	RET

HLPMSG:	ASCIZ/
The Small Executive is a simple command processor that demonstrate the
capabilities of the COMND JSYS. Try typing ? to see what commands are 
available.
/


	SUBTTL PUSH command
; The actual server for the PUSH command will be presented in section
; 27, page 387
.PUSH:	NOISE (COMMAND LEVEL)
	CONFIRM		; Tie off command
	MOVX	A,GJ%OLD!GJ%SHT	; Try to get an EXEC
	HRROI	B,[ASCIZ/SYSTEM:EXEC.EXE/]
	GTJFN
	ERJMP	ERROR
	MOVEM	A,EXCJFN		; Save JFN we got for EXEC
	
	MOVX	A,CR%CAP	; Make a fork, give it our capabilities
	CFORK			; Create FORK
	ERJMP	ERROR
	MOVEM	A,FKHAN		; Save fork handle
				; form JFN,,fork handle
	HRL	A,EXCJFN	; stuff fork with JFN for EXEC
	MOVS	A,A		; GET wants to see fork handle,,JFN
	GET			; Copy exec.exe into inferior fork
	ERCAL	FATAL
	
	MOVE	A,FKHAN		; Get fork handle back
	SETZ	B,		; Start at offset 0 in entry vector
	SFRKV			; Start fork
	ERCAL	FATAL
	WFORK			; Wait for it to complete
	ERCAL	FATAL
	KFORK			; Now kill that fork
	ERCAL	FATAL
	RET

	SUBTTL	QUEUE Command
; The actual server for the QUEUE program is presented in 
; section 28.1, page 397

; Select a page for IPCF replies from QUASAR
IFNDEF	MSGPAG,MSGPAG==670 ; Put replies on page 670
MSGLOC=MSGPAG_^D9 ; First location on MSGPAG

; This is the message we send to QUASAR to make it divulge the queues
QSRMSG:	QSRLEN,,.QOLIS	; Length of block,,list queues
	0,,'SYS'	; flags,,3 letter mnemonic
	0		; acknowledge word
	LS.ALL		; flags - I want to see everything
	1		; one argument following
	2,,.LSQUE	; 2 words this argument,,queues I want
	LIQALL		; list all queues
QSRLEN==.-QSRMSG	; Length of message.

.QUEUE:	NOISE (STATUS DISPLAY)
	CONFIRM
; First we need to get PIDs for QUASAR and for this process
	MOVEI	A,3		; Length of argument block for MUTIL
	MOVEI	B,IPCBLK	; Address of block for MUTIL
	MOVEI	C,.MURSP	; Read a PID from system PID table
	MOVEM	C,IPCBLK	; Store as function or MUTIL
; Get QUASAR's PID
	MOVEI	C,.SPQSR	; Code to reuest QUASAR PID
	MOVEM	C,IPCBLK+1	; from system PID table
	MUTIL	
	ERJMP	QERR1
	MOVE	C,IPCBLK+2	; QUASARS PID returned in argument BLK
	MOVEM	C,QSRPID	; Save QUASAR's PID

; Now get own PID
	SKIPE	MYPID		; Is there a pid for me already?
	JRST	QUEUE3		; Yes, ready to send off a message
	MOVEI	C,.MUCRE	; no, must create one
	MOVEM	C,IPCBLK	; Set Create PID function for MUTIL
	MOVEI	C,.FHSLF	; PID for this fork, no flags
	MOVEM	C,IPCBLK+1	; Required: supply .FHSLF argument to .MUCRE
	MUTIL
	ERJMP	QERR2
	MOVE	C,IPCBLK+2	; Returned value from .MUCRE
	MOVEM	C,MYPID		; Save as my PID
; Here we have the PIDs we need. Now tell Quasar to send us the information
QUEUE3:	SETZM	IPCBLK		; no flags
	MOVE	C,MYPID
	MOVEM	C,IPCBLK+1	; My PID
	MOVE	C,QSRPID
	MOVEM	C,IPCBLK+2	; QUASAR's PID
	MOVE	C,[QSRLEN,,QSRMSG]
	MOVEM	C,IPCBLK+3
	MOVEI	A,.IPCFP+1	; Length of packed descriptor block
	MSEND
	ERJMP	QERR3		; report an error and return to user
	SETOM	FIRSTP		;Set this is first time through GETGRP
; Loop, reading the replies from QUASAR
GETQRP:	MOVX	C,IP%CFV	;flag to request one page of data
	MOVEM	C,IPCBLK+.IPCFL	; in the packet descriptor flag
	SETZM	IPCBLK+.IPCFS	; sender (filled in by system)
	MOVE	C,MYPID		; My PID is
	MOVEM	C,IPCBLK+.IPCFR	; the receiver
	MOVE	C,[1000,,MSGPAG]	;put data on message page
	MOVEM	C,IPCBLK+.IPCFP	; Verified correction:
                            ; Gorin prints .IPCFD here;
							; .IPCFP is required by MRECV.
	MOVEI	A,.IPCFP+1		; length of packet descriptor block
	MOVEI	B,IPCBLK	; Address of our block
	MRECV			; get the reply
	ERJMP	QERR4
	MOVE	C,IPCBLK+.IPCFS	; Get sender PID for this message
	CAME	C,QSRPID	; Was it QUASAR
	JRST	[HRROI A,[ASCIZ/%Ignoring irrelevant IPCF message
/]
		PSOUT		; someone other than QUASAR sent to us
	JRST GETQRP]		; try again to get QUASAR's reply
	HRROI	A,MSGLOC+.OHDRS+1	; get ptr to text block
	HLRZ	B,MSGLOC+.OHDRS		; get block's size
	AOSN	FIRSTP		; is this the first message?
	ADD	A,B		; Yes, point past header message
	PSOUT
	MOVE	B,MSGLOC+.OFLAG	; Get flags from QUASAR
	TXNE	B,WT.MOR	; Are there more messages?
	JRST	GETQRP		; Yes, handle
	RET			; No, return

.TYPE:	NOISE	(FILE ON TERMINAL)
	SKIPE	A,INPJFN	; Any JFN lying around
	CLOSF		; Yes, try to close it
	ERJMP	.+1	; Ignore any failure
	SETZM	INPJFN	; and don't try to do it again
	MOVEI	A,CMDBLK	; Reload A with ptr to state block
	MOVEI	B,[FLDDB. .CMIFI,CM%SDH,,name of the file you want to type]
	COMND	; get an input file
	ERCAL	FATAL
	TXNE	A,CM%NOP	; Maybe not found or something?
	JRST	ERROR
	HRRZM	B,INPJFN	; Save the JFN we got
	CONFIRM			; Tie off command
	MOVE	A,INPJFN	; Open the file, using JFN from COMND
	MOVX	B,<FLD(7,OF%BSZ)+OF%RD>	; Read access, 7-bit bytes
	OPENF
	JRST	ERROR		;OPENF failed for some reason...
TYPE1:	MOVE	A,INPJFN
	BIN			; Simple byte-by-byte copy loop
	ERJMP	TYPE2
	MOVEI	A,.PRIOU	; brevity, not speed...
	BOUT
	JRST	TYPE1

TYPE2:	MOVE	A,INPJFN	; Error here, EOF?
	GTSTS
	TLNN	B,(GS%EOF)	
	CALL	ERROR		; Some serious problem; report it.
	MOVE	A,INPJFN
	CLOSF			; Close file
	ERCAL	FATAL
	SETZM	INPJFN		; Zero JFN storage
	RET

	SUBTTL Error handlers and miscellany

; Fatal error routine, for "impossible errors" only.
; Called by ERCAL FATAL after failing JSYS

FATAL:	CALL	ERROR	; First output reason JSYS died
	HRROI	A,[ASCIZ/, JSYS at PC=/]
	PSOUT
	MOVEI	A,.PRIOU	; Output PC
	POP	P,B		; get PC back from stack
	SUBI	B,2		; Back up over ERCAL to JSYS address
	MOVX	C,NO%MAG!10	; Output free format unsigned octal
	NOUT
	ERJMP	.+1		; This can't happen but avoid recursion
	HRROI	A,CRLF
	PSOUT
	MOVEI	A,.PRIIN	; Flush TTY input handler
	CFIBF
FATAL0: HALTF
	HRROI	A,[ASCIZ/?Can't continue
/]
	PSOUT
	JRST	FATAL0	; Disallow continue command

QERR1:	HRROI	A,[ASCIZ/MUTIL .MURSP failed: /]
	PSOUT
	JRST	ERROR


QERR2:	HRROI	A,[ASCIZ/MUTIL .MUCRE failed: /]
	PSOUT
	JRST	ERROR


QERR3:	HRROI	A,[ASCIZ/MSEND failed: /]
	PSOUT
	JRST	ERROR


QERR4:	HRROI	A,[ASCIZ/MRECV failed: /]
	PSOUT
	JRST	ERROR

; Ordinary JSYS routine. Just outputs the error string for the 
; failing JSYS and returns

ERROR:	HRROI	A,[ASCIZ/Error: /]
	ESOUT
	MOVEI	A,.PRIOU	; Errmsg to primary output
	HRLOI	B,.FHSLF	; This fork, last error
	SETZ	C,		; No limit
	ERSTR
	ERJMP	.+1		; Neither of these are supposed to happen
	ERJMP	.+1
	HRROI	A,CRLF
	PSOUT
	RET

CRLF:	BYTE(7)15,12

;Entry vector
EVEC:	JRST	START		; START entry point
	JRST	START		; REENTER entry point
VERSIO:	BYTE	(3)VWHO(9)VMAJOR(6)VMINOR(18)VEDIT ;version #. Label for Hello
EVECL==.-EVEC

	END	<EVECL,,EVEC>
```

### Sample session

```TOPS-20
@compile smexec.mac
MACRO:	SMALL

EXIT
@load smexec
LINK:	Loading
@save smexec
 SMEXEC.EXE.2 Saved
@smexec
Small Executive>? A command one of the following:
 COUNT	 EXIT	  HELLO	   HELP	    PUSH     QUEUE    TYPE
Small Executive>count ? a direction to count. one of the following:
 DOWN	UP
  or a number to count up to
Small Executive>count uP (TO) ? a number to count up to
Small Executive>count uP (TO) 11
1
2
3
4
5
6
7
8
9
10
11
Small Executive>hello
Hello this is the Small Executive.
Version 2.7(13)-2
Small Executive>hello ? confirm with carriage return
Small Executive>hello 
Hello this is the Small Executive.
Version 2.7(13)-2
Small Executive>quEUE (STATUS DISPLAY) 

Batch Queue:
Job Name   Req#   Run Time            User
--------  ------  --------  ------------------------
  BSEND        4  00:05:00  FLAX                  /After:31-Jul-2026 09:
	  /Uniq:Yes  /Restart:No  /Assist:Yes  /Output:Log
	  /Batlog:Append  /Seq:1711
There is 1 job in the queue (none in progress)
Small Executive>exit
```


<!-- projects/macro-20/domain/data-representation.md -->

# Data Representation (projects/macro-20/domain/data-representation.md)

## Generator

The PDP-10 is a 36-bit, word-oriented machine.

Program data is represented by interpreting those 36 bits according to
the needs of the operation.

The architecture does not impose one universal meaning on a word.

A word may represent:

-   a signed integer;
-   packed characters;
-   an instruction;
-   a byte pointer;
-   two halfwords;
-   part of a larger numeric value;
-   a bit field or flag set.

------------------------------------------------------------------------

## Integers

Signed integers use two's-complement representation.

Important consequences include:

-   zero is represented by all zero bits;
-   `-1` is represented by all one bits;
-   negation changes the bit pattern according to two's-complement
    rules.

Arithmetic generators operate on these representations according to
their family semantics.

------------------------------------------------------------------------

## Numeric Radix

Unmarked numeric constants normally use the assembler's prevailing
radix.

Accepted explicit radix prefixes include:

-   `^D` for decimal;
-   documented octal and binary notation.

Verified experimentally:

``` asm
TABLE: BLOCK ^D100
```

allocates 100 decimal words.

Hexadecimal constant syntax remains unverified.

------------------------------------------------------------------------

## Character Packing

Five 7-bit ASCII characters fit in one 36-bit word.

The remaining bit is zero.

Character strings may therefore occupy one or more words while still
being accessed through byte pointers rather than as ordinary word-sized
integers.

------------------------------------------------------------------------

## ASCII and ASCIZ

`ASCII`

packs characters into words and zero-fills unused space in a partial
final word.

It does not append a separate terminator when the final word is exactly
full.

`ASCIZ`

packs characters and appends a zero byte.

A zero-terminated string may therefore require an additional word when
the preceding characters exactly fill the available byte positions.

------------------------------------------------------------------------

## Halfwords and Fields

A 36-bit word may also be treated as two 18-bit halfwords.

Many instructions, pointers, tables, and monitor interfaces rely on this
structure.

Fields may occupy arbitrary bit ranges within a word.

The exact meaning of those fields is defined by the instruction family,
assembler construct, or monitor interface using them.

------------------------------------------------------------------------

## Wider Values

Larger values may occupy consecutive words.

Accepted examples include:

-   doubleword arithmetic;
-   four-word arithmetic;
-   double-precision floating point;
-   arrays of digits used for multiprecision arithmetic.

The representation determines how the words combine into one logical
value.

------------------------------------------------------------------------

## Conceptual Model

``` text
36-bit word
     ↓
Interpretation supplied by context
     ↓
integer
characters
instruction
pointer
halfwords
bit fields
part of wider value
```

The bit pattern is primary.

Meaning comes from the operation that interprets it.

------------------------------------------------------------------------

## Boundaries

Current project knowledge does **not** establish:

-   complete byte-pointer encoding;
-   exact floating-point field boundaries;
-   hexadecimal assembler syntax;
-   every character-set or packed-string convention.

Do not infer byte-pointer structure from ASCII packing alone.

Do not infer exact numeric layout from width alone.

------------------------------------------------------------------------

## Open Questions

-   Exact byte-pointer bit representation.
-   Exact floating-point field boundaries.
-   Hexadecimal constant syntax in MACRO-20.
-   Additional packed-data conventions used by TOPS-20 libraries.

------------------------------------------------------------------------

## Related Capsules

-   `arithmetic.md`
-   `addressing.md`
-   `records.md`
-   `anchors.md`

---



<!-- projects/macro-20/domain/files-and-jfns.md -->

# Files and JFNs (projects/macro-20/domain/files-and-jfns.md)

## Generator

TOPS-20 separates **file identity** from **file access**.

A pathname names a file.

A Job File Number (JFN) is the monitor-managed handle used by nearly all
subsequent file operations.

Applications normally manipulate JFNs rather than pathnames.

------------------------------------------------------------------------

## File Lifecycle

The accepted lifecycle is:

``` text
pathname
    ↓
GTJFN
    ↓
JFN
    ↓
OPENF
    ↓
File access
    ↓
GTSTS (optional status)
    ↓
CLOSF
    ↓
RLJFN
```

Each stage has a distinct responsibility.

-   `GTJFN` establishes file identity.
-   `OPENF` establishes access characteristics.
-   I/O JSYSes operate on the JFN.
-   `GTSTS` reports status associated with the JFN.
-   `CLOSF` terminates file access.
-   `RLJFN` releases the JFN.

------------------------------------------------------------------------

## Identity

`GTJFN`

-   translates pathname → JFN.

`JFNS`

-   translates JFN → pathname.

These are complementary operations.

Obtaining a JFN does **not** itself establish read or write access.

------------------------------------------------------------------------

## Access

Once a JFN has been obtained, most operations use that JFN directly.

Accepted access styles currently include:

-   byte I/O;
-   string I/O;
-   mapped-file access;
-   shared thawed writable access.

The pathname normally disappears from subsequent operations.

------------------------------------------------------------------------

## Writable Sharing

Normal writable access is frozen.

A frozen writable open excludes every other writable open.

`OF%THW` requests thawed writable access.

Thawed access permits multiple simultaneous writers when every writer
requests `OF%RD`, `OF%WR`, and `OF%THW`.

While thawed writers hold the file, frozen writable access is denied.

While a frozen writer holds the file, all further writable opens are
denied, whether frozen or thawed.

Thawed access permits concurrent writers but does not provide
synchronization.

Processes may combine thawed access with `PMAP` so the same file pages
appear in multiple address spaces.

---

## String I/O

### Output

`SOUT`

-   AC1: output JFN
-   AC2: source byte pointer
-   AC3: character count or termination rule

With AC3 equal to zero, output continues until a null byte.

Verified experimentally:

`.PRIOU` together with `SOUT` reproduces the terminal output normally
performed through `PSOUT`.

### Input

`SIN`

-   AC1: source JFN
-   AC2: destination byte pointer
-   AC3: character count and stopping mode
-   AC4: break character when AC3 is positive

Negative AC3 requests a fixed-length transfer.

Positive AC3 terminates when either:

-   the requested count is exhausted; or
-   the break character is encountered.

On return AC3 moves toward zero by the number of transferred characters.

------------------------------------------------------------------------

## Terminal I/O

TOPS-20 also provides higher-level terminal-oriented JSYSes.

Accepted examples include:

-   `PSOUT`
-   `RDTTY`

These build upon the same underlying file abstraction.

------------------------------------------------------------------------

## Status

`GTSTS`

returns monitor status associated with a JFN.

Current accepted use:

-   distinguish end-of-file from other I/O failures following `SIN` or
    similar operations.

------------------------------------------------------------------------

## Wildcard Iteration

Wildcarded file specifications produce an initial JFN.

`GNJFN`

advances that JFN through subsequent wildcard matches.

The iteration state is therefore associated with the JFN rather than
with a pathname string.

------------------------------------------------------------------------

## Predefined JFNs

The monitor provides predefined JFNs.

Current project knowledge includes:

-   `.PRIIN`
-   `.PRIOU`

These provide the conventional primary input and output streams.

------------------------------------------------------------------------

## Conceptual Model

TOPS-20 attempts to present diverse devices through a common JFN-based
interface.

The accepted abstraction is therefore:

``` text
pathname
        ↓
   file identity
        ↓
       JFN
        ↓
 common file interface
        ↓
byte I/O
string I/O
mapped pages
status
iteration
```

The JFN is the conceptual centre of the model.

------------------------------------------------------------------------

## Boundaries

Current project knowledge does **not** establish:

-   complete `OPENF` sharing modes beyond accepted frozen/thawed access;
-   buffering policy;
-   synchronization between thawed writers;
-   precise JOB/FORK ownership rules;
-   lifetime rules for predefined JFNs;
-   interaction between multiple FORKs and shared JFN tables.

Do not infer these from other operating systems.

------------------------------------------------------------------------

## Open Questions

-   Are JFN tables shared between FORKs?
-   Can JFNs migrate between FORKs?
-   Exact relationship between JOB and FORK ownership.
-   Detailed `OPENF` flags beyond `OF%RD`, `OF%WR`, and `OF%THW`.
-   Detailed `.CMIFI` interaction with COMND.

------------------------------------------------------------------------

## Related Capsules

-   `program-memory.md`
-   `comnd.md`
-   `program-memory.md`
-   `processes.md`
-   `ipcf.md`
-   `anchors.md`


<!-- projects/macro-20/domain/instruction-families.md -->

# Instruction Families (projects/macro-20/domain/instruction-families.md)

## Generator

The PDP-10 instruction set is highly regular.

Many instructions are best understood as members of instruction families
rather than as isolated operations.

A family consists of related instructions that share a common conceptual
operation while varying one or more orthogonal properties.

Learning the family allows many individual instructions to be
reconstructed from a small number of semantic rules.

------------------------------------------------------------------------

## Family-Local Grammar

Mnemonic grammars are family-local.

A mnemonic letter may describe:

-   a source form;
-   a destination form;
-   a value transformation;
-   a test relation;
-   a result width;
-   an operand placement.

Do not assume that a letter has the same meaning in unrelated families.

Instruction-family semantics begin only after effective-address
calculation has completed.

------------------------------------------------------------------------

## MOVE Family

Generator:

`MOV` + value transformation + destination form

Value transformations:

-   blank: unchanged;
-   `N`: negate;
-   `M`: magnitude;
-   `S`: swap halfwords.

Destination forms:

-   blank: memory to AC;
-   `I`: immediate value to AC;
-   `M`: AC to memory;
-   `S`: self/memory form.

The two dimensions are independent within this family.

------------------------------------------------------------------------

## TEST Family

Generator:

`T` + mask source + AC modification + skip relation

### Mask source

-   `R`: immediate right-half mask;
-   `L`: immediate left-half mask;
-   `D`: direct memory mask;
-   `S`: swapped memory mask.

### AC modification

-   `N`: no modification;
-   `Z`: zero selected bits;
-   `O`: set selected bits;
-   `C`: complement selected bits.

### Skip relation

-   blank: do not skip;
-   `N`: skip if not all selected bits are zero;
-   `E`: skip if all selected bits are zero;
-   `A`: always skip.

This generator explains families such as:

-   `TRNE`
-   `TLON`
-   `TDZA`
-   `TSC`

The exact instruction is reconstructed by selecting one value from each
dimension.

------------------------------------------------------------------------

## Relational Vocabulary

Several runtime instruction families combine an operation prefix with a
common relation suffix:

-   `G`: greater;
-   `GE`: greater or equal;
-   `E`: equal;
-   `N`: not equal;
-   `L`: less;
-   `LE`: less or equal.

Families using this vocabulary include forms of:

-   `JUMP`;
-   `SKIP`;
-   `AOJ`;
-   `SOJ`;
-   `CAI`;
-   `CAM`.

The same relation vocabulary is reused by conditional assembly
directives.

The relation keeps its meaning; the controlled action changes.

------------------------------------------------------------------------

## Boolean Family

The processor implements all sixteen Boolean functions of two one-bit
variables.

Each operation may use destination/source forms:

-   blank: memory operand, result to AC;
-   `I`: immediate operand, result to AC;
-   `M`: result to memory;
-   `B`: result to both AC and memory.

The Boolean operation and destination form are separate dimensions.

------------------------------------------------------------------------

## Shift Family

Two dimensions generate the main shift family.

### Operation

-   logical shift;
-   arithmetic shift;
-   rotate.

### Width

-   single word;
-   combined doubleword in `AC,AC+1`.

Resulting pairs include:

-   `LSH` / `LSHC`;
-   `ASH` / `ASHC`;
-   `ROT` / `ROTC`.

------------------------------------------------------------------------

## Fixed Arithmetic Destination Grammar

`ADD`, `SUB`, and `IMUL` share a destination grammar:

-   blank: memory operand, result to AC;
-   `I`: immediate operand, result to AC;
-   `M`: result to memory;
-   `B`: result to both AC and memory.

This regularity does not imply that every arithmetic family supports the
same complete matrix.

------------------------------------------------------------------------

## Width Hierarchy

Multiplication:

-   `IMUL`: one-word result;
-   `MUL`: doubleword result;
-   `DMUL`: four-word result.

Division:

-   `IDIV`: single-word dividend, quotient and remainder;
-   `DIV`: doubleword dividend;
-   `DDIV`: four-word dividend divided by a doubleword divisor.

Width is part of the family structure, but output placement may
introduce irregularities.

------------------------------------------------------------------------

## Floating Arithmetic Grammar

Single precision:

`F` + operation + optional rounding + destination form

Double precision:

`DF` + operation

Operations:

-   `AD`;
-   `SB`;
-   `MP`;
-   `DV`.

------------------------------------------------------------------------

## Reconstruction Strategy

When encountering an unfamiliar instruction:

1.  Identify its instruction family.
2.  Determine which family dimensions vary.
3.  Apply the accepted family generator.
4.  Check whether the family has known irregularities.
5.  Verify any exact local semantics that affect correctness.

Generators reconstruct structure.

Exact local semantics may still require anchors, documentation, or
experiment.

------------------------------------------------------------------------

## Relationship to Anchors

Instruction-family generators explain structural regularity.

Anchors preserve exact semantic distinctions where nearby instructions
can easily be confused.

Examples include:

-   similar mnemonics with different destinations;
-   family-local meanings of mnemonic letters;
-   instructions whose behaviour cannot safely be inferred from the
    family alone.

------------------------------------------------------------------------

## Conceptual Model

``` text
Instruction
      ↓
Identify family
      ↓
Select family dimensions
      ↓
Recover general behaviour
      ↓
Check irregularities and anchors
```

Instruction families generate structure.

Anchors constrain exact behaviour.

------------------------------------------------------------------------

## Boundaries

Current project knowledge does **not** establish:

-   every PDP-10 instruction family;
-   every mnemonic variant;
-   a universal meaning for mnemonic letters;
-   complete regularity within every family;
-   undocumented monitor or processor extensions.

Do not infer exact behaviour solely from mnemonic similarity.

------------------------------------------------------------------------

## Open Questions

-   Minimum useful family set for reliable reconstruction.
-   Which specialised instructions deserve their own generators.
-   Which semantic distinctions should remain anchors permanently.
-   Exact irregularities in memory-result division forms.

------------------------------------------------------------------------

## Related Capsules

-   `addressing.md`
-   `arithmetic.md`
-   `blt.md`
-   `anchors.md`

---



<!-- projects/macro-20/domain/ipcf.md -->

# IPCF (projects/macro-20/domain/ipcf.md)

## Generator

The InterProcess Communication Facility exchanges queued message packets
between cooperating processes.

IPCF is asynchronous.

The sender places a packet in the receiver's input queue.

The receiver consumes it later.

---

## IPCF Identity

Each participating process uses a system-assigned IPCF Process Identifier.

An IPCF PID is distinct from a JOB number, terminal number, relative fork
handle, or JFN.

---

## Message Flow

```text
sender
  ↓ MSEND
receiver input queue
  ↓ MRECV
receiver
```

The sender and receiver do not execute in lockstep.

---

## Reception

A receiver may poll with `MRECV` or request a software interrupt when a
packet arrives.

Notification does not replace `MRECV`; it announces queued input.

---

## Packet Descriptor

Accepted fields include:

- `.IPCFL` — flags;
- `.IPCFS` — sender PID;
- `.IPCFR` — receiver PID;
- `.IPCFP` — message length,,message address;
- `.IPCFD` — sender user number;
- `.IPCFC` — sender capabilities;
- `.IPCSD` — sender connected directory;
- `.IPCAS` — sender account-string pointer;
- `.IPCLL` — sender node-name pointer.

The monitor supplies sender context for received packets.

---

## Arm's-Length Cooperation

IPCF supports cooperation between processes that need not fully trust one
another.

Routing and sender context are explicit.

Applications and subsystems still define the payload protocol.

The generic IPCF envelope must be kept distinct from subsystem-specific
message layouts.

---

## QUASAR Example

The verified Small Executive `QUEUE` command:

1. obtains QUASAR's PID;
2. creates its own IPCF PID;
3. sends a list-queues request;
4. receives one or more replies;
5. rejects non-QUASAR senders;
6. outputs returned text;
7. tests `WT.MOR` for further packets.

---

## Verified Implementation Corrections

Some `QSRMAC.UNV` files omit `.OFLAG`.

Verified compatibility definition:

```asm
IFNDEF .OFLAG,.OFLAG==.OHDRS-2
```

For `MRECV`, the receive length and address belong in `.IPCFP`.

Gorin's published `.IPCFD` form produced:

`?Error: Invalid message size`

Changing it to `.IPCFP` produced correct QUASAR output.

On the tested system, `.MUCRE` requires IPCF or WHEEL capability.

---

## Shared File Pages

Processes in independent JOBs that trust one another may communicate
through shared file pages.

Each process:

- agrees on the file;
- has read and write permission;
- opens it with `OF%RD`, `OF%WR`, and `OF%THW`;
- maps the same file pages into its own address space.

The virtual page numbers need not match.

Writes by one process are visible to the other.

---

## Frozen and Thawed Access

Normal writable access is frozen and permits one writer.

`OF%THW` requests thawed access.

Thawed access permits multiple simultaneous writers only when every
writer requests it.

Frozen and thawed writable opens exclude one another.

Thawed access permits concurrent writers but does not supply
synchronization or locking.

---

## Communication Choice

```text
Arm's-length cooperation
    → IPCF packets, identity, queues

Mutual trust
    → shared thawed file pages, shared state
```

---

## Boundaries

Current project knowledge does **not** establish:

- complete `MUTIL` semantics;
- PID cleanup conventions;
- queue limits;
- complete software-interrupt integration;
- QUASAR's full protocol;
- synchronization for shared writers;
- all version-specific security policy.

Do not substitute fork handles for IPCF PIDs.

Do not place the receive descriptor in `.IPCFD`.

Do not infer that `OF%THW` supplies locking.

---

## Open Questions

- PID deletion and cleanup.
- Software-interrupt integration.
- Synchronization patterns for shared pages.
- Other subsystem IPCF protocols.

---

## Related Capsules

- `processes.md`
- `program-memory.md`
- `files-and-jfns.md`
- `comnd.md`
- `anchors.md`

---


<!-- projects/macro-20/domain/jsys.md -->

# JSYS Domain Index

## Purpose

This file is the compact entry point for the JSYS domain.

It should be included in the generated `macro-20.md` project prompt.

The detailed capsules live under:

```text
projects/macro-20/domain/jsys/
```

They are intended for selective inspection when work enters the relevant
part of the TOPS-20 monitor interface.

The objective is to preserve a compact conceptual map without loading the
entire monitor-call reference model into every session.

---

## Deferred domain

Detailed JSYS material is stored under:

`projects/macro-20/domain/jsys/`

This branch uses the repository's Deferred Domain Activation mechanism.

Before retrieving detailed JSYS capsules for the first time in a session,
request and read:

`deferred-domain-activation.md`

For branch organization or maintenance, request:

`projects/macro-20/domain/jsys/about-this-domain.md`

---

## Status

The material in this directory was mined from the **TOPS-20 Monitor Calls
Reference Manual**, TOPS-20 Version 7.0, revised November 1990.

It is currently:

- documentation-derived candidate domain knowledge;
- consistent with the accepted MACRO-20 project model where overlap exists;
- not automatically promoted into Project State;
- subject to refinement through use, comparison with existing capsules,
  and verified programs.

The reference manual is authoritative for exact documented local
semantics, but it assumes prior familiarity and is not itself a conceptual
tutorial.

---

## Central Model

A TOPS-20 monitor call is a structured transition between user code and
the monitor:

```text
prepare arguments in accumulators and/or argument blocks
                         ↓
                     execute JSYS
                         ↓
              monitor performs a service
                         ↓
             return through defined paths
                         ↓
       receive results in accumulators or storage
```

Monitor calls should be understood through:

- their argument model;
- the designators and handles they accept;
- their return-control convention;
- their resource lifecycle;
- the subsystem to which they belong;
- exact local semantics established by documentation or experiment.

---

## Detailed Capsules

### `jsys-interface.md`

The common monitor-call interface: accumulators, argument blocks,
returned data, symbolic call names, and monitor entry.

### `monitor-designators.md`

The typed designators used to identify memory, strings, files, devices,
processes, pages, sections, and other monitor-visible objects.

### `monitor-resource-lifecycles.md`

The recurring separation between identifying, acquiring, activating,
using, closing, and releasing monitor resources.

### `jsys-return-model.md`

Return paths, error handling, and the principle that control flow is part
of the monitor-call interface.

### `jsys-functional-families.md`

The major conceptual families into which the monitor calls cluster.

### `jsys-anchors.md`

Documentation-derived facts selected to prevent nearby inference drift.

### `reset.md`

The process-wide cleanup semantics of `RESET`, preserved separately
because its breadth is easy to underestimate from small example programs.

### `jsys-boundaries.md`

Limits on safe reconstruction from the common JSYS model.

---

## Use

Read this index during initial reconstruction.

Inspect detailed capsules only when needed for:

- program construction;
- exact JSYS-family reasoning;
- diagnosing a local semantic uncertainty;
- evaluating a candidate generator or anchor;
- extending a verified reference program.

Do not infer exact AC layouts, flag meanings, return conditions, or
designator encodings from this index alone.

---

Detailed branch organization:

If repository organization or restructuring becomes relevant,
retrieve:

    projects/macro-20/domain/jsys/about-this-domain.md
	
---


<!-- projects/macro-20/domain/luuos.md -->

# LUUOs (projects/macro-20/domain/luuos.md)

## Generator

Local Unimplemented User Operations (LUUOs) let a program define
application-specific instructions.

The processor supplies the dispatch mechanism.

Software defines the operation, calling convention, and semantics.

The opcode identifies the local operation.

The resolved effective address supplies the operand or argument location.

---

## Processor Mechanism

When a LUUO executes:

1. the processor calculates the effective address;
2. a normalized instruction image is stored at location `40`;
3. the saved image preserves the opcode and AC fields;
4. the indirect and index fields are cleared;
5. the address field is replaced by the resolved effective address;
6. the processor executes the instruction at location `41` as though
   through `XCT 41`.

The processor does not interpret the local opcode beyond invoking this
mechanism.

---

## Software Responsibility

The LUUO handler is responsible for:

- preserving any required accumulator state;
- recovering the opcode, AC field, and effective address;
- validating the local opcode;
- dispatching to the selected operation;
- defining argument conventions;
- performing the operation;
- restoring state;
- returning to the instruction following the LUUO.

The CPU supplies entry.

Software supplies meaning.

---

## Interface Construction

`OPDEF` may assign symbolic instruction-like names to LUUO operations.

Accepted examples from Gorin's worked program include:

- `ERROR`;
- `TTYSTR`;
- `TTYCHR`.

The main program can then use these names as compact application-level
interfaces.

This creates a local instruction vocabulary without changing the
processor's hardware instruction set.

---

## Dispatch Pattern

The accepted handler pattern is:

```text
LUUO executed
      ↓
effective address resolved
      ↓
instruction image saved at 40
      ↓
control transferred through 41
      ↓
handler preserves state
      ↓
opcode decoded
      ↓
software dispatch table
      ↓
selected operation
      ↓
state restored
      ↓
return to following instruction
```

Dispatch tables make the relationship between local opcodes and software
handlers explicit and maintainable.

---

## Invariants

- Effective-address calculation occurs before handler entry.
- The processor does not define the local operation's semantics.
- The processor does not automatically save accumulators for the handler.
- The handler receives a normalized instruction image rather than the
  original unresolved addressing fields.
- Software defines the calling convention.
- Return must continue with the instruction following the LUUO.

---

## Cost Model

LUUOs are more expensive than ordinary subroutine calls.

They should normally justify their overhead by providing a substantial
operation or a useful application-level interface.

Their value is architectural and organisational, not raw execution speed.

---

## Relationship to Subroutines

A subroutine call transfers control directly according to a calling
convention.

A LUUO presents an instruction-like interface and reaches software
through the processor's local-opcode dispatch mechanism.

Both may ultimately execute ordinary software.

They differ in how the interface is encoded and entered.

---

## Relationship to Monitor Calls

LUUOs are local, program-defined operations.

TOPS-20 JSYS calls invoke monitor services.

Do not equate the two merely because both can look instruction-like at
the source level.

---

## Conceptual Model

```text
Application instruction vocabulary
              ↓
            OPDEF
              ↓
          Local opcode
              ↓
      Processor LUUO mechanism
              ↓
       Software dispatcher
              ↓
      Application-defined semantics
```

The processor creates the doorway.

The program decides what lies behind it.

---

## Boundaries

Current project knowledge does **not** establish:

- a universal LUUO calling convention;
- typical opcode allocation conventions across real programs;
- every handler save/restore pattern;
- interaction with later asynchronous facilities;
- whether later Gorin chapters introduce stronger design conventions.

Do not infer TOPS-20 monitor-call semantics from the LUUO model.

Do not assume the processor preserves application state beyond the
documented dispatch mechanism.

---

## Open Questions

- Common argument conventions used by real MACRO-20 programs.
- Common patterns for allocating local opcodes.
- Further design lessons from Gorin's complete worked example.
- Interaction with traps, pseudo-interrupts, or process facilities if
  later documentation connects them.

---

## Related Capsules

- `addressing.md`
- `instruction-families.md`
- `macros.md`
- `source-organization.md`
- `anchors.md`

---



<!-- projects/macro-20/domain/macro-20-anchors.md -->

# MACRO-20 Anchors

## Purpose

Preserve a minimal set of exact semantic, structural, and behavioural
facts that constrain reconstruction of the MACRO-20 and TOPS-20
programming model.

These anchors complement the domain generators.

They are not an instruction reference, JSYS reference, or substitute for
the project documentation.

Each anchor exists because losing the distinction could permit a nearby
but incorrect reconstruction.

---

## Instruction Semantics

### SETO and SETM distinction

`SETO` produces a word containing all ones, which represents `-1` in
36-bit two's-complement arithmetic.

`SETOM address` stores that all-ones value in memory at `address`.

`SETM AC,address` loads the contents of memory at `address` into `AC`.

If the AC field is omitted, the instruction uses AC0.

Therefore:

```asm
SETOM UDFLAG
```

sets `UDFLAG` to `-1`, while:

```asm
SETM UDFLAG
```

does not modify `UDFLAG`.

#### Provenance

A transcription error in the verified Small Executive program changed
`SETOM UDFLAG` to `SETM UDFLAG`.

The resulting `COUNT DOWN` command counted upward because the negative
direction flag was never established.

#### Guarded distinction

Do not infer the meaning of a SET-family instruction from the shared
`SET` prefix alone. The remaining mnemonic letters determine whether the
instruction generates a canonical value, copies an operand, and whether
the destination is an accumulator, memory, or both.

---

### Numeric radix

Unmarked numeric constants normally use the assembler's prevailing
radix.

`^D` marks a numeric constant as decimal.

Verified experimentally:

```asm
TABLE: BLOCK ^D100
```

allocates 100 decimal words.

#### Guarded distinction

Do not interpret an unmarked constant as decimal merely because its
printed digits resemble an ordinary decimal number.

---

### Byte-string copying

`ILDB` loads a byte through a byte pointer and advances the pointer.

`IDPB` deposits a byte through a byte pointer and advances the pointer.

A null-terminated string-copy loop can therefore be formed from:

```asm
COPYST: ILDB A,SOURCE
        JUMPE A,RETURN
        IDPB A,DESTINATION
        JRST COPYST
```

The terminating null need not be copied if the destination is terminated
separately before output.

#### Provenance

Accepted from Gorin's `COPYST` routine and its use with the verified
line-buffer output pattern.

---

## Effective Addressing and Data Layout

### One-dimensional arrays

A one-dimensional word array occupies contiguous memory.

An operand such as:

```asm
ACCUM(C)
```

uses ordinary indexed effective-address calculation to select the
element at offset `C` from `ACCUM`.

No special array instruction is involved.

#### Provenance

Verified in the working factorial program, where the array is traversed
forward during multiplication and backward during output.

---

### Multidimensional arrays

A multidimensional array is mapped onto linear memory.

Accepted addressing techniques introduced by Gorin are:

- a side table containing row or column origins;
- an address polynomial computed from the indices and dimensions.

Both techniques ultimately produce the effective address of the selected
element.

#### Guarded distinction

Row-major and column-major layout are representation choices. Neither is
an intrinsic property of the PDP-10 addressing mechanism.

---

### Record field offsets

During `PHASE n`, labels receive values from the phase location counter
while assembled words are placed using the ordinary storage location
counter.

`DEPHASE` restores normal location counting.

`.ORG address` resets assembly location so temporary layout words may be
overwritten.

This permits symbolic record-field offsets to be generated without
retaining the temporary prototype storage in the final program.

#### Provenance

Accepted from Gorin's dictionary-record definition using `PHASE 0`,
`DEPHASE`, and `.ORG DEFS`.

#### Guarded distinction

A field symbol produced under `PHASE 0` is an offset, not the runtime
address of a record field.

---

## LUUO semantic anchors

- PDP-10 reserves opcodes 001–037 (octal) for LUUOs.
- Before dispatching an LUUO, the processor completes effective-address 
  calculation.
- LUUO dispatch does not modify accumulators.
- The processor stores a normalized instruction image at location 40:
  - opcode and AC fields preserved;
  - index field cleared;
  - address field replaced by the resolved effective address.
- The instruction at location 41 is executed via XCT.
  Consequently, the return PC established by JSR/PUSHJ refers to the 
  instruction following the LUUO.
- The processor dispatches the LUUO but does not interpret it.
  Opcode decoding and operation semantics are entirely the responsibility
  of the LUUO handler.

### Guarded distinction

Do not infer that the processor interprets local operations or preserves the original instruction unchanged. LUUO dispatch normalizes the instruction and transfers control; all interpretation belongs to the handler.

---

## File and JFN Semantics

### JFN identity and access

`GTJFN` associates a pathname with a Job File Number.

Obtaining a JFN identifies the file.

`OPENF` separately establishes access characteristics such as byte size
and read or write access.

Most subsequent file operations use the JFN rather than the pathname.

#### Guarded distinction

Do not treat `GTJFN` as opening the file or assume that pathname syntax
determines the eventual access mode.

---

### JFN location

For ordinary file JSYS use, the JFN is carried in the right half of AC1.

A returned word may also contain flags, so code may isolate the JFN with
a right-half operation such as:

```asm
HRRZ A,SAVED-JFN
```

#### Provenance

Observed in Gorin's verified file-output example.

---

### String output

For `SOUT`:

- AC1 identifies the output JFN;
- AC2 contains the source byte pointer;
- AC3 controls the count or termination rule.

With AC3 equal to zero, output continues until a null byte.

The same operation works with `.PRIOU` and with an ordinary disk-file
JFN.

#### Provenance

Verified on TOPS-20 using both terminal output and file output.

---

### String input

For `SIN`:

- AC1 identifies the source JFN;
- AC2 contains the destination byte pointer;
- AC3 supplies a count and selects the stopping rule;
- AC4 supplies a break character when AC3 is positive.

A negative AC3 requests a fixed-length transfer.

A positive AC3 permits termination either when the count is exhausted or
when the AC4 break character is encountered.

After the call, AC3 moves toward zero by the number of characters
transferred.

#### Guarded distinction

AC3 is both an input limit and a residual-count result.

---

### File mapping

`PMAP` can associate pages of an open file with pages in a fork's virtual
address space.

Mapped data is subsequently accessed using ordinary memory references.

TOPS-20 pages contain 512 words, so page-aligned word addresses are
multiples of octal `1000`.

Copy-on-write mapping permits private modification without modifying the
mapped file.

#### Guarded distinction

Stream I/O and mapped I/O are alternative access models over files; a
mapped file page is not transferred through `SIN` or `SOUT` for each
memory reference.

---

## COMND Structure

### One field per call

Each `COMND` call parses one command field.

A complete command is processed through a sequence of calls, each
advancing through the command grammar.

#### Guarded distinction

COMND does not merely tokenize and return an entire command-line argument
vector.

---

### Command state block

The caller-supplied command state block preserves the continuing parsing
dialogue.

It contains, among other state:

- input and output JFNs;
- prompt or reprompt pointer;
- beginning of editable input;
- pointer to the next field to parse;
- free-space count;
- unparsed-character count;
- atom-buffer pointer and size;
- GTJFN argument-block address;
- application reparse address.

The command buffer holds the continuing command text.

The atom buffer receives the current parsed field.

---

### Function descriptor blocks

A Function Descriptor Block describes a field COMND may parse.

Its accepted structure contains:

- `.CMFNP`: function code, function flags, and alternate-FDB address;
- `.CMDAT`: function-specific data;
- `.CMHLP`: field help pointer;
- `.CMDEF`: default-string pointer;
- `.CMBRK`: optional break-mask pointer.

`FLDDB.` constructs an FDB.

Alternative FDBs permit one position in the command grammar to accept
different field types.

---

### COMND return convention

COMND normally returns `+1`.

On return:

- AC1 contains status flags in its left half and the command-state-block
  address in its right half;
- AC2 contains data produced by the parsed field, or an error code when
  `CM%NOP` is set;
- AC3 contains the address of the first supplied FDB in its left half and
  the address of the FDB actually used in its right half.

If reparsing is required and the right half of `.CMFLG` is nonzero,
COMND transfers control to the supplied reparse address instead of
returning normally.

#### Provenance

TOPS-20 Monitor Calls Reference Guide, December 1982, COMND JSYS 544.

#### Guarded distinction

For chained alternatives, RH(AC3), not the original FDB address, tells
the application which descriptor accepted the field.

---

### Reparse ownership

COMND preserves and restores textual parse state.

The application supplies a reparse entry point that restores its own
control state.

The verified Small Executive saves a known pushdown-list pointer and
restores it at the reparse entry:

```asm
MOVEM P,SAVPDL
CMRPRS: MOVE P,SAVPDL
```

#### Guarded distinction

Reparsing may abandon a partially executed application control path; it
is not merely a request to rescan characters.

---

### Keyword tables

A COMND keyword table contains an entry count, maximum size, and entries
consisting of:

- a left-half pointer to keyword text or a flagged keyword descriptor;
- right-half application data.

The application data commonly contains a command-server address.

Flagged keyword descriptors must include `CM%FW` to identify their
extended format.

Accepted keyword flags include:

- `CM%ABR`: the entry is an explicit abbreviation of another entry;
- `CM%NOR`: do not recognize this string;
- `CM%INV`: recognize the entry but suppress it from `?` help output.

#### Guarded distinction

A COMND keyword table carries recognition policy as well as a
string-to-handler relationship.

---

### Interactive field behaviour

Observed in the verified Small Executive session:

- `?` displays help for the field currently expected;
- `ESC` performs recognition or completion for that field;
- completion may select a default;
- completion may emit noise words;
- after help, COMND redraws the current command and resumes at the same
  field;
- confirmation is itself an explicitly parsed field.

Noise words improve readability but do not provide application data.

---

### Filename fields

A `.CMIFI` field can parse an input-file specification and return a JFN
for subsequent use by `OPENF`.

#### Provenance

Verified in the Small Executive `TYPE` command.

#### Guarded distinction

The application does not necessarily receive filename text and then call
`GTJFN` itself; COMND file-field functions can integrate command parsing
with JFN acquisition.

---

## Behavioural Invariants

### COUNT direction

For the verified Small Executive counting algorithm:

```text
count upward   => UDFLAG is zero initially, then becomes the upper bound
count downward => UDFLAG is -1 before the counting loop
```

The downward loop negates the starting value and counts upward through
negative values toward `-1`, printing each magnitude.

Any implementation of the DOWN handler must therefore establish:

```text
UDFLAG < 0
```

before the direction test.

---

### Command completion

Before a command server performs its semantic operation, it should parse
confirmation when no additional fields are permitted.

Successful confirmation means no unparsed command fields remain.

---

### File cleanup

A command that acquires a JFN must either close or otherwise release it,
including along error paths where applicable.

The Small Executive records the `TYPE` command's active input JFN so that
it can close stale or completed file state deliberately.

---

## Reference Anchors

### Small Executive

`comnd-reference-program.md` is the verified architectural reference for
a COMND-based application.

It demonstrates the composition of:

- command-state initialization;
- reparsing;
- FDBs and FDB alternatives;
- keyword tables and keyword policies;
- command dispatch;
- noise words;
- defaults;
- confirmation;
- numeric fields;
- input-file fields;
- JFN-based file access;
- ordinary and fatal error handling;
- resource cleanup.

The reference program anchors composition. It does not replace the
individual generators or semantic anchors.

---

### Factorial program

The verified factorial program anchors:

- one-dimensional arrays;
- indexed effective addressing;
- contiguous initialization with `BLT`;
- byte-pointer string construction;
- multiprecision arithmetic represented as decimal digits.

The multiprecision algorithm is an example, not a general MACRO-20
generator.

---


## Process Semantics

### JOB and process distinction

A process or fork is the independently scheduled executable entity.

A JOB organizes a hierarchy of processes.

#### Guarded distinction

Do not describe a JOB as though it were itself the scheduled execution
context. Programs execute in processes.

---

### Relative fork handles

A returned fork handle identifies an inferior relative to the superior
that received it.

Different superiors may hold the same numeric relative handle for
different inferiors.

#### Guarded distinction

Do not treat relative fork handles as system-wide process identifiers.

---

### Process construction is decomposed

`CFORK`, `GET`, and `SFRKV` perform distinct roles:

- `CFORK` constructs and initializes a process;
- `GET` installs a program image and process metadata;
- `SFRKV` starts execution through an entry-vector offset.

`GET` never loads accumulators.

#### Guarded distinction

Do not collapse process creation, executable loading, accumulator
initialization, and starting execution into one implicit operation.

---

### Shared maps

`CR%MAP` shares the superior's mapped pages with the inferior.

Changes made by either process are visible to the other.

#### Guarded distinction

Do not reconstruct `CR%MAP` as a one-time copy.

---

## IPCF and Shared-File Semantics

### IPCF PID versus fork handle

An IPCF PID is used by IPCF routing.

A relative fork handle identifies a process within a superior's fork
namespace.

These are distinct naming systems.

---

### IPCF receive descriptor field

For `MRECV`, the receive message length and address belong in `.IPCFP`.

`.IPCFD` is the sender user-number field filled by the monitor.

#### Provenance

Gorin's published `QUEUE` server stores the receive descriptor in
`.IPCFD`.

This produced `?Error: Invalid message size`.

Changing the field to `.IPCFP` produced correct QUASAR output.

---

### QUASAR output flag compatibility

Some distributed `QSRMAC.UNV` files define `.OHDRS` and `WT.MOR` but omit
`.OFLAG`.

The verified compatibility definition is:

```asm
IFNDEF .OFLAG,.OFLAG==.OHDRS-2
```

#### Provenance

`.OFLAG` was absent on two systems, `.OHDRS` was octal `5`, DEC GALAXY
layout placed `.OFLAG` two words before `.OHDRS`, and the definition was
verified by successful queue output.

---

### Frozen and thawed writable access

Normal writable access is frozen and permits one writer.

Thawed writable access permits multiple simultaneous writers only when
every writer requests `OF%THW`.

Frozen and thawed writable opens exclude one another.

#### Guarded distinction

One process requesting `OF%THW` does not thaw access for the others.

---

## Maintenance

Add an anchor when a verified failure, recurring ambiguity, or close
semantic alternative demonstrates that a generator can drift.

For each candidate anchor, ask:

- Which incorrect reconstruction does it prevent?
- Is the distinction load-bearing?
- Is it smaller than the documentation needed to recover it?
- Does it constrain future reasoning beyond one isolated example?

Record provenance when a specific failure motivated the anchor.

Merge overlapping anchors.

Remove anchors that cease to constrain plausible inference.

Do not expand this file toward comprehensive instruction or JSYS
coverage.


<!-- projects/macro-20/domain/macros.md -->

# Macros (projects/macro-20/domain/macros.md)

## Generator

MACRO-20 macros transform assembly source into assembly source during
assembly.

They do not execute at program runtime.

A macro packages a source-generation rule so that one accepted
relationship can produce many consistent pieces of assembled code or
data.

---

## Definition and Expansion

Accepted forms include:

```asm
DEFINE NAME <BODY>
```

and:

```asm
DEFINE NAME (ARGUMENTS) <BODY>
```

When the macro is invoked:

1. actual arguments are associated with formal parameters;
2. the macro body is expanded;
3. the resulting source is assembled normally.

The expansion is therefore part of assembly-time source construction,
not a runtime call.

---

## Parameters

Macro parameters allow one source pattern to be reused with different
values or source fragments.

Angle brackets delimit macro text and protect arguments that contain
characters such as commas.

The current project model establishes substitution at a conceptual level.

It does not yet establish the complete rescan, quoting, or nested
delimiter semantics of the macro processor.

---

## Conditional Assembly

Conditional assembly selects whether source is included during assembly.

Accepted relation tests include:

- greater;
- greater or equal;
- equal;
- not equal;
- less;
- less or equal.

These reuse the same relation vocabulary found in runtime JUMP and SKIP
families.

The relation keeps its meaning.

The controlled action changes from runtime control flow to assembly-time
source inclusion.

`IFNDEF` may provide a default definition when a symbol has not already
been defined.

---

## Relationship Generation

A macro may preserve one relationship and emit several synchronized
representations.

Gorin's accepted `OPMAC` / `XX` pattern demonstrates this:

1. operator and instruction pairs are written once;
2. `XX` is defined to emit the operator representation;
3. the relationship is expanded to generate `OPTAB`;
4. `XX` is redefined to emit the instruction representation;
5. the same relationship is expanded to generate `OPINS`;
6. the selected instruction is later executed through `XCT`.

This avoids maintaining parallel tables independently.

The general generator is:

```text
One accepted relationship
          ↓
Different macro interpretations
          ↓
Several synchronized artefacts
```

This is one powerful use of macros, not the defining purpose of every
macro.

---

## Interface Construction

Macros may also hide repeated source-level protocol.

Accepted examples include:

- `CALL` and `RET` operation definitions;
- COMND helpers such as `NOISE` and `CONFIRM`;
- table-construction helpers such as `TBL`;
- symbolic instruction interfaces created with `OPDEF`.

The value of such macros is not merely shorter source.

They preserve a repeated structural rule in one place.

---

## Conceptual Model

```text
Source relationship
        ↓
Macro definition
        ↓
Invocation and substitution
        ↓
Generated source
        ↓
Normal assembly
```

Macros generate source structure.

The assembler then interprets the generated source exactly as though it
had been written directly.

---

## Boundaries

Current project knowledge does **not** establish:

- exact nested-angle-bracket rules;
- quoting rules;
- complete rescanning behaviour;
- expansion order in complex nested macros;
- redefinition semantics in all cases;
- the exact boundary between textual substitution and assembler
  expression evaluation.

Do not infer these local semantics from the high-level source-generation
model.

---

## Open Questions

- Nested delimiters.
- Argument substitution details.
- Rescanning.
- Macro redefinition.
- Expansion order.
- Emitted-source inspection and listing behaviour.

---

## Related Capsules

- `instruction-families.md`
- `source-organization.md`
- `luuos.md`
- `comnd.md`
- `anchors.md`


<!-- projects/macro-20/domain/processes.md -->

# Processes (projects/macro-20/domain/processes.md)

## Generator

A TOPS-20 process or fork is an independently scheduled execution
environment.

A JOB organizes a hierarchy of processes.

The process and the program image it executes are distinct.

TOPS-20 therefore constructs, populates, and starts a process through
separate mechanisms.

---

## Process Components

Each process has its own virtual address space, accumulators, program
counter, and execution state.

A process may exist before a program image has been installed or before
execution has begun.

---

## JOB Hierarchy

A JOB contains a hierarchy of superior and inferior processes.

The usual interactive JOB has an EXEC at the top level. Programs such as
EMACS, Lisp systems, pushed EXECs, and application programs may occupy
inferior processes.

TOPS-20 schedules processes rather than whole JOBs.

---

## Fork Handles

A relative fork handle is meaningful within the superior that receives it.

Different superiors may receive the same numeric handle for different
inferiors.

Predefined handles express structural relationships:

- `.FHSLF` — current process;
- `.FHSUP` — immediate superior;
- `.FHTOP` — top-level process;
- `.FHSAI` — current process and all inferiors;
- `.FHINF` — all inferiors;
- `.FHJOB` — all processes in the JOB.

---

## Process Construction

`CFORK` creates an inferior process.

Accepted construction choices include:

- `CR%MAP` — share the superior's map;
- `CR%CAP` — copy capabilities;
- `CR%ACS` — initialize accumulators from a supplied block;
- `CR%ST` — supply a PC and start immediately.

Without `CR%MAP`, the process initially has no mapped pages.

Without `CR%ACS`, its accumulators are zero.

Without `CR%ST`, it is not started.

`CR%MAP` shares pages rather than copying them.

---

## Program Image Installation

`GET` copies or maps a save file into an existing process.

Sharable files are mapped.

Nonsharable files are copied.

`GET` updates the entry vector and PDVA list.

`GET` never loads accumulators.

---

## Entry Vector

The accepted initial entry-vector words are:

1. program start instruction;
2. program reenter instruction;
3. program version word.

Additional words may contain entry-specific data.

`SFRKV` starts a process through an offset in the entry vector.

---

## Program Data Vectors

LINK writes Program Data Vectors into program memory.

The monitor retains Program Data Vector Addresses rather than complete
PDVs.

Other programs may obtain PDVAs through `PDVOP%` and then inspect the
program-owned metadata.

The entry vector and PDVA list are distinct save-file structures.

---

## Execution Lifecycle

```text
CFORK
   ↓
GET and/or PMAP
   ↓
SFRKV
   ↓
execution
   ↓
WFORK
   ↓
KFORK
```

Higher-level facilities such as `PUSH` and `CRJOB` compose these
mechanisms.

---

## Virgin and Execute-Only Processes

A new JOB's top-level process is virgin.

An execute-only file may be mapped only into a virgin process.

A process may also become execute-only by sharing the map of an
execute-only superior.

The detailed security rationale remains incomplete.

---

## Boundaries

Current project knowledge does **not** establish:

- complete capability semantics;
- every execute-only restriction;
- exact JOB/FORK/JFN ownership;
- all process-state manipulation JSYSes;
- scheduler policy.

Do not treat relative fork handles as global PIDs.

Do not assume `GET` initializes accumulators.

Do not collapse JOB, process, and executable image into one object.

---

## Open Questions

- Exact JOB/FORK/JFN ownership.
- Detailed capability inheritance and enabling.
- Complete execute-only restrictions.
- Interaction with traps, PSI, and asynchronous control transfer.

---

## Related Capsules

- `program-memory.md`
- `files-and-jfns.md`
- `ipcf.md`
- `comnd.md`
- `anchors.md`

---


<!-- projects/macro-20/domain/program-memory.md -->

# Program Memory (projects/macro-20/domain/program-memory.md)

## Generator

A TOPS-20 program executes within a virtual address space.

Program code, data, stack, dynamically allocated storage, and mapped
file pages all occupy locations within this address space.

Different mechanisms establish these regions, but ordinary memory
references access them uniformly.

------------------------------------------------------------------------

## Program Layout

The loaded program occupies the lowest portion of the address space.

Accepted components include:

-   executable code;
-   static data;
-   literal pools;
-   pushdown lists (stacks).

The linker supplies information describing the loaded image.

------------------------------------------------------------------------

## Available Storage

The linker maintains `.JBSA`.

Accepted working model:

-   right half: program starting address;
-   left half: first free location above the loaded program.

Programs may use the first free address as the beginning of dynamically
allocated storage.

Current project knowledge does not yet establish a general-purpose
memory allocator.

------------------------------------------------------------------------

## Address Space

Memory is viewed as one linear sequence of PDP-10 words.

Arrays, records, stacks and mapped pages all occupy ordinary addresses.

Once an address has been established, the instruction set does not
distinguish how that storage was obtained.

------------------------------------------------------------------------

## Memory Mapping

`PMAP`

associates pages of an open file with pages in a fork's virtual
address space.

After mapping, the program accesses the file contents using ordinary
memory references.

No explicit read operation is required for each word.

------------------------------------------------------------------------

## Page Model

Accepted project knowledge:

-   TOPS-20 pages contain 512 words.
-   Page boundaries occur at addresses that are multiples of octal
    `1000`.
-   Several consecutive pages may be mapped by one PMAP request.

------------------------------------------------------------------------

## Copy-on-Write

PMAP may request copy-on-write access.

Reads access the original mapped page.

The first write creates a private copy.

Subsequent writes affect only the private page.

The underlying file remains unchanged.

------------------------------------------------------------------------

## Shared File Pages

Processes in independent JOBs may map the same writable file pages into
their own virtual address spaces.

The process page numbers need not match.

Both mappings refer to the same underlying file pages.

When the file is opened for thawed writable access, writes by one process
are visible through the other process's mapping.

Every participating writer must request `OF%THW`.

This provides shared memory for cooperating processes that deliberately
trust one another.

---

## Stream versus Mapping

TOPS-20 supports two complementary access models.

### Stream I/O

Data moves explicitly between file and program through JSYSes such as:

-   `SIN`
-   `SOUT`

### Memory Mapping

The monitor establishes an address-space mapping.

The program thereafter accesses the file using ordinary load and store
instructions.

------------------------------------------------------------------------

## Conceptual Model

The accepted abstraction is:

``` text
Program address space

    executable image
            │
     static storage
            │
      dynamic storage
            │
     mapped file pages
            │
ordinary PDP-10 memory references
```

The instruction set operates on addresses.

The operating system determines what those addresses represent.

------------------------------------------------------------------------

## Boundaries

Current project knowledge does **not** establish:

-   page replacement policy;
-   cache behaviour;
-   detailed page-table structure;
-   all sharing semantics between related forks;
-   page protection beyond accepted PMAP access modes;
-   synchronization protocols for concurrent writers.

Do not infer these from other virtual-memory systems.

------------------------------------------------------------------------

## Open Questions

-   Exact relationship between FORKs and inherited/shared maps.
-   Detailed PMAP access flags beyond accepted examples.
-   Interaction between PMAP and program growth.
-   Allocation strategy beyond `.JBSA`.

------------------------------------------------------------------------

## Related Capsules

-   `addressing.md`
-   `files-and-jfns.md`
-   `records.md`
-   `processes.md`
-   `ipcf.md`
-   `anchors.md`


<!-- projects/macro-20/domain/records.md -->

# Records (projects/macro-20/domain/records.md)

## Generator

Records provide symbolic structure for heterogeneous data stored in
ordinary PDP-10 memory.

A record describes the relationship between fields.

It does not create a new runtime object.

---

## Layout Generation

Record layout is constructed during assembly.

Accepted mechanisms include:

- `PHASE`
- `.ORG`
- `DEPHASE`

These allow symbolic field offsets to be generated without allocating
storage.

The generated offsets may later be applied to any compatible record
instance.

---

## Symbolic Fields

Fields are accessed symbolically rather than by numeric offsets.

The assembler performs the offset calculation.

Programs therefore express:

- field identity;
- record structure;

instead of embedding literal addresses.

---

## Record Instances

A record definition may describe many independent instances.

Each instance shares one layout while occupying different storage.

Conceptually:

```text
Record definition
        ↓
Field offsets
        ↓
Instance base address
        ↓
Effective address
        ↓
Field
```

The layout is constant.

Only the instance base changes.

---

## Relationship to Arrays

Records organize heterogeneous fields.

Arrays organize homogeneous elements.

A program frequently combines both:

- arrays of records;
- records containing arrays.

The two abstractions are complementary.

---

## Relationship to Addressing

Record access is ultimately ordinary effective-address calculation.

The record definition contributes the field offset.

The current instance contributes the base address.

The addressing mechanism computes the final effective address.

---

## Conceptual Model

```text
Record layout
      ↓
Symbolic field
      ↓
Field offset
      ↓
Instance base
      ↓
Effective address
      ↓
Memory
```

Records generate structure rather than storage.

---

## Boundaries

Current project knowledge does **not** establish:

- variable-length record layouts;
- compiler-generated record descriptors;
- runtime type information;
- automatic alignment or padding rules.

Do not infer higher-level language record semantics from the assembly
model.

---

## Open Questions

- Common TOPS-20 library conventions for record layouts.
- Typical use of records together with dynamically allocated storage.
- Additional assembler facilities related to symbolic layout.

---

## Related Capsules

- `addressing.md`
- `arrays.md`
- `program-memory.md`
- `macros.md`
- `anchors.md`

---



<!-- projects/macro-20/domain/source-organization.md -->

# Source Organization (projects/macro-20/domain/source-organization.md)

## Generator

MACRO-20 source may be organized so that program structure is visible in
both the source text and the assembler listing.

Organizational directives do not change runtime semantics.

They preserve the human-readable structure of the program.

---

## Sections

`SUBTTL` names a major source section.

Accepted uses include separating:

- data definitions;
- top-level control;
- command servers;
- subroutines;
- error handling;
- entry and version information.

Section titles make large listings easier to navigate and preserve the
intended architecture of the source.

---

## Listing Pages

A form-feed may begin a new listing page.

This allows related source material to remain together while major
sections start cleanly in printed or generated listings.

The source file and assembler listing therefore have related but
distinct organization.

---

## Local Structure

Labels, comments, indentation, and nearby definitions should make local
relationships visible.

Accepted examples include:

- keeping storage locations together when a `BLT` depends on their
  contiguity;
- placing command tables near their dispatch logic;
- keeping a record-layout definition together;
- placing constants and helper strings near the routines that use them
  when this improves clarity.

Source order may therefore preserve semantic relationships even when the
assembler does not require that order.

---

## Reference-Program Pattern

The verified Small Executive demonstrates a useful large-program
organization:

```text
title and searches
        ↓
accumulator and macro definitions
        ↓
data storage
        ↓
top-level control and command table
        ↓
command servers
        ↓
error handling and miscellany
        ↓
entry vector and END
```

This is an accepted example, not a required universal layout.

---

## Conceptual Model

```text
Program architecture
        ↓
Source sections
        ↓
Assembler listing structure
        ↓
Human navigation and maintenance
```

Source organization externalizes the program's conceptual structure.

---

## Boundaries

Current project knowledge does **not** establish:

- a mandatory MACRO-20 source layout;
- complete listing-control semantics;
- all effects of `SALL`, `XALL`, and `LALL`;
- standard conventions across all TOPS-20 programs.

Do not infer runtime behaviour from source or listing organization.

---

## Open Questions

- Detailed listing controls and macro-expansion display.
- Common source-layout conventions in larger TOPS-20 programs.
- Entry-vector and version-layout conventions as later chapters expand
  the reference program.

---

## Related Capsules

- `macros.md`
- `records.md`
- `comnd.md`
- `luuos.md`

---



