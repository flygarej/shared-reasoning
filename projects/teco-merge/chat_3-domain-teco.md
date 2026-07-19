# Domain Knowledge

## Purpose

Restore the accepted conceptual model of TECO control flow developed in this investigation: TECO executes command streams containing structurally delimited regions; conditionals and iterations control whether and how often such regions execute; skipped regions are structurally scanned but not semantically executed. TOPS-20 TECO is the semantic reference, with TECOC and TECO-64 used as compatibility comparisons.

## Core Model

- The execution stream is a primary TECO language object.
- Control-flow constructs operate on delimited regions of that stream, not merely on single following commands.
- A region may contain multiple commands and nested control-flow regions.
- Region handling separates structural scanning from semantic execution:
  - structural scanning finds matching delimiters and respects nesting;
  - semantic execution interprets commands, produces effects, and raises runtime errors.
- A region may therefore be structurally valid yet contain commands that would fail if executed.
- TOPS-20 TECO 540(6124)-2 is the accepted semantic reference.
- TECOC and TECO-64 are comparison implementations. Agreement across all three supports a language-level conclusion; disagreement should first be classified as implementation-specific.

## Execution Model

- Interactive input accumulates a command string before execution is triggered by the command terminator sequence.
- On TOPS-20 TECO and TECOC, ESC is echoed as `$`; on TECO-64 it is echoed as `` ` ``. This is presentation, not language semantics.
- Numeric arguments feed control-flow commands directly.
- For `n"E ... '`:
  - the numeric argument is tested for equality with zero;
  - if true, the body executes;
  - if false, the body is structurally skipped.
- For `n< ... >`:
  - the numeric argument determines the iteration count;
  - the body executes exactly `n` times for tested nonnegative counts;
  - `0< ... >` skips execution of the body.
- Runtime errors arise only from commands actually executed. Commands inside a skipped body may be semantically invalid without error, provided the surrounding control-flow structure is balanced.
- Structural imbalance is still detected while skipping.

## Language / Structural Model

- Conditional grammar generator:

  ```text
  numeric-value " predicate body '
  ```

- Verified predicate in this thread:

  ```text
  E  → numeric value equals zero
  ```

- Iteration grammar generator:

  ```text
  numeric-value < body >
  ```

- `body` is a balanced execution region:
  - it may contain multiple commands;
  - it may contain nested regions of the same kind;
  - conditionals and iterations may be treated as instances of the same region-oriented control-flow model.
- Conditional apostrophes and iteration angle brackets are matched structurally, not by stopping at the first closing delimiter encountered.
- Structural scanning must understand enough nesting to skip an outer false conditional or zero-count loop without executing nested contents.
- Whitespace was not established here as a control-flow delimiter or semantic requirement and should not be inferred to carry structural meaning from these experiments.

## Verified Invariants

- `0"E ... '` executes its body.
- A nonzero value supplied to `"E` skips its body.
- Conditional bodies may contain multiple commands.
- Conditionals nest.
- An outer false conditional skips a balanced nested conditional without executing it.
- An unbalanced conditional region produces an unterminated-command error even when the outer condition would otherwise skip execution.
- `n< ... >` executes the body `n` times for tested nonnegative counts.
- Iteration bodies may contain multiple commands.
- Iterations nest.
- `0< ... >` executes the body zero times.
- A zero-count loop suppresses runtime errors from commands inside its body.
- These basic `"E` conditional behaviors were confirmed on TOPS-20 TECO, TECOC, and TECO-64.
- The different ESC echo characters across implementations do not alter command semantics.

## Structural Exceptions

- Delimited text commands terminate at their own delimiter before subsequent command characters are interpreted. Text following the delimiter is not part of the insertion merely because it appears inside a control-flow body.
- Skipped code need not be semantically valid, but it must remain structurally skippable.
- `D` deletes forward by default. After insertion at end of buffer, plain `D` may fail because no following character exists; `-1D` addresses the previous character. This matters when constructing control-flow probes intended to distinguish execution from skipping.
- Persistent buffer state can contaminate observations. Clean experiments should explicitly clear the buffer when prior contents could affect output.

## Open Questions

- Full conditional predicate set and exact semantics of each predicate.
- Whether all conditional forms share exactly the same structural behavior as `"E`.
- Exact rules for mixing different region types in deeper nesting.
- When iteration counts are evaluated and whether they can change during execution.
- Semantics of negative iteration counts.
- Whether other TECO constructs use the same structural-region machinery.
- Precise interpreter architecture underlying structural scanning versus execution.
