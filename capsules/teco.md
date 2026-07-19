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

## Placeholder

This placeholder indicates that this is the start of a new project.

If this placeholder is present, no project-specific state has yet been established.

Do not infer or reconstruct project state.

Instead, establish the project's scope and current state through collaboration with the user, following the guidance in protocol.md.

Once sufficient project state has been established, remove this placeholder section and replace it with the current accepted project state.

Future maintenance updates should preserve this document's identity by updating **project-State.md** rather than creating derivative filenames.

The purpose of this document is to capture the project's current accepted understanding, enabling future conversations to resume work with minimal friction.

---
# session-log.md

## Placeholder

This placeholder indicates that no project history has yet been established.

If this placeholder is present, this is the beginning of a new project.

Do not infer historical reasoning that has not yet occurred.

Instead, establish the project through collaboration with the user, following the guidance in protocol.md.

The first maintenance update should remove this placeholder and begin the chronological project log.

Future maintenance updates should preserve this document's identity by updating **session-log.md** rather than creating derivative filenames.

The purpose of this document is to preserve the project's chronological evolution so that future conversations can understand not only what is currently believed, but how those conclusions were reached.

---
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

# TECO Documentation Overview

## Purpose

Record the significant evidence sources used by the project, their proper scope, and the limits on what may be inferred from them. Documentation is evidence about TECO variants; verified experiments remain authoritative for the implementation tested.

## Source-Selection Rule

Use the following order within the relevant implementation scope:

1. Clean, repeatable experiments on the target implementation.
2. Accepted project conclusions supported by those experiments.
3. Primary architectural or language documentation consistent with the experiments.
4. Implementation manuals and source material for the implementation they describe.
5. Historical guides, tutorials, and earlier session prose.

No single manual defines every TECO dialect. Cross-dialect agreement may support a broader language-level model; disagreement must be preserved and scoped.

## Experimental Sources

### TOPS-20 TECO 540 / TECO-10 experiments

**Scope**

Parser behaviour, arithmetic, prefix accumulation, buffer and range operations, control flow, search, Q-registers, macro execution, and dialect comparison on the historical target implementation.

**Observed reliability**

Highest authority for TOPS-20 TECO 540 behaviour.

**Experimentally confirmed areas**

- command-stream and argument-termination behaviour;
- buffer positions and ranges;
- arithmetic and parser-prefix interaction;
- conditionals, iterations, labels, goto, and iteration exit;
- `:S` status semantics and TOPS-20 repeated-modifier behaviour;
- single-kind Q-register storage;
- destructive `Xq`, non-destructive `Gq`, push/pop, nested `M`, and self-modifying macros.

**Important limitations**

Experiments establish only the tested cases. Interactive transcripts can mix prompts, echoed ESC characters, output, errors, typing mistakes, and persistent buffer state. Observable behaviour does not by itself reveal internal representation.

**Known disagreements**

- Later Standard TECO documents `::S` anchored compare; the tested TOPS-20 system treated repeated colon like `:S`.
- Later dialects provide `|` else, computed goto, and richer Q-register semantics absent from the tested TOPS-20 system.

**Recommended use**

Authoritative whenever deciding actual TOPS-20 TECO 540 semantics.

### TECOC executable experiments

**Scope**

Modern TECOC parser, editing, search, control-flow, startup, newline, and Q-register behaviour.

**Observed reliability**

Highest authority for the tested TECOC executable.

**Experimentally confirmed areas**

- Standard-style conditionals and status-returning search;
- modern Q-register behaviour;
- CRLF internal newline representation in tested cases;
- implementation-specific startup and search behaviour.

**Important limitations**

TECOC is not authoritative for TOPS-20 or TECO-64. Similar syntax may conceal different runtime semantics. Manual claims may describe intended Standard TECO behaviour not present in the executable.

**Known disagreements**

- TECOC preserves numeric and text Q-register components simultaneously and copies with `Xq`, unlike TOPS-20 TECO-10.
- The extracted capsules conflict on default TECOC search case sensitivity; the issue requires a clean discriminating experiment.
- A later capsule reports failed counted searches resetting point to `B`; command form and scope require preservation rather than broad generalization.

**Recommended use**

Authoritative for TECOC, and useful for determining whether a behaviour is shared with or differs from historical TECO.

### TECO-64 executable experiments

**Scope**

