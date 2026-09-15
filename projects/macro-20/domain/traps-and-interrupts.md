# Traps and Interrupts

## Scope

Compact reasoning model for Gorin Chapter 29. This capsule is intentionally
partial: arithmetic traps are established; PSI interrupt handling is not yet
covered in enough detail to encode.

## Framing

Gorin explicitly says TOPS-20 blurs the distinction between traps and
interrupts. Do not import a modern textbook synchronous/asynchronous taxonomy
as the governing model.

In the material covered so far:

- arithmetic exceptions use the trap mechanism;
- other event handling is introduced through the software interrupt / PSI
  system later in the chapter.

## Arithmetic-trap generator

For `.SWART`, set:

```text
AC1 = process handle
AC2 = .SWART
AC3 = address of four-word trap block
SWTRP%
```

The trap block carries:

```text
.ARPFL  saved flags + failing instruction image
.AROPC  trapping instruction PC + 1
.AREFA  effective address of trapping instruction
.ARNPC  new PC / handler word
```

The verified operational model is:

```text
register trap block
    ↓
arithmetic exception
    ↓
monitor records trap context
    ↓
handler examines/reports/optionally repairs result
    ↓
handler clears any flags that must not be reasserted
    ↓
XJRSTF from .ARPFL/.AROPC restores state and resumes
```

## Example 18 anchor

The verified return sequence is:

```asm
TRAPIT: CALL   TRAPNT
        XJRSTF TRAPB+.ARPFL
```

`XJRSTF` is load-bearing. Substituting `XJRST` caused the saved instruction
image `231040,,0` to be interpreted as a PC and produced an illegal-instruction
transfer to `231040`.

For floating exponent underflow, Example 18's `DOFXU` identifies the failing
floating instruction, locates the result (AC, memory, and where applicable
AC+1), reports the computed value, and replaces the underflow result with zero
before resumption.

## Tooling evidence

Current environment:

```text
MACRO %53B(1254)-4
LINK 6(2425)
```

Useful commands established experimentally:

```text
MACRO listing:
*relfile,listfile=sourcefile

LINK map:
@LOAD relfile /MAP
```

For Example 18 the TITLE is `TRAP`, so the map file is `TRAP.MAP`. The map
places the program at low-segment base `140`; adding `140` to relocatable
listing addresses reproduces observed runtime addresses exactly.

## Boundaries / open questions

- PSI dispatch structure, levels/channels, enabling, masking, and return
  conventions are not yet accepted; wait for the remaining Chapter 29 text.
- Do not infer good/bad trap coding rules before Gorin's post-example
  discussion is incorporated.
- Gorin's printed Example 18 addresses differ from the current build. The
  current executable is internally consistent; the historical layout cause is
  unresolved and deliberately parked.
- CR/LF or literal-pool effects are hypotheses only and must not be promoted
  without evidence.
