# session-log.md

## 2026-08-04 — Project bootstrap and first exploration

### Scope established

The project was started to learn 6502 assembly.

The user currently has access to a Commodore 64 emulator on another Windows
computer, but chose to begin with generic 6502 fundamentals. A Linux-based
assembler and emulator may be selected later.

The initial scope was therefore set to the classic NMOS 6502 programming model,
without yet adopting Commodore-specific memory maps, ROM routines, graphics
hardware, or assembler syntax.

### Initial architectural discussion

The processor was introduced as having:

- one accumulator, `A`;
- two index registers, `X` and `Y`;
- a 16-bit address space;
- a fixed stack page;
- a processor-status register.

The discussion emphasized that `A`, `X`, and `Y` are not interchangeable
general-purpose registers. `A` is the primary arithmetic and logic work register,
while `X` and `Y` are primarily used for indexing and counting.

### Zero page

Zero page was identified as addresses `$0000` through `$00FF`.

The useful conceptual model is that zero page remains ordinary RAM, but has
special compact and usually faster addressing forms. This makes it function as
register-like fast storage in many programs.

The user responded positively to this design choice and observed that the
processor appeared well suited to moving through data.

### Addressing modes

The conversation surveyed the major NMOS 6502 addressing concepts:

- immediate;
- zero page;
- absolute;
- zero-page indexed;
- absolute indexed;
- indexed indirect;
- indirect indexed;
- relative;
- implied;
- accumulator;
- indirect `JMP`.

No exact opcode-by-addressing-mode matrix was established. That remains a local
semantic detail requiring documentation or experiment.

### Multiply and divide failure mode

A known language-model failure was discussed: inventing `MUL` or `DIV`
instructions for the 6502.

The accepted conclusion is that the original NMOS 6502 has neither multiply nor
divide instructions. Such operations require software algorithms or supplied
library/platform routines.

This became the project's first clear semantic anchor because it prevents
cross-architecture contamination from instruction sets that do provide those
operations.

### Shift-and-add multiplication

An unsigned 8-bit by 8-bit multiplication producing a 16-bit result was examined.

The routine used:

- `LSR` to move the current multiplier bit into carry;
- `BCC` to skip the add when that bit was zero;
- `CLC` before beginning each 16-bit addition;
- successive `ADC` operations so carry from the low-byte addition entered the
  high-byte addition;
- `ASL` and `ROL` to shift a 16-bit multiplicand through carry;
- `CLD` to ensure binary rather than decimal arithmetic.

This produced the working conceptual conclusion that carry is a shared one-bit
data path, not merely an overflow flag.

The routine has not yet been executed in a chosen assembler or emulator, so it
remains unverified executable material rather than a verified reference program.

### Historical meanders not promoted into project state

The conversation ranged over:

- Commodore's adoption of the 6502;
- the TI-99/4A;
- TI Lisp machines;
- Dallas Semiconductor;
- the 68000, Z80, ARM, RISC-V, CHERI;
- Transputers and Connection Machines;
- Go, Rust, Valkey, and Kubernetes.

These discussions provided useful cultural and architectural context but were
not promoted into the 6502 project state because they are not required to
continue the active 6502 investigation.

### First maintenance decision

There is now sufficient accepted knowledge to replace the fresh-project
placeholders.

The project should remain compact. Initial domain knowledge is split into:

- `domain/6502-programming-model.md`;
- `domain/6502-semantic-anchors.md`.

The bootstrap TODO should be replaced by an active project TODO.
