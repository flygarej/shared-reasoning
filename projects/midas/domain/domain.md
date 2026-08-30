# Domain knowledge

## MIDAS on TOPS-20 — anchors

### Runtime versus assembly time

MIDAS source has two important semantic levels:

1. PDP-10 instructions and data that exist in the generated program.
2. MIDAS assembly-time computation that decides or generates what appears in that program.

When reading unfamiliar source, classify the line before interpreting it.

### Initial symbol environment

On the live MIDAS.458/TOPS-20 system, `PSOUT` and `HALTF` are verified as usable without `.INSRT`.

Boundary: do not assume all TOPS-20 monitor symbols or `%`-style aliases are similarly predefined.

### Inclusion

`.INSRT <filespec>` includes another MIDAS source file during assembly and resumes the original source afterward.

### Literals

Square-bracketed literals can generate stored data and evaluate to its address.

Example:

```text
HRROI A,[ASCIZ /text/]
```

Literal/constants storage is data. Runtime control falling into that area will execute the data as instructions; this failure mode was directly observed.

### Minimal TOPS-20 output anchor

```text
A=1

START:
        HRROI A,[ASCIZ /text
/]
        PSOUT
        HALTF
        END START
```

### Macro anchor

```text
DEFINE SAY TEXT
        HRROI A,[ASCIZ /TEXT
/]
        PSOUT
TERMIN
```

`SAY Hello from MIDAS` emits the expected instruction sequence and associated literal data.

### Conditional assembly anchor

`IFN` and `IFE` are assembly-time conditionals. If a conditional fails, its source is not emitted.

### Fixed repetition anchor

`REPEAT 3,[ ... ]` processes its body three times during assembly. In the verified test, `.RPCNT` yielded `0, 1, 2`.

### IRPS anchor

`IRPS WORD,,[ONE, TWO, THREE] ... TERMIN` iterates over successive syllables. In the verified test, `.IRPCNT` yielded `0, 1, 2`. Commas between the tested syllables did not prevent iteration.

### TECO.MID reading rule

`TECO.MID` is an advanced specimen, not the MIDAS specification. Learn a mechanism independently, then use `TECO.MID` to see how it is exploited in production source.

---

## Evidence hierarchy and portability

For practical MIDAS.458/TOPS-20 questions, prefer live verified behavior and late/contemporary MIDAS documentation over early historical material. `midas.doc` is currently the strongest general manual candidate; the later INFO material remains valuable. AIM-90 explicitly targets PDP-6 and is lineage evidence, not a MIDAS.458 authority.

Working portability rule:

- PDP-10 instruction semantics: broadly portable across PDP-10 environments, subject to processor/model differences.
- MIDAS assembler/macro machinery: likely portable across contemporary ITS/TENEX/DEC MIDAS unless version evidence says otherwise.
- OS/site definitions, predefined symbols, file conventions, system calls, and executable command interfaces: environment-specific until verified.

## Real-source corpus

Curated small specimens in the project root:

- `itags.mid`: comparatively ordinary PDP-10/TOPS-20 code; useful for separating machine code from assembler machinery.
- `wm.mid` / `qm.mid`: expose `.SCALAR`, symbol aliases, `REPEAT/.RPCNT`, constants/variables and explicit layout.
- `elink.mid`: exposes `IF1`, `PRINTX`, `.TTYMAC` and pass-sensitive/interactive assembly.
- `xjsys.mid`: advanced macro specimen with richer argument/text-generation machinery, validation, and generated labels.

Use these to derive experiments rather than inventing a complete curriculum from the manual.

## AIM-90 lineage boundary

AIM-90 states that MIDAS is a PDP-6 assembly program and describes PDP-6 machine instructions. Preserve it as a primary historical source for MIDAS ancestry and PDP-6 -> PDP-10 lineage comparison. Do not use it to settle later TOPS-20 MIDAS behavior when later evidence exists.

---

## Definition-file and symbol-environment anchors

Late MIDAS documentation distinguishes reusable definition files from the assembler's own initial symbols. Do not infer that a name present in `DECDFS`, `DECBTS`, or `TNXDFS` is necessarily compiled into the live MIDAS.458; verify the executable/environment independently. `.SYMCNT` is documented as counting both initial and user-defined symbols (excluding expunged symbols), making it useful for measuring the bare initial environment.

`DECDFS` is organized around definition/iteration machinery for DEC system-call families. `DECBTS` is a large declarative monitor-symbol corpus built from repeated `DEFSYM name==:value` forms and cleans up temporary helper machinery. `TNXDFS` is a parameterized table: `.TNXJS DEF` applies the supplied operation to a large JSYS list, while `.TNXDF` supplies `.TNXSET` by default. This is evidence for mature textual/meta-programming in later MIDAS, not by itself evidence that every listed JSYS is an initial symbol.

`TNXDFS` provides strong later-source continuity evidence for `DEFINE ... TERMIN` and dummy substitution. Its extensive use of `=:` makes exact assignment semantics a high-priority language question. `.AUXIL`, `.INIT"XXX`, and the richer dummy/delimiter syntax are source-derived questions to resolve from late documentation before designing live tests.

## Historical comparison rule

For PDP-6 -> PDP-10 MIDAS comparison, compare like with like. Separate machine instruction names from assembler pseudo-ops/special symbols and from monitor/site vocabulary. AIM-090's Initial Symbol Table is a historical baseline; the later TOPS-20 namespace is expected to contain substantial OS-interface accretion, so raw table size alone does not measure architectural or language change.
