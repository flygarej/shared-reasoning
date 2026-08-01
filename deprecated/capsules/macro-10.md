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
# Project-State.md

## Project
**MACRO-20 on TOPS-20 (Bootstrap phase)**

## Domain Knowledge

Current project knowledge is maintained in:

- Data-Representation.md
- Addressing.md
- Instruction-Families.md
- Memory-Operations.md
- Arithmetic.md

Project-State intentionally contains only the current project overview and accepted high-level model.

### Objective
Develop a rigorous understanding of MACRO-20, the PDP-10 architecture it exposes, and the TOPS-20 monitor interface through documentation and experiment.

## Collaboration Method
- Follow Protocol.md v1.0.2.
- Distinguish Observation, Documentation, Inference, Hypothesis, Prediction and Verified Conclusion.
- Prefer experiments over speculation.

## Verified Findings
- Panda KLH10/TOPS-20 MACRO-20 toolchain works.
- Workflow verified: .MAC → COMPILE → .REL → LOAD → SAVE → execute.
- First Hello World assembled and executed successfully.
- Missing newline after END causes MCRNES 'NO END STATEMENT ENCOUNTERED'.
- Completed the core architecture chapters of Gorin through arithmetic.

## Current Model

Core architectural model established.

Accepted conceptual areas:

- Data representation.
- Effective address calculation.
- Instruction families.
- Fixed and floating-point arithmetic.
- Basic JSYS calling convention.

Detailed knowledge has been moved into domain documents.

## Open Questions
- Hexadecimal syntax in MACRO-20.
- Detailed JSYS encoding.
- Processor flags.
- Byte pointer internals.
- Exact IDIVM/DIVM remainder semantics.
- Verify accumulator relationship to low memory.
- Verify floating-point field layout (possible transcription ambiguity).

## Next
Continue Gorin:

- Macro facilities.
- Conditional assembly.
- Local UUOs.
# Session-Log.md

## Bootstrap

Read Protocol, RATIONALE and placeholder project artefacts.

Established a new project exploring MACRO-20 on TOPS-20.

### Experiments

- Wrote first Hello World.
- Initial compile failed due to missing newline after END.
- Recompiled successfully.
- Loaded, saved and executed the program.

### Documentation Covered

- Hello World example.
- SEARCH MONSYM.
- JSYS overview.
- HRROI and PSOUT.
- ASCII vs ASCIZ.
- 36-bit architecture.
- Effective addressing.
- MOVE family.
- EXCH.
- JRST, JSR, JSP, JFCL, JFFO, XCT.

### Emerging Model

Gorin teaches architecture first, syntax second. MACRO-20 closely exposes the PDP-10 architecture. Continue with tests, booleans and stack operations.
# Addressing

Instruction fields: opcode, AC, I, X, Y.

Effective address is always computed first.

Rules: 1. X=0,I=0 =\> EA=Y. 2. X!=0 =\> EA=AC\[X\]+Y. 3. I=1 =\>
recursively resolve until I=0.

Immediate instructions use the address field itself.

Current JSYS model: arguments usually in AC1-AC4; HRROI builds a byte
pointer for PSOUT.

## Boundary

Effective address is computed before instruction execution.

Instructions that modify values involved in their own effective address calculation produce undefined or unpredictable behaviour.

Verified example:

- BLT must not use its own accumulator as an index register because BLT updates that accumulator while executing.
# Arithmetic (arithmetic.md)

## Fixed point

### Width model

Single-word
Double-word
Quad-word

Arithmetic instructions expand naturally with operand width.

## Multiplication

IMUL
    one-word result

MUL
    double-word result

DMUL
    quadruple-word result

## Division

Division produces two outputs:

- quotient
- remainder

Known asymmetry

IDIVM and DIVM require verification of remainder handling.

## Floating point

Representation

Single precision
Double precision

Instruction grammar

F/DF
+
operation
+
optional rounding
+
destination variant

Conversions

FIX
FIXR
FLTR
FSC

Open questions

- Verify exact floating-point bit layout.
- Verify complete floating instruction matrix.
# Data Representation

-   36-bit words.
-   Two's complement integers.
-   Five 7-bit ASCII characters per word.
-   Final bit always zero.

ASCII packs characters only. ASCIZ appends a terminating zero byte.

Assembler documents decimal, octal and binary. Hex support remains to be
verified.
# Instruction Families

## Purpose

Capture the grammar behind instruction families.

## MOVE

Grammar: MOV + value transformation + destination variant.

Transformations: blank=copy, N=negate, M=absolute value, S=swap
halfwords.

Destinations: blank=memory→AC, I=immediate operand, M=AC→memory,
S=self/memory variant.

## TEST

Grammar: T + mask source + AC modification + skip condition.

Mask: R/L/D/S. Modification: N/Z/O/C. Skip: blank/N/E/A.

## BOOLEAN

Implements all 16 Boolean functions of two inputs. Variants:
blank=memory operand, I=immediate, M=store memory, B=store both.

## JUMP

JRST family selected by AC field.

AC=1 implements a protected portal entry into privileged code. The portal
instruction itself is the first instruction of a privileged entry area and
dispatches execution to the actual privileged routine.

JSR non-reentrant. JSP reentrant. JFCL test+clear flags. XCT executes
instruction from memory.

## Shift Family

Grammar

Dimension 1

- Logical
- Arithmetic
- Rotate

Dimension 2

- Single-word
- Combined (AC,AC+1)

Resulting family

LSH   LSHC
ASH   ASHC
ROT   ROTC

Generator

The C suffix denotes operation on the concatenated doubleword AC,AC+1.

## Arithmetic Families

Shared destination grammar

(blank)
    memory operand, result to AC

I
    immediate operand

M
    result written to memory

B
    result written to both AC and memory

Families using this grammar

ADD
SUB
IMUL

## Width hierarchy

Arithmetic operations scale by operand width.

IMUL
    one-word product

MUL
    two-word product

DMUL
    four-word product

IDIV
    one-word dividend

DIV
    two-word dividend

DDIV
    four-word dividend
	
## Floating-point grammar

Single precision

F
+
operation
+
optional rounding
+
destination variant

Double precision

DF
+
operation

Operations

AD
SB
MP
DV
# Macros (macros.md)

## Generator

Macros transform assembly source into assembly source during assembly.

They do not execute at run time.

### Observed pattern: 
A macro can encode one relationship and emit multiple synchronized representations by redefining a helper macro.

## Structure

DEFINE name <body>

DEFINE name(parameters) <body>

## Conditional assembly

IF relation(expression,0)

↓

assemble enclosed source

or

omit enclosed source

IFNDEF provides default symbol definitions when a symbol has not already been defined.

## Open Questions

- Exact macro expansion semantics.
- Nested delimiter handling.
- Argument rescanning and expansion order.
- Redefinition rules.

---

# Memory Operations (memory-operations.md)

## BLT

Principle

The BLT accumulator contains the moving source and destination addresses.

Generator

The accumulator is updated during execution.

Consequences

- BLT modifies its own accumulator.
- Never use that accumulator during EA calculation.
- Copy proceeds from low addresses upward.
- If BLT overwrites its own accumulator, that must be the final destination.
- If BLT overwrites the BLT instruction, that must be the final destination.

Boundary

Overlapping copies require careful ordering because BLT copies upward.
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
