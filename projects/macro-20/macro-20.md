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



<!-- projects/common/inference-policy.md -->

# Inference Policy (common/inference-policy.md)

## Purpose

Restore reasoning habits for maintaining domain knowledge.

-   Store generators rather than enumerations.
-   Promote generators conservatively.
-   A repeated pattern is evidence for a capability, not necessarily for the defining purpose of the mechanism.
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

# Knowledge Representation (common/knowledge-architecture.md)

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


<!-- projects/common/reasoning-constraints.md -->

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



<!-- projects/macro-20/state/project-state.md -->

# Project State

## Project

**MACRO-20 on TOPS-20**

## Objective

Develop a rigorous, testable understanding of MACRO-20, the PDP-10 architecture it exposes, and the TOPS-20 monitor interface through documentation and experiment.

## Collaboration method

- Follow the shared protocol and rationale.
- Distinguish observation, documentation, inference, hypothesis, prediction, working model, and verified conclusion.
- Prefer small experiments over attractive inference.
- Treat domain files as compact reasoning capsules: preserve generators, boundaries, and open questions rather than exhaustive lists.

## Verified environment

- Panda KLH10 running TOPS-20.
- Native MACRO-20 toolchain works.
- Verified workflow:
  - `.MAC` → `COMPILE` → `.REL`
  - `LOAD`
  - `SAVE`
  - execute with `@program`
- A missing final newline after `END` causes `?MCRNES NO END STATEMENT ENCOUNTERED`.
- Gorin explicitly states that `END` requires its own CRLF.

## Current phase

The introductory machine-architecture portion of Gorin has been covered through:

- representation and instruction format;
- effective addressing;
- movement, jumps, tests, Boolean operations;
- block transfer and shifts;
- fixed and floating-point arithmetic;
- macros and conditional assembly;
- local UUOs.

The project is moving from core machine architecture into:

- operating-system facilities;
- file I/O;
- arrays, lists, and records;
- command scanning with COMND.

## Accepted high-level model

- PDP-10 instructions are best understood as regular families generated by small grammars.
- Effective address calculation precedes instruction semantics.
- Some instructions and facilities are irregular where the underlying operation has extra outputs or state.
- MACRO-20 macros transform assembly source during assembly.
- LUUOs let a program define application-specific instructions while the processor supplies dispatch only.
- Domain knowledge is maintained separately from project state.

## Domain knowledge files

- `data-representation.md`
- `addressing.md`
- `instruction-families.md`
- `memory-operations.md`
- `arithmetic.md`
- `macros.md`
- `luuos.md`
- `source-organization.md`

## Open questions

- Hexadecimal constant syntax in MACRO-20.
- Detailed JSYS encoding.
- Processor flags: AROV, FOV, CRY0, CRY1.
- Stack instruction conventions and later procedure-linkage details.
- Byte-pointer internals.
- Exact `IDIVM` and `DIVM` remainder behavior.
- Exact floating-point bit layout where the chapter transcription was ambiguous.
- Architectural relationship between accumulators and low memory.
- Detailed macro expansion rules: nested delimiters, rescanning, redefinition, and expansion order.
- Common design patterns from Gorin's complete LUUO example beyond the handler structure already extracted.

## Next

Continue with Gorin Chapter 19, operating-system facilities, files, and JFNs. Preserve new knowledge in inference-friendly domain capsules and verify uncertain details experimentally where practical.


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

Maintenance save completed after Chapter 18 and its worked example. Ready to continue with operating-system facilities.


<!-- projects/macro-20/state/TODO.md -->

# Potential changes to protocol.md

### Candidate protocol evolution: Separate conceptual models

Observation:
Some projects appear to develop an architectural or conceptual model that is
neither accepted project state nor historical reasoning.

Hypothesis:
Introduce a fourth artefact (Mental-Model.md) if this distinction repeatedly
proves useful across multiple projects.

Evidence:
Currently observed during the MACRO-20 project.

### Candidate protocol evolution: Observable maintenance triggers

Observation:
The assistant rarely initiates maintenance based on perceived context load,
even when the protocol encourages it.

Possible reason:
Internal context utilization is not directly observable.

Hypothesis:
Maintenance recommendations should be based on observable project milestones
rather than inferred internal state.

