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

## Experiment 4 - Z80 Multiply and Decimal Output

Built a native Z80 program that:

- loads two 8-bit integers from memory;
- multiplies them in software using repeated addition;
- retains the result as a 16-bit value;
- converts the result to decimal;
- prints through CP/M BDOS.

Observed:

- `25 * 10` -> `250`
- `25 * 20` -> `500`

The second test verifies that the high byte of the 16-bit product is handled correctly.

---

## Experiment 5 - Register Preservation Failure

Initial decimal-output code used `B` as the digit count while `PUTCHAR` called BDOS function 2.

`PUTCHAR` did not preserve `BC`. The program printed the correct result prefix and then continued popping past the digit data, corrupting return state and eventually crashing yaze-ag itself.

Fix:

```asm
PUTCHAR:
        PUSH    BC
        LD      C,2
        CALL    5
        POP     BC
        RET
```

After the fix, execution completed normally.

Promoted lesson: register preservation must be part of the subroutine contract; BDOS calls must not be assumed to preserve arbitrary registers.

---

## Development Workflow Update

Practical yaze-ag workflow established:

1. Copy source from ChatGPT into a Linux directory mounted as a yaze logical drive.
2. Use PIP to copy the file to a CP/M working drive.
3. Open and save in TE to normalize LF line endings to CR/LF.
4. Assemble with M80.
5. Link with L80.
6. Execute and report observations.

Interactive forms verified:

```
M80
*=MUL/Z

L80
*MUL,MUL/N/E
```

The `=` used at the M80 prompt must not be carried over to the L80 prompt.

---

## Current Open Questions

- Confirm default M80 CPU mode from documentation.
- Characterize the CROMEMCO assembler.
- Identify LINK version 1.31.
- Establish initial domain knowledge capsules.

---


