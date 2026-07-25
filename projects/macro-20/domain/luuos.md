# LUUOs

## Generator

Local Unimplemented User Operations let a program define application-specific instructions while the processor supplies only the dispatch mechanism.

The opcode selects the software-defined operation; the effective address supplies the operand or argument location.

## Hardware structure

When a LUUO opcode is executed:

1. The effective address is calculated.
2. An instruction image is stored at location 40.
3. The saved image preserves opcode and AC fields, clears indirect/index fields, and replaces the address field with the resolved effective address.
4. The processor executes the instruction at location 41 as though through `XCT 41`.
5. The program's handler interprets and performs the operation.

## Invariants

- Effective-address calculation occurs before handler entry.
- The CPU does not decode the local opcode.
- The CPU does not save accumulators for the handler.
- Software defines the calling convention and operation semantics.

## Cost model

LUUOs are more expensive than ordinary subroutine calls and should normally perform substantial work.

## Worked-example pattern

Gorin's photographed example defines symbolic LUUOs with `OPDEF`, including:

- `ERROR`
- `TTYSTR`
- `TTYCHR`

The main program uses them as instruction-like application interfaces.

The handler pattern is:

1. preserve accumulator state;
2. recover opcode, AC field, and effective address from the saved instruction;
3. validate the local opcode;
4. dispatch through a software table;
5. perform the selected operation;
6. restore state;
7. return to the instruction following the LUUO.

## Boundary

Do not equate LUUOs with TOPS-20 monitor calls. The chapter presents them as local, program-defined operations.

## Open questions

- Further design patterns in the complete worked example.
- Typical argument conventions across real programs.
- Later interaction with other system facilities, if documented.
