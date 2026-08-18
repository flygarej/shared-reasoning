# Project State (projects/macro-20/state/project-state.md)

## Project

**MACRO-20 on TOPS-20**

## Objective

Develop a rigorous, testable understanding of:

- MACRO-20;
- the PDP-10 architecture exposed through MACRO-20;
- the TOPS-20 monitor interface;
- characteristic TOPS-20 program-construction techniques.

The project proceeds breadth-first through Gorin, using documentation,
verified programs, and small experiments to establish a reusable
conceptual model.

---

## Collaboration Method

- Follow the shared protocol and rationale.
- Distinguish observation, documentation, inference, hypothesis,
  prediction, working model, and verified conclusion.
- Prefer small discriminating experiments over attractive inference.
- Treat domain capsules as compact reasoning artefacts rather than
  reference manuals.
- Preserve generators, anchors, boundaries, and explicit unknowns.
- Use verified reference programs to anchor how mechanisms compose.
- Do not infer exact local instruction or JSYS semantics from structural
  generators alone.

---

## Verified Environment

- Panda KLH10 running TOPS-20.
- Native MACRO-20 toolchain works.

Verified workflow:

1. `COMPILE` assembles `.MAC` source into `.REL`.
2. `LOAD` links the relocatable program.
3. `SAVE` writes an executable `.EXE`.
4. The program is executed from the TOPS-20 command level.

A missing final newline after `END` causes:

`?MCRNES NO END STATEMENT ENCOUNTERED`

Gorin explicitly states that `END` requires its own CRLF.

---

## Current Phase

Gorin has been covered through Chapter 28, Interprocess Communication.

Accepted areas now include the existing architecture, language, file,
memory, and COMND models, plus:

- TOPS-20 jobs and process hierarchies;
- process construction and execution;
- entry vectors, Program Data Vectors, and PDVAs;
- IPCF message exchange and QUASAR communication;
- shared writable file pages using thawed access.

The verified Small Executive now includes working `PUSH` and `QUEUE`
servers. It anchors process handling and IPCF composition in addition to
COMND and JFN-based I/O.

The next major subject is Chapter 29, traps and interrupts.

---

## Accepted High-Level Model

### PDP-10 instruction architecture

PDP-10 instructions are often best understood as regular, family-local
grammars.

Mnemonic components may encode:

- source form;
- destination form;
- value transformation;
- test relation;
- result width;
- operand placement.

A mnemonic letter must not be assumed to carry the same meaning across
unrelated families.

Effective-address calculation occurs before instruction semantics.

Some instructions remain irregular where an operation naturally has
additional outputs, state, or architectural constraints.

---

### MACRO-20 as a construction language

MACRO-20 is more than a direct instruction assembler.

Accepted compile-time mechanisms include:

- macros;
- conditional assembly;
- `OPDEF`;
- `PHASE` and `DEPHASE`;
- `.ORG`;
- generated command tables;
- symbolic field placement;
- relocatable `.REL` output for LINK and reusable `.UNV` universal files;
- standard MACSYM source abstractions for calls, returns, AC preservation, and named local storage.

Macros may encode relationships once and generate multiple consistent
representations.

Repeated use of a mechanism does not by itself establish the mechanism's
defining purpose.

MACSYM is accepted as a standard TOPS-20 MACRO support environment rather
than merely an optional collection of conveniences. It provides conventional
source-level abstractions such as `CALL`, `RET`, `RETSKP`, AC preservation,
and named stack/AC variables. Site-specific Columbia Chapter 7 packages are
reference material, not portable MACRO-20/MACSYM semantics.

---

### LUUOs

Local Unimplemented User Operations allow a program to define
application-specific instructions.

The processor:

- calculates the effective address;
- saves a normalized instruction image;
- transfers through the instruction at location 41.

Software remains responsible for:

- saving accumulators;
- decoding the local opcode;
- dispatching;
- defining argument conventions;
- implementing the operation.

LUUOs are local program mechanisms and are not equivalent to TOPS-20
monitor calls.

---

### Files and JFNs

A Job File Number is a compact monitor-maintained handle associated with
a pathname.

The accepted lifecycle is broadly:

pathname → `GTJFN` → JFN → `OPENF` → I/O → `CLOSF` / `RLJFN`

Obtaining a JFN identifies a file but does not itself establish access.

