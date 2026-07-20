# TECO Domain Knowledge (teco/domain-teco.md)

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

---