Examples:
- accepted architectural model changes
- elimination of major competing hypotheses
- completion of a chapter or subsystem
- Project-State requires substantial revision

## Project TODO's

### Dig deeper into macro processing

Revisit MACRO-20 macro expansion semantics after the introductory chapters: nested angle brackets, argument substitution, rescanning, redefinition, and emitted source.


<!-- projects/macro-20/domain/addressing.md -->

# Addressing

## Invariant

Effective address calculation occurs before instruction semantics.

## Instruction structure

Normal instructions contain:

- opcode;
- accumulator field;
- indirect bit `I`;
- index field `X`;
- address field `Y`.

## Effective-address generator

- `X=0, I=0` → `EA=Y`
- `X≠0` → add the selected accumulator to `Y`
- `I=1` → fetch an indirect word and repeat until `I=0`

Indirection is therefore recursive, not restricted to one level.

## Immediate operands

Immediate forms use the resolved address value rather than fetching `C(E)`.

Example:

- `MOVEI AC,E` loads `0,,E`.

## JSYS calling convention

Current introductory model:

- low accumulators, normally AC1–AC4, carry JSYS arguments;
- `PSOUT` receives a byte pointer in AC1;
- `HRROI` constructs the common pointer form used in the first example.

## Boundary: effective-address stability

An instruction must not unpredictably change values needed for its own effective-address calculation.

Verified example:

- `BLT` updates its accumulator while executing;
- that accumulator must never also serve as the `BLT` index register.

## Open questions

- Byte-pointer bit structure.
- Architectural relationship between accumulators and low memory.


<!-- projects/macro-20/domain/arithmetic.md -->

# Arithmetic

## Fixed-point width model

Arithmetic scales through:

- one word;
- doubleword;
- four-word quantities.

## Multiplication

- `IMUL` keeps a one-word result and assumes the useful product fits.
- `MUL` produces the full doubleword product in `AC,AC+1`.
- `DMUL` multiplies doubleword operands and produces a four-word result.

## Division

Division naturally produces two outputs:

- quotient;
- remainder.

Placement:

- quotient begins in `AC`;
- remainder follows in `AC+1` for the documented AC-result forms.

## Boundary

The memory forms are not fully predicted by the ordinary destination grammar.

Open:

- exact `IDIVM` remainder behavior;
- exact `DIVM` remainder behavior.

## Doubleword moves

Selected doubleword MOVE operations transfer or negate consecutive word pairs rather than generating the complete single-word MOVE matrix.

## Floating point

Single precision uses one word.

Double precision uses two words, extending the fraction into the second word.

The photographed/transcribed chapter description left an apparent bit-position overlap, so exact field boundaries remain unaccepted pending verification.

## Floating instruction generator

Single precision:

`F` + operation + optional rounding + destination form

Double precision:

`DF` + operation

Operations:

- add;
- subtract;
- multiply;
- divide.

## Conversion and scaling

- `FIX`: floating to fixed without rounding.
- `FIXR`: floating to fixed with rounding.
- `FLTR`: fixed to floating with rounding.
- `FSC`: adjust the exponent by `E` and normalize.


<!-- projects/macro-20/domain/data-representation.md -->

# Data Representation

## Generator

The PDP-10 is a 36-bit, word-oriented machine.

## Integers

- Signed integers use two's complement.
- Gorin documents decimal, octal, and binary notation.
- Hexadecimal assembler syntax remains unverified.

## Character packing

Five 7-bit ASCII characters fit in one 36-bit word; the remaining bit is zero.

## ASCII and ASCIZ

- `ASCII` packs characters and zero-fills unused space in a partial final word.
- `ASCII` does not append a separate terminator when the string exactly fills the final word.
- `ASCIZ` appends a zero byte and may therefore require an additional word.

## Boundary

Do not infer byte-pointer representation from character packing alone. Byte pointers are a separate mechanism.


<!-- projects/macro-20/domain/handover-notes.md -->

# Handover Notes for Other LLMs

## Isolation rule

Treat this package as the authoritative project context.

Do not assume access to:

- earlier chats;
- sibling chats;
- another model's conversation history;
- unstated personal memory.

