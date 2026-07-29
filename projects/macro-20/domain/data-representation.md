# Data Representation (projects/macro-20/domain/data-representation.md)

## Generator

The PDP-10 is a 36-bit, word-oriented machine.

Program data is represented by interpreting those 36 bits according to
the needs of the operation.

The architecture does not impose one universal meaning on a word.

A word may represent:

-   a signed integer;
-   packed characters;
-   an instruction;
-   a byte pointer;
-   two halfwords;
-   part of a larger numeric value;
-   a bit field or flag set.

------------------------------------------------------------------------

## Integers

Signed integers use two's-complement representation.

Important consequences include:

-   zero is represented by all zero bits;
-   `-1` is represented by all one bits;
-   negation changes the bit pattern according to two's-complement
    rules.

Arithmetic generators operate on these representations according to
their family semantics.

------------------------------------------------------------------------

## Numeric Radix

Unmarked numeric constants normally use the assembler's prevailing
radix.

Accepted explicit radix prefixes include:

-   `^D` for decimal;
-   documented octal and binary notation.

Verified experimentally:

``` asm
TABLE: BLOCK ^D100
```

allocates 100 decimal words.

Hexadecimal constant syntax remains unverified.

------------------------------------------------------------------------

## Character Packing

Five 7-bit ASCII characters fit in one 36-bit word.

The remaining bit is zero.

Character strings may therefore occupy one or more words while still
being accessed through byte pointers rather than as ordinary word-sized
integers.

------------------------------------------------------------------------

## ASCII and ASCIZ

`ASCII`

packs characters into words and zero-fills unused space in a partial
final word.

It does not append a separate terminator when the final word is exactly
full.

`ASCIZ`

packs characters and appends a zero byte.

A zero-terminated string may therefore require an additional word when
the preceding characters exactly fill the available byte positions.

------------------------------------------------------------------------

## Halfwords and Fields

A 36-bit word may also be treated as two 18-bit halfwords.

Many instructions, pointers, tables, and monitor interfaces rely on this
structure.

Fields may occupy arbitrary bit ranges within a word.

The exact meaning of those fields is defined by the instruction family,
assembler construct, or monitor interface using them.

------------------------------------------------------------------------

## Wider Values

Larger values may occupy consecutive words.

Accepted examples include:

-   doubleword arithmetic;
-   four-word arithmetic;
-   double-precision floating point;
-   arrays of digits used for multiprecision arithmetic.

The representation determines how the words combine into one logical
value.

------------------------------------------------------------------------

## Conceptual Model

``` text
36-bit word
     ↓
Interpretation supplied by context
     ↓
integer
characters
instruction
pointer
halfwords
bit fields
part of wider value
```

The bit pattern is primary.

Meaning comes from the operation that interprets it.

------------------------------------------------------------------------

## Boundaries

Current project knowledge does **not** establish:

-   complete byte-pointer encoding;
-   exact floating-point field boundaries;
-   hexadecimal assembler syntax;
-   every character-set or packed-string convention.

Do not infer byte-pointer structure from ASCII packing alone.

Do not infer exact numeric layout from width alone.

------------------------------------------------------------------------

## Open Questions

-   Exact byte-pointer bit representation.
-   Exact floating-point field boundaries.
-   Hexadecimal constant syntax in MACRO-20.
-   Additional packed-data conventions used by TOPS-20 libraries.

------------------------------------------------------------------------

## Related Capsules

-   `arithmetic.md`
-   `addressing.md`
-   `records.md`
-   `anchors.md`

---

