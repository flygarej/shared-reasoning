# Instruction Families

## Principle

Mnemonic grammars are family-local. Reuse a family generator where documented, but do not assume that a letter has the same meaning in unrelated families.

Many PDP-10 instruction families combine an operation prefix (e.g. AOJ, SOJ, CAM) with the common relation suffix grammar (G, GE, E, N, L, LE).

## MOVE family

Generator:

`MOV` + value transformation + destination form

Value transformations:

- blank: unchanged;
- `N`: negate;
- `M`: magnitude;
- `S`: swap halfwords.

Destination forms:

- blank: memory to AC;
- `I`: immediate value to AC;
- `M`: AC to memory;
- `S`: self/memory form.

## TEST family

Generator:

`T` + mask source + AC modification + skip relation

Mask source:

- `R`: immediate right-half mask;
- `L`: immediate left-half mask;
- `D`: direct memory mask;
- `S`: swapped memory mask.

AC modification:

- `N`: no modification;
- `Z`: zero selected bits;
- `O`: set selected bits;
- `C`: complement selected bits.

Skip relation:

- blank: do not skip;
- `N`: skip if not all selected bits are zero;
- `E`: skip if all selected bits are zero;
- `A`: always skip.

## Boolean family

The processor implements all sixteen Boolean functions of two one-bit variables.

Each operation has destination/source forms:

- blank: memory operand, result to AC;
- `I`: immediate operand, result to AC;
- `M`: result to memory;
- `B`: result to both AC and memory.

## Shift family

Two dimensions generate the family:

Operation:

- logical;
- arithmetic;
- rotate.

Width:

- single word;
- combined doubleword in `AC,AC+1`.

Resulting mnemonics:

- `LSH` / `LSHC`
- `ASH` / `ASHC`
- `ROT` / `ROTC`

## Fixed arithmetic destination grammar

`ADD`, `SUB`, and `IMUL` share:

- blank: memory operand, result to AC;
- `I`: immediate operand, result to AC;
- `M`: result to memory;
- `B`: result to both AC and memory.

## Width hierarchy

Multiplication:

- `IMUL`: one-word result;
- `MUL`: doubleword result;
- `DMUL`: four-word result.

Division:

- `IDIV`: single-word dividend, quotient and remainder;
- `DIV`: doubleword dividend;
- `DDIV`: four-word dividend divided by a doubleword divisor.

## Floating arithmetic grammar

Single precision:

`F` + operation + optional rounding + destination form

Double precision:

`DF` + operation

Operations:

- `AD`
- `SB`
- `MP`
- `DV`

## Relational vocabulary

The assembler reuses the JUMP/SKIP relation vocabulary for conditional assembly:

- greater;
- greater or equal;
- equal;
- not equal;
- less;
- less or equal.

The same relation semantics apply at runtime and assembly time; only the controlled action differs.