Some systems, including tested Copilot workflows, may have no access to other chats at all.

## Required reading order

1. shared protocol;
2. shared rationale;
3. `project-state.md`;
4. relevant domain files;
5. `session-log.md` only when historical reasoning is needed.

## Reasoning objective

Reconstruct the accepted conceptual model with minimal incorrect inference.

Use domain capsules as:

- generators for reliable reconstruction;
- boundaries against over-generalization;
- explicit unknowns where guessing is unwelcome.

## Domain capsules

Domain capsules intentionally preserve conceptual generators rather than complete reference material.

Do not interpret omitted detail as missing knowledge.

Attempt to reconstruct the accepted conceptual model from the stored generators before assuming additional facts are required.

## Authority

Prefer, in order:

1. verified experiments;
2. accepted project state;
3. domain capsules;
4. source documentation confirmed by the project;
5. current conversation;
6. general knowledge;
7. plausible inference.

Do not silently convert a plausible explanation into accepted project knowledge.

## Interaction rule

When information is missing:

- identify the missing premise;
- ask for documentation or propose a small discriminating experiment;
- do not compensate by importing a similar mechanism from another architecture or language.

## Maintenance rule

At coherent milestones, update:

- project state for current position;
- session log for history;
- domain capsules for stable conceptual knowledge;
- TODO for deferred investigation.

Fresh-chat tests may be used to reveal missing capsule knowledge: if an unprimed model gives a materially weaker or evasive answer, identify which generator, boundary, or structural fact is absent from the package.


<!-- projects/macro-20/domain/instruction-families.md -->

# Instruction Families

## Principle

Mnemonic grammars are family-local. Reuse a family generator where documented, but do not assume that a letter has the same meaning in unrelated families.

Many PDP-10 instruction families combine an operation prefix (e.g. AOJ, SOJ, CAM) with the common relation suffix grammar (G, GE, E, N, L, LE).

## MOVE family

Generator:

`MOV` + value transformation + destination form

Value transformations:

- blank: unchanged;
- `N`: negate;
- `M`: magnitude;
- `S`: swap halfwords.

Destination forms:

- blank: memory to AC;
- `I`: immediate value to AC;
- `M`: AC to memory;
- `S`: self/memory form.

## TEST family

Generator:

`T` + mask source + AC modification + skip relation

Mask source:

- `R`: immediate right-half mask;
- `L`: immediate left-half mask;
- `D`: direct memory mask;
- `S`: swapped memory mask.

AC modification:

- `N`: no modification;
- `Z`: zero selected bits;
- `O`: set selected bits;
- `C`: complement selected bits.

Skip relation:

- blank: do not skip;
- `N`: skip if not all selected bits are zero;
- `E`: skip if all selected bits are zero;
- `A`: always skip.

## Boolean family

The processor implements all sixteen Boolean functions of two one-bit variables.

Each operation has destination/source forms:

- blank: memory operand, result to AC;
- `I`: immediate operand, result to AC;
- `M`: result to memory;
- `B`: result to both AC and memory.

## Shift family

Two dimensions generate the family:

Operation:

- logical;
- arithmetic;
- rotate.

Width:

- single word;
- combined doubleword in `AC,AC+1`.

Resulting mnemonics:

- `LSH` / `LSHC`
- `ASH` / `ASHC`
- `ROT` / `ROTC`

## Fixed arithmetic destination grammar

`ADD`, `SUB`, and `IMUL` share:

- blank: memory operand, result to AC;
- `I`: immediate operand, result to AC;
- `M`: result to memory;
- `B`: result to both AC and memory.

## Width hierarchy

Multiplication:

- `IMUL`: one-word result;
- `MUL`: doubleword result;
- `DMUL`: four-word result.

Division:

- `IDIV`: single-word dividend, quotient and remainder;
- `DIV`: doubleword dividend;
- `DDIV`: four-word dividend divided by a doubleword divisor.

## Floating arithmetic grammar

Single precision:

`F` + operation + optional rounding + destination form

Double precision:

`DF` + operation

Operations:

- `AD`
- `SB`
- `MP`
- `DV`

## Relational vocabulary

The assembler reuses the JUMP/SKIP relation vocabulary for conditional assembly:

