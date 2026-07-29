# Addressing (projects/macro-20/domain/addressing.md)

## Generator

The PDP-10 separates **address calculation** from **instruction
semantics**.

Before an instruction performs its operation, the processor computes an
effective address (EA).

The instruction family then operates on the resolved operand.

------------------------------------------------------------------------

## Instruction Address Fields

A memory reference is determined by the instruction's addressing fields.

Accepted components include:

-   address field;
-   indirect bit;
-   index field.

These fields describe **how to locate an operand**, not what the
instruction ultimately does with it.

------------------------------------------------------------------------

## Effective Address Calculation

Normal instructions contain:

- an indirect bit `I`;
- an index field `X`;
- an address field `Y`.

The effective-address generator is:

1. Begin with `Y`.
2. If `X` is nonzero, add the contents of accumulator `X`.
3. If `I` is zero, the resulting value is the effective address.
4. If `I` is one, fetch the word at the resulting address and repeat the
   process using that word's `I`, `X`, and `Y` fields.

Indirection is therefore recursive rather than limited to one additional
memory reference.

Only after this process terminates does instruction-family semantics
begin.

------------------------------------------------------------------------

## Immediate Forms

Immediate instructions embed a value within the instruction itself.

The operand value is therefore obtained directly rather than through a
memory reference.

Immediate addressing changes operand acquisition but does not change the
conceptual operation performed by the instruction family.

Immediate forms use the resolved address value rather than fetching the
contents of the resolved address.

For example:

`MOVEI AC,E`

loads `0,,E` after effective-address calculation.

------------------------------------------------------------------------

## Address Stability

Once an effective address has been calculated, it remains the operand
address for the instruction.

Instructions such as `BLT` repeatedly operate using the established
addressing rules rather than recalculating new effective addresses for
each transferred word.

This distinction explains why address calculation belongs outside the
instruction-family generators.

------------------------------------------------------------------------

## Relationship to Other Generators

Addressing answers:

> Where does the operand come from?

Instruction families answer:

> What operation is performed on that operand?

Keeping these mechanisms separate greatly reduces inference drift.

------------------------------------------------------------------------

## Conceptual Model

``` text
Instruction
      ↓
Address fields
      ↓
Effective address calculation
      ↓
Operand located
      ↓
Instruction-family semantics
```

Addressing determines the operand.

Instruction families determine the operation.

------------------------------------------------------------------------

## Boundaries

Current project knowledge does **not** establish:

-   complete byte-pointer encoding;
-   all indexed-indirect corner cases;
-   architectural relationship between accumulators and low memory;
-   every specialised addressing mode.

Do not infer instruction semantics from addressing behaviour alone.

------------------------------------------------------------------------

## Open Questions

-   Exact byte-pointer representation.
-   Remaining specialised addressing forms.
-   Detailed interaction between addressing and selected monitor
    instructions.

------------------------------------------------------------------------

## Related Capsules

-   `instruction-families.md`
-   `arrays.md`
-   `records.md`
-   `program-memory.md`
-   `anchors.md`

---

