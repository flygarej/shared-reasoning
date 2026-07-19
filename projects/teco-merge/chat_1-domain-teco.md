# domain-teco.md

# Domain Knowledge

## Purpose

Restore the conceptual model developed for understanding TECO as a language rather than as a collection of editor commands. The intended reasoning model emphasizes parser semantics, execution semantics, operand composition, and experimentally verified behavior over command memorization.

---

## Core Model

TECO is best modeled as a small interpreted programming language operating on a text buffer.

The primary abstraction is not the command list but the interaction between:

* parser
* command stream
* operands
* editing state

Commands compose through supplied operands rather than existing as isolated operations.

The editing buffer is the primary mutable object.

Point (`.`) and buffer extent (`B`,`Z`) define positions within the buffer.

Many operations are naturally expressed as operations on positions or ranges rather than on "lines."

---

## Execution Model

Input is accumulated as a command stream.

Argument termination and command execution are distinct operations.

* ESC terminates commands requiring ESC-delimited arguments.
* Command execution occurs only when the command stream is explicitly executed.

Command composition exists only within a single command stream.

Implicit operands supplied by preceding constructs are consumed only within that stream.

After execution, implicit operand state is not preserved.

---

## Language / Structural Model

Separate:

* parser
* operands
* commands
* editing state

Commands have default operands.

Explicit operands override default behavior.

Operands include:

* numeric values
* text arguments
* positions
* ranges

Ranges are first-class language constructs.

`H` is structurally equivalent to `B,Z`.

Range-producing constructs compose naturally with range-consuming commands.

Example relationships are consequences of this rule rather than independent language features.

Argument syntax and command semantics are orthogonal.

`@` modifies argument parsing while preserving command semantics.

Comments exist only in command syntax.

Once text argument parsing begins, command syntax is suspended until the argument terminator.

---

## Verified Invariants

Command streams may contain multiple commands.

ESC terminates arguments.

Execution occurs after explicit command-stream execution.

`.` denotes current point.

`Z` denotes current buffer end.

`J` moves point to buffer start.

`ZJ` moves point to buffer end.

`L` and `-L` move between line boundaries.

`T` defaults to typing the current line.

`H` is equivalent to `B,Z`.

`B,ZT` and `HT` are experimentally equivalent.

TECOC stores CRLF internally.

TECO-64 stores LF internally.

Despite newline representation differences, observed editing semantics matched.

---

## Structural Exceptions

Implicit operands do not survive command execution.

Executing `H` separately does not affect a later `T`.

Interactive syntax and command-file syntax differ for ESC handling between implementations.

Implementation startup behavior is not part of the language model.

---

## Open Questions

Whether TECO is fundamentally character-oriented with "lines" derived from line separators rather than represented as first-class language objects.

Complete classification of:

* operand-producing constructs
* operand-consuming commands
* parser grammar
* editing model (buffer/page/file relationships)

Exact boundary between language semantics and implementation-specific behavior.

