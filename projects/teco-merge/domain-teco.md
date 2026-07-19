# Domain Knowledge

## Purpose

Restore the experimentally accepted conceptual model of TECO control flow and expression evaluation for reasoning about previously unseen programs, emphasizing execution semantics over command catalogues.

## Core Model

- TECO is best modeled as an execution engine operating on a character buffer plus a transient numeric evaluation stream.
- Commands belong to semantic classes: numeric producers, consumers, transformers, buffer operations, and control-flow operations.
- Verified implementation differences between TOPS-20 TECO 540 and later TECO implementations are part of the model.

## Execution Model

- Arithmetic evaluates left-to-right unless grouped by parentheses.
- Numeric expressions are consumed by assignment and conditional commands; consumers need not leave a replacement value.
- Text-taking commands retain their own argument grammar inside control structures.
- Control flow is sequential unless altered by conditional execution, iteration, or goto.

## Language / Structural Model

- Labels are `!tag!` markers and are executable no-ops.
- `Otag$` transfers control to matching labels and supports forward and backward jumps in TOPS-20.
- Conditionals select execution from the preceding numeric expression.
- Iteration is a distinct structural construct.

## Verified Invariants

- Buffer model: B, Z, dot.
- Left-associative arithmetic.
- Parentheses override grouping.
- Assignment consumes the complete preceding expression.
- TOPS-20 requires explicit termination of text arguments inside conditionals.
- TOPS-20 supports simple conditionals and `Otag$`.
- TECO-64 supports `|` else and one-based computed goto.

## Structural Exceptions

- TOPS-20 TECO 540 does not implement documented `|` else.
- TOPS-20 TECO 540 does not implement documented computed goto (`nO...`).
- Do not generalize implementation-specific behavior across TECO variants.

## Open Questions

- Lifetime of the numeric evaluation stream.
- Complete producer/consumer taxonomy.
- Full iteration semantics.
