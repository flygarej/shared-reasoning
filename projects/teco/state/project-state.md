# TECO Documentation Overview (teco/state/project-state.md)

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

---

