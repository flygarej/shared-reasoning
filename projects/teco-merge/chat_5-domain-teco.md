# Domain Knowledge

## Purpose

Restore the conceptual model of TECO control flow, iteration, search
modifiers, and command-prefix parsing established by verified
experiments.

## Core Model

TECO executes a command stream. Commands consume accumulated prefix
state consisting of numeric argument(s), semantic modifier (`:`), and
syntax modifier (`@`). Labels are executable markers; `Olabel` transfers
control independently of structured iteration. Bare `<...>` is the
primitive indefinite iteration construct; numeric arguments specialize
it into counted iteration. `;` exits iteration.

Colon modifiers tend to convert exceptional behaviour into returned
status or metadata. `@` changes parsing (argument syntax), not command
semantics.

## Execution Model

-   Loop count evaluated once on entry.
-   Counted-loop bookkeeping survives backward gotos and `O` exits.
-   `:S` returns `-1` on success, `0` on failure; successful search
    moves dot, failed `:S` leaves dot unchanged.

## Language / Structural Model

Conceptual grammar: `[numeric][:][@]COMMAND`. Parser is more permissive
than documented ordering: numeric material and modifiers may be
interleaved before at least `S`. Prefer documented ordering in source.
`@` supplies alternate delimiters, allowing nesting without consuming
enclosing delimiters.

## Verified Invariants

-   Labels are sequential no-ops.
-   `Olabel` jumps forward/backward.
-   Zero-count loops skip.
-   Nested/adjacent loops compose.
-   Loop state survives internal backward gotos.
-   Argumented `;` exits current iteration when argument \>= 0.
-   `:S` converts search outcome into status.

## Structural Exceptions

-   TOPS-20 errors on negative iteration count; TECO-64 skips.
-   TOPS-20 lacks documented computed goto and `|` else.
-   Bare `;` differs and is syntax-sensitive; prefer argumented form.

## Open Questions

-   General semantic rule for all colon modifiers.
-   Whether prefix accumulation applies uniformly to all commands.
-   Internal implementation of prefix accumulation remains unknown.
