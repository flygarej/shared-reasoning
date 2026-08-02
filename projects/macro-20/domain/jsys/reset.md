# RESET

## Status

Documentation-derived semantic anchor.

---

## Central Anchor

`RESET` performs broad cleanup of monitor-maintained state associated with
the process.

It should not be understood merely as:

> initialize terminal I/O

or:

> clear files before starting a small program

Those are visible effects in simple examples, but not the full semantic
scope.

---

## Documented Scope

The reference description includes effects across several subsystems,
including cleanup or reset of:

- open files and JFNs;
- inferior processes;
- software interrupt state;
- IPCF PIDs;
- enqueue requests;
- terminal-related state;
- software traps;
- selected process-related handles and monitor resources.

The exact full list belongs to the `RESET` JSYS reference entry.

---

## Generator Relationship

`RESET` is a cross-subsystem lifecycle operation.

It demonstrates that the monitor may provide a broad process-level
cleanup operation spanning several otherwise independent resource
families.

Conceptually:

```text
process with accumulated monitor state
                    ↓
                  RESET
                    ↓
broad restoration toward initial process conditions
```

---

## Why It Is an Anchor

Small MACRO-20 examples commonly begin:

```MACRO-20
START:  RESET
```

That repeated placement encourages a narrow inferred meaning:

> program initialization

The exact local semantic is broader and therefore worth preserving.

---

## Boundary

`RESET` should not replace deliberate understanding of normal resource
lifecycles.

A program should still use the proper close, release, wait, terminate,
unmap, or deallocation operations when their semantics matter.

Do not infer from this capsule:

- the exact order in which resources are reset;
- rollback guarantees;
- behavior under every failure condition;
- whether every possible external resource is released;
- that `RESET` is harmless at arbitrary points in a running program.

Consult the exact JSYS entry before relying on a particular cleanup
effect.
