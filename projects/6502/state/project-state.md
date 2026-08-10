# project-state.md

## Project

Learn 6502 assembly from first principles.

## Operation

Bootstrap completed through the first maintenance pass.

## Objective

Develop a conceptual and practical understanding of classic 6502 assembly,
with emphasis on the processor's programming model, addressing modes, carry
semantics, and characteristic implementation techniques.

## Initial Scope

- Target the classic NMOS 6502 programming model.
- Begin independently of any particular computer, assembler, monitor, or emulator.
- Use small examples that can later be adapted to a Linux-based development
  environment or a Commodore 64 emulator.
- Distinguish processor instructions and semantics from assembler-specific
  syntax, directives, and platform memory maps.

## Excluded for Now

- Commodore 64 KERNAL and VIC-II programming.
- Machine-specific memory maps and I/O.
- 65C02 and 65C816 extensions.
- Selection of a Linux assembler or emulator.
- Demo-scene optimization techniques beyond illustrative discussion.

## Accepted Working Model

The 6502 is an 8-bit processor with a 16-bit address space.

Its primary programmer-visible working registers are:

- `A`: accumulator, used for most arithmetic, logic, and data movement;
- `X`: 8-bit index register;
- `Y`: 8-bit index register.

The processor has a small internal register set. Efficient programming therefore
depends heavily on memory organization, zero-page use, addressing modes, and the
carry flag.

Zero page consists of addresses `$0000` through `$00FF`. The processor provides
shorter and usually faster instruction encodings for zero-page operands. It is
still RAM, but is often used as register-like fast storage.

The original NMOS 6502 has no multiply or divide instructions. Integer
multiplication and division must be implemented in software or supplied by
platform or library routines.

The carry flag is not merely an overflow indicator. It acts as a one-bit data
path connecting:

- addition across multiple bytes;
- subtraction across multiple bytes;
- shifts and rotates;
- bit extraction and insertion.

An unsigned byte-by-byte multiplication can be implemented by a shift-and-add
algorithm, producing a 16-bit result.

## Current Generators

### Addressing over register abundance

The 6502 compensates for a very small register set with specialized addressing
modes and preferential access to zero page. Efficient code often comes from
choosing the correct data location and addressing mode rather than attempting
to keep many values in registers.

### Accumulator as workbench

Most data processing flows through `A`, while `X` and `Y` primarily help select,
walk, or count memory locations. This is a useful introductory model, but exact
instruction support must still be verified locally.

### Carry as a shared one-bit path

Carry transports information between shifts, rotates, and successive arithmetic
operations. Multi-byte algorithms should be understood as explicit compositions
through this one-bit path.

## Boundaries and Uncertainty

- Exact instruction availability varies by addressing mode; the structural model
  does not establish every opcode/mode combination.
- Assembler syntax may differ, including notation for literals, labels,
  accumulator operands, zero-page selection, and directives.
- Timing and instruction-size claims should be checked against authoritative
  NMOS 6502 documentation before being treated as exact.
- No emulator, assembler, or test platform has yet been selected.
- The project's current examples have been reasoned about but not executed in a
  selected environment.

## Next Direction

1. Select a Linux-based assembler and emulator or monitor.
2. Establish exact source syntax and a reproducible build/run workflow.
3. Learn and test:
   - register transfers;
   - load and store operations;
   - immediate, zero-page, and absolute addressing;
   - indexed addressing;
   - flags and branches.
4. Create a minimal verified program and preserve it as the first reference
   artefact.
