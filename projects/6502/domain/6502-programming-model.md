# 6502 Programming Model

## Purpose

Provide a compact conceptual model for beginning 6502 assembly work.

This file contains generators and boundaries rather than an exhaustive
instruction reference.

## Core Register Model

The primary programmer-visible working registers are:

- `A`: 8-bit accumulator;
- `X`: 8-bit index register;
- `Y`: 8-bit index register.

Useful introductory model:

```text
memory -> A -> memory
          ^
    arithmetic and logic

X and Y help select, walk, or count locations.
```

This model explains many common routines but is not an opcode matrix. Some
instructions support only one index register or only particular addressing
modes.

## Addressing over register abundance

The 6502 has very few internal working registers.

It compensates through:

- several indexed addressing forms;
- indirect addressing through zero-page pointers;
- compact and usually faster zero-page access.

A productive first question is often:

> Where should the data live, and which addressing mode reaches it naturally?

rather than:

> Which register should hold every value?

## Zero Page

Zero page is the first 256 bytes of the address space:

```text
$0000-$00FF
```

It is ordinary memory, not an internal register file.

The processor gives it special instruction encodings that omit the high address
byte. Consequently, zero-page accesses are commonly smaller and usually faster
than equivalent absolute accesses.

This makes zero page suitable for:

- frequently accessed variables;
- counters;
- temporary values;
- pointers used by indirect addressing;
- multi-byte software registers.

The exact allocation is platform-specific. A machine or operating environment
may reserve parts of zero page.

## Accumulator as workbench

Most arithmetic and logic operations involve `A`.

This often produces a flow of:

```text
load into A
operate on A
store from A
```

`X` and `Y` frequently participate in:

- loops;
- table indexing;
- pointer-relative access;
- source or destination traversal.

They are still real data registers, but they are less general than the
interchangeable register sets found in architectures such as the 68000.

## Carry as a data path

Carry participates directly in computation.

It can:

- receive a bit shifted out by `ASL` or `LSR`;
- provide a bit shifted in by `ROL` or `ROR`;
- enter an `ADC`;
- propagate arithmetic from a low byte to a high byte.

This makes carry the connecting path for many multi-byte algorithms.

## Boundary

This conceptual model does not establish:

- exact instruction timings;
- exact flag effects for every instruction;
- every legal instruction/addressing-mode combination;
- assembler-specific syntax;
- platform-specific zero-page ownership.

Consult documentation or run a discriminating experiment when those local
semantics affect correctness.
