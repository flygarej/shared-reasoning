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


<!-- projects/macro-20/domain/arrays.md -->

# Arrays

## Generator

Arrays map collections of elements onto contiguous memory.

Element selection is performed by computing an effective address from a base location and one or more indices.

## One-dimensional arrays

A one-dimensional array occupies a contiguous block of words.

Indexed addressing selects an element relative to the array origin.

## Multidimensional arrays

Multidimensional arrays are represented in linear memory.

Observed implementation techniques:

- side-table containing row or column origins;
- computed address polynomial.

Both generate the effective address of the selected element.

## Principles

Array access builds on the ordinary effective-address mechanism rather than introducing special array instructions.

## Boundaries

This chapter introduces array organization and addressing techniques.

Performance trade-offs and implementation preferences beyond the presented techniques are outside the current project model.

---



<!-- projects/macro-20/domain/comnd.md -->

# COMND

## Generator

A command is represented as a tree of typed fields.

Each COMND call parses one field and advances command processing along one valid branch of that tree.

## Consequences

Because the current field has a declared type and context, COMND can provide:

- recognition;
- completion;
- context-sensitive help;
- validation;
- prompting;
- field-appropriate terminal behavior.

## Field roles introduced

- keywords select command branches;
- noise words improve readability without supplying application data;
- values provide arguments to the program.

## Boundary

COMND parses one field per call, not an entire command line in one operation.

The exact data structures and calling sequence used to describe fields have not yet been introduced.

## Parser state

COMND maintains parsing state within a command buffer.

Observed state includes:

- reprompt text;
- beginning of editable input;
- next field to parse;
- remaining unparsed characters;
- remaining free buffer space.

Each successful COMND call advances the parser state rather than reparsing the command from the beginning.

## Command state block

COMND maintains persistent command-processing state in a caller-supplied block.

The block contains:

- input and output JFNs;
- prompt/reprompt pointer;
- editable-input boundary;
- next parse position;
- free-space and unparsed-character counts;
- atom-buffer pointer and size;
- GTJFN argument-block address;
- a caller-provided reparse dispatch address.

The command buffer holds the continuing input dialogue.  
The atom buffer receives the contents of the current parsed field.

## Reparse principle

COMND preserves its parsing state, while the application supplies a reparse
entry point for restoring application control state.

An observed pattern saves a known stack pointer before parsing and restores
it at the reparse entry.

## Function descriptor blocks

Each COMND call describes the next expected field with a Function
Descriptor Block.

An FDB contains:

- field function code and flags;
- optional link to another FDB;
- function-specific data;
- help text;
- default text;
- optional break-mask information.

`FLDDB.` constructs these blocks.

## Keyword dispatch pattern

A `.CMKEY` field may refer to an alphabetically ordered command table.

The table associates recognized keywords with command-server addresses.
After COMND identifies an entry, the program obtains its server address
from the entry and dispatches indirectly.

This makes command recognition and execution data-driven rather than a
sequence of explicit string comparisons.

## Interactive field behavior

Observed in the verified Small Executive session:

- `?` displays help appropriate to the current field.
- `ESC` performs recognition or completion for the current field.
- A field default may be selected by completion when the user supplies no explicit value.
- Noise words may be emitted as part of completion to make the command readable.
- After help output, COMND redisplays the current command line and resumes at the same field.

Example:

`co<ESC><ESC>?`

progresses through:

- `COUNT`
- default direction `UP`
- noise word `(TO)`
- help for the required numeric field


<!-- projects/macro-20/domain/comnd-reference-program.md -->

# COMND reference program

## SMALL EXECUTIVE

```MACRO-20
	TITLE	SMALL EXECUTIVE		; Mark R. Crispin 12/79
	SEARCH	MACSYM,MONSYM,QSRMAC
	SALL

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

; The actual server for the PUSH command will be presented in section
; 27, page 387
.PUSH:	NOISE (COMMAND LEVEL)
	CONFIRM
	RET

; The actual server for the QUEUE program will be presented in 
; section 28.1, page 397
.QUEUE:	NOISE (STATUS DISPLAY)
	CONFIRM
	RET

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
Small Executive>exit
```


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

## Numeric radix prefixes

Unmarked numeric constants normally use the assembler's prevailing radix.

`^D` marks the following constant as decimal.

Verified experimentally:

`BLOCK ^D100` allocates 100 decimal words

## Boundary

Do not infer byte-pointer representation from character packing alone. Byte pointers are a separate mechanism.


<!-- projects/macro-20/domain/files-and-jfns.md -->

# Files and JFNs

## Generator

A Job File Number (JFN) is a job-local shorthand for a pathname.