TOPS-20 presents different devices through a largely common JFN-based
file interface.

Accepted access styles include:

- byte I/O;
- string I/O;
- memory mapping through `PMAP`.

Wildcarded JFNs may be advanced using `GNJFN`.

The exact ownership and visibility relationship between JOBs, FORKs, and
JFN tables remains open. Frozen and thawed writable sharing is now accepted.

---

### TOPS-20 jobs and processes

A process or fork is the independently scheduled executable entity.

A process has its own virtual address space, accumulators, program
counter, and execution state.

A JOB organizes a hierarchy of processes. The JOB itself is not scheduled
as an executable entity.

A superior may create and control inferiors.

Relative fork handles are meaningful within the superior that receives
them and are not global process identifiers. Predefined handles such as
`.FHSLF`, `.FHSUP`, `.FHTOP`, `.FHSAI`, `.FHINF`, and `.FHJOB` express
structural relationships.

---

### Process construction and execution

TOPS-20 separates process construction, image installation, and execution.

- `CFORK` creates an inferior and may initialize its map, capabilities,
  accumulators, and starting state.
- `GET` copies or maps a save file into an existing process and updates
  entry-vector and PDVA metadata.
- `GET` never loads accumulators.
- `SFRKV` starts a process through an entry-vector offset.
- `WFORK` waits for an inferior.
- `KFORK` terminates one or more processes.

`CR%MAP` shares pages through indirect pointers; it does not copy them.

The process and the executable image are distinct:

```text
construct process
      ↓
install program image
      ↓
select entry
      ↓
begin execution
```

---

### Entry vectors, PDVs, and PDVAs

The entry vector describes program entry conditions. Its accepted initial
words are the start instruction, reenter instruction, and version word.

LINK writes Program Data Vectors into program memory. A PDV may describe
program identity, exported information, memory layout, symbols, and
toolchain metadata.

The monitor retains Program Data Vector Addresses rather than complete
PDVs. Other programs may obtain PDVAs through `PDVOP%`.

The entry vector and PDVA list are distinct save-file structures.

---

### Interprocess communication

IPCF provides asynchronous packet exchange between cooperating processes.

Each participating process has an IPCF PID, distinct from a relative fork
handle.

```text
sender
  ↓ MSEND
receiver input queue
  ↓ MRECV
receiver
```

The receiver may poll or request a software interrupt on arrival.

The packet descriptor carries routing, payload, and sender-context
information. Subsystem protocols, such as QUASAR, are layered inside the
IPCF payload.

The verified Small Executive `QUEUE` command sends one request to QUASAR
and consumes one or more reply packets.

---

### Shared file pages

Processes in independent JOBs that trust one another may communicate by
mapping the same writable file pages.

Each process must:

- agree on the file;
- have normal read and write permission;
- open it with `OF%RD`, `OF%WR`, and `OF%THW`;
- map the agreed file pages into its own address space.

The process virtual page numbers need not match.

Normal writable access is frozen and permits one writer.

Thawed writable access permits multiple simultaneous writers only when
every writer requests `OF%THW`.

Frozen and thawed writable opens exclude one another.

---

### Data structures

Arrays occupy linear memory and use ordinary effective-address
calculation.

Multidimensional arrays may be represented through:

- side tables of row or column origins;
- computed address polynomials.

Record layouts may be generated at assembly time using `PHASE`,
`DEPHASE`, and `.ORG`.

Field symbols generated under `PHASE 0` are offsets rather than runtime
addresses.

Lists are represented through elements containing links to successor
elements, with a null value terminating the list.

---

### Program memory and mapping

A program may locate free storage above its loaded image using information
associated with `.JBSA`.

`PMAP` associates file pages with pages in a fork's virtual address
space.

Mapped pages are accessed through ordinary memory references.

TOPS-20 pages contain 512 words and begin at addresses that are multiples
of octal `1000`.

Copy-on-write mapping permits private modification without altering the
mapped file.

Processes in independent JOBs may also map the same thawed writable file
pages, providing shared state through ordinary memory references.

---

### COMND

COMND is a stateful command-interface facility rather than a simple
command-line tokenizer.

A command is represented as a sequence or tree of typed fields.

Each COMND call parses one field and advances through the command
grammar.

Accepted COMND mechanisms include:

