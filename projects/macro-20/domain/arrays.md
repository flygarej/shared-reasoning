# Arrays (projects/macro-20/domain/arrays.md)

## Generator

An array is a contiguous region of memory whose elements are accessed
through effective-address calculation.

The PDP-10 instruction set has no dedicated array mechanism.

Arrays are constructed from ordinary memory together with address
calculation.

------------------------------------------------------------------------

## Linear Arrays

A one-dimensional array occupies consecutive PDP-10 words.

The address of an element is determined from:

-   array origin;
-   element index.

Iteration normally advances by changing the index rather than modifying
the array itself.

------------------------------------------------------------------------

## Multidimensional Arrays

Multidimensional arrays remain linear in memory.

Accepted construction techniques include:

-   row-major or column-major address calculations;
-   tables of row or column origins.

The chosen mapping determines how multidimensional indices become linear
addresses.

------------------------------------------------------------------------

## Address Calculation

Array access is an application of the addressing generator.

Conceptually:

``` text
Array base
     ↓
Element index
     ↓
Effective address
     ↓
Memory operand
```

The instruction family then operates on the resolved operand.

------------------------------------------------------------------------

## Relationship to Records

Arrays organise homogeneous collections.

Records organise heterogeneous fields.

Arrays answer:

> Which element?

Records answer:

> Which field?

The two mechanisms are complementary.

------------------------------------------------------------------------

## Relationship to BLT

`BLT` efficiently copies or initializes contiguous regions of memory.

It therefore naturally complements array construction and bulk array
operations without changing the conceptual array model.

------------------------------------------------------------------------

## Conceptual Model

``` text
Linear memory
      ↓
Choose origin
      ↓
Apply index calculation
      ↓
Effective address
      ↓
Element
```

Arrays are a view of memory rather than a distinct architectural object.

------------------------------------------------------------------------

## Boundaries

Current project knowledge does **not** establish:

-   language-specific array descriptors;
-   runtime bounds checking;
-   dynamically resized arrays;
-   compiler-generated array layouts.

Do not infer higher-level language features from the assembly model.

------------------------------------------------------------------------

## Open Questions

-   Common TOPS-20 runtime conventions for multidimensional arrays.
-   Typical library support for dynamic arrays, if any.

------------------------------------------------------------------------

## Related Capsules

-   `addressing.md`
-   `records.md`
-   `program-memory.md`
-   `blt.md`
-   `anchors.md`

---

