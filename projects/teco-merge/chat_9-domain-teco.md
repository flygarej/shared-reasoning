# Domain Knowledge

## Purpose

Restore the accepted conceptual model of TECO conditional execution, conditional predicates, and the relationship between parser behavior and execution. The capsule is intended to restore the interpreter model rather than command syntax.

---

## Core Model

TECO conditional execution consists of two distinct phases:

1. structural scanning to locate conditional boundaries;
2. execution of the selected branch.

Untaken branches are not executed, but neither are they ignored. They undergo selective structural scanning sufficient to locate the matching conditional delimiter.

Conditional predicates operate on the numeric value produced by the immediately preceding expression, regardless of how that value was computed.

Iteration exit (`;`) is a family of predicates rather than a single unconditional control-flow operation.

---

## Execution Model

Conditional evaluation order:

1. evaluate the preceding numeric expression;
2. evaluate the conditional predicate;
3. structurally scan the untaken branch;
4. execute only the selected branch.

Structural scanning performs only the minimum analysis required to identify the correct matching conditional delimiter.

Semantic command execution, argument validation and runtime errors occur only within executed branches.

Character-class predicates evaluate numeric character codes, not literal syntax.

---

## Language / Structural Model

Dead-branch scanning recognizes only syntax relevant to locating conditional boundaries.

Recognized structure includes:

- nested conditionals;
- delimited insertion text (`@I/.../`).

Structure unrelated to conditional matching is ignored during dead-branch scanning.

Iteration control and conditional control are orthogonal.

Conditional execution may select whether an iteration-exit command executes; the iteration command retains its own semantics.

Conditional predicates consume the numeric result of the immediately preceding expression, not merely numeric literals.

---

## Verified Invariants

Untaken conditional branches:

- are never executed;
- ignore semantic command errors;
- ignore command argument validation;
- correctly balance nested conditionals;
- correctly ignore conditional delimiters occurring inside `@I/.../` text;
- do not require balanced iteration delimiters.

Numeric predicates:

- `"E` selects zero.
- `"N` selects non-zero.
- `"L` selects negative values.
- `"G` selects positive values.

Character predicates:

- `"A` tests alphabetic character codes.
- `"D` tests decimal digit character codes.
- `"C` tests symbol constituents.

Observed `"C` classification:

- alphabetic → true;
- decimal digit → true;
- underscore → true;
- hyphen → false;
- space → false.

Iteration predicates:

- `n;` exits iteration when `n >= 0`.
- `n:;` exits iteration when `n < 0`.
- bare `;` and `:;` operate on search success state rather than numeric values.

---

## Structural Exceptions

Dead-branch scanning is not full parsing.

Only syntax required to locate conditional delimiters is recognized.

Iteration balance is ignored while scanning untaken branches.

Semantic validity of commands inside untaken branches is not checked.

---

## Open Questions

- Remaining conditional predicates not yet experimentally verified.
- Expression evaluation semantics beyond current predicate model.
- Additional branch contents requiring structural recognition.
- Complete command-stream model and ESC semantics.
