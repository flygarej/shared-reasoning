# MIDAS TECO Investigation

## Purpose

Investigate the custom TECO implementation written in MIDAS assembly and used
as the bootstrap interpreter for original TECO EMACS.

This branch complements the existing TOPS-20 TECO, TECOC, and TECO-64
implementation work. Its primary purpose is experimental capability discovery:
determine which TECO facilities are intrinsic to the MIDAS TECO executable,
which are added by subsequently loaded TECO or ELIB libraries, and which emerge
only after the full EMACS environment has been initialized.

The investigation should preserve provenance carefully because very little
direct user documentation for this TECO implementation is currently available.

---

## Working Identity

The implementation under investigation is a TECO written in MIDAS assembly and
used by original EMACS.

Observed architectural characteristics reported at project bootstrap:

- the executable can operate as a TECO interpreter before full EMACS is loaded;
- it is TTY-aware and controls terminal cursor/display behaviour;
- it contains facilities needed to bootstrap EMACS;
- additional TECO and ELIB files are loaded to construct the full TECO EMACS
  environment.

These statements are the starting working model for investigation. Exact
implementation boundaries remain to be established experimentally and, where
possible, by inspection of the MIDAS sources.

---

## Initial Compatibility Hypotheses

### Hypothesis: TOPS-20 TECO baseline

Until experiments establish otherwise, use TOPS-20 TECO behaviour as the
initial hypothesis generator for ordinary TECO commands.

This is not an assertion of compatibility.

For each correctness-relevant command:

1. prefer direct experiment on MIDAS TECO;
2. compare with accepted TOPS-20 TECO behaviour;
3. record agreement, disagreement, or unresolved behaviour;
4. do not silently promote agreement on a few commands into general
   compatibility.

### Hypothesis: EMACS-source compatibility

TECO found in original EMACS TECO source files is a useful source of candidate
syntax and behaviour.

However, occurrence in an EMACS source file does not establish that the
facility is implemented by the base MIDAS TECO executable. The command or
mechanism may instead be supplied by:

- the MIDAS TECO executable itself;
- bootstrap TECO code;
- a loaded TECO library;
- a loaded ELIB library;
- generated EMACS runtime state;
- machine-language support reached through the EMACS environment.

The implementation layer must therefore be identified rather than inferred
from source usage alone.

---

## Layer Model

Use the following provisional layers when classifying discovered behaviour:

```text
MIDAS TECO executable
        ↓
bootstrap TECO environment
        ↓
loaded TECO / ELIB facilities
        ↓
full TECO EMACS environment
```

A successful command in full EMACS does not prove that the command exists in
the MIDAS TECO executable.

Likewise, a command accepted by bare MIDAS TECO is strong evidence that the
facility belongs to the executable or to whatever startup material has already
been loaded at that exact test point.

For every experiment, record the environment layer explicitly.

---

## Experimental Method

Prefer small discriminating tests.

For each tested facility record:

- exact implementation/startup state;
- exact command stream;
- buffer or Q-register setup when relevant;
- observed output;
- point/buffer/state changes;
- error text or failure mode;
- comparison with TOPS-20 TECO;
- whether the facility is also seen in EMACS source;
- current attribution of the facility to an implementation layer;
- confidence and unresolved alternatives.

Avoid testing large EMACS macros before the primitive commands they depend on
have been classified.

---

## Capability Matrix

Use this section as a compact index. Detailed transcripts may remain in the
session log or separate observation artefacts.

| Area | MIDAS TECO status | TOPS-20 comparison | Layer attribution | Notes |
| --- | --- | --- | --- | --- |
| Basic command-stream execution | Untested | Candidate baseline | Unknown | |
| Buffer `B`, `Z`, `.` | Untested | Candidate baseline | Unknown | |
| Movement `J`, `C`, `L` | Untested | Candidate baseline | Unknown | |
| Insert/delete/typeout | Untested | Candidate baseline | Unknown | |
| Numeric expressions | Untested | Candidate baseline | Unknown | |
| Q-register numeric storage | Verified basic `Uq`/`Qq`; text store changes numeric view | Differs from TECOC split-component model | Startup MIDAS TECO | Exact numeric interpretation of text-valued register unresolved |
| Q-register text storage | Verified `Xq`/`Gq` | Hybrid relative to tested TOPS-20/TECOC | Startup MIDAS TECO | `Xq` copies without deleting source; `Gq` reinserts stored value |
| Search / remembered search | Untested | Candidate baseline | Unknown | |
| Conditionals | Untested | Candidate baseline | Unknown | |
| Iteration | Untested | Candidate baseline | Unknown | |
| `M` macro execution | Verified nested macro execution | Compatible with core TECO macro model | Startup MIDAS TECO | Nested `M` shares active Q-register PDL context |
| File input/output | Untested | Candidate baseline | Unknown | |
| Terminal/cursor facilities | Known to exist at some level; details untested | Expected extension | Unknown | Important distinguishing area |
| EMACS bootstrap commands | Present at some level; details untested | Expected extension | Unknown | Must separate executable from loaded libraries |
| Named-command machinery | Untested | EMACS-layer candidate | Unknown | Do not assume primitive implementation |
| ELIB-provided facilities | Untested | N/A | Loaded library candidate | Attribution is a primary research goal |

---

## Verified Startup MIDAS TECO Findings — 2026-08-23

Environment tested:

- TOPS-20 login session with terminal type set to VT100;
- interpreter started with `@emacs\:teco`;
- startup display identified itself as `TECO.16510`;
- no TECO/ELIB files were deliberately loaded by the experimenter after startup.

The startup screen is terminal-aware: the screen is cleared, the version is
displayed near the top, command entry appears at the bottom, and command output
appears in the upper display area. Whether startup itself implicitly loads any
bootstrap material remains unresolved, so this environment is called **startup
MIDAS TECO**, not proven bare executable TECO.

