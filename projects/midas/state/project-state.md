# project-state.md

## Project

MIDAS assembly language on TOPS-20.

## Objective

Learn MIDAS well enough to read, write, test, and reason about MIDAS programs on the live TOPS-20 system. A later application is understanding the MIDAS portions of the historical EMACS/TECO implementation, especially `TECO.MID`, but MIDAS itself is the present focus.

## Environment

- Live PANDA TOPS-20 system.
- MIDAS version observed: `MIDAS.458`.
- PDP-10/TOPS-20 programs can be assembled, loaded with LINK, saved, and executed on the live system.
- Historical MIDAS source is available throughout the TOPS-20 distribution, including the EMACS directory.

## Reference material

Preferred reference:

- `reference/midas-26.info.txt` — later INFO-format MIDAS manual; useful detailed language reference.

Legacy reference still present:

- `reference/midas.info.txt` — alternate/older INFO-derived copy.
- `reference/AIM-090_ocr.pdf` and `reference/midas-aim-090.txt` — searchable scan/OCR of Peter Samson's AIM-90. AIM-90 explicitly documents PDP-6 MIDAS and is therefore historical lineage evidence, not authority for MIDAS.458/TOPS-20.
- `reference/midas.doc.txt` is cached and is currently the strongest candidate for the best general late MIDAS manual/change-history source.

Historical EMACS MIDAS files examined during exploration include `SYSTEM.MID`, `CVT.MID`, `TNXDFS.MID`/`TWXDFS.MID`, `XJSYS.MID`, `EMACS.CTL`, `TWENEX.INSTALL`, and `TECO.MID`. These are evidence/examples, not MIDAS language authorities.

## Accepted observations and verified conclusions

### MIDAS invocation and output

- Running `MIDAS` interactively produces a `*` prompt.
- `@MIDAS FOO` successfully assembles `FOO.MID`.
- Simple assemblies produce relocatable output that `@LOAD` handles through LINK.
- `END START` supplies a usable entry point.
- `@SAVE` produces an executable runnable from the EXEC.

### Initial symbols on TOPS-20

**Verified by live experiment:** a bare MIDAS source with no `.INSRT` can use `PSOUT` and `HALTF`.

Therefore, on this MIDAS.458/TOPS-20 installation, these names are in the initial symbol environment. Do not generalize this yet to every monitor symbol or every MIDAS installation.

### File inclusion

The MIDAS file-inclusion pseudo-op is `.INSRT`. It suspends the current input, reads the specified file, and resumes the original input afterward.

### Literals and runtime fall-through

Square brackets can create literals whose address is used in the containing expression. A construct such as:

```text
HRROI A,[ASCIZ /text/]
```

can therefore supply a pointer to literal string storage.

A program that printed with `PSOUT` but omitted `HALTF` fell through into the constants area and eventually trapped on an illegal instruction. This verifies the important distinction that `END` terminates assembly; it does not terminate execution.

### Verified minimal TOPS-20 program

```text
A=1

START:
        HRROI A,[ASCIZ /text
/]
        PSOUT
        HALTF
        END START
```

This pattern assembled, linked, saved, printed correctly, and returned to the EXEC.

## Assembly-time programming model

Current evidence supports a useful layered model:

```text
PDP-10 runtime instructions
        ↑
MIDAS expressions / symbols / literals
        ↑
macros and textual substitution
        ↑
conditional assembly
        ↑
iteration and generated source/code
```

The runtime instruction layer transfers strongly from ordinary PDP-10 knowledge. The assembly-time language is distinctly MIDAS and must be learned on its own terms.

### Simple macros

Verified syntax:

```text
DEFINE SAY TEXT
        HRROI A,[ASCIZ /TEXT
/]
        PSOUT
TERMIN
```

Invocation such as `SAY Hello from MIDAS` textually substitutes the argument and emits the expected PDP-10 instructions plus literal string data. Multiple calls generated multiple instruction sequences and corresponding literals.

### Conditional assembly

`IFN` and `IFE` have been verified in small programs.

With:

```text
DEBUG==1

IFN DEBUG,[
        SAY Debug message
]
```

the enclosed source is assembled. With `DEBUG==0`, it is absent from the generated program. This is assembly-time selection, not runtime branching.

### REPEAT and `.RPCNT`

Verified:

```text
REPEAT 3,[
        SAY Hello from REPEAT
]
```

emits the body three times at assembly time.

Inside `REPEAT 3,[...]`, `.RPCNT` was experimentally observed to take the values `0, 1, 2`. Thus `.RPCNT` is a zero-based iteration counter for `REPEAT` in this environment.

### IRPS and `.IRPCNT`

Verified:

```text
IRPS WORD,,[ONE, TWO, THREE]
        SAY WORD
        ...
TERMIN
```

This iterated over the syllables `ONE`, `TWO`, and `THREE`. `.IRPCNT` was experimentally observed as `0, 1, 2`.

The commas did not interfere with the syllable scan, consistent with the manual's description of `IRPS`.

This makes the `TECO.MID` idiom

