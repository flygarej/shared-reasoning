# Project-State.md

## Scope

State of the TECO / TECO EMACS research project after the conditional-control-flow
investigations.

# Verified Conclusions

## Research methodology

- Primary experimental targets are TECOC and TECO-64.
- TOPS-20 TECO is primarily a historical reference implementation.
- Original TECO EMACS is used when investigating architecture.

## Search model

### Verified

- The current search string is a persistent runtime object.
- `G_` copies the current search string into the buffer.
- Explicit searches update the current search string even when the search fails.
- Null searches reuse the remembered search string.
- Searches begin at the current dot.
- Successful searches leave dot immediately after the match.
- Successive searches are non-overlapping.
- Counted searches (`n:S`) locate the nth occurrence from the current dot.
- Failed counted searches expose no partial progress and leave dot at B.
- Failed `:S` returns 0; successful `:S` returns -1.
- Ordinary `S` signals SRH on failure.
- Default TECOC search is case-insensitive.
- Editing text produced by `G_` does not modify the remembered search string.

### Working Model

Persistent search state consists minimally of:

- current dot
- remembered search string

Installing the search string and executing the search are distinct phases.

## Conditional execution model

### Verified

- Untaken conditional branches are not executed.
- Untaken branches are scanned with sufficient syntax awareness to locate the
  correct conditional delimiters.
- Nested conditionals are balanced while scanning untaken branches.
- Delimited insertion text (`@I/.../`) is recognized during dead-branch scanning,
  preventing embedded `'` and `|` from terminating the branch.
- Semantic command execution does not occur while scanning untaken branches.
- Command errors inside untaken branches are ignored.
- Iteration delimiters (`<...>`) are not balanced while scanning untaken branches.

### Working Model

Dead branches undergo selective structural scanning rather than full parsing.
The scanner tracks only syntax required to locate the matching conditional
delimiter.

## Conditional tests

### Verified

Numeric tests:

- `"E` selects zero.
- `"N` selects non-zero.
- `"L` selects negative values.
- `"G` selects positive values.

Character tests:

- `"A` recognizes alphabetic character codes.
- `"D` recognizes decimal digit character codes.
- `"C` recognizes symbol constituents.
- TECOC classifies letters, digits and underscore as symbol constituents.
- Hyphen and space are not symbol constituents.

The character tests operate on the numeric value produced by the preceding
expression, not only on numeric literals.

## Iteration interaction

### Verified

- `n;` exits the current iteration when `n >= 0`.
- A conditional can control iteration exit by conditionally executing `n;`.
- Bare `;` is the search-status form and is not an unconditional iteration exit.

## Dialect understanding

- TOPS-20 TECO is an older, smaller dialect.
- TECOC and TECO-64 are closer to later Standard TECO.
- TECO-64 supports documented bounded-search syntax (`m,n:S`).
- TECOC rejects the same syntax; treat this as a dialect difference pending
  further evidence.

## EMACS architecture

- EMACS extends TECO using MIDAS.
- Long command names resolve through M.M.
- Q-register M preserves MM compatibility.
- Q-register ..Q is a substantial dispatch structure.

## Active Questions

- Remaining conditional tests.
- Expression evaluation semantics for conditional predicates.
- Safe branch contents beyond current experiments.
- Command-stream model and ESC semantics.



