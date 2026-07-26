# Files and JFNs

## Generator

A Job File Number (JFN) is a job-local shorthand for a pathname.

The monitor maintains the mapping between pathnames and JFNs so that almost all file operations use compact JFN identifiers rather than textual file names.

## Lifecycle

pathname
    ↓
GTJFN
    ↓
JFN
    ↓
OPENF
    ↓
File I/O
    ↓
CLOSF
    ↓
RLJFN

## Principles

- TOPS-20 attempts to present different storage devices through a common file interface.
- Most file-related JSYSes operate on JFNs rather than pathnames.
- Once a JFN has been obtained, the pathname normally disappears from subsequent file operations.

## Observed Patterns

### Translation

- GTJFN translates pathname → JFN.
- JFNS translates JFN → pathname.

These form complementary operations.

### Iteration

GNJFN advances through wildcard matches using an existing JFN.

The JFN itself carries the iteration state.

### I/O

Most file I/O follows the pattern

JFN
    ↓
OPENF
    ↓
String/Byte input and output
    ↓
GTSTS (status)
    ↓
CLOSF
    ↓
RLJFN

### Predefined JFNs

The monitor provides predefined JFNs.

This chapter introduces:

- .PRIIN
- .PRIOU

Higher-level monitor calls (for example PSOUT) may internally operate using these predefined JFNs.

## Vocabulary

JOB

- Execution environment owning JFNs.

FORK

- Creates another process within a JOB.

(The relationship between FORKs and JFN ownership has not yet been established.)

## Boundaries

This chapter introduces the file abstraction and common JSYS workflow.

It does not yet establish:

- detailed OPENF modes;
- sharing semantics;
- buffering behaviour;
- relationship between multiple FORKs and JFN mappings.

Do not infer these from other operating systems.

## Open Questions

- Are JFN tables shared by all FORKs within a JOB?
- Can a JFN migrate between FORKs?
- What exactly constitutes a JOB?
- Lifetime rules for predefined JFNs.
- Detailed OPENF access flags and byte-size handling.
