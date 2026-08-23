# Session Log (teco/session-log.md)

## Purpose

Preserve the historical reasoning that led to the project's current
accepted knowledge.

Unlike `project-state.md`, this document is **not authoritative**.

It records:

- experiments;
- observations;
- competing hypotheses;
- discarded models;
- reasoning that motivated semantic anchors and boundaries;
- maintenance decisions;
- provenance for accepted knowledge.

The Project State records what we currently accept.

The Session Log records how we arrived there.

---

## Status

This placeholder was created after repository restructuring.

Historical reasoning currently resides primarily in previous ChatGPT
conversations and has not yet been reconstructed into this artefact.

As future work is performed, significant experiments and reasoning
should be recorded here before any accepted conclusions are promoted to
Project State.

---

---

## 2026-08-23 — Startup MIDAS TECO fingerprint

A new MIDAS TECO investigation branch was opened to distinguish facilities
implemented by the TECO executable from later TECO/ELIB/EMACS layers.

The interpreter was started with `@emacs\:teco` in a VT100 TOPS-20 session and
identified itself as `TECO.16510`. It immediately used a cursor-controlled
screen layout with command entry at the bottom and output near the top.

Experiments established:

- `5UA$$QA=$$` returned `5`;
- `HXA` copied `ABC` into A without deleting the source buffer;
- `GA` inserted stored `ABC`, producing `ABCABC`;
- after storing numeric `5` in A, `GA` inserted `5`;
- numeric `QA` on text-valued A returned large negative values, including
  `-34359735078` and `-34359735063`; their meaning was deliberately left
  unresolved;
- `[q`/`]q` worked as Q-register PDL operations within one executing command
  stream (`5UA[A]BQB=$$` returned `5`);
- a push performed in one interactive command stream was gone by a later stream:
  `]A` produced `QRP     Q-register PDL overflow or underflow?`;
- nested `M` execution shared the active Q-register PDL: a macro containing
  `]B QB=` successfully popped and printed a value pushed by its caller.

The resulting working model is that ordinary Q-register contents persist across
interactive command executions, while the Q-register PDL belongs to the active
execution context: it does not persist between separate interactive command
streams but survives nested `M` execution.

The tests also showed a hybrid Q-register fingerprint: storage appears
single-current-value rather than TECOC split-component storage, while `Xq` is
non-destructive unlike the tested TOPS-20 implementation.

An early push/pop text test produced confusing cumulative output because buffer
state from earlier experiments had not been cleared. This was treated as a test
design failure rather than assimilated as semantics; subsequent probes used
explicit cleanup and smaller discriminating cases.