```text
IRPS AC,,FF A B C D E J BP T TT TT1 IN OUT CH Q P
AC=.IRPCNT
TERMIN
```

read naturally as assigning consecutive numeric values to accumulator names at assembly time.

## Relationship to MACRO-20

Current evidence strongly suggests that ordinary PDP-10 instruction syntax and semantics transfer well from MACRO-20 knowledge, but MIDAS adds a much richer assembly-time programming language.

Working rule:

> If a line looks like ordinary PDP-10 assembly, first read it as ordinary PDP-10 assembly. If something is inexplicable, check whether MIDAS generated or transformed part of it before questioning the PDP-10 interpretation.

MACRO-20 may generate hypotheses for MIDAS, but it is not evidence for MIDAS semantics.

## TECO.MID as a future specimen

Source inspection strongly supports that `TECO.MID` is the source of the TECO interpreter/runtime used by historical EMACS, with included support such as terminal-specific code.

For this project, `TECO.MID` should be treated not as the language specification but as an advanced specimen: learn one MIDAS mechanism independently, then revisit matching fragments in `TECO.MID`.

## Working boundaries

- Focus on TOPS-20 behavior first.
- ITS examples may teach MIDAS syntax but not TOPS-20 runtime behavior without verification.
- Prefer `midas.26` and live experiments over model familiarity.
- Keep MIDAS-language behavior separate from PDP-10 instruction semantics, TOPS-20 JSYS behavior, and TECO/EMACS semantics.
- Keep this project focused on MIDAS; cross-domain TECO/EMACS integration belongs in a later combined project.

## Source-driven learning strategy

The preferred route is now to reverse-engineer real MIDAS source and document the language as evidence accumulates:

1. Observe a construct in real source.
2. Check `midas.doc` / later INFO documentation.
3. Form a narrow hypothesis.
4. Verify uncertain or TOPS-20-specific behavior on MIDAS.458.
5. Promote only supported conclusions into domain/state.

Assembler-language machinery is expected to be broadly portable across ITS/TENEX/DEC MIDAS of comparable vintage unless evidence says otherwise. OS/site definitions, predefined symbols, file conventions, system calls, and executable interfaces are environment-specific until verified. Version differences remain an independent concern.

The small source corpus (`elink.mid`, `itags.mid`, `qm.mid`, `wm.mid`, `xjsys.mid`) is curated for this purpose. It suggests a progression from ordinary PDP-10 code through symbol/storage machinery to pass-sensitive and advanced macro facilities.

## AIM-90 preservation side thread

AIM-90 is explicitly a PDP-6 MIDAS document. It is being transcribed separately for historical preservation and lineage study. The scan is authoritative; original spelling, punctuation, capitalization, and apparent errors are preserved; reconstructions are marked. This transcription is useful for tracing PDP-6 -> later MIDAS evolution but must not silently override later MIDAS documentation or live MIDAS.458 behavior.

## Initial-symbol inventory and PDP-6 lineage comparison

The completed diplomatic transcription of AIM-090 now makes its PDP-6 Initial Symbol Table usable as a historical baseline. The immediate comparison target is the much larger initial environment of the live MIDAS.458/TOPS-20 assembler. Keep three things distinct: the assembler's internal initial symbol table, symbols emitted in an output-file symbol table, and definition/support files used to construct an assembler or program environment.

Late documentation provides an important measurement hook: `.SYMCNT` counts user-defined plus initial symbols (excluding expunged symbols). Determine the bare MIDAS.458 initial count, then seek a way to enumerate/classify the names rather than merely count them. Desired classes include PDP-10 opcodes, MIDAS pseudo-ops/special symbols, DEC monitor/bit definitions, TENEX/TOPS-20 JSYS definitions, aliases/compatibility names, and possible site-specific additions.

Current source archaeology shows that definition packages are important evidence but are not automatically proof of what was compiled into this particular MIDAS.458. `DECDFS` uses iterator-like definition machinery; `DECBTS` is a large declarative monitor-symbol corpus; `TNXDFS` exposes a parameterized JSYS definition table. The live executable remains authority for its actual initial environment.

`TNXDFS.MID` strongly reinforces macro-language continuity with AIM-090 through production use of `DEFINE ... TERMIN` and macro dummy substitution. It also raises concrete source-derived questions: `=:` is heavily used in JSYS/instruction definitions; `.AUXIL`, `.INIT"XXX`, and richer macro argument/delimiter forms need documentation before experiments. These now outrank an arbitrary test ladder.

## Current direction

Use the chain **AIM-090 -> real later MIDAS source -> late documentation -> targeted MIDAS.458 experiment**. First characterize the MIDAS.458 initial symbol environment and resolve source-exposed constructs such as `=:`, `.AUXIL`, and the `TNXDFS` macro idioms. Then resume the broader language targets (`=`, `=:`, `==`, `==:`, `EQUALS`, `.SCALAR`, storage/layout, pass-sensitive facilities). Continue hunting `HLP:MIDAS.HLP` for executable command/switch documentation.

---