### Q-register numeric and text behaviour

`5UA$$QA=$$` returned `5`, verifying ordinary numeric Q-register store/read for
register A.

After storing buffer text `ABC` with `HXA`, `QA=$$` no longer returned the old
numeric `5`; one observed value was `-34359735078`. A later text-valued state
produced `-34359735063`. These large negative values are preserved as raw
observations only. Their representation or meaning is unresolved.

`HXA` was non-destructive to the source buffer: immediately following it,
`HT$$` still printed `ABC`. This differs from the tested TOPS-20 TECO behaviour
retained by the project, where `Xq` extracts/removes the source range.

`GA` then inserted the stored text, producing `ABCABC`, verifying that `Gq`
re-inserts the stored value without consuming it.

After `5UA`, clearing the buffer and executing `GA$$HT$$` produced `5`. Thus a
numeric Q-register value can be inserted textually by `Gq` in this implementation.
The previous `ABC` text was not restored, which supports a working model in
which the register has one current value rather than TECOC-style independent
numeric and text components.

### Q-register PDL lifetime

A push and pop within one executing command stream worked:

```text
5UA[A]BQB=$$
```

returned `5`, verifying the conventional Q-register PDL roles of `[q` and `]q`
in that context.

When the push and pop were separated by interactive command execution:

```text
5UA$$
[A$$
7UA$$
QA=$$
]A$$
QA=$$
```

`QA` first returned `7`; `]A` then reported:

```text
QRP     Q-register PDL overflow or underflow?
```

and the final `QA` remained `7`.

This establishes that the Q-register PDL does not persist across separately
executed interactive command streams in the tested startup environment.

A nested macro did, however, access the same active PDL. A macro in register C
containing `]B QB=` successfully popped a value pushed before `MC` and printed
`5`. Therefore the current working model is:

```text
Q-register contents
    persist across separately executed command streams

Q-register PDL
    does not persist across separately executed interactive command streams

Q-register PDL
    is shared across nested M execution within one active execution context
```

The exact internal lifetime and representation of this execution context remain
unresolved.

### Current comparison fingerprint

- Q-register storage appears single-current-value rather than TECOC-style
  simultaneous numeric/text components.
- `Xq` is non-destructive to the source buffer, unlike the tested TOPS-20 model.
- `Gq` inserts both text values and the textual form of an observed numeric value.
- nested `M` execution participates in the active Q-register PDL context.
- the Q-register PDL is transient across separately executed interactive command
  streams.

These findings demonstrate that startup MIDAS TECO is not safely modeled as
either tested TOPS-20 TECO or TECOC as a whole.

---

## Cross-Project Source Work

The MIDAS project is investigating the assembler and source code used to build
this TECO implementation.

Results from MIDAS source inspection may be imported here as evidence when they
establish command implementation, dispatch, runtime structures, terminal
handling, or bootstrap behaviour.

Source-derived conclusions must retain provenance:

- source inspection establishes what the inspected source appears to implement;
- executable experiments establish observable runtime behaviour;
- agreement between the two strengthens attribution;
- disagreement should be preserved and investigated rather than normalized.

The TECO project remains responsible for behavioural experiments and
TECO-language interpretation. The MIDAS project remains responsible for
assembly-level reconstruction unless the investigation explicitly crosses that
boundary.

---

## Reference Routing

Existing TECO references remain useful comparison sources:

- TOPS-20 TECO is the primary initial behavioural comparison for historical
  ordinary TECO semantics;
- TECO-64 can help identify later facilities and dialect evolution;
- TECOC can provide another modern comparison and searchable command
  documentation;
- original EMACS TECO and ELIB source files provide candidate usage evidence,
  but not automatic proof of where a facility is implemented.

Future MIDAS TECO source listings, notes, or documentation should be stored
under:

`/projects/teco/references/MIDAS-TECO/`

when useful to the TECO investigation.

---

## Boundaries

- Do not equate MIDAS TECO with TOPS-20 TECO merely because ordinary commands
  behave similarly.
- Do not infer that a command used by EMACS is primitive MIDAS TECO.
- Do not infer that a command absent in bare MIDAS TECO is absent from full
  TECO EMACS.
- Do not infer implementation layer from command spelling alone.
- Do not treat TTY awareness as proof of any particular terminal architecture
  until experimentally or source-verified.
- Do not promote source-code interpretation over contradictory executable
  behaviour without resolving the discrepancy.
- Preserve startup state: a test is meaningful only if we know what bootstrap
  or library material had already been loaded.

---

## Initial Questions

- What identifies the barest runnable MIDAS TECO environment?
- Which ordinary TOPS-20 TECO commands are implemented identically?
- Which TOPS-20 commands differ or are absent?
- Which additional commands are intrinsic to the executable?
- Which terminal/cursor operations are implemented directly in MIDAS?
- Which commands are required to bootstrap the first EMACS libraries?
- What files are loaded, and in what order, between bare TECO and full EMACS?
- Which TECO/ELIB files define additional commands or Q-register conventions?
- At what layer are named-command lookup, variable handling, keyboard dispatch,
  and display management introduced?
- Can individual command implementations be mapped from runtime experiments to
  MIDAS source entry points?

---

## Promotion Rule

This file begins as a working investigation capsule.

Move behaviour into accepted TECO project knowledge only after it is:

- experimentally verified on a clearly identified MIDAS TECO startup state;
- established by sufficiently clear source inspection and accepted as the
  current model;
- or intentionally retained as an explicitly labelled working model.

The central goal is not merely to enumerate commands.

It is to reconstruct the boundary between the MIDAS TECO interpreter and the
TECO/ELIB machinery that turns it into original EMACS.
