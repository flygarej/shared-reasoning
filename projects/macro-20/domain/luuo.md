# LUUO (Local Unimplemented User Operation)

## Generator

LUUOs allow a program to extend the instruction set in software.

Execution transfers control to a program-defined handler after effective address calculation.

## Structure

LUUO
    ↓
Effective address calculated
    ↓
Instruction image + resolved EA saved
    ↓
Instruction at location 41 executed
    ↓
Handler interprets opcode and performs operation

## Invariants

- Effective address calculation occurs before handler entry.
- The CPU performs dispatch but does not decode the LUUO operation.
- The handler is responsible for interpreting the opcode.

## Boundaries

- LUUOs are not ordinary subroutine calls.
- LUUOs are more expensive than ordinary subroutine calls and are intended for substantial operations.
- Do not equate LUUOs with monitor calls; this has not been established.

## Open Questions

- Common design patterns from the worked example.
- Typical argument-passing conventions.
- Interaction with monitor facilities, if any.

---
