# Monitor Resource Lifecycles

## Status

Documentation-derived candidate generator, reinforced by accepted JFN and
process models.

---

## Generator

TOPS-20 frequently separates several stages that higher-level systems may
collapse into one operation:

1. identify or describe a resource;
2. acquire a monitor-recognized handle or object;
3. establish operational state or access;
4. use the resource;
5. close, terminate, or release it.

Conceptually:

```text
description
    ↓
acquisition
    ↓
activation or access
    ↓
use
    ↓
cleanup or release
```

Not every subsystem uses every stage, but the separation is a recurring
monitor design pattern.

---

## Files as an Instance

The accepted JFN lifecycle is:

```text
pathname
    ↓ GTJFN
JFN
    ↓ OPENF
open file
    ↓ I/O or mapping
resource use
    ↓ CLOSF / RLJFN
cleanup
```

Obtaining a JFN identifies a file but does not itself establish access.

Opening a file establishes operational state.

Closing and releasing are distinct concepts, even when one operation may
perform both under particular conditions.

---

## Processes as an Instance

The accepted process model separates:

```text
CFORK
    ↓
process exists
    ↓ GET
program image installed
    ↓ SFRKV
execution begins
    ↓ WFORK / KFORK
wait or terminate
```

The process and its executable image are distinct monitor-managed
objects.

---

## Mapping as an Instance

Memory mapping similarly separates:

- identifying a file or process;
- selecting pages;
- establishing map relationships;
- accessing memory through normal instructions;
- changing or removing mappings.

---

## Why the Generator Matters

This pattern prevents several nearby errors:

- treating identification as access;
- treating construction as execution;
- treating a handle as the underlying resource;
- assuming cleanup happens automatically;
- assuming one call performs an entire lifecycle.

---

## Boundaries

The generator does not establish:

- that every resource has a named acquisition call;
- that all handles have the same ownership rules;
- that closing always releases;
- that process termination releases every related external resource;
- that `RESET` is equivalent to correct local cleanup;
- exact error recovery behavior.

Each subsystem may introduce additional states and exceptions.