- caller-maintained command state block;
- command and atom buffers;
- Function Descriptor Blocks;
- alternate FDB chains;
- keyword tables;
- recognition policy;
- defaults;
- noise words;
- confirmation;
- contextual help;
- completion;
- reparsing;
- file-field parsing integrated with JFN acquisition.

COMND normally returns:

- AC1: status flags and state-block address;
- AC2: parsed field data or an error code;
- AC3: first supplied FDB and FDB actually used.

COMND maintains textual parse state.

The application supplies a reparse entry that restores application
control state.

---

## Verified Reference Programs

### Basic programs

Verified programs include:

- Hello World using `PSOUT`;
- repeated output using a loop;
- equivalent terminal output using `.PRIOU` and `SOUT`;
- file output using `GTJFN`, `OPENF`, `SOUT`, and `CLOSF`.

### Factorial program

The factorial program through `100!` was transcribed, corrected, assembled,
and run.

It anchors:

- arrays;
- indexed addressing;
- `BLT` initialization;
- byte-pointer string construction;
- multiprecision decimal arithmetic.

### Small Executive

The Mark Crispin Small Executive was transcribed, assembled, linked,
saved, run, and extended through Chapters 27–28.

It is the primary Rosetta/reference program for COMND, JFN-based I/O,
process construction, and IPCF/QUASAR composition.

The verified `PUSH` server composes:

`GTJFN → CFORK → GET → SFRKV → WFORK → KFORK`

The verified `QUEUE` server composes:

`MUTIL → MSEND → MRECV → QUASAR reply processing`

Verified implementation notes include:

- some distributed `QSRMAC.UNV` files omit `.OFLAG`;
- `IFNDEF .OFLAG,.OFLAG==.OHDRS-2` was reconstructed and verified;
- the tested monitor requires IPCF capability for `.MUCRE`;
- Gorin's published receive descriptor uses `.IPCFD`;
  `MRECV` requires `.IPCFP`, verified by successful queue output.

The earlier `SETOM`/`SETM` transcription error remains an anchor for
nearby mnemonic distinctions.

The Small Executive is now a tested reference implementation whose
deviations from the source are retained with provenance.

---

## Knowledge Representation Status

The project uses:

- generator-oriented domain capsules;
- semantic, structural, and behavioural anchors;
- explicit boundaries and open questions;
- verified Rosetta/reference programs.

The first broad MACRO-20 anchor set has been created.

It is intentionally a candidate superset and should later be compacted
through reconstruction testing and observed inference failures.

The project domain is undergoing maintenance to:

- remove duplication;
- align names with conceptual scope;
- separate reference artefacts from domain generators;
- update state and history to reflect Chapters 19–26.

---

## Open Questions

### Processor and instruction semantics

- Hexadecimal constant syntax in MACRO-20.
- Detailed JSYS instruction encoding.
- Processor flags: AROV, FOV, CRY0, and CRY1.
- Architectural relationship between accumulators and low memory.
- Exact `IDIVM` and `DIVM` remainder behaviour.
- Exact floating-point field boundaries where the chapter transcription
  was ambiguous.
- Detailed raw stack-instruction semantics beneath the accepted MACSYM procedure-linkage conventions.
- Byte-pointer bit-level representation.

### Macro processing

- Nested delimiter handling.
- Argument substitution and rescanning.
- Macro redefinition.
- Expansion order.
- Exact boundaries between textual substitution and assembler evaluation.

### Operating-system facilities

- Exact relationship between JOBs, FORKs, and JFN ownership.
- Whether and how JFNs are shared between FORKs.
- Detailed `.CMIFI` interaction with the COMND GTJFN argument block.
- Detailed capability policy beyond observed IPCF behaviour.
- Complete execute-only security rules.
- PSI, traps, and asynchronous control transfer.

### Knowledge representation

- Minimum useful MACRO-20 instruction-family anchor set.
- Which broad candidate anchors remain necessary after fresh-session
  reconstruction tests.
- Whether additional reference programs are needed beyond the factorial
  program and Small Executive.

---

## Next

1. Continue with Gorin Chapter 29 on traps and interrupts.
2. Expand the Small Executive as later chapters introduce asynchronous
   control facilities.
3. Complete maintenance of state, history, domain, anchors, and references.
4. Compact the candidate anchor set after fresh-session reconstruction tests.
5. Revisit JOB/FORK/JFN ownership when direct evidence appears.

---

