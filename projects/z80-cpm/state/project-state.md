# project-state.md

# Project State

## Project

Relearn and experimentally validate:

- Z80 assembly language
- Z180 architecture
- CP/M 2.2
- Later CP/M 3 where appropriate

The project follows the collaboration protocol.

Accepted knowledge is distinguished from historical reasoning.

---

# Current Test Environments

## Emulator

Primary experimentation platform.

- yaze-ag
- Bug-compatible Z80 emulator
- CP/M 2.2
- CP/M 3 available

Primary environment for experiments.

## Hardware

Secondary validation platform.

- Real Z180 system
- Currently running CP/M 2.2

Used for validating emulator behaviour and investigating Z180-specific
features.

---

# Toolchains

## Microsoft Toolchain (Project Baseline)

Assembler

- M80

Linker

- L80 3.44 (09-Dec-1981)

Additional tools

- LIB80
- CREF80

This is the project's accepted reference toolchain.

## CROMEMCO Toolchain

Assembler

- CROMEMCO Z80 Macro Assembler 03.04

Documentation has not yet been incorporated.

No accepted knowledge has yet been derived from this assembler.

---

# Verified Build Workflow

Verified experimentally.

```
TEST.MAC
    │
    ▼
   M80
    │
    ▼
TEST.REL
    │
    ▼
   L80
    │
    ▼
TEST.COM
```

Programs produced by this workflow execute successfully under CP/M.

---

# M80 CPU Syntax Selection

The Microsoft documentation defines two equivalent mechanisms for selecting
instruction syntax.

## Intel 8080 Mode

Command line

```
/I
```

Source directive

```
.8080
```

## Z80 Mode

Command line

```
/Z
```

Source directive

```
.Z80
```

Documentation states:

- `.8080` is equivalent to `/I`
- `.Z80` is equivalent to `/Z`

---

# Verified Behaviour

The following have been experimentally verified.

## Intel 8080 Source

- Assembles successfully.
- Links successfully.
- Executes successfully.

## Native Z80 Source

- `.Z80` enables Z80 syntax.
- `/Z` enables Z80 syntax without a `.Z80` directive.
- Programs assemble successfully.
- Programs link successfully.
- Programs execute successfully.

---

# Working Models

The default M80 syntax mode appears to be Intel 8080 because 8080 source
assembled successfully without `.8080` or `/I`.

This remains a documentation-backed working model until explicitly confirmed
from the M80 manual.

---

# Deferred Topics

- CROMEMCO ZASM
- LINK version 1.31
- Z180 architecture
- CP/M 3
- Initial domain knowledge capsules

---


