
# Project-State.md

## Scope

State of the TECO / TECO EMACS research project after the search investigations
performed in this session.

# Verified Conclusions

## Research methodology

- Primary experimental targets are TECOC and TECO-64.
- TOPS-20 TECO is primarily a historical reference implementation.
- Original TECO EMACS is used when investigating architecture.

## Search model (updated)

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
- Editing text produced by `G_` does not modify the remembered search string; `G_` returns a copy.

### Working Model

Persistent search state consists minimally of:
- current dot
- remembered search string

Installing the search string and executing the search are distinct phases.

## Dialect understanding

- TOPS-20 TECO is an older, smaller dialect.
- TECOC and TECO-64 are closer to later Standard TECO.
- TECO-64 supports documented bounded-search syntax (`m,n:S`).
- TECOC rejects the same syntax; treat this as a dialect/implementation difference pending further evidence.

## EMACS architecture

- EMACS extends TECO using MIDAS.
- Long command names resolve through M.M.
- Q-register M preserves MM compatibility.
- Q-register ..Q is a substantial dispatch structure.

## Active Questions

- Command to set the remembered search string directly?
- Additional runtime search objects?
- Internal model for bounded search?
