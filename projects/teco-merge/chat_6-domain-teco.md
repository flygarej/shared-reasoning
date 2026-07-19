# domain-teco.md

# Domain Knowledge

## Purpose

Restore the accepted conceptual model of DEC TOPS-20 TECO 540 as a stream-oriented command interpreter by preserving experimentally verified execution semantics, parser behavior, and structural relationships while minimizing inference from later TECO dialects.

---

## Core Model

- TECO is fundamentally a **stream interpreter**, not a file-oriented editor.
- Three conceptually independent streams exist:
  - command stream;
  - text input stream;
  - text output stream.
- The editing buffer is distinct from all three streams.
- Editing commands operate on the buffer; stream-selection commands change attached streams rather than buffer contents.
- Macro execution (`M`) is best modelled as execution of a new command stream rather than invocation of a distinct language runtime.
- Q-registers conceptually contain both numeric and text state; command semantics determine which component is accessed.

---

## Execution Model

- Command stream is scanned incrementally.
- Before command dispatch, parser state is accumulated independently for:
  - numeric argument;
  - colon modifier;
  - at-sign modifier.
- Commands consume the accumulated parser state when dispatched.
- Numeric expressions are accumulated during scanning rather than parsed into a separate syntax tree.
- Arithmetic operators remain pending until another numeric atom is encountered.
- A command requiring a numeric argument may consume the accumulated numeric value before a pending arithmetic operator receives another operand.
- Command return values become new numeric results; they do not retroactively satisfy previously pending arithmetic operators.

---

## Language / Structural Model

- Numeric arguments, `:` and `@` are independent parser components rather than fixed grammar positions.
- For tested commands, parser accepts these components in multiple orders while producing identical semantics.
- Parenthesized expressions evaluate before command dispatch and behave as ordinary numeric arguments.
- Command modifiers alter command interpretation without interrupting expression accumulation.
- Repeated modifier characters are interpreted by individual commands rather than by a global modifier-count rule.

---

## Verified Invariants

- `:S`
  - success returns `-1`;
  - failure returns `0`;
  - failure does not move point;
  - failure does not raise a search error.
- Successful `:S` leaves point exactly where ordinary `S` leaves it.
- Numeric argument, `:`, and `@` may be interleaved before `S` without changing behavior.
- Space between adjacent numeric values performs addition (`2 2` evaluates to `4`).
- Pending arithmetic operators survive across `:` and `@`.
- Completed numeric expressions may appear before, after, or between tested modifiers.
- `QA` behaves as a numeric atom within expression evaluation.

---

## Structural Exceptions

- Documentation for later/Standard TECO defines `::S` as anchored compare.
- TOPS-20 TECO 540 does **not** implement this behavior.
- In TOPS-20:
  - `::S`
  - `:::S`
  - `::::S`
  behave identically to `:S` for tested cases.
- Repeated `@` for `I` behaves identically to a single `@`; alternate delimiter mode is presence-based for tested cases.
- Repeated `:` should not be generalized beyond experimentally verified commands.

---

## Open Questions

- Internal representation of parser state.
- Exact lifecycle of pending arithmetic operators after command dispatch.
- Internal implementation of macro execution.
- Runtime model of Q-register push/pop.
- Relationship between push/pop and execution context.
