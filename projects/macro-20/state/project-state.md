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

Gorin has been covered through Chapter 26, Command Scanning.

Accepted areas now include:

- machine representation and instruction format;
- recursive effective-address calculation;
- movement, control-flow, test, Boolean, shift, and arithmetic families;
- block transfer;
- macros and conditional assembly;
- local UUOs;
- files and JFNs;
- string and byte I/O;
- arrays;
- lists and record-layout construction;
- program memory and mapped file pages;
- COMND command scanning.

The verified Small Executive has been entered, assembled, linked, saved,
executed, and debugged.

The next major subject is Chapter 27, process handling and structure,
including implementation of the currently empty `PUSH` command server.

Later chapters are expected to add:

- interprocess communication;
- pseudo-interrupts and traps;
- further TOPS-20 file-system and I/O facilities;
- additional servers to the Small Executive reference program.

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
- symbolic field placement.

Macros may encode relationships once and generate multiple consistent
representations.

Repeated use of a mechanism does not by itself establish the mechanism's
defining purpose.

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

The exact sharing relationship between JOBs, FORKs, and JFN tables remains
open.

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
saved, and run.

It is the primary Rosetta/reference program for:

- COMND initialization;
- reparsing;
- FDBs and FDB alternatives;
- keyword tables and recognition flags;
- dispatch;
- defaults;
- noise words;
- confirmation;
- numeric parsing;
- file parsing;
- JFN-based input;
- resource cleanup;
- ordinary and fatal JSYS error handling.

A transcription error changed:

`SETOM UDFLAG`

to:

`SETM UDFLAG`

causing `COUNT DOWN` to count upward.

The correction established the need for semantic anchors that constrain
nearby mnemonic interpretations.

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
- Detailed stack instruction and procedure-linkage conventions.
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
- Detailed `OPENF` access and sharing semantics.
- Detailed `.CMIFI` interaction with the COMND GTJFN argument block.
- Process creation, fork control, and program invocation.
- IPCF conventions and Quasar interaction.
- PSI, traps, and asynchronous control transfer.

### Knowledge representation

- Minimum useful MACRO-20 instruction-family anchor set.
- Which broad candidate anchors remain necessary after fresh-session
  reconstruction tests.
- Whether additional reference programs are needed beyond the factorial
  program and Small Executive.

---

## Next

1. Complete maintenance of project state, session history, TODO, domain
   capsules, anchors, and reference artefacts.
2. Continue with Gorin Chapter 27 on process handling and structure.
3. Add the real `PUSH` server to the verified Small Executive.
4. Continue expanding the reference program as Gorin introduces IPC and
   related facilities.
5. Conduct instruction-family anchor sessions and compact the candidate
   anchor set using verified semantics and reconstruction tests.
   
---