TECO-64 compatibility, extensions, control flow, search, page handling, newline representation, and terminal presentation.

**Observed reliability**

Highest authority for the tested TECO-64 executable.

**Experimentally confirmed areas**

- basic conditional compatibility;
- `|` else and one-based computed goto;
- bounded search support;
- negative-loop and page-mode differences;
- LF internal newline representation in tested cases.

**Important limitations**

TECO-64 includes later extensions and must not be treated as historical or Standard TECO by default. Interactive backtick echo for ESC is presentation, not language syntax.

**Known disagreements**

Differs from TOPS-20 in control-flow extensions, negative iteration, page options, and Q-register-era assumptions.

**Recommended use**

Authoritative for TECO-64 and useful for mapping later dialect evolution.

## Language and Historical Manuals

### 1985 Standard TECO Manual

**Scope**

Standard TECO command semantics, parser behaviour, modifiers, and core language reference used alongside TECOC.

**Observed reliability**

High as a primary Standard TECO reference.

**Experimentally confirmed areas**

Many core editing, arithmetic, conditional, and search behaviours agree with modern implementation tests.

**Important limitations**

It is broader than TOPS-20 TECO and may document facilities absent from a particular TECOC executable. Subtle parser and execution claims require experiment.

**Known disagreements**

Its later `::S` semantics do not describe tested TOPS-20 TECO 540 behaviour.

**Recommended use**

Primary Standard-language reference and hypothesis source; never use it to overwrite target-implementation experiments.

### 1990 TECO / TECO-64 Manual

**Scope**

Later Standard TECO and TECO-64 syntax, semantics, extensions, and historical changes from earlier standards.

**Observed reliability**

High for TECO-64 and later Standard TECO.

**Experimentally confirmed areas**

Later control-flow and search extensions, modifier ordering, and TECO-64-specific facilities.

**Important limitations**

Describes a later and richer dialect than TOPS-20 TECO. Searchable documentation can encourage accidental backward projection.

**Known disagreements**

Documents features absent from TOPS-20, including `|` else, computed goto, and anchored `::S` semantics.

**Recommended use**

TECO-64 reference, language-evolution comparison, and clarification of later documented semantics.

### PDP-10 / TOPS-20 TECO Manual, TECO 23B (1975)

**Scope**

Historical PDP-10 TECO command set and behaviour close to the TOPS-20 target.

**Observed reliability**

High historical reference when confirmed experimentally.

**Experimentally confirmed areas**

Core historical syntax, buffer operations, control-flow candidates, and dialect limitations.

**Important limitations**

The running TOPS-20 system identifies a later TECO 540 build; edition differences and implementation drift remain possible. Documentation is not a substitute for tests.

**Known disagreements**

Some documented commands or forms failed in the running implementation; later manuals contain additional features.

**Recommended use**

Generate historically plausible hypotheses and interpret TOPS-20 behaviour before testing.

### TECO Pocket Guides (1978/1979)

**Scope**

Compact command lookup, DEC-era conceptual organization, dialect footnotes, iteration forms, streams, and Q-register distinctions.

**Observed reliability**

High for concise conceptual and dialect-specific facts when verified.

**Experimentally confirmed areas**

- auxiliary command/text input/text output stream architecture;
- indefinite and counted iteration concepts;
- TECO-10 single-area Q-register semantics and absence of later facilities.

**Important limitations**

Compression omits operational detail and can conceal implementation consequences. Not sufficient alone for parser or execution-model disputes.

**Known disagreements**

None retained where experimentally checked; apparent conflicts usually reflect later dialect evolution.

**Recommended use**

Fast lookup, architectural orientation, and identifying historically specific constraints worth testing.

### TECO User's Guide (1979)

**Scope**

General TECO use and supporting language explanation.

**Observed reliability**

Good secondary historical reference.

**Experimentally confirmed areas**

Broad editing and programming idioms consistent with the tested systems.

**Important limitations**

Not authoritative for subtle parser semantics or implementation differences.

**Known disagreements**

None central to the accepted model.

**Recommended use**

Human-oriented orientation and examples, not semantic adjudication.

### Dan Murphy, "TECO becomes a programming language"

**Scope**

Primary historical account of TECO's evolution from editor to programmable system, including text variables, macros, Q-registers, and loops.

**Observed reliability**

High as architectural evidence from TECO's original author.

**Experimentally confirmed areas**

