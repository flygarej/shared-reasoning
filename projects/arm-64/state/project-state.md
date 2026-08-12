# project-state.md

## Project

`arm-64`

## Objective

Learn ARM and primarily AArch64/ARM64 assembly programming through small,
inspectable experiments on Raspberry Pi 5 systems.

The project is intended as a practical learning environment: write small
programs, assemble and link them, run them on real hardware, inspect the
resulting ELF/disassembly, and use observations to build the domain model.

## Scope

Primary scope:

- AArch64 assembly language;
- GNU assembler and linker on Linux;
- Raspberry Pi 5 as the main experimental platform;
- Linux user-space programs, initially using direct system calls;
- instruction behavior, addressing, register use, executable layout, and
  assembler/linker behavior as they become relevant.

ARM topics outside AArch64 may be discussed when useful for comparison or
context, but are not currently the main focus.

## Verified Environment

Observed on a Raspberry Pi 5 with 16 GiB RAM:

- `uname -m` reports `aarch64`;
- GCC: Debian 14.2.0-19;
- GNU assembler: Binutils 2.44, configured for `aarch64-linux-gnu`;
- GNU linker: Binutils 2.44.

The user has several Raspberry Pi 5 systems available, running Raspberry Pi OS
or Ubuntu. The currently exercised system is Debian-derived Linux on AArch64.

## Verified Assembly/Execution Pipeline

A minimal program was successfully built and run using:

```text
hello.s -> as -> hello.o -> ld -> hello -> execution
```

Commands used:

```bash
as -o hello.o hello.s
ld -o hello hello.o
./hello
```

The program printed:

```text
Hello, ARM64!
```

and returned exit status 0.

This establishes that the direct GNU assembler/linker workflow is functional
on the current Raspberry Pi 5 environment.

## Verified Direct Linux Syscall Example

The first program used `_start` directly rather than libc.

Observed working register setup:

```asm
mov     x0, #1
ldr     x1, =msg
mov     x2, #14
mov     x8, #64
svc     #0

mov     x0, #0
mov     x8, #93
svc     #0
```

For this environment and experiment:

- syscall 64 successfully performed `write`;
- `x0 = 1` selected stdout;
- `x1` held the buffer address;
- `x2` held the byte count;
- syscall 93 successfully terminated the process;
- `x0 = 0` produced exit status 0;
- `svc #0` entered the kernel for both calls.

These are accepted local observations for this Linux/AArch64 environment.
They should not yet be generalized into a complete Linux syscall ABI capsule.

## Verified Address-Loading Experiments

### `ldr x1, =msg`

GNU assembler accepted:

```asm
ldr     x1, =msg
```

Disassembly showed that the assembler/linker produced a PC-relative literal
load:

```text
ldr x1, 4000d0
```

with an 8-byte value at the literal location containing the address of `msg`.
The data section was located at that loaded address.

Accepted conclusion:

- `ldr x1, =msg` is assembler convenience syntax in this context;
- it resulted in an AArch64 literal load plus a stored 64-bit address in the
  text section.

### `adr x1, msg`

The source was changed to:

```asm
adr     x1, msg
```

The rebuilt executable still ran successfully.

Disassembly showed:

```text
adr x1, 4100d0 <msg>
```

and the previous 8-byte literal pool disappeared from `.text`.

Accepted conclusion:

- this `adr` form computed the address of `msg` directly using PC-relative
  addressing;
- no stored pointer was required in the text section for this example.

## Verified `adrp` + `add` Address Construction

The source was changed to:

```asm
adrp    x1, msg
add     x1, x1, :lo12:msg
```

The rebuilt executable ran successfully. Disassembly showed:

```text
adrp x1, 410000
add  x1, x1, #0xd4
```

with `msg` located at `0x4100d4`. This established for the observed executable that:

- `adrp` produced the 4-KiB-aligned base `0x410000`;
- `:lo12:msg` contributed the low 12-bit offset `0x0d4`;
- the pair reconstructed the full address of `msg`.

## Verified Page-Size Distinction

On the current Raspberry Pi 5 system:

```text
getconf PAGESIZE -> 16384
```

So the Linux base page size is 16 KiB on this machine. This must be kept distinct from the fixed 4-KiB addressing unit used by `adrp`/`:lo12:` address construction.

`readelf -l hello` also showed the executable's two `LOAD` segments with `Align 0x10000` (64 KiB), providing a third distinct alignment/granularity visible in the same experiment.

## Current Working Model

AArch64 learning will proceed by separating three layers whenever useful:

1. source-level GNU assembler syntax and conveniences;
2. the actual AArch64 instructions emitted;
3. linker/executable effects visible in ELF layout and disassembly.

`objdump -d` and `objdump -s` are currently useful inspection tools for
checking those distinctions.

## Boundaries

The project has not yet established:

- a general AArch64 calling convention;
- the complete Linux/AArch64 syscall ABI;
- general instruction encoding rules;
- the precise architectural range/semantics of `adr`, `adrp`, or related
  relocation forms;
- stack conventions;
- function calls and ABI register preservation;
- floating-point/SIMD/SVE behavior;
- Raspberry Pi 5 bare-metal or peripheral programming.

Use documentation or discriminating experiments when exact local semantics in
these areas become correctness-relevant.

## Current Direction

The immediate educational emphasis remains on AArch64 addressing and on separating assembler syntax, emitted machine instructions, linker behavior, and OS memory-management concepts before expanding into larger programs.

A useful next branch is to continue from `adrp`/`add` into relocations, symbol placement, or register/instruction fundamentals.


## 2026-08-12 — Fixed-Width Encoding and Addressing Model

### Accepted conceptual model

AArch64 instructions are fixed at 32 bits. Instruction forms must divide that fixed bit budget among operation/family identification, register fields, immediates, addressing-mode/control information, and other required operands. This is now a primary reasoning generator for understanding apparent immediate/range restrictions.

General-purpose `x` registers can hold full 64-bit addresses. PC-relative construction range and eventual memory-access range are separate concerns: once a valid address has been constructed or obtained in a 64-bit register, loads/stores may use that register regardless of its distance from the current PC, subject to normal mapping/access constraints.

### Working addressing heuristic

For current learning purposes:

- `ADR`: nearby PC-relative address construction, approximately +/-1 MiB;
- `ADRP` plus a low-offset operation such as `ADD`: page-relative construction with approximately +/-4 GiB reach for the 4-KiB-aligned component;
- beyond those convenient PC-relative ranges, another mechanism is needed to obtain/construct the address in a 64-bit register.

This is a learning heuristic, not a claim that AArch64 programs or memory accesses are limited to these ranges.

### Strengthened 4-KiB / 16-KiB boundary

`ADRP` uses a fixed 4-KiB (12-low-bit) address-construction granularity. It does not perform memory translation or consult the MMU. The current Linux system reports a 16-KiB base page size; that VM granularity becomes relevant when a virtual address is translated/accessed. These are distinct mechanisms and are not in conflict.

### Emerging instruction-family model

Instruction forms/families can usefully be approached by asking what operands and control information must fit into the 32-bit instruction. Register-register arithmetic, immediate arithmetic, loads/stores, branches, PC-relative address generation, and constant construction have different bit-budget needs. Exact encodings remain documentation/experiment territory until established.
