# ARM64 Domain Knowledge

## Purpose

This capsule contains compact project-domain knowledge accepted during the
ARM64 learning project. It should grow from observed behavior and verified
semantics rather than attempt to become an ARM reference manual.

The main experimental platform is AArch64 Linux on Raspberry Pi 5 using GNU
Binutils.

---

## Generator: Inspectable Assembly Pipeline

For small Linux/AArch64 experiments, a useful minimal pipeline is:

```text
source (.s)
    -> GNU as
object (.o)
    -> GNU ld
ELF executable
    -> run on Raspberry Pi 5
    -> inspect with objdump
```

This deliberately avoids libc when direct process-entry and syscall behavior
are the subject of the experiment.

Useful commands established so far:

```bash
as -o program.o program.s
ld -o program program.o
./program
objdump -d program
objdump -s program
```

The important reasoning pattern is to compare source, execution result, and
disassembly rather than assume that source mnemonics map one-for-one to emitted
instructions or data.

---

## Generator: Raw Linux Syscall Shape — Verified Local Subset

A working direct-syscall program used `_start` as its entry point and invoked
the kernel with:

```asm
svc     #0
```

For the verified `write` experiment:

```text
x0 = file descriptor
x1 = buffer address
x2 = byte count
x8 = 64
svc #0
```

With `x0 = 1`, this wrote to stdout.

For the verified exit experiment:

```text
x0 = exit status
x8 = 93
svc #0
```

With `x0 = 0`, the process exited with status 0.

### Boundary

This establishes only the syscall forms exercised on the current
Linux/AArch64 environment. Do not infer a complete syscall ABI, error-return
model, or calling convention from this small example.

---

## Generator: Address Construction Is Worth Inspecting

An address written in assembly source may be produced in different ways by the
assembler/linker. Treat source syntax, emitted instruction sequence, and linked
address/data as separate layers.

### Verified form: `ldr xN, =symbol`

GNU assembler accepted:

```asm
ldr     x1, =msg
```

In the first Hello World executable this became a PC-relative literal `ldr`
that fetched an 8-byte stored address from the text section.

Conceptually for this observed case:

```text
source pseudo/convenience syntax
    -> literal-load instruction
    -> nearby stored 64-bit address
    -> register receives address of symbol
```

### Anchor

`ldr x1, =msg` did **not** appear verbatim as an architectural address-forming
instruction in the disassembly. Inspect the emitted code before reasoning from
this source form.

---

## Generator: `adr` Can Form a Nearby Address Directly

Replacing:

```asm
ldr     x1, =msg
```

with:

```asm
adr     x1, msg
```

produced a working executable.

The disassembly contained an `adr` instruction targeting `msg`, and the
previous 8-byte literal pool disappeared.

Conceptually for this observed case:

```text
ADR instruction
    -> PC-relative address calculation
    -> register receives symbol address
```

This provides a useful contrast with the literal-pool result of
`ldr x1, =msg`.

### Boundary

The exact architectural range of `adr` and precise immediate encoding have not yet been established in project knowledge.

---

## Generator: `adrp` + `add` Splits an Address at 4 KiB

A verified working form is:

```asm
adrp    x1, msg
add     x1, x1, :lo12:msg
```

In the observed executable, `msg` was at `0x4100d4`. Disassembly showed:

```text
adrp x1, 0x410000
add  x1, x1, #0x0d4
```

Useful working model:

```text
4-KiB-aligned base = address & ~0xfff
low 12-bit offset  = address &  0xfff
```

The pair reconstructs the symbol address from those two pieces.

### Anchor: ADRP 4 KiB Is Not the Linux Page Size

On the current Raspberry Pi 5, `getconf PAGESIZE` returned `16384`, so Linux uses 16-KiB base pages on this machine.

Do **not** infer that `adrp` uses the operating system's configured page size. The `adrp`/`:lo12:` address split is based on a 4-KiB unit (12 low bits) even when the OS/MMU base page size differs.

The same executable also showed `LOAD` segment alignment of `0x10000` (64 KiB). Keep these three concepts distinct:

```text
ADRP address split       4 KiB
Linux base page size    16 KiB   (verified on current Pi)
ELF LOAD alignment      64 KiB   (observed in current executable)
```

### Boundary

Do not generalize the current system's 16-KiB Linux page size to all AArch64 systems or all Raspberry Pi installations.

---

## Structural Observation: Fixed-Width Instructions in the First Program

In both Hello World disassemblies, each emitted AArch64 instruction occupied
4 bytes and successive instructions appeared four bytes apart.

This is accepted as an observation from the current executable. Broader
instruction-set claims should be promoted only when deliberately established.

---

## Current Learning Edge

The `adrp` + `add` mechanism and its separation from the current Linux page size are now established locally. A useful next branch is relocation behavior, broader address-construction constraints, or core register/instruction semantics.


---

## Generator: The 32-Bit Instruction Budget

Every AArch64 instruction occupies one 32-bit word. There is no general 68k/Z80-style extension byte/word following an instruction for an arbitrary immediate or address; the next 32-bit word is the next instruction.

When an AArch64 restriction looks arbitrary, ask first:

> What information must this instruction fit into its 32 bits?

Register identifiers, immediates, operation-family/variant bits, addressing modes, shifts, sizes, and other controls compete for that fixed budget. Different instruction forms therefore spend the bits differently rather than sharing one universal fixed-size opcode/operand layout.

### Consequence

Full 64-bit addresses and arbitrary 64-bit constants generally cannot simply be embedded as trailing operands. Instead AArch64 commonly derives values from PC-relative information, constructs them in pieces, loads them from memory, or operates on values already held in 64-bit registers.

---

## Generator: Constructing an Address vs. Using an Address

Keep these stages separate:

```text
construct/obtain address -> 64-bit register -> use/dereference address
```

`ADR` and `ADRP` concern convenient PC-relative address construction. Their reach does not limit the addresses that a 64-bit register can subsequently hold or that register-based loads/stores can use.

Working learning heuristic:

```text
ADR                 about +/-1 MiB: easy nearby construction
ADRP + low offset   about +/-4 GiB: moderately easy construction
outside that        use another mechanism to obtain the address
```

### Boundary

This is a mnemonic for the mechanisms learned so far, not a universal memory-access limit and not a complete catalogue of AArch64 relocation/addressing mechanisms.

---

## Anchor: ADRP 4-KiB Units Are Not MMU Pages

`ADRP` uses a fixed 12-low-bit / 4-KiB-aligned addressing unit when constructing an address. It does not access memory, consult the MMU, or perform address translation.

On the currently tested Raspberry Pi 5 Linux system, `getconf PAGESIZE` reports 16384 bytes (16 KiB). That VM page size belongs to memory translation and page handling when an address is actually accessed.

Therefore:

```text
ADRP granularity        4 KiB   address construction
Linux base page size   16 KiB   VM/MMU translation on tested system
```

There is no inherent conflict between these values. After address construction, the register simply contains a 64-bit address; the MMU does not care how that value was produced.

---

## Generator: Operand Needs Shape Instruction Forms

A useful first approximation is that AArch64 instruction forms are strongly shaped by what they need to encode within 32 bits. For example, a register-register arithmetic form spends bits naming registers; an immediate form spends some operand budget on an immediate; a load/store must describe registers plus an addressing form; a branch can devote more bits to a displacement because it need not name general source/destination registers.

Use this as a prediction tool, then verify exact field layouts and restrictions from disassembly or architecture documentation rather than inferring them solely from the generator.
