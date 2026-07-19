# Domain Knowledge

## Purpose

Restore the project's conceptual model of TECO as a text-processing
programming language built around an editable character buffer and an
execution stream.

## Core Model

-   Buffer is the primary editing object; files are external.
-   Primitive hierarchy: character → position (between characters) →
    range.
-   Lines derive from line terminators; pages derive from form-feed
    separators.
-   Explicit character ranges are fundamental; line/page defaults are
    derived conveniences.
-   Pipeline model: input file → buffer → output file.

## Execution Model

-   Commands execute as a command stream.
-   Numeric arguments are literals, special numeric values, Q-register
    values, or arithmetic expressions.
-   Expressions evaluate left-to-right; parentheses override.
-   Numeric argument state is transient across execution streams.
-   Q-registers provide persistent numeric/text storage.
-   Pushdown saves/restores complete Q-register contents.

## Language / Structural Model

-   Character-oriented editing is invariant.
-   Pointer is always between characters.
-   Commands compose by producing/consuming numbers, positions, ranges,
    text and side effects.

## Verified Invariants

-   Explicit ranges override default operand models.
-   Arithmetic belongs to the numeric argument language.
-   Global Q-registers persist across executions.
-   Local Q-registers are macro-scoped in TECO-11; prompt level owns its
    own set.
-   Pushdown preserves the original Q-register while exposing a
    modifiable working copy.

## Structural Exceptions

-   TECO-64 E3&1 can disable traditional page semantics.
-   :Mq and macros invoked from local Q-registers do not create a new
    local register set.

## Open Questions

-   Control flow, iteration, branching, modifier grammar and remaining
    corner cases.
