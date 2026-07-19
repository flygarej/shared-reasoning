# Domain Knowledge

## Purpose

Restore the accepted conceptual model of TECO/TECO EMACS search
semantics and the runtime-object approach used to investigate them,
minimizing incorrect inference across TECO dialects.

## Core Model

-   Model TECO through persistent runtime objects rather than isolated
    commands.
-   The current search string is a persistent runtime object distinct
    from transient search execution.
-   Search semantics are explained primarily by current dot, remembered
    search string, and transient execution state.
-   Dialect differences are first-class; never generalize from one
    implementation.

## Execution Model

-   Explicit search installs the current search string before executing
    the search.
-   Installation is independent of search success.
-   Null searches reuse the remembered search string.
-   Searches begin at current dot.
-   Successful searches advance dot immediately after the match.
-   Search continuation is explained by dot movement plus remembered
    search string.

## Language / Structural Model

-   Search state is externally observable through search execution and
    `G_`.
-   `G_` returns a copy of the remembered search string.
-   Counted search is semantically equivalent to locating the nth
    occurrence.

## Verified Invariants

-   Failed explicit searches replace the remembered search string.
-   Failed `:S` returns 0; successful `:S` returns -1.
-   Ordinary `S` reports search failure.
-   Failed counted searches expose no partial progress and reset dot to
    B.
-   Searches are non-overlapping.
-   Default TECOC search is case-insensitive.
-   TECO-64 supports bounded search syntax; TECOC rejects it.

## Structural Exceptions

-   TOPS-20 TECO is a smaller historical dialect.
-   TECOC manuals may document features absent from the executable.

## Open Questions

-   Complete runtime search-state.
-   Direct search-string mutation commands.
-   Internal bounded-search model.
