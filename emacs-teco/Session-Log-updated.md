
# Session-Log.md

## Scope

Chronological continuation after the previously adopted state.

## Search experiments

- Verified failed explicit searches replace the remembered search string.
- Verified failed `:S` resets dot to B.
- Verified counted searches match repeated-search semantics.
- Verified repeated searches are non-overlapping.
- Verified ordinary `S` raises SRH on failure.
- Verified default case-insensitive search behaviour.
- Verified failed counted searches expose no partial progress.
- Compared bounded-search syntax:
  - TECO-64 accepts documented `m,n:S`.
  - TECOC rejects the syntax.
- Used `G_` to expose the remembered search string.
- Verified `G_` returns a copy by editing inserted text without changing subsequent null-search behaviour.

## Model evolution

The search model advanced from inferred behaviour to a directly observable runtime-object model.

## Next experiments

- Locate commands that directly manipulate the remembered search string.
- Investigate search flags/options.
- Continue runtime-object modelling.
