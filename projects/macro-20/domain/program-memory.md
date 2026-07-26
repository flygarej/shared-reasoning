# Program Memory

## Generator

The running program occupies a contiguous region of memory.

Observed mechanism:

`.JBSA` contains information describing the program image.

The left half identifies the first free word above the program, allowing a program to allocate additional storage dynamically.

## Boundary

Only the allocation origin has been introduced.
Memory management policy has not yet been investigated.

---

