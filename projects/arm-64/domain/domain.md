# ARM64 Domain Knowledge

## Purpose
Compact accepted knowledge for the ARM64 learning project on AArch64 Linux/Raspberry Pi 5.

## Core generators
- A64 instructions are fixed 32-bit words. Operand/immediate/range restrictions should first be understood as competition for that 32-bit encoding budget, then verified.
- Separate address construction from address use: `ADR` is the easy nearby (~+/-1 MiB) case; `ADRP` plus low offset is the moderately easy (~+/-4 GiB) case; beyond that obtain/construct the address another way. Once an address is in an X register, PC distance is irrelevant to register-based dereference.
- `ADRP` uses a fixed 4-KiB/12-low-bit address split. This is not an MMU page. Tested system: Linux base page 16 KiB; observed ELF LOAD alignment 64 KiB.
- X0-X30 are 31 general-purpose 64-bit registers usable for data or addresses; W0-W30 are 32-bit views. Writing Wn zeros the upper half of Xn. Encoding 31 has contextual SP/XZR/WZR use.
- Memory transfers support byte/halfword/word/doubleword sizes; ordinary GPR arithmetic works at W=32 or X=64.
- Integer arithmetic is normally three-operand. ADD/SUB do not inherently encode signedness; ADDS/SUBS request NZCV updates. DIV distinguishes SDIV/UDIV. MUL returns the low result width and does not set NZCV; high-half multiply forms are deferred.

## FP/SIMD generator
There is one shared bank of 32 128-bit registers, V0-V31, used by both scalar FP and Advanced SIMD/NEON.

Scalar views include S=32-bit and D=64-bit. SIMD arrangements include both 64-bit and 128-bit forms:

```text
64-bit:   8B, 4H, 2S
128-bit: 16B, 8H, 4S, 2D
```

The physical V register remains 128 bits. The instruction selects how much of it is active and how those bits are interpreted for that operation.

### Lane anchor
A useful human model is: **a lane is one parallel path across the registers participating in a SIMD operation.** The instruction imposes the lane interpretation; the V register itself remains 128 bits.

`Vn.<count><size>` is read as: use vector register n with `<count>` lanes of element size B/H/S/D. For ordinary vector arrangements, the count and lane width form a supported 64- or 128-bit arrangement.

### SIMD arithmetic, masks, and selection
A normal vector arithmetic instruction applies the same operation independently to corresponding lanes. Verified examples include `ADD` and `SUB` on `.4S` vectors.

SIMD lanes are bit patterns; signed/unsigned meaning comes from the operation or later interpretation.

`LDR Qn,[Xm]` and `STR Qn,[Xm]` transfer the full 128 bits of a V register. This is distinct from the lane arrangement chosen by a following arithmetic/logical instruction.

SIMD comparisons such as:

```asm
cmeq    v0.4s, v1.4s, v2.4s
```

produce one all-zero/all-one mask per lane. **Arithmetic lanes produce values; comparison lanes produce masks.**

A verified `BSL` experiment used the comparison result directly as a selection mask:

```asm
cmeq    v0.4s,  v1.4s, v2.4s
bsl     v0.16b, v3.16b, v4.16b
```

`BSL` treats its first register as both input mask and output result. This supports the stronger generator:

> SIMD can express data-parallel computation, including arithmetic, comparison, masks, and selection, without converting each lane condition into scalar control flow.

Ordinary NEON instructions typically name at most three vector registers. Some use a destructive destination that is also an input, accumulator, or mask. Larger computations are composed across multiple instructions and intermediate registers.

## Verified scalar FP path
A test loaded `.double 2.5` and `.double 3.5`, executed `fadd d2,d0,d1`, converted with `fcvtzs x0,d2`, and exited with status 6. `FCVTZS` numerically converts FP to signed integer rounding toward zero.

## AAPCS64 / native function-call generator
AAPCS64 is the native AArch64 procedure-call contract relevant to ordinary Linux interoperability. It is not a property of C alone: independently produced native code can cooperate when it obeys the same ABI boundary. Self-contained assembly may use a private convention, but calls into/out of normal platform code require the appropriate ABI.

### BL/RET anchor
`BL target` branches to the callee and places the return address in X30/LR. `RET` normally transfers control through X30.

A conventional framed function often begins:

```asm
stp     x29, x30, [sp, #-16]!
mov     x29, sp
```

and ends with the corresponding restore/deallocation and `ret`.

Recognition rule: this strongly suggests a conventional stack-frame prologue preserving FP/LR. It does **not** by itself prove that the function is non-leaf, takes arguments, or has any particular argument layout.

### Leaf/non-leaf anchor
A leaf function that makes no further calls may leave its incoming LR in X30 and simply `RET`. A non-leaf function that executes `BL` must preserve any return address it still needs before `BL` overwrites X30.

Verified structure:

```text
main (framed non-leaf)
  -> middle (framed non-leaf)
       -> double_it (leaf, no frame)
```

The program returned through the chain correctly and printed `Result = 42` through `printf`.

