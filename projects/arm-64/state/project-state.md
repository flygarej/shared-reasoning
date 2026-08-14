# project-state.md

## Project
`arm-64`

## Objective
Learn primarily AArch64 assembly through small inspectable experiments on Raspberry Pi 5: write, assemble/link, execute, inspect ELF/disassembly, and build a durable human-usable model.

## Verified environment
Current Raspberry Pi 5: 16 GiB, `aarch64`, GCC Debian 14.2.0-19, GNU Binutils 2.44 targeting `aarch64-linux-gnu`; `getconf PAGESIZE` reports 16384. Several Pi 5 systems with Raspberry Pi OS/Ubuntu are available.

## Verified work
- Direct-syscall Hello World assembled with `as`, linked with `ld`, printed successfully, exit 0.
- Address experiments verified `ldr x1,=msg`, `adr`, and `adrp`+`:lo12:` forms through execution/disassembly.
- Tested distinction: ADRP split 4 KiB, Linux VM page 16 KiB, observed ELF LOAD alignment 64 KiB.
- Scalar FP test loaded doubles 2.5 and 3.5, performed `fadd d2,d0,d1`, converted via `fcvtzs x0,d2`, and exited with status 6.
- SIMD vector addition/subtraction, comparison masks, and `BSL` branchless selection were executed and inspected successfully.
- GCC-linked assembly `main` called `middle`, which called leaf `double_it`; execution printed `Result = 42` and disassembly verified the expected frame/call structure.
- `printf` was called successfully from assembly using the normal Linux/AAPCS64 interface and GCC for linking.
- Static-library overhead model established: assembler source -> `.o`; objects may be linked directly or packaged with `ar` into a `.a` archive.

## Accepted working model
- Every A64 instruction is a fixed 32-bit word; use the encoding-budget idea to predict restrictions, then verify.
- Address-construction heuristic: ADR ~+/-1 MiB easy; ADRP+low offset ~+/-4 GiB moderately easy; farther addresses need another construction/load mechanism. This is not a memory-access limit.
- X0-X30 are 64-bit GPRs for integers or addresses; W0-W30 are 32-bit views and W writes zero the upper X half.
- Memory transfers support 8/16/32/64-bit objects; ordinary GPR arithmetic is W=32 or X=64.
- Integer arithmetic is normally three-operand; ADDS/SUBS update NZCV; ADD/SUB signedness is interpretation; DIV has SDIV/UDIV; MUL gives the low result width and no NZCV.
- V0-V31 are 32 shared 128-bit FP/SIMD registers. Scalar S/D and SIMD 64-bit (`8B/4H/2S`) or 128-bit (`16B/8H/4S/2D`) arrangements are views of the same bank.
- SIMD teaching anchor: a lane is a parallel path across the participating registers; the instruction supplies the arrangement.
- SIMD comparisons produce per-lane all-zero/all-one masks; `BSL` can use such a mask for branchless selection and is a destructive-destination form.
- SIMD is data-parallel computation, not merely arithmetic: comparison, masks, logical combination, selection, conversion, and rearrangement can keep work in the vector domain.
- Linux user-space normally leaves MMU programming to the kernel. Understand virtual-memory effects as needed; privileged translation-table/MMU programming is parked.

## AAPCS64 / function-call model
- AAPCS64 is the normal procedure-call contract used at native AArch64 ABI boundaries on this Linux platform. Self-contained assembly may invent its own convention, but interoperability with normal compiled/library code requires the platform ABI.
- `BL target` writes the return address to X30/LR; `RET` normally returns through X30.
- Conventional framed non-leaf functions commonly save X29/FP and X30/LR with `stp x29,x30,[sp,#-16]!`, establish X29 from SP, restore with `ldp`, and return. This is a recognition heuristic, not proof of all function properties.
- A leaf function that does not overwrite LR may need no frame at all.
- Stack frames may hold saved FP/LR, callee-saved registers, locals, temporaries/spills, and padding/alignment. Frame size alone does not imply stack-passed arguments.
- SP must respect the ABI's 16-byte alignment rule at public call boundaries/currently relevant frame usage.
- Integer/pointer arguments normally begin in X0-X7; return values commonly use X0. FP/SIMD arguments use the ABI's vector-register rules when applicable.
- Callee-saved register anchor: if a callee modifies an inherited callee-saved register such as X19, it must restore the incoming value before returning. Saving it in the callee's stack frame is a normal way to meet that obligation.
- Caller-saved register anchor: if the caller needs a volatile/caller-saved value after a `BL`, the caller must arrange to preserve it.
- Stack-frame details are understood structurally but not yet automatic; reinforce them organically in future exercises rather than treating the topic as complete.

## Atomics reconnaissance
- Basic exclusive-loop model established: `LDXR` loads and establishes exclusive-monitor state; computation follows; `STXR` conditionally stores and reports status; `CBNZ` retries on failure.
- Wetware shorthand: **LD it, change it, try to ST it; pear-shaped -> reread and redo.** Failure is normal retry behavior, not an exceptional error.
- `LDXR` does not lock the location and has no success/failure result analogous to `STXR`; multiple cores may load while later stores compete.
- The whole `LDXR`/modify/`STXR`/retry protocol implements an atomic read-modify-write, not `STXR` alone.
- GNU numeric local labels were encountered: `1b` means nearest `1:` backward and `1f` nearest forward. Descriptive labels are preferred in teaching examples for now.
- LSE (Large System Extensions) recognized as providing more direct atomic read-modify-write operations such as `LDADD`, `CAS`, and `SWP`; exact Pi-5 feature use should be verified before experiments.
- Atomicity and memory ordering are separate concerns. Acquire/release and barriers were introduced but deliberately deferred for a focused later session.
- High-level synchronization/language atomics should normally be preferred in application code; direct CPU atomics remain available when low-level work requires them.

## Current direction
Return to the AAPCS64/function-call thread. Next useful step is caller-saved versus callee-saved register practice, with stack-frame construction and restoration repeatedly folded into ordinary exercises. Continue libc/native-library interoperation as useful context.

## Parked return threads
- Advanced SIMD families: rearrangement/shuffle, widening/narrowing, FP SIMD, reductions, saturating arithmetic, multiply-accumulate.
- Atomics: LSE experiment, acquire/release, memory ordering, spinlocks, contention/performance measurement.
- Cache/memory hierarchy and multicore behavior are natural later CPU-facing topics.
- PAC/AUT pointer authentication and BTI were recognized in GCC/runtime disassembly as control-flow hardening; interesting but postponed.
- ELF/PLT/dynamic-linking machinery is visible and useful but remains a shiny squirrel until needed.
- GPU/CUDA/AI accelerator discussion remains an adjacent/future project idea rather than ARM64 project state.

## Deferred/open
Exact full AAPCS64 register classification and complex argument cases; variadic/aggregate calling details; exact encodings/relocations; shared libraries/PIC/GOT/PLT; detailed IEEE-754 FPCR/FPSR behavior; high-half multiplication; deeper NEON operation families; SVE; acquire/release and memory barriers; cache hierarchy/performance; privileged MMU/exception levels; detailed endianness controls; Thumb history; bare-metal/peripherals.
