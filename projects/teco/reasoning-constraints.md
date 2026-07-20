# TECO Reasoning Constraints

## Exact Program Generation

- Exact TECO programs require verified command-local semantics, not only a
  correct high-level program shape.
- Treat compact operators and command modifiers as semantically dense.
- Do not infer the value produced by an operator merely from the state
  change it performs.
- Do not infer delimiter behaviour across commands, modifiers,
  implementations or interactive/file contexts.
- When command-local semantics are uncertain, present only the verified
  structural shape and identify the unresolved operation.
- Finalize the program only after the relevant semantics are documented or
  experimentally discriminated.
  
---

