# session-log.md

## 2026-08-11 — Project Bootstrap and First AArch64 Program

### Project establishment

The project was established to explore ARM and primarily ARM64/AArch64
assembly programming using Raspberry Pi 5 systems. Several Raspberry Pi 5
machines are available, running Raspberry Pi OS or Ubuntu.

The intended style is experimental and educational: small programs, direct
execution on real hardware, and inspection of emitted code.

### Environment inspection

On the first Raspberry Pi 5 (16 GiB), the following were observed:

```text
uname -m -> aarch64
GCC      -> Debian 14.2.0-19
GNU as   -> Binutils 2.44, target aarch64-linux-gnu
GNU ld   -> Binutils 2.44
```

This established a native AArch64 GNU toolchain suitable for direct assembly
experiments.

### Experiment 1: minimal Hello World

A small `_start` program was written using direct Linux syscalls rather than
libc. The relevant address load was initially:

```asm
ldr     x1, =msg
```

The program was assembled and linked with:

```bash
as -o hello.o hello.s
ld -o hello hello.o
```

Execution produced:

```text
Hello, ARM64!
```

and exit status 0.

This verified the basic source -> object -> ELF -> execution pipeline.

### Inspection 1: literal address load

`objdump -d hello` showed that `ldr x1, =msg` had become a PC-relative literal
load. The text section also contained two `.word` values representing an
8-byte pointer to the message in `.data`.

`objdump -s hello` showed the message bytes at the address contained by that
pointer.

Conclusion promoted to project knowledge: in this example, GNU assembler
convenience syntax `ldr x1, =msg` produced a literal load plus a stored address.

### Experiment 2: replace literal load with `adr`

The source was changed from:

```asm
ldr     x1, =msg
```

to:

```asm
adr     x1, msg
```

The program rebuilt and ran successfully.

Disassembly showed a direct `adr` targeting `msg`, and section inspection
showed that the earlier 8-byte literal pool was no longer present in `.text`.

Conclusion promoted to project knowledge: for this nearby symbol, `adr`
provided direct PC-relative address construction without the stored pointer
used by the previous form.

### Emerging learning model

The first experiments exposed a useful recurring distinction:

```text
assembler source syntax
vs.
emitted AArch64 instruction(s)
vs.
linked executable/data layout
```

Future experiments should continue inspecting all three when assembler or
linker behavior is relevant.

### Next experiment

Explore the common `adrp` + `add` address-construction form, then inspect the
emitted instructions and any relevant relocation/linker behavior before
promoting its exact semantics into domain knowledge.


### Experiment 3: `adrp` plus `add`

The address construction was changed to:

```asm
adrp    x1, msg
add     x1, x1, :lo12:msg
```

The program rebuilt and ran successfully. Disassembly showed `adrp` producing `0x410000` and `add` supplying `0x0d4`, reconstructing the observed `msg` address `0x4100d4`.

### Experiment 4: distinguish ADRP granularity from Linux page size

`getconf PAGESIZE` reported:

```text
16384
```

This established that the current Linux system uses 16-KiB base pages, while the `adrp`/`:lo12:` construction still splits addresses at 4 KiB (12 low bits).

`readelf -l hello` showed the executable's `LOAD` segments aligned to `0x10000` (64 KiB). This exposed three distinct concepts in one experiment: ADRP addressing granularity (4 KiB), Linux base page size (16 KiB), and ELF segment alignment (64 KiB).

Conclusion promoted to domain knowledge: do not equate ADRP's 4-KiB address split with the operating system's MMU page size.


## 2026-08-12 — Fixed 32-Bit Instruction Insight

Discussion of `ADR`/`ADRP` range led to a major conceptual insight: AArch64 instructions are fixed 32-bit words, so immediate values, register identifiers, operation selection, and addressing information must fit within that word rather than using following extension words/bytes as familiar from 68k/Z80.

This explained the previously observed address-construction limits and produced a durable heuristic: `ADR` gives convenient nearby construction (~+/-1 MiB), `ADRP` plus low-offset construction gives much wider PC-relative reach (~+/-4 GiB), while addresses beyond those convenient mechanisms require another way to prepare a 64-bit register. Once a valid address is in a register, its original distance from PC is irrelevant to register-based memory access.

The earlier 4-KiB/16-KiB distinction was sharpened: `ADRP`'s 4-KiB unit is address arithmetic only and does not consult the MMU. The tested Linux system's 16-KiB base page size applies to virtual-memory translation/access. The two granularities coexist without conflict.

An emerging learning strategy was accepted: when an instruction has a surprising range or immediate restriction, first ask what operands/control information must fit into its fixed 32-bit encoding, then verify the actual instruction form experimentally or from documentation.
