# Documentation Overview

## Purpose

Relocate the source material used to establish the accepted TOPS-20 TECO 540 and TECO EMACS model. This file records reference roles and limitations rather than restating the domain model.

## TECO-10 Pocket Guide

### Covers

Compact command reference and dialect annotations for TECO-10 and later implementations.

Important items used in this project:

- Q-register storage semantics.
- Absence of `:Gq` in TECO-10.
- `^\` case-acceptance toggle.
- Footnotes distinguishing TECO-10 from later dialects.

### Observed reliability

High for concise dialect-specific facts when confirmed experimentally.

The Q-register footnote exactly matched observed TOPS-20 behavior: TECO-10 stores either text or numeric data, but not both simultaneously, in a single Q-register area.

### Limitations

Compact descriptions can omit operational details and implementation consequences. Command summaries are easy to misread when later-dialect semantics are assumed.

### Disagreements with accepted project knowledge

None retained where the guide was experimentally checked.

### Prefer when

Use for terse TECO-10 command semantics, dialect exclusions, and footnotes that distinguish TECO-10 from later versions.

---

## TOPS-20 TECO 540 / TECO-10 Experiments

### Covers

Observed behavior of the actual target implementation.

Key tested areas:

- Q-register numeric/text replacement.
- `[q` and `]q`.
- destructive `Xq`.
- non-destructive `Gq`.
- error behavior and numeric access to text.
- nested macro execution.
- self-modifying macro behavior.

### Observed reliability

Highest authority in this project.

### Limitations

Experiments establish behavior, not necessarily underlying representation. Single experiments must not be generalized beyond what they discriminate.

### Disagreements with accepted project knowledge

Where later implementations differed, TOPS-20 behavior defines the accepted TECO-10 model.

### Prefer when

Use whenever determining actual TOPS-20 TECO 540 semantics.

---

## TECOC Experiments

### Covers

Behavior of the modern TECOC implementation used for dialect comparison.

Important observed differences:

- simultaneous numeric and text Q-register components;
- copying rather than extracting behavior for `Xq`;
- preservation of text after numeric assignment.

### Observed reliability

High for TECOC itself.

### Limitations

Not authoritative for TECO-10 or TOPS-20 TECO 540. Similar syntax can conceal incompatible runtime semantics.

### Disagreements with accepted project knowledge

TECOC differs materially from the accepted TECO-10 Q-register and `Xq` model.

### Prefer when

Use only for explicit dialect comparison or TECOC-specific work.

---

## Later TECO / TECO-11 Documentation

### Covers

Later Q-register facilities, including direct text insertion and simultaneous numeric/text storage.

### Observed reliability

Accepted as describing later TECO evolution.

### Limitations

Must not be projected backward onto TECO-10.

### Disagreements with accepted project knowledge

No disagreement when treated as later-dialect behavior; incompatible if treated as TOPS-20 semantics.

### Prefer when

Use to explain why TECOC or later manuals differ from TOPS-20 TECO 540.

---

## Original TECO EMACS Manual by Richard Stallman

### Covers

TECO EMACS command conventions and architecture.

Important confirmed topics:

- historical `MM` named-command lookup;
- later `M.M` form;
- named commands;
- variables;
- key bindings;
- keyboard macros;
- minibuffer use;
- BARE library;
- machine-language functions;
- syntax table;
- library generation.

### Observed reliability

High for intended EMACS behavior and terminology.

### Limitations

The manual often describes interfaces rather than exposing runtime storage layout. It does not, from the sections inspected, fully explain where loaded command bodies live.

### Disagreements with accepted project knowledge

None retained. Manual statements were integrated only where consistent with inspected macros or experiments.

### Prefer when

Use for EMACS-level semantics, historical command forms, library workflows, keyboard macro representation, and syntax-table definitions.

---

## Running TECO EMACS Macro Inspection

### Covers

Direct inspection of Q-register-resident EMACS code and runtime values.

Important inspected objects:

- global Q-register `M`;
- local Q-register `.M`;
- local Q-register `.V`;
- structured Q-register `..Q`.

### Observed reliability

Highest authority for the running EMACS instance.

### Limitations

Macro text is difficult to decode without exact command documentation. Binary-looking Q-register text must not be interpreted structurally without discriminating evidence.

### Disagreements with accepted project knowledge

None retained. Earlier speculative readings of individual commands were discarded when contradicted by documentation.

### Prefer when

Use to determine whether an EMACS feature is implemented as TECO macro code and to inspect actual runtime structures.

---

## `.EMACS` Source Libraries

### Covers

Human-authored EMACS command and mode definitions.

Examples encountered:

- `EMACS:BARE.EMACS`
- `EMACS:CMODE.EMACS`

### Observed reliability

High for source-level declarations and comments.

### Limitations

Source form does not directly reveal final runtime placement after library generation. Some functionality may refer to machine-language primitives or generated structures.

### Disagreements with accepted project knowledge

None retained.

### Prefer when

Use to understand how commands, modes, variables, and library-generation logic are authored.

---

## `.:EJ` Generated Libraries

### Covers

Generated runtime form produced from `.EMACS` source libraries.

Confirmed example:

- `EMACS:BARE.:EJ`

`BARE.EMACS` states that “BARE Library Generate” writes a `:EJ` file on the `EMACS` directory.

### Observed reliability

Confirmed as the generated/loadable form used by EMACS.

### Limitations

Exact internal format and whether “compiled” means transformed TECO, indexed runtime objects, machine code references, or a mixture remain unresolved.

The colon in the extension requires quoting in TECO/EMACS contexts and makes ordinary OS-level access awkward.

### Disagreements with accepted project knowledge

None retained.

### Prefer when

Use when investigating loaded-library runtime representation and EJ-page behavior.

---

## Dan Murphy’s Description of `M`

### Covers

Conceptual description of `M` as executing a text variable as a TECO command string.

### Observed reliability

High as primary historical evidence and strongly supported by nested macro experiments.

### Limitations

Conceptual wording does not specify all parser-state or call-frame details.

### Disagreements with accepted project knowledge

None.

### Prefer when

Use for the stream-execution model of TECO macros, while relying on experiments for precise runtime behavior.
