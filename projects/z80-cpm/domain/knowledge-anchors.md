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

