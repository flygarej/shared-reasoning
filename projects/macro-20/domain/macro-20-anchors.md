# MACRO-20 Anchors

## Purpose

Preserve a minimal set of exact semantic, structural, and behavioural
facts that constrain reconstruction of the MACRO-20 and TOPS-20
programming model.

These anchors complement the domain generators.

They are not an instruction reference, JSYS reference, or substitute for
the project documentation.

Each anchor exists because losing the distinction could permit a nearby
but incorrect reconstruction.

---

## Instruction Semantics

### SETO and SETM distinction

`SETO` produces a word containing all ones, which represents `-1` in
36-bit two's-complement arithmetic.

`SETOM address` stores that all-ones value in memory at `address`.

`SETM AC,address` loads the contents of memory at `address` into `AC`.

If the AC field is omitted, the instruction uses AC0.

Therefore:

```asm
SETOM UDFLAG
```

sets `UDFLAG` to `-1`, while:

```asm
SETM UDFLAG
```

does not modify `UDFLAG`.

#### Provenance

A transcription error in the verified Small Executive program changed
`SETOM UDFLAG` to `SETM UDFLAG`.

The resulting `COUNT DOWN` command counted upward because the negative
direction flag was never established.

#### Guarded distinction

Do not infer the meaning of a SET-family instruction from the shared
`SET` prefix alone. The remaining mnemonic letters determine whether the
instruction generates a canonical value, copies an operand, and whether
the destination is an accumulator, memory, or both.

---

### Numeric radix

Unmarked numeric constants normally use the assembler's prevailing
radix.

`^D` marks a numeric constant as decimal.

Verified experimentally:

```asm
TABLE: BLOCK ^D100
```

allocates 100 decimal words.

#### Guarded distinction

Do not interpret an unmarked constant as decimal merely because its
printed digits resemble an ordinary decimal number.

---

### Byte-string copying

`ILDB` loads a byte through a byte pointer and advances the pointer.

`IDPB` deposits a byte through a byte pointer and advances the pointer.

A null-terminated string-copy loop can therefore be formed from:

```asm
COPYST: ILDB A,SOURCE
        JUMPE A,RETURN
        IDPB A,DESTINATION
        JRST COPYST
```

The terminating null need not be copied if the destination is terminated
separately before output.

#### Provenance

Accepted from Gorin's `COPYST` routine and its use with the verified
line-buffer output pattern.

---

## Effective Addressing and Data Layout

### One-dimensional arrays

A one-dimensional word array occupies contiguous memory.

An operand such as:

```asm
ACCUM(C)
```

uses ordinary indexed effective-address calculation to select the
element at offset `C` from `ACCUM`.

No special array instruction is involved.

#### Provenance

Verified in the working factorial program, where the array is traversed
forward during multiplication and backward during output.

---

### Multidimensional arrays

A multidimensional array is mapped onto linear memory.

Accepted addressing techniques introduced by Gorin are:

- a side table containing row or column origins;
- an address polynomial computed from the indices and dimensions.

Both techniques ultimately produce the effective address of the selected
element.

#### Guarded distinction

Row-major and column-major layout are representation choices. Neither is
an intrinsic property of the PDP-10 addressing mechanism.

---

### Record field offsets

During `PHASE n`, labels receive values from the phase location counter
while assembled words are placed using the ordinary storage location
counter.

`DEPHASE` restores normal location counting.

`.ORG address` resets assembly location so temporary layout words may be
overwritten.

This permits symbolic record-field offsets to be generated without
retaining the temporary prototype storage in the final program.

#### Provenance

Accepted from Gorin's dictionary-record definition using `PHASE 0`,
`DEPHASE`, and `.ORG DEFS`.

#### Guarded distinction

A field symbol produced under `PHASE 0` is an offset, not the runtime
address of a record field.

---

## File and JFN Semantics

### JFN identity and access

`GTJFN` associates a pathname with a Job File Number.