Strongly supports the model of `M` executing text as a TECO command string and Q-registers as the basis for persistent program state.

**Important limitations**

Historical narrative, not an implementation specification; it does not define parser internals or all dialect differences.

**Known disagreements**

None when used as architectural intent rather than precise operational semantics.

**Recommended use**

Explain architectural origin and constrain high-level models; use experiments for exact behaviour.

## Implementation Documentation and Source

### TECOC documentation, README, programming guide, and `wchart.txt`

**Scope**

TECOC startup, command-line behaviour, implementation notes, quick command lookup, and implementation-specific programming topics.

**Observed reliability**

High for TECOC when confirmed against the executable.

**Experimentally confirmed areas**

Startup behaviour, compatibility facilities, and many Standard TECO command forms.

**Important limitations**

Implementation documentation is not a universal language definition. Some documented features may be absent or differ in the executable version tested.

**Known disagreements**

The search capsules explicitly warn that TECOC manuals may document executable-absent features.

**Recommended use**

TECOC-specific operation and fast lookup, followed by experiments for subtle semantics.

### TECO-64 documentation and indexed command reference

**Scope**

TECO-64 commands, flags, extensions, indexed navigation, and implementation behaviour.

**Observed reliability**

High for TECO-64.

**Experimentally confirmed areas**

Control-flow extensions, bounded search, page-mode options, and terminal-specific behaviour.

**Important limitations**

Contains extensions not shared by Standard TECO, TECOC, or TOPS-20.

**Known disagreements**

Expected dialect differences from TOPS-20 in control flow, page handling, and iteration.

**Recommended use**

Primary TECO-64 lookup and implementation comparison.

### TOPS-20 TECO EMACS manual

**Scope**

EMACS interaction, named commands, variables, key bindings, minibuffer use, library workflow, syntax tables, and the TECO substrate beneath EMACS.

**Observed reliability**

High for intended EMACS interfaces and terminology.

**Experimentally confirmed areas**

`MM`/`M.M` named-command conventions, `M.V` variables, BARE libraries, syntax-table use, and the presence of TECO and machine-language layers.

**Important limitations**

Often describes interfaces rather than runtime layout. MIDAS and EMACS conventions must not be mistaken for standalone TECO semantics.

**Known disagreements**

None retained after checking against running macros and source.

**Recommended use**

EMACS-level semantics and architectural terminology, not raw TECO command adjudication.

### Running TECO EMACS macro inspection

**Scope**

Actual Q-register-resident code and runtime values in the running EMACS instance, including `M`, `.M`, `.V`, and `..Q`.

**Observed reliability**

Highest authority for the inspected runtime instance.

**Experimentally confirmed areas**

Macro-based named-command and variable dispatch, compatibility wrappers, structured Q-register data, and mixed TECO/machine-language resolution.

**Important limitations**

Dense macro text is difficult to decode. Binary-looking or structured Q-register contents must not be assigned a schema without discriminating evidence.

**Known disagreements**

Earlier speculative interpretations were discarded when documentation contradicted them.

**Recommended use**

Determine what is actually implemented as TECO macro code and inspect live runtime structures.

### `.EMACS` source libraries

**Scope**

Human-authored EMACS commands, modes, variables, comments, and library-generation logic.

**Observed reliability**

High for source-level intent and declarations.

**Experimentally confirmed areas**

Examples include `EMACS:BARE.EMACS` and `EMACS:CMODE.EMACS`; source comments establish generation of runtime libraries.

**Important limitations**

Source form does not reveal final runtime placement or whether every operation becomes TECO text, indexed data, or a machine-language reference.

**Known disagreements**

None retained.

**Recommended use**

Understand authored EMACS facilities and discover production idioms for later testing.

### Generated `.:EJ` libraries

**Scope**

Loadable runtime form generated from `.EMACS` sources, including the confirmed `EMACS:BARE.:EJ` example.

**Observed reliability**

Confirmed as the generated library form used by EMACS.

**Experimentally confirmed areas**

Generation and loading relationship between `.EMACS` source and `.:EJ` output.

**Important limitations**

Internal format, indexing, command-body placement, and the meaning of "compiled" remain unresolved. The quoted colon-containing extension complicates ordinary access.

**Known disagreements**

None; the model remains intentionally incomplete.

**Recommended use**

Investigate runtime library representation, EJ pages, and named-object loading.