The monitor maintains the mapping between pathnames and JFNs so that almost all file operations use compact JFN identifiers rather than textual file names.

## Lifecycle

pathname
    ↓
GTJFN
    ↓
JFN
    ↓
OPENF
    ↓
File I/O
    ↓
CLOSF
    ↓
RLJFN

## Principles

- TOPS-20 attempts to present different storage devices through a common file interface.
- Most file-related JSYSes operate on JFNs rather than pathnames.
- Once a JFN has been obtained, the pathname normally disappears from subsequent file operations.

## Observed Patterns

### Translation

- GTJFN translates pathname → JFN.
- JFNS translates JFN → pathname.

These form complementary operations.

### Iteration

GNJFN advances through wildcard matches using an existing JFN.

The JFN itself carries the iteration state.

### I/O

Most file I/O follows the pattern

JFN
    ↓
OPENF
    ↓
String/Byte input and output
    ↓
GTSTS (status)
    ↓
CLOSF
    ↓
RLJFN

### Predefined JFNs

The monitor provides predefined JFNs.

This chapter introduces:

- .PRIIN
- .PRIOU

Higher-level monitor calls (for example PSOUT) may internally operate using these predefined JFNs.

### Verified pattern

.PRIOU plus SOUT reproduces the primary-output behaviour of PSOUT.

## Vocabulary

JOB

- Execution environment owning JFNs.

FORK

- Creates another process within a JOB.

(The relationship between FORKs and JFN ownership has not yet been established.)

## Boundaries

This chapter introduces the file abstraction and common JSYS workflow.

It does not yet establish:

- detailed OPENF modes;
- sharing semantics;
- buffering behaviour;
- relationship between multiple FORKs and JFN mappings.

Do not infer these from other operating systems.

## Open Questions

- Are JFN tables shared by all FORKs within a JOB?
- Can a JFN migrate between FORKs?
- What exactly constitutes a JOB?
- Lifetime rules for predefined JFNs.
- Detailed OPENF access flags and byte-size handling.

## String input

`SIN` transfers bytes from a JFN into a caller-supplied buffer.

AC registers:

- AC1: source JFN
- AC2: destination byte pointer
- AC3: character count and stopping mode
- AC4: break character when AC3 is positive

The sign of AC3 selects the stopping rule:

- Negative AC3: attempt to read exactly the specified number of characters. A short count occurs only on an error condition.
- Positive AC3: stop when the count is exhausted or when an input character matches the break character in AC4.

After the call, AC3 is moved toward zero by the number of characters actually transferred.

## File status

`GTSTS` accepts a JFN in AC1 and returns its status in AC2.

Observed use:

- after `SIN`, inspect the JFN status to distinguish the cause of an input condition.

## Terminal input

Observed use of `RDTTY`:

- AC1 supplies the destination buffer pointer;
- AC2 supplies the maximum input length;
- AC3 may supply a reprompt string.

The monitor supports redisplaying the reprompt when requested by the user, for example with `^R`.

## Input principle

For string input, the caller supplies both the destination storage and the stopping policy.

## Wildcard iteration

`GTJFN` may be called with flags permitting wildcard matching.

Observed pattern:

GTJFN (wildcard specification)
    ↓
GNJFN repeatedly advances through the matching files.

Iteration terminates when GNJFN reports no further matches and releases the exhausted JFN.



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


<!-- projects/macro-20/domain/memory-mapping.md -->

# Memory Mapping

## Generator

Open files may be accessed either through stream I/O or by mapping file pages into a process address space.

## PMAP

PMAP associates a file page with a virtual memory page.

Subsequent access uses ordinary memory instructions.

## Observed options

- read access
- copy-on-write

Copy-on-write provides a private modified page while leaving the file unchanged.

## Principle

Memory mapping operates on page-sized aligned regions.

---



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


<!-- projects/macro-20/domain/program-memory.md -->

# Program Memory

## Generator

The running program occupies a contiguous region of memory.

Observed mechanism:

`.JBSA` contains information describing the program image.

The left half identifies the first free word above the program, allowing a program to allocate additional storage dynamically.

## Boundary

Only the allocation origin has been introduced.
Memory management policy has not yet been investigated.

---



<!-- projects/macro-20/domain/records.md -->

# Records

## Generator

A record layout is represented by symbolic field offsets rather than absolute addresses.

`PHASE` allows field offsets to be generated automatically while assembling.

`DEPHASE` restores normal location counting.

`.ORG` may reclaim the temporary storage used during layout generation.

## Principle

Compile-time layout descriptions need not occupy runtime memory.

## Boundary

The current model describes record layout generation only.

Record allocation, traversal, and list manipulation are introduced later.

---



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


