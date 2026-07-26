# Data Representation

## Generator

The PDP-10 is a 36-bit, word-oriented machine.

## Integers

- Signed integers use two's complement.
- Gorin documents decimal, octal, and binary notation.
- Hexadecimal assembler syntax remains unverified.

## Character packing

Five 7-bit ASCII characters fit in one 36-bit word; the remaining bit is zero.

## ASCII and ASCIZ

- `ASCII` packs characters and zero-fills unused space in a partial final word.
- `ASCII` does not append a separate terminator when the string exactly fills the final word.
- `ASCIZ` appends a zero byte and may therefore require an additional word.

## Numeric radix prefixes

Unmarked numeric constants normally use the assembler's prevailing radix.

`^D` marks the following constant as decimal.

Verified experimentally:

`BLOCK ^D100` allocates 100 decimal words

## Boundary

Do not infer byte-pointer representation from character packing alone. Byte pointers are a separate mechanism.