### Stack-frame anchor
A stack frame is function-owned working/preservation space, not merely a place for X29/X30. It may contain:
- saved X29/FP and X30/LR;
- saved callee-saved registers;
- local variables;
- temporaries/spills;
- alignment/padding.

A larger frame does not by itself imply stack-passed arguments. Caller-supplied stack arguments and callee-owned frame allocation are separate concepts.

The stack must obey the AAPCS64 alignment rules; for the current examples, maintain SP on a 16-byte boundary.

### Callee-saved anchor
If a callee chooses to modify a callee-saved register such as X19, it must restore the value it inherited before returning. A common pattern is to reserve a larger frame and store X19 in it:

```asm
stp     x29, x30, [sp, #-32]!
mov     x29, sp
str     x19, [sp, #16]
...
ldr     x19, [sp, #16]
ldp     x29, x30, [sp], #32
ret
```

The stack is merely a convenient preservation mechanism. The semantic obligation is that X19 has its incoming value again at return.

### Caller-saved anchor
Caller-saved/volatile registers may be changed by the callee. If the caller needs such a value after `BL`, the caller must preserve it appropriately. This complements callee-saved registers: responsibility is divided rather than placed entirely on one side.

### Argument/return anchor
For ordinary integer/pointer cases, arguments begin in X0-X7 and a simple integer/pointer return value commonly comes back in X0. FP/SIMD arguments use the ABI's vector-register rules. Complex aggregates, variadic calls, and stack argument details remain deferred until needed.

### Teaching boundary
The structural frame model is accepted, but special-case details are not yet automatic. Reintroduce frame allocation, X29/X30 save/restore, alignment, and callee-saved preservation naturally in later exercises instead of treating stack frames as a completed one-off topic.

## Assembly/library interoperability
Assembly routines that export symbols and obey the ABI can be linked directly as `.o` files with normal compiled code. Multiple objects can be packaged into a traditional static archive with `ar`, e.g. `libname.a`, and linked by the normal toolchain. The archive changes packaging/linker selection, not the calling convention inside the routines.

Shared-library/PIC/GOT/PLT details are deliberately deferred. GCC-linked disassembly already exposes PLT/runtime machinery, but it is not required for the current function-call model.

## Atomics generator
Atomicity is distinct from higher-level locking/monitor abstractions and distinct from memory ordering.

### Exclusive-access anchor
The basic AArch64 exclusive read-modify-write protocol is:

```asm
retry:
        ldxr    x1, [x0]
        add     x1, x1, #1
        stxr    w2, x1, [x0]
        cbnz    w2, retry
        ret
```

Interpretation:
- `LDXR` loads the current value and establishes exclusive-monitor state. It does not lock the memory location and has no status result analogous to `STXR`.
- Compute a proposed new value.
- `STXR` attempts the store only if the exclusive state still permits it and writes success/failure status to its status register (`0` success, nonzero failure).
- `CBNZ` retries the whole operation on failure, rereading and recomputing from fresh state.

Wetware shorthand: **LD it, change it, try to ST it; pear-shaped -> reread and redo.**

The atomic read-modify-write is the whole protocol, not `STXR` alone. Failed exclusive stores are expected retry events under contention, not exceptional errors.

### Local-label syntax anchor
GNU assembler numeric local labels are reusable landmarks:

```text
1b = nearest `1:` backward
1f = nearest `1:` forward
```

They do not change branch semantics. For teaching examples, descriptive labels such as `retry:` are preferred until the syntax is automatic.

### LSE anchor
Large System Extensions (LSE) provide more direct atomic read-modify-write operations, including families such as `LDADD`, `CAS`, and `SWP`, reducing the need to spell out an explicit exclusive retry loop in source. Exact feature availability/use on the Pi 5 should be verified before relying on a specific LSE instruction in an experiment.

### Ordering boundary
Atomicity does not by itself establish all required ordering between separate memory operations. Acquire/release forms and memory barriers constrain observation/order across cores. This topic was introduced but intentionally deferred for a focused, sober treatment.

### Software abstraction anchor
Prefer high-level synchronization/language atomics where they solve the problem. Direct AArch64 atomics are valuable for kernel/low-level work, reading compiler output, unusual performance work, and understanding what higher-level primitives ultimately rest on.

## Security instructions recognized
`PACIASP`/`AUTIASP` were observed in GCC/runtime-generated functions and recognized as pointer-authentication/control-flow hardening around return addresses. `BTI` was recognized as Branch Target Identification. Both are useful disassembly recognition knowledge but are parked for later study.

## MMU/context boundaries
Linux normally manages virtual-memory translation for user space. ADRP's 4-KiB construction unit and the tested Linux 16-KiB VM page are distinct mechanisms. Privileged translation tables, TCR/TTBR details, TLB maintenance, exception levels, and bare-metal MMU programming are deferred until a kernel/bare-metal reason appears.

## Current learning edge
AAPCS64/function-call mechanics are the active thread. Caller-saved versus callee-saved register use is the next natural exercise, with stack-frame mechanics deliberately repeated as part of normal workflow. Advanced SIMD remains established enough to revisit later. Atomics have been reconnoitered; memory ordering, LSE experiments, contention measurement, and locks remain later threads.
