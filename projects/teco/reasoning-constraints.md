# TECO Reasoning Constraints (teco/reasoning-contraints.md)

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

## Semantically dense commands

When generating executable examples, treat compact commands whose behavior depends on precise local semantics (for example %, ;, :S, X, G, M) as verification points.

Do not substitute an intuitive interpretation based on other programming languages or overall program intent.

Before finalizing executable code, verify that each such command is used according to its experimentally established local semantics.

---

## Failure classes

- Structural correctness does not imply command-local correctness.
- Control-flow operators (;, :;, %, O, etc.) are semantically dense. Their structural role does not determine their local semantics. When generating executable examples, verify the exact command-local exit conditions rather than inferring them from the intended control flow.
- When a program depends on command-local behavior, verify that behavior against accepted project knowledge before generating executable examples.
- If local semantics are uncertain, preserve the structural solution and identify the unresolved operator rather than silently choosing a plausible interpretation.
- Side effects and produced values are independent semantic properties. Verify both.
- Partial documentation can create false semantic completeness.
  Documentation of a command’s syntax or side effect does not establish its produced value, error behavior, point movement, or modifier interaction. Treat each correctness-relevant dimension independently until documented or experimentally verified.

---

## Suggested strategy when handling failure classes

On uncertain inference, ask collaborator for advice or input. If neither know how to resolve, devise a test to determine correct path forward.

---

