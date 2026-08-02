# JSYS Interface

## Status

Documentation-derived candidate generator.

Source basis: **TOPS-20 Monitor Calls Reference Manual**, Version 7.0.

---

## Generator

A TOPS-20 monitor call is a structured transition between user code and
the monitor.

The caller:

1. prepares arguments in accumulators and, when needed, argument blocks;
2. executes a named JSYS;
3. receives control through a documented return path;
4. obtains returned data in accumulators or caller-supplied storage.

Conceptually:

```text
caller state
    ↓
argument preparation
    ↓
JSYS instruction
    ↓
monitor service
    ↓
documented return path
    ↓
returned data and side effects
```

The interface consists of both data flow and control flow.

---

## Accumulator Convention

The general convention places the first monitor-call argument in AC1, the
second in AC2, and so forth.

This is a convention rather than a universal proof of every call's exact
layout. Individual monitor-call descriptions remain authoritative.

Monitor calls may return results in accumulators.

When more returned data is required than can reasonably fit in
accumulators, the caller supplies storage and passes a pointer to it.

---

## Argument Blocks

Many monitor calls use contiguous argument blocks in memory.

An accumulator may point to an argument block.

An argument block may itself contain pointers to further blocks.

This allows monitor interfaces to scale from simple calls to structured
operations without changing the fundamental JSYS mechanism.

Conceptually:

```text
AC argument
    ↓
argument block
    ↓
additional blocks or data
```

The presence of nested blocks does not imply that all JSYS interfaces are
uniform. Their exact structures are local semantics.

---

## Symbolic Interface

Monitor-call names and related symbols are defined by `MONSYM`.

Programs using those symbols include:

```MACRO-20
        SEARCH  MONSYM
```

The manual recommends monitor-call names ending in `%`.

The suffix helps avoid conflicts with program symbols and is required for
calls defined in TOPS-20 Version 4.0 or later. Older calls accept the
suffixed form.

The symbolic interface is part of the supported programming model.

Prefer symbolic call names and flag definitions over embedded call
numbers or bit positions.

---

## Relationship to JSYS Instruction

TOPS-20 monitor calls invoke the monitor through the `JSYS` instruction.

This is distinct from TOPS-10 compatibility UUOs.

Programs written for TOPS-20 should use TOPS-20 monitor calls rather than
TOPS-10 compatibility operations unless compatibility is itself the
objective.

---

## Relationship to Other Generators

This capsule explains the common call shape.

Other capsules explain:

- what kinds of designators arguments may contain;
- how resources move through lifecycles;
- how success and failure affect control flow;
- how calls cluster into functional families.

Exact per-call semantics remain in the reference manual, accepted
anchors, and verified programs.

---

## Boundaries

This generator does not establish:

- the exact AC layout of an individual JSYS;
- which accumulators are preserved;
- the exact format of an argument or result block;
- flag positions;
- whether a call uses one or two normal return paths;
- the complete interaction with `ERJMP` or `ERCAL`;
- version-specific behavior.

Do not turn the common convention into an invented local interface.
