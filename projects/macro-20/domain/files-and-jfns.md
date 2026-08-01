# Files and JFNs (projects/macro-20/domain/files-and-jfns.md)

## Generator

TOPS-20 separates **file identity** from **file access**.

A pathname names a file.

A Job File Number (JFN) is the monitor-managed handle used by nearly all
subsequent file operations.

Applications normally manipulate JFNs rather than pathnames.

------------------------------------------------------------------------

## File Lifecycle

The accepted lifecycle is:

``` text
pathname
    ↓
GTJFN
    ↓
JFN
    ↓
OPENF
    ↓
File access
    ↓
GTSTS (optional status)
    ↓
CLOSF
    ↓
RLJFN
```

Each stage has a distinct responsibility.

-   `GTJFN` establishes file identity.
-   `OPENF` establishes access characteristics.
-   I/O JSYSes operate on the JFN.
-   `GTSTS` reports status associated with the JFN.
-   `CLOSF` terminates file access.
-   `RLJFN` releases the JFN.

------------------------------------------------------------------------

## Identity

`GTJFN`

-   translates pathname → JFN.

`JFNS`

-   translates JFN → pathname.

These are complementary operations.

Obtaining a JFN does **not** itself establish read or write access.

------------------------------------------------------------------------

## Access

Once a JFN has been obtained, most operations use that JFN directly.

Accepted access styles currently include:

-   byte I/O;
-   string I/O;
-   mapped-file access;
-   shared thawed writable access.

The pathname normally disappears from subsequent operations.

------------------------------------------------------------------------

## Writable Sharing

Normal writable access is frozen.

A frozen writable open excludes every other writable open.

`OF%THW` requests thawed writable access.

Thawed access permits multiple simultaneous writers when every writer
requests `OF%RD`, `OF%WR`, and `OF%THW`.

While thawed writers hold the file, frozen writable access is denied.

While a frozen writer holds the file, all further writable opens are
denied, whether frozen or thawed.

Thawed access permits concurrent writers but does not provide
synchronization.

Processes may combine thawed access with `PMAP` so the same file pages
appear in multiple address spaces.

---

## String I/O

### Output

`SOUT`

-   AC1: output JFN
-   AC2: source byte pointer
-   AC3: character count or termination rule

With AC3 equal to zero, output continues until a null byte.

Verified experimentally:

`.PRIOU` together with `SOUT` reproduces the terminal output normally
performed through `PSOUT`.

### Input

`SIN`

-   AC1: source JFN
-   AC2: destination byte pointer
-   AC3: character count and stopping mode
-   AC4: break character when AC3 is positive

Negative AC3 requests a fixed-length transfer.

Positive AC3 terminates when either:

-   the requested count is exhausted; or
-   the break character is encountered.

On return AC3 moves toward zero by the number of transferred characters.

------------------------------------------------------------------------

## Terminal I/O

TOPS-20 also provides higher-level terminal-oriented JSYSes.

Accepted examples include:

-   `PSOUT`
-   `RDTTY`

These build upon the same underlying file abstraction.

------------------------------------------------------------------------

## Status

`GTSTS`

returns monitor status associated with a JFN.

Current accepted use:

-   distinguish end-of-file from other I/O failures following `SIN` or
    similar operations.

------------------------------------------------------------------------

## Wildcard Iteration

Wildcarded file specifications produce an initial JFN.

`GNJFN`

advances that JFN through subsequent wildcard matches.

The iteration state is therefore associated with the JFN rather than
with a pathname string.

------------------------------------------------------------------------

## Predefined JFNs

The monitor provides predefined JFNs.

Current project knowledge includes:

-   `.PRIIN`
-   `.PRIOU`

These provide the conventional primary input and output streams.

------------------------------------------------------------------------

## Conceptual Model

TOPS-20 attempts to present diverse devices through a common JFN-based
interface.

The accepted abstraction is therefore:

``` text
pathname
        ↓
   file identity
        ↓
       JFN
        ↓
 common file interface
        ↓
byte I/O
string I/O
mapped pages
status
iteration
```

The JFN is the conceptual centre of the model.

------------------------------------------------------------------------

## Boundaries

Current project knowledge does **not** establish:

-   complete `OPENF` sharing modes beyond accepted frozen/thawed access;
-   buffering policy;
-   synchronization between thawed writers;
-   precise JOB/FORK ownership rules;
-   lifetime rules for predefined JFNs;
-   interaction between multiple FORKs and shared JFN tables.

Do not infer these from other operating systems.

------------------------------------------------------------------------

## Open Questions

-   Are JFN tables shared between FORKs?
-   Can JFNs migrate between FORKs?
-   Exact relationship between JOB and FORK ownership.
-   Detailed `OPENF` flags beyond `OF%RD`, `OF%WR`, and `OF%THW`.
-   Detailed `.CMIFI` interaction with COMND.

------------------------------------------------------------------------

## Related Capsules

-   `program-memory.md`
-   `comnd.md`
-   `program-memory.md`
-   `processes.md`
-   `ipcf.md`
-   `anchors.md`
