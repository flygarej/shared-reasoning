# Arithmetic (projects/macro-20/domain/arithmetic.md)

## Generator

PDP-10 arithmetic is organised into related instruction families.

Families vary independently along dimensions such as:

-   operand source;
-   destination;
-   result width;
-   numeric representation.

Learning the family structure allows many instructions to be
reconstructed from a small set of rules.

------------------------------------------------------------------------

## Destination Grammar

Several fixed-point arithmetic families share a common destination
grammar.

Destination forms include:

-   blank: memory operand, result to AC;
-   `I`: immediate operand, result to AC;
-   `M`: result to memory;
-   `B`: result to both AC and memory.

This grammar is shared by families such as:

-   `ADD`;
-   `SUB`;
-   `IMUL`.

Individual families may introduce exceptions.

------------------------------------------------------------------------

## Width Hierarchy

Arithmetic families frequently scale by operand and result width.

Accepted examples include:

### Multiplication

-   `IMUL` --- one-word result.
-   `MUL` --- doubleword result.
-   `DMUL` --- four-word result.

### Division

-   `IDIV` --- single-word dividend with quotient and remainder.
-   `DIV` --- doubleword dividend.
-   `DDIV` --- four-word dividend divided by a doubleword divisor.

Increasing width changes representation requirements and may introduce
additional architectural state.

------------------------------------------------------------------------

## Floating-Point Grammar

Floating-point instructions form their own family.

Accepted structure:

Single precision:

`F` + operation + optional rounding + destination form

Double precision:

`DF` + operation

Common operations include:

-   addition;
-   subtraction;
-   multiplication;
-   division.

------------------------------------------------------------------------

## Irregularities

Arithmetic families are highly regular but not perfectly uniform.

Operations producing more than one logical result, such as quotient and
remainder, naturally introduce architectural irregularities.

Treat these as explicit exceptions rather than forcing them into the
general family grammar.

------------------------------------------------------------------------

## Relationship to Other Generators

Instruction families describe the grammatical structure shared by
arithmetic instructions.

This capsule captures arithmetic-specific regularities and known
exceptions.

Exact instruction semantics remain anchored by verified documentation,
experiments, and semantic anchors where necessary.

------------------------------------------------------------------------

## Conceptual Model

``` text
Arithmetic instruction
        ↓
Identify family
        ↓
Determine width
        ↓
Determine destination form
        ↓
Apply family semantics
        ↓
Check family-specific irregularities
```

------------------------------------------------------------------------

## Boundaries

Current project knowledge does **not** establish:

-   every floating-point detail;
-   exact remainder placement for every division variant;
-   overflow handling for every arithmetic instruction;
-   all specialised arithmetic extensions.

Do not infer complete semantic equivalence across related families.

------------------------------------------------------------------------

## Open Questions

-   Exact semantics of `DIVM` and `IDIVM`.
-   Floating-point field details where documentation was ambiguous.
-   Overflow and processor flag interactions across arithmetic families.

------------------------------------------------------------------------

## Related Capsules

-   `instruction-families.md`
-   `data-representation.md`
-   `anchors.md`

---

