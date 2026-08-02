# JSYS Semantic Anchors

## Status

Documentation-derived candidate anchor set.

These anchors should be retained only while they prevent plausible
inference drift. They are not a substitute for the monitor-call manual.

---

## Monitor Symbols

### Anchor

Use `MONSYM` symbols for monitor calls, flags, and related definitions.

```MACRO-20
        SEARCH  MONSYM
```

Prefer `%`-suffixed monitor-call names.

### Drift prevented

- embedding numeric JSYS codes as if they were the primary interface;
- guessing bit positions;
- colliding with program-defined symbols;
- assuming older spelling conventions apply to later calls.

---

## Symbol Existence Does Not Prove Implementation

### Anchor

`MONSYM` may contain symbols for calls or bit positions that are not
implemented by the target TOPS-20 monitor.

Undefined and unimplemented fields should remain zero unless established
otherwise.

### Drift prevented

- treating assembler recognition as proof of monitor support;
- enabling future-reserved bits because they have plausible names;
- assuming every symbol in the universal file is operational.

---

## Argument Conventions Are General, Not Universal

### Anchor

AC1, AC2, and following accumulators form the general argument sequence,
but individual JSYS descriptions define the actual interface.

### Drift prevented

- inventing a call layout from neighboring calls;
- assuming every call uses only AC1 through AC4;
- overlooking argument blocks or returned data blocks.

---

## Return Paths Are Semantic

### Anchor

`RETURNS +1` and `RETURNS +2` are part of the documented interface.

Do not assume globally that `+1` means failure and `+2` means success.

### Drift prevented

- mechanically applying one branching idiom to every JSYS;
- ignoring meaningful alternate normal returns;
- misclassifying a documented result as an error.

---

## Designators Are Typed

### Anchor

A file, source/destination, device, process, page, or byte-pointer
designator must be interpreted in the context of the receiving JSYS.

### Drift prevented

- treating handles as raw addresses;
- treating special designators as ordinary integers;
- assuming one designator class is accepted wherever another is accepted.

---

## JSYS and Compatibility UUO Are Different Layers

### Anchor

TOPS-20 monitor calls use the `JSYS` instruction.

TOPS-10 compatibility UUOs invoke the compatibility package and are not
the native TOPS-20 monitor interface.

### Drift prevented

- conflating LUUOs, TOPS-10 UUOs, and TOPS-20 JSYSes;
- constructing new TOPS-20 programs around compatibility calls without
  an explicit reason.

---

## RESET Is Process-Wide Cleanup

### Anchor

`RESET` affects a broad set of monitor-maintained process resources.

It is not merely an I/O initialization call.

See `reset.md`.

### Drift prevented

- explaining `RESET` as only terminal initialization;
- assuming it has no effect on inferiors, PSI, IPCF, queues, traps, or
  other process state;
- using it as a narrow substitute for understood resource cleanup.
