# Semantic Anchors

## Purpose

Preserve the smallest set of load-bearing facts that prevent incorrect
reconstruction of the accepted project model.

---

## Microsoft M80 CPU Selection

The following mechanisms are semantically equivalent:

```
.Z80   ==   /Z
.8080  ==   /I
```

The source directive and command-line option select the same instruction
syntax.

Do not treat them as independent mechanisms.

---

## Verified Build Pipeline

The accepted Microsoft build workflow is:

```
.MAC
  ↓
 M80
  ↓
.REL
  ↓
 L80
  ↓
.COM
```

Future examples should assume this pipeline unless explicitly stated
otherwise.

---

## Instruction Set vs Assembler

The processor architecture defines:

- instruction set
- registers
- flags
- execution semantics

The assembler defines:

- directives
- macro facilities
- conditional assembly
- command-line options
- object-file generation

Do not infer assembler behaviour from CPU behaviour, or vice versa.

---

---


## Interactive M80 vs L80 Command Syntax

Do not transfer M80 prompt syntax mechanically to L80.

Verified interactive forms:

```
M80: *=NAME/Z
L80: *NAME,NAME/N/E
```

The `=` belongs to the M80 interactive form and causes a command error when used the same way at the L80 prompt.

---

## Register Preservation Contract

Do not assume a subroutine, BDOS call, or wrapper preserves a register unless that is part of its explicit interface.

A verified failure occurred when a print loop kept its count in `B` across a BDOS output call and the wrapper did not preserve `BC`; the resulting stack overrun eventually crashed the emulator.

When a local wrapper promises preservation, enforce it explicitly with save/restore operations.

---

## Z80 Multiplication Boundary

The Z80 has no hardware multiply instruction.

For Z80 code, multiplication must be implemented in software (for example repeated addition or a shift/add algorithm) unless the target is explicitly changed to a processor such as the Z180 with additional instructions.

Do not silently emit Z180-only multiplication instructions in Z80 examples.

---