Obtaining a JFN identifies the file.

`OPENF` separately establishes access characteristics such as byte size
and read or write access.

Most subsequent file operations use the JFN rather than the pathname.

#### Guarded distinction

Do not treat `GTJFN` as opening the file or assume that pathname syntax
determines the eventual access mode.

---

### JFN location

For ordinary file JSYS use, the JFN is carried in the right half of AC1.

A returned word may also contain flags, so code may isolate the JFN with
a right-half operation such as:

```asm
HRRZ A,SAVED-JFN
```

#### Provenance

Observed in Gorin's verified file-output example.

---

### String output

For `SOUT`:

- AC1 identifies the output JFN;
- AC2 contains the source byte pointer;
- AC3 controls the count or termination rule.

With AC3 equal to zero, output continues until a null byte.

The same operation works with `.PRIOU` and with an ordinary disk-file
JFN.

#### Provenance

Verified on TOPS-20 using both terminal output and file output.

---

### String input

For `SIN`:

- AC1 identifies the source JFN;
- AC2 contains the destination byte pointer;
- AC3 supplies a count and selects the stopping rule;
- AC4 supplies a break character when AC3 is positive.

A negative AC3 requests a fixed-length transfer.

A positive AC3 permits termination either when the count is exhausted or
when the AC4 break character is encountered.

After the call, AC3 moves toward zero by the number of characters
transferred.

#### Guarded distinction

AC3 is both an input limit and a residual-count result.

---

### File mapping

`PMAP` can associate pages of an open file with pages in a fork's virtual
address space.

Mapped data is subsequently accessed using ordinary memory references.

TOPS-20 pages contain 512 words, so page-aligned word addresses are
multiples of octal `1000`.

Copy-on-write mapping permits private modification without modifying the
mapped file.

#### Guarded distinction

Stream I/O and mapped I/O are alternative access models over files; a
mapped file page is not transferred through `SIN` or `SOUT` for each
memory reference.

---

## COMND Structure

### One field per call

Each `COMND` call parses one command field.

A complete command is processed through a sequence of calls, each
advancing through the command grammar.

#### Guarded distinction

COMND does not merely tokenize and return an entire command-line argument
vector.

---

### Command state block

The caller-supplied command state block preserves the continuing parsing
dialogue.

It contains, among other state:

- input and output JFNs;
- prompt or reprompt pointer;
- beginning of editable input;
- pointer to the next field to parse;
- free-space count;
- unparsed-character count;
- atom-buffer pointer and size;
- GTJFN argument-block address;
- application reparse address.

The command buffer holds the continuing command text.

The atom buffer receives the current parsed field.

---

### Function descriptor blocks

A Function Descriptor Block describes a field COMND may parse.

Its accepted structure contains:

- `.CMFNP`: function code, function flags, and alternate-FDB address;
- `.CMDAT`: function-specific data;
- `.CMHLP`: field help pointer;
- `.CMDEF`: default-string pointer;
- `.CMBRK`: optional break-mask pointer.

`FLDDB.` constructs an FDB.

Alternative FDBs permit one position in the command grammar to accept
different field types.

---

### COMND return convention

COMND normally returns `+1`.

On return:

- AC1 contains status flags in its left half and the command-state-block
  address in its right half;
- AC2 contains data produced by the parsed field, or an error code when
  `CM%NOP` is set;
- AC3 contains the address of the first supplied FDB in its left half and
  the address of the FDB actually used in its right half.

If reparsing is required and the right half of `.CMFLG` is nonzero,
COMND transfers control to the supplied reparse address instead of
returning normally.

#### Provenance

TOPS-20 Monitor Calls Reference Guide, December 1982, COMND JSYS 544.

#### Guarded distinction

For chained alternatives, RH(AC3), not the original FDB address, tells
the application which descriptor accepted the field.

---

### Reparse ownership

COMND preserves and restores textual parse state.

