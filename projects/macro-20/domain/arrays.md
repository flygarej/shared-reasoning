# Arrays

## Generator

Arrays map collections of elements onto contiguous memory.

Element selection is performed by computing an effective address from a base location and one or more indices.

## One-dimensional arrays

A one-dimensional array occupies a contiguous block of words.

Indexed addressing selects an element relative to the array origin.

## Multidimensional arrays

Multidimensional arrays are represented in linear memory.

Observed implementation techniques:

- side-table containing row or column origins;
- computed address polynomial.

Both generate the effective address of the selected element.

## Principles

Array access builds on the ordinary effective-address mechanism rather than introducing special array instructions.

## Boundaries

This chapter introduces array organization and addressing techniques.

Performance trade-offs and implementation preferences beyond the presented techniques are outside the current project model.

---

