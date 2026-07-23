# session-log.md

# Session Log

## Bootstrap

Started a new collaboration to relearn:

- Z80 assembly language
- Z180 architecture
- CP/M

Established collaboration methodology and initial project state.

---

## Test Environments

Established two execution environments.

Primary

- yaze-ag
- CP/M 2.2
- CP/M 3 available

Secondary

- Real Z180 hardware
- CP/M 2.2

---

## Documentation Inventory

Available documentation identified.

- Zilog Z80 manuals
- Zilog Z180 manuals
- Digital Research CP/M manuals
- Microsoft M80/L80/LIB80/CREF80 manuals

Documentation for the CROMEMCO assembler is currently unavailable.

---

## Toolchain Inventory

Observed:

Microsoft

- M80
- L80 3.44 (09-Dec-1981)
- LIB80
- CREF80

Observed:

- CROMEMCO Z80 Macro Assembler 03.04

Observed:

- LINK version 1.31

The identity of LINK 1.31 remains unresolved.

---

## Experiment 1

Built an Intel 8080 "Hello World" program.

Workflow

```
M80
 ↓
REL
 ↓
L80
 ↓
COM
```

Program executed successfully.

Promoted to Project State.

---

## Experiment 2

Built a native Z80 program.

Program used:

- `.Z80`
- Native Z80 mnemonics

Compiled successfully.

Linked successfully.

Executed successfully.

Promoted to Project State.

---

## Experiment 3

Repeated assembly without a `.Z80` directive.

Assembly command

```
M80 TEST/Z
```

Assembly succeeded.

Manual confirms

```
.Z80  ==  /Z
.8080 ==  /I
```

Relationship promoted to Project State.

---

## Current Open Questions

- Confirm default M80 CPU mode from documentation.
- Characterize the CROMEMCO assembler.
- Identify LINK version 1.31.
- Establish initial domain knowledge capsules.

---


