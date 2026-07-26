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

### Verified pattern

.PRIOU plus SOUT reproduces the primary-output behaviour of PSOUT.

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

## String input

`SIN` transfers bytes from a JFN into a caller-supplied buffer.

AC registers:

- AC1: source JFN
- AC2: destination byte pointer
- AC3: character count and stopping mode
- AC4: break character when AC3 is positive

The sign of AC3 selects the stopping rule:

- Negative AC3: attempt to read exactly the specified number of characters. A short count occurs only on an error condition.
- Positive AC3: stop when the count is exhausted or when an input character matches the break character in AC4.

After the call, AC3 is moved toward zero by the number of characters actually transferred.

## File status

`GTSTS` accepts a JFN in AC1 and returns its status in AC2.

Observed use:

- after `SIN`, inspect the JFN status to distinguish the cause of an input condition.

## Terminal input

Observed use of `RDTTY`:

- AC1 supplies the destination buffer pointer;
- AC2 supplies the maximum input length;
- AC3 may supply a reprompt string.

The monitor supports redisplaying the reprompt when requested by the user, for example with `^R`.

## Input principle

For string input, the caller supplies both the destination storage and the stopping policy.

## Wildcard iteration

`GTJFN` may be called with flags permitting wildcard matching.

Observed pattern:

GTJFN (wildcard specification)
    ↓
GNJFN repeatedly advances through the matching files.

Iteration terminates when GNJFN reports no further matches and releases the exhausted JFN.