## Secondary and Tutorial Sources

### Wikipedia, SDF Survival TECO, and Twenex Wiki

**Scope**

Historical orientation, tutorials, practical examples, and bibliography.

**Observed reliability**

Moderate.

**Experimentally confirmed areas**

Useful broad history and introductory usage, but not used as semantic authority.

**Important limitations**

Secondary, tutorial-oriented, and liable to merge dialects or omit subtle semantics.

**Known disagreements**

No specific disagreement is retained because these sources are not used to resolve semantic questions.

**Recommended use**

Orientation and source discovery only.

## Preserved Documentation Disagreements

- Standard/later manuals describe facilities absent from TOPS-20 TECO 540, including `|` else, computed goto, richer Q-register storage, and anchored `::S`.
- TECOC documentation may describe features not present in the tested executable.
- The extracted experimental capsules disagree on TECOC's default search case sensitivity; documentation must not be used to erase that experimental conflict.
- Manual similarity across TECO variants is never sufficient evidence of runtime equivalence.

# TECO Domain Knowledge

## Purpose

Restore the smallest accepted conceptual model that explains the TECO behaviour established across the project without projecting one implementation's semantics onto another.

The model is intended for reasoning about unfamiliar TECO programs. It preserves conceptual generators, experimentally established constraints, and only those dialect differences needed to prevent incorrect inference.

## Core Conceptual Model

TECO is a **stream interpreter operating on persistent runtime objects**.

Its central components are:

- a command stream;
- a text input stream;
- a text output stream;
- an editable character buffer;
- persistent objects such as Q-registers and the remembered search string;
- transient parser and numeric-evaluation state.

The buffer is not a file and not a stream. Files attach to input or output streams; editing commands operate on the buffer.

The buffer is fundamentally character-oriented:

```text
character -> position between characters -> range
```

Point (`.`) is a position between characters. `B` and `Z` denote the buffer bounds. Lines and pages are derived from separator characters; explicit ranges are more fundamental than line- or page-oriented defaults.

Commands compose by producing, transforming, consuming, or persisting values and effects. Important value classes include:

- numbers;
- positions;
- ranges;
- text;
- status values;
- persistent runtime state.

This producer/consumer model is more fundamental than a catalogue of commands.

## Execution Model

Interactive input accumulates a command stream. Argument termination and command-stream execution are distinct: ESC terminates commands that take delimited arguments, while the implementation's command-termination sequence triggers execution of the collected stream.

The command stream is scanned incrementally. Before command dispatch, the interpreter may accumulate independent transient state:

- numeric value or expression state;
- colon modifier state;
- at-sign modifier state.

A dispatched command consumes the relevant accumulated state. This state does not persist as an implicit operand across separately executed command streams.

Numeric expressions evaluate left-to-right unless parentheses force grouping. Numeric atoms include literals, special numeric values, Q-register values, and command results. Operators may remain pending while modifiers are scanned. A command may consume the current numeric value before a pending operator receives another operand; a later command result does not retroactively complete that earlier operation.

For tested commands, numeric material, `:`, and `@` are independent parser components rather than rigidly ordered grammar positions. The parser accepted several interleavings, although documented ordering remains the preferred source form. Modifier repetition is command-specific, not governed by one global rule.

Macro execution (`Mq`) executes the current text of Q-register `q` as a nested command stream. When that stream is exhausted, execution resumes in the caller. Ordinary Q-register macros therefore use the same interpreter rather than a separate macro language or compilation stage.

## Structural Models

### Buffer and range model

The editing buffer is the primary mutable text object. Point and explicit ranges define editing locations.

`H` is structurally equivalent to `B,Z`: it produces the whole-buffer range for a range-consuming command. This equivalence exists only through composition within one command stream; executing `H` separately does not preserve an implicit range for a later stream.

Text-taking commands retain their own delimiter grammar even when embedded inside control-flow regions. `@` changes argument parsing, chiefly by selecting an alternate delimiter; it does not by itself change the underlying command operation. 
Nested @ modified commands must use different delimiters, they are not scoped

### Control-flow model

Control flow is sequential unless changed by conditionals, iteration, or goto.

Conditionals and iterations operate on regions of the command stream, but their structural handling is construct-specific rather than evidence of one fully general parser.

Conditional execution separates:

1. evaluation of the preceding numeric expression;
2. predicate evaluation;
3. selective structural scanning of the untaken branch;
4. semantic execution of the selected branch.

An untaken conditional branch is not executed, but it is scanned far enough to locate the matching conditional delimiter. This scanning recognizes nested conditionals and delimiters occurring inside text arguments where required. It does not perform full parsing, command validation, or general delimiter balancing.

Iteration is a separate structural construct. Counted iteration evaluates its count on entry; tested nonnegative counts execute the body that many times, and zero skips it. Bare iteration is indefinite. Iteration exit is predicate-driven:

- `n;` exits when `n >= 0`;
- `n:;` exits when `n < 0`;
- bare `;` and `:;` use search-success state rather than an explicit numeric argument.

Labels are executable no-ops. `Olabel` transfers control to a matching label and may jump forward or backward. Loop bookkeeping survives internal backward gotos in tested TOPS-20 behaviour.

### Persistent-object model

Persistent state explains behaviour that cannot be reconstructed from the current command alone.

#### Search state

The remembered search string is a persistent runtime object distinct from an individual search execution.

An explicit search installs its text as the remembered search string before attempting the search, even if the search fails. A null search reuses the remembered string. Searches begin at current point; success moves point immediately after the match. Repeated search is therefore explained by remembered text plus changed point, not by an implicit continuation object.

`G_` exposes a copy of the remembered search string in implementations that provide it.

#### Q-register state

Q-registers persist across command streams and may hold numbers or text, but their storage model is dialect-specific.

The explicit push-down operations `[q` and `]q` save and restore complete Q-register state in LIFO order. This stack is distinct from the interpreter-managed nesting used by `M`.

In TOPS-20 TECO 540 / TECO-10, a Q-register contains one value kind at a time:

```text
Q-register q
    kind    in {numeric, text}
    payload = one value of that kind
```

`nUq` replaces it with a numeric value. `m,nXq` transfers buffer text into it and removes that range from the buffer. `Gq` inserts stored text without consuming the register.

This permits self-modifying macros:

```text
Q-register text -> Gq -> edit in buffer -> Xq -> Mq
```

### TECO EMACS model

Original TECO EMACS is layered on the TECO interpreter using:

- ordinary Q-register macros;
- local macros such as `.M` and `.V`;
- structured text-valued runtime objects such as `..Q`;
- generated `.:EJ` libraries from `.EMACS` sources;
- selected machine-language functions.

`M.Mname$` and `M.Vname$` execute local Q-register macros that implement named-command lookup and variable handling; they are not primitive TECO commands. The observed global `M` serves as a compatibility wrapper for the older `MMname$` convention.

## Verified Invariants

### General execution and editing

- Command streams may contain multiple commands.
- ESC terminates delimited arguments; it is not itself the general execution operation.
- `.` is current point; `B` and `Z` are buffer bounds.
- `J` moves to buffer start; `ZJ` moves to buffer end.
- `H` and `B,Z` are equivalent range producers in the same command stream.
- Arithmetic is left-associative unless parenthesized.
- Explicit ranges override command defaults.
- Numeric argument state is transient across separately executed streams.

### Conditional execution

- Conditional predicates consume the numeric result of the immediately preceding expression, not merely a literal.
- Untaken branches are not semantically executed.
- Runtime command errors and argument validation inside untaken branches are suppressed.
- Nested conditionals are balanced during dead-branch scanning.
- Conditional delimiters inside tested `@I/.../` text are ignored correctly.
- Iteration delimiters need not balance inside an untaken conditional branch.
- Verified numeric predicates: `"E` zero, `"N` nonzero, `"L` negative, `"G` positive.
- Verified character predicates operate on numeric character codes: `"A` alphabetic, `"D` decimal digit, `"C` symbol constituent.
- Observed `"C` accepts letters, digits, and underscore, but rejects hyphen and space.

### Iteration and goto

- Counted loops use the entry count once in tested behaviour.
- Zero-count loops skip their body.
- Nested and adjacent loops compose.
- Argumented `;` forms exit the current iteration according to their predicates.
- Labels are no-ops and `Olabel` supports forward and backward transfer in TOPS-20.

### Search

