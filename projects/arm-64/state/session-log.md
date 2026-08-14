# session-log.md

## 2026-08-11 — Bootstrap and first program
Established the AArch64/Raspberry Pi 5 project and native GNU toolchain. Built a direct-syscall Hello World and inspected it. Compared `ldr x1,=msg`, `adr`, and `adrp`+`add :lo12:` address construction. Verified the important distinction between ADRP's 4-KiB split, the tested Linux 16-KiB base page, and observed 64-KiB ELF LOAD alignment.

## 2026-08-12 — Fixed instruction budget and addressing
Accepted the 32-bit A64 instruction budget as a central reasoning generator. Developed the learning heuristic: ADR ~+/-1 MiB easy, ADRP+low offset ~+/-4 GiB moderately easy, farther addresses require another construction mechanism. Address construction was separated from later register-based address use.

## 2026-08-12 — Integer arithmetic and FP/SIMD reconnaissance
Established X/W GPR views, W-write zeroing of upper X bits, memory transfer widths versus 32/64-bit ordinary GPR arithmetic, three-operand ADD/SUB, optional NZCV via ADDS/SUBS, low-half MUL behavior, and SDIV/UDIV. High-half multiplication was deliberately deferred.

Surveyed MMU, FP, and SIMD. Recognized FP and SIMD as one shared bank of 32 128-bit V registers. Introduced scalar S/D views and SIMD 16B/8H/4S/2D arrangements.

A collaborative teaching anchor emerged: **a SIMD lane is one parallel path across the registers participating in an operation.**

### First scalar FP experiment
Loaded `.double 2.5` and `.double 3.5` into D0/D1, executed `fadd d2,d0,d1`, converted with `fcvtzs x0,d2`, and exited through syscall 93. Execution returned 6.

## 2026-08-13 — SIMD lane model and first vector programs
Reinforced the 64-/128-bit vector arrangement model. Verified SIMD addition/subtraction, signed/unsigned interpretation of lane bit patterns, comparison masks with `CMEQ`, and branchless selection with destructive-destination `BSL`.

The key conceptual leap was accepted: SIMD is better understood as **data-parallel computation**, not merely arithmetic on vectors. Per-lane conditions can remain masks/data and drive selection without scalar branches.

`od` became a useful laboratory tool for inspecting raw vector output without adding number-to-text conversion code.

## 2026-08-13 — Calling-convention entry
Moved from direct syscalls toward standard-library interoperability. Established `BL` as branch-with-link through X30/LR and introduced the conventional X29/X30 stack-frame pattern. Began distinguishing leaf from non-leaf functions and using GCC as the linker driver when libc is required.

## 2026-08-14 — AAPCS64 stack frames and libc calls
Built and ran a small GCC-linked assembly program with the structure `main -> middle -> double_it`, where `main` and `middle` are framed non-leaf functions and `double_it` is a leaf. `main` passed 21 in X0, `double_it` doubled it, and `printf` printed `Result = 42`.

Disassembly verified the expected prologues/epilogues and call chain. The runtime-generated executable also exposed PLT/startup machinery plus `PACIASP`, `AUTIASP`, and `BTI`; these were recognized as modern control-flow hardening and deliberately parked.

The stack-frame model was broadened: a frame may contain saved FP/LR, callee-saved registers, locals, temporaries/spills, and padding. A larger frame does not imply that arguments were passed on the stack.

### Callee-saved register connection
Using X19 in a 32-byte example frame established the callee-saved contract: a callee may use X19 internally but, if it modifies it, must restore the incoming value before return. Saving X19 in the callee's own frame is a normal way to satisfy the contract. Caller-saved registers were introduced as the complementary responsibility.

The user requested that stack-frame details be reinforced through normal future exercises because the structural idea sticks more readily than special-case details.

### Assembly libraries overhead view
Established that assembly routines can be linked directly as `.o` files or collected with `ar` into a static `.a` library. ABI-compliant routines remain the same regardless of whether the object is linked directly or extracted from an archive. Shared-library/PIC/GOT/PLT details were deliberately deferred.

## 2026-08-14 — Atomics reconnaissance
A detour into Pi-5/multicore atomics established the exclusive-access loop:

```asm
retry:
        ldxr    x1, [x0]
        add     x1, x1, #1
        stxr    w2, x1, [x0]
        cbnz    w2, retry
        ret
```

`LDXR` was understood as load plus exclusive-monitor state, not as a lock. `STXR` conditionally commits and reports success/failure; `CBNZ` retries the entire operation after failure. The accepted shorthand became: **LD it, change it, try to ST it; pear-shaped -> reread and redo.**

GNU local numeric labels (`1b`/`1f`) were encountered and decoded; descriptive labels remain preferable for teaching examples for now.

LSE was introduced as a newer/direct atomic read-modify-write facility with operations such as `LDADD`, `CAS`, and `SWP`. High-level synchronization/language atomics remain the preferred application-level route; direct hardware atomics are available when low-level work needs them.

Atomicity was explicitly separated from memory ordering. Acquire/release semantics, barriers, LSE experiments, spinlocks, and contention/performance measurement are parked for later.

## Return point
Resume AAPCS64/function-call work with caller-saved versus callee-saved register practice. Keep stack-frame allocation, X29/X30 preservation, alignment, and callee-saved restoration in the normal exercise workflow so the details become automatic through repetition.
