# 6502 Semantic Anchors

## Purpose

Preserve small, load-bearing facts that prevent nearby inference drift.

## Original NMOS 6502 has no multiply or divide instruction

Integer multiplication and division must be implemented by software or provided
by a platform or library routine.

Do not invent or import `MUL`, `DIV`, or similarly named arithmetic instructions
from another architecture.

## Immediate and memory operands are distinct

A conventional syntax such as:

```asm
LDA #5
```

loads the literal value 5, while:

```asm
LDA $0005
```

loads the byte stored at memory address `$0005`.

Exact notation is assembler-specific, but the semantic distinction is
fundamental.

## Zero page is memory

Addresses `$0000-$00FF` are ordinary addressable memory.

Zero page is often described as register-like because of its special encodings
and performance characteristics. It is not an internal CPU register bank.

## `ADC` includes carry

`ADC` adds:

```text
accumulator + operand + carry input
```

For an ordinary fresh addition, carry must normally be deliberately initialized,
commonly with `CLC`.

In a multi-byte addition, clear carry once before the low byte and allow each
successive `ADC` to consume carry from the previous byte.

## Carry must be consumed before repurposing it

When a shift places a tested bit into carry, branch or otherwise consume that
meaning before using `CLC`, `SEC`, or another carry-changing instruction.

Example pattern:

```asm
LSR multiplier
BCC bit_was_zero
CLC
; begin unrelated addition
```

## `ASL` plus `ROL` can shift a multi-byte value

For a little-endian 16-bit value stored as high:low:

```asm
ASL low
ROL high
```

shifts the combined value left by one bit, carrying the bit leaving `low` into
`high`.

## Decimal mode affects arithmetic

On the NMOS 6502, `ADC` and `SBC` are affected by the decimal flag.

A routine that requires binary arithmetic must establish or document the decimal
mode it expects. A simple routine may use `CLD`, but a library routine must also
consider whether the caller's status should be preserved.
