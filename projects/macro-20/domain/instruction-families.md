# Instruction Families (projects/macro-20/domain/instruction-families.md)

## Generator

The PDP-10 instruction set is highly regular.

Many instructions are best understood as members of instruction families
rather than as isolated operations.

A family consists of related instructions that share a common conceptual
operation while varying one or more orthogonal properties.

Learning the family allows many individual instructions to be
reconstructed from a small number of semantic rules.

------------------------------------------------------------------------

## Family-Local Grammar

Mnemonic grammars are family-local.

A mnemonic letter may describe:

-   a source form;
-   a destination form;
-   a value transformation;
-   a test relation;
-   a result width;
-   an operand placement.

Do not assume that a letter has the same meaning in unrelated families.

Instruction-family semantics begin only after effective-address
calculation has completed.

------------------------------------------------------------------------

## MOVE Family

Generator:

`MOV` + value transformation + destination form

Value transformations:

-   blank: unchanged;
-   `N`: negate;
-   `M`: magnitude;
-   `S`: swap halfwords.

Destination forms:

-   blank: memory to AC;
-   `I`: immediate value to AC;
-   `M`: AC to memory;
-   `S`: self/memory form.

The two dimensions are independent within this family.

------------------------------------------------------------------------

## TEST Family

Generator:

`T` + mask source + AC modification + skip relation

### Mask source

-   `R`: immediate right-half mask;
-   `L`: immediate left-half mask;
-   `D`: direct memory mask;
-   `S`: swapped memory mask.

### AC modification

-   `N`: no modification;
-   `Z`: zero selected bits;
-   `O`: set selected bits;
-   `C`: complement selected bits.

### Skip relation

-   blank: do not skip;
-   `N`: skip if not all selected bits are zero;
-   `E`: skip if all selected bits are zero;
-   `A`: always skip.

This generator explains families such as:

-   `TRNE`
-   `TLON`
-   `TDZA`
-   `TSC`

The exact instruction is reconstructed by selecting one value from each
dimension.

------------------------------------------------------------------------

## Relational Vocabulary

Several runtime instruction families combine an operation prefix with a
common relation suffix:

-   `G`: greater;
-   `GE`: greater or equal;
-   `E`: equal;
-   `N`: not equal;
-   `L`: less;
-   `LE`: less or equal.

Families using this vocabulary include forms of:

-   `JUMP`;
-   `SKIP`;
-   `AOJ`;
-   `SOJ`;
-   `CAI`;
-   `CAM`.

The same relation vocabulary is reused by conditional assembly
directives.

The relation keeps its meaning; the controlled action changes.

------------------------------------------------------------------------

## Boolean Family

The processor implements all sixteen Boolean functions of two one-bit
variables.

Each operation may use destination/source forms:

-   blank: memory operand, result to AC;
-   `I`: immediate operand, result to AC;
-   `M`: result to memory;
-   `B`: result to both AC and memory.

The Boolean operation and destination form are separate dimensions.

------------------------------------------------------------------------

## Shift Family

Two dimensions generate the main shift family.

### Operation

-   logical shift;
-   arithmetic shift;
-   rotate.

### Width

-   single word;
-   combined doubleword in `AC,AC+1`.

Resulting pairs include:

-   `LSH` / `LSHC`;
-   `ASH` / `ASHC`;
-   `ROT` / `ROTC`.

------------------------------------------------------------------------

## Fixed Arithmetic Destination Grammar

`ADD`, `SUB`, and `IMUL` share a destination grammar:

-   blank: memory operand, result to AC;
-   `I`: immediate operand, result to AC;
-   `M`: result to memory;
-   `B`: result to both AC and memory.

This regularity does not imply that every arithmetic family supports the
same complete matrix.

------------------------------------------------------------------------

## Width Hierarchy

Multiplication:

-   `IMUL`: one-word result;
-   `MUL`: doubleword result;
-   `DMUL`: four-word result.

Division:

-   `IDIV`: single-word dividend, quotient and remainder;
-   `DIV`: doubleword dividend;
-   `DDIV`: four-word dividend divided by a doubleword divisor.

Width is part of the family structure, but output placement may
introduce irregularities.

------------------------------------------------------------------------

## Floating Arithmetic Grammar

Single precision:

`F` + operation + optional rounding + destination form

Double precision:

`DF` + operation

Operations:

-   `AD`;
-   `SB`;
-   `MP`;
-   `DV`.

------------------------------------------------------------------------

## Reconstruction Strategy

When encountering an unfamiliar instruction:

1.  Identify its instruction family.
2.  Determine which family dimensions vary.
3.  Apply the accepted family generator.
4.  Check whether the family has known irregularities.
5.  Verify any exact local semantics that affect correctness.

Generators reconstruct structure.

Exact local semantics may still require anchors, documentation, or
experiment.

------------------------------------------------------------------------

## Relationship to Anchors

Instruction-family generators explain structural regularity.

Anchors preserve exact semantic distinctions where nearby instructions
can easily be confused.

Examples include:

-   similar mnemonics with different destinations;
-   family-local meanings of mnemonic letters;
-   instructions whose behaviour cannot safely be inferred from the
    family alone.

------------------------------------------------------------------------

## Conceptual Model

``` text
Instruction
      ↓
Identify family
      ↓
Select family dimensions
      ↓
Recover general behaviour
      ↓
Check irregularities and anchors
```

Instruction families generate structure.

Anchors constrain exact behaviour.

------------------------------------------------------------------------

## Boundaries

Current project knowledge does **not** establish:

-   every PDP-10 instruction family;
-   every mnemonic variant;
-   a universal meaning for mnemonic letters;
-   complete regularity within every family;
-   undocumented monitor or processor extensions.

Do not infer exact behaviour solely from mnemonic similarity.

------------------------------------------------------------------------

## Open Questions

-   Minimum useful family set for reliable reconstruction.
-   Which specialised instructions deserve their own generators.
-   Which semantic distinctions should remain anchors permanently.
-   Exact irregularities in memory-result division forms.

------------------------------------------------------------------------

## Related Capsules

-   `addressing.md`
-   `arithmetic.md`
-   `blt.md`
-   `anchors.md`

---