- greater;
- greater or equal;
- equal;
- not equal;
- less;
- less or equal.

The same relation semantics apply at runtime and assembly time; only the controlled action differs.


<!-- projects/macro-20/domain/luuos.md -->

# LUUOs

## Generator

Local Unimplemented User Operations let a program define application-specific instructions while the processor supplies only the dispatch mechanism.

The opcode selects the software-defined operation; the effective address supplies the operand or argument location.

## Hardware structure

When a LUUO opcode is executed:

1. The effective address is calculated.
2. An instruction image is stored at location 40.
3. The saved image preserves opcode and AC fields, clears indirect/index fields, and replaces the address field with the resolved effective address.
4. The processor executes the instruction at location 41 as though through `XCT 41`.
5. The program's handler interprets and performs the operation.

## Invariants

- Effective-address calculation occurs before handler entry.
- The CPU does not decode the local opcode.
- The CPU does not save accumulators for the handler.
- Software defines the calling convention and operation semantics.

## Cost model

LUUOs are more expensive than ordinary subroutine calls and should normally perform substantial work.

## Worked-example pattern

Gorin's photographed example defines symbolic LUUOs with `OPDEF`, including:

- `ERROR`
- `TTYSTR`
- `TTYCHR`

The main program uses them as instruction-like application interfaces.

The handler pattern is:

1. preserve accumulator state;
2. recover opcode, AC field, and effective address from the saved instruction;
3. validate the local opcode;
4. dispatch through a software table;
5. perform the selected operation;
6. restore state;
7. return to the instruction following the LUUO.

## Boundary

Do not equate LUUOs with TOPS-20 monitor calls. The chapter presents them as local, program-defined operations.

## Open questions

- Further design patterns in the complete worked example.
- Typical argument conventions across real programs.
- Later interaction with other system facilities, if documented.


<!-- projects/macro-20/domain/macros.md -->

# Macros

## Generator

Macros transform assembly source into assembly source during assembly.

They do not execute at program runtime.

## Structure

- `DEFINE name <body>`
- `DEFINE name(parameters) <body>`

Actual arguments are substituted into the macro body, and the expanded source is then assembled normally.

## Conditional assembly

Conditional assembly compares an expression with zero and either includes or omits enclosed source.

It reuses the JUMP/SKIP relation vocabulary.

`IFNDEF` may provide a default definition for a symbol that is otherwise undefined.

## Observed pattern

Macros may encode a relationship once and generate multiple consistent representations.

Gorin's `OPMAC`/`XX` example:

- stores operator/instruction pairs once;
- defines `XX` to select the character and emits `OPTAB`;
- redefines `XX` to select the instruction and emits `OPINS`;
- the completed program executes the selected instruction through `XCT`.

This is one demonstrated use, not the defining purpose of all macros.

## Boundaries and open questions

Angle brackets delimit and protect macro text, including arguments containing commas.

Not yet established:

- exact nested-delimiter rules;
- quoting;
- rescanning;
- expansion order;
- redefinition details.

Revisit the macro processor when later examples require these semantics.


<!-- projects/macro-20/domain/memory-operations.md -->

# Memory Operations

## BLT generator

The `BLT` accumulator is the moving state of the copy operation:

- left half: current source address;
- right half: current destination address.

The accumulator is updated as words are copied.

## Consequences

- `BLT` modifies its accumulator.
- The `BLT` accumulator cannot be used as its own index register.
- Anything used in the instruction's effective-address calculation must remain stable.
- Copy order is from low source addresses upward.
- Overlapping copies must account for that direction.
- If the destination overwrites the `BLT` accumulator, it must be the final destination.
- If the destination overwrites the `BLT` instruction, it must be the final destination.

## Boundary

`BLT` is not automatically overlap-safe in the general sense of a direction-selecting move operation.


<!-- projects/macro-20/domain/source-organization.md -->

# Source Organization

## Generator

Large assembly programs should be divided into functionally related source components.

## Observed tools

- `SUBTTL` gives a major section a subtitle in the assembly listing.
- A form-feed starts a new source/listing page.
- Gorin commonly places a `SUBTTL` near the start of a new component.

## Boundary

These constructs organize source and printed listings; they do not change runtime program behavior.