The application supplies a reparse entry point that restores its own
control state.

The verified Small Executive saves a known pushdown-list pointer and
restores it at the reparse entry:

```asm
MOVEM P,SAVPDL
CMRPRS: MOVE P,SAVPDL
```

#### Guarded distinction

Reparsing may abandon a partially executed application control path; it
is not merely a request to rescan characters.

---

### Keyword tables

A COMND keyword table contains an entry count, maximum size, and entries
consisting of:

- a left-half pointer to keyword text or a flagged keyword descriptor;
- right-half application data.

The application data commonly contains a command-server address.

Flagged keyword descriptors must include `CM%FW` to identify their
extended format.

Accepted keyword flags include:

- `CM%ABR`: the entry is an explicit abbreviation of another entry;
- `CM%NOR`: do not recognize this string;
- `CM%INV`: recognize the entry but suppress it from `?` help output.

#### Guarded distinction

A COMND keyword table carries recognition policy as well as a
string-to-handler relationship.

---

### Interactive field behaviour

Observed in the verified Small Executive session:

- `?` displays help for the field currently expected;
- `ESC` performs recognition or completion for that field;
- completion may select a default;
- completion may emit noise words;
- after help, COMND redraws the current command and resumes at the same
  field;
- confirmation is itself an explicitly parsed field.

Noise words improve readability but do not provide application data.

---

### Filename fields

A `.CMIFI` field can parse an input-file specification and return a JFN
for subsequent use by `OPENF`.

#### Provenance

Verified in the Small Executive `TYPE` command.

#### Guarded distinction

The application does not necessarily receive filename text and then call
`GTJFN` itself; COMND file-field functions can integrate command parsing
with JFN acquisition.

---

## Behavioural Invariants

### COUNT direction

For the verified Small Executive counting algorithm:

```text
count upward   => UDFLAG is zero initially, then becomes the upper bound
count downward => UDFLAG is -1 before the counting loop
```

The downward loop negates the starting value and counts upward through
negative values toward `-1`, printing each magnitude.

Any implementation of the DOWN handler must therefore establish:

```text
UDFLAG < 0
```

before the direction test.

---

### Command completion

Before a command server performs its semantic operation, it should parse
confirmation when no additional fields are permitted.

Successful confirmation means no unparsed command fields remain.

---

### File cleanup

A command that acquires a JFN must either close or otherwise release it,
including along error paths where applicable.

The Small Executive records the `TYPE` command's active input JFN so that
it can close stale or completed file state deliberately.

---

## Reference Anchors

### Small Executive

`comnd-reference-program.md` is the verified architectural reference for
a COMND-based application.

It demonstrates the composition of:

- command-state initialization;
- reparsing;
- FDBs and FDB alternatives;
- keyword tables and keyword policies;
- command dispatch;
- noise words;
- defaults;
- confirmation;
- numeric fields;
- input-file fields;
- JFN-based file access;
- ordinary and fatal error handling;
- resource cleanup.

The reference program anchors composition. It does not replace the
individual generators or semantic anchors.

---

### Factorial program

The verified factorial program anchors:

- one-dimensional arrays;
- indexed effective addressing;
- contiguous initialization with `BLT`;
- byte-pointer string construction;
- multiprecision arithmetic represented as decimal digits.

The multiprecision algorithm is an example, not a general MACRO-20
generator.

---

## Maintenance

Add an anchor when a verified failure, recurring ambiguity, or close
semantic alternative demonstrates that a generator can drift.

For each candidate anchor, ask:

- Which incorrect reconstruction does it prevent?
- Is the distinction load-bearing?
- Is it smaller than the documentation needed to recover it?
- Does it constrain future reasoning beyond one isolated example?

Record provenance when a specific failure motivated the anchor.

Merge overlapping anchors.

Remove anchors that cease to constrain plausible inference.

Do not expand this file toward comprehensive instruction or JSYS
coverage.