- Explicit search updates the remembered search string even on failure.
- Null search reuses the remembered string.
- Successful search moves point to the end of the match.
- `:S` returns `-1` on success and `0` on failure in the tested implementations.
- Failed `:S` leaves point unchanged in the TOPS-20 experiments retained by the project.
- Ordinary `S` reports failure rather than returning status.
- Tested repeated matches are non-overlapping.
- `G_` copies rather than aliases the remembered search string.

### TOPS-20 Q-registers and macros

- A TECO-10 Q-register stores text or a number, not both simultaneously.
- `[q` preserves the visible register while saving a complete independent copy.
- Nested saves restore in strict LIFO order, including value kind.
- `Xq` is destructive to the source buffer range.
- `Gq` is non-destructive to the Q-register.
- Nested `M` execution returns to its caller.
- Later macro execution uses the Q-register's current text.

## Boundary Constraints

- Do not infer a universal TECO dialect from any one implementation. Language-level claims require either cross-dialect agreement or explicit scoping.
- Structural scanning of an untaken conditional branch is not full parsing. It recognizes only what is needed to find the matching conditional boundary.
- The earlier broad model of all skipped control-flow bodies requiring completely balanced nested regions is too strong. Verified conditional scanning ignores unrelated iteration imbalance.
- Parser permissiveness observed before `S` must not be generalized automatically to every command.
- Colon commonly converts exceptional behaviour into status or changes interpretation, but there is no accepted universal colon rule.
- Repeated `:` and `@` are interpreted per command. Presence-based behaviour observed for specific commands is not a global law.
- Lines and pages are derived conveniences, not established first-class buffer objects.
- Startup behaviour, ESC echo characters, and terminal presentation are implementation behaviour, not core language semantics.
- Experiments establish observable behaviour, not internal representation. Terms such as parser state, nested stream, and persistent object are accepted models unless directly verified as implementation internals.

## Implementation Differences

### TOPS-20 TECO 540 / TECO-10

- Q-registers hold one value kind at a time.
- `Xq` removes the copied range from the buffer.
- `|` else and computed goto were not implemented in the tested system.
- Negative counted iteration raises an error in tested behaviour.
- Repeated `:` before `S` behaved like single `:S`; later Standard TECO's documented `::S` anchored-compare semantics were absent.
- `:Gq` and later simultaneous numeric/text Q-register semantics must not be projected backward.

### TECOC

- Q-registers may preserve numeric and text components simultaneously.
- `Xq` copies rather than extracts in the tested implementation.
- Standard-manual features may still require executable verification.
- The capsules disagree about default search case sensitivity: one experiment set recorded lowercase-only matching, while a later capsule states case-insensitive default search. This remains unresolved and must not be silently normalized.
- A later search capsule reports failed counted searches resetting point to `B`; this does not conflict with the separately verified claim that failed `:S` leaves point unchanged, but the exact command forms and scope should be reverified before generalization.

### TECO-64

- Interactive ESC may be echoed as backtick rather than `$`.
- `|` else and one-based computed goto are available in tested behaviour.
- Negative counted iteration skips rather than raising the TOPS-20 error in the retained tests.
- Bounded search syntax is available where TECOC rejected it.
- `E3&1` can disable traditional form-feed page semantics.
- Internal newline representation is LF in tested cases, whereas TECOC used CRLF; observed editing semantics nevertheless matched.

### TECO-11 and later dialects

- Local Q-register sets and simultaneous numeric/text storage belong to later dialect models and must not be inferred for TECO-10.
- Macro invocation and local-register-set creation have dialect-specific exceptions; `:Mq` and invocation from local Q-registers do not necessarily create another local set.

## Open Questions

- Complete taxonomy of numeric producers, consumers, transformers, and command return values.
- Exact lifetime and internal representation of pending arithmetic and modifier state.
- Which commands accept interleaved numeric, colon, and at-sign prefixes.
- Complete conditional predicate set and all syntax recognized during dead-branch scanning.
- Full iteration semantics, especially negative counts and interaction with search-state exits across dialects.
- Complete search runtime state, direct mutation facilities, bounded-search semantics, and the unresolved TECOC case-sensitivity disagreement.
- Exact internal representation of TOPS-20 textual Q-registers and numeric access to them.
- Exact execution context preserved across nested `M` calls and Q-register push/pop.
- Exact schema of `..Q`, generated `.:EJ` libraries, named-command storage, machine-language dispatch, and keyboard macro execution in TECO EMACS.
- Precise boundary between shared TECO semantics and implementation-specific behaviour.
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
