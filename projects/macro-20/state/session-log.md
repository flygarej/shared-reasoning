# Session Log

## Bootstrap and first program

- Established the MACRO-20 project under the shared protocol.
- Verified the TOPS-20 MACRO-20 toolchain.
- Wrote, assembled, linked, saved, and ran a Hello World program using:
  - `SEARCH MONSYM`
  - `RESET`
  - `HRROI`
  - `PSOUT`
  - `HALTF`
- Discovered experimentally that `END` needs a final newline; later confirmed explicitly by Gorin.

## Architecture chapters covered

- 36-bit words and two's-complement representation.
- ASCII and ASCIZ packing.
- Instruction formats and recursive effective-address calculation.
- MOVE family and EXCH.
- JRST, JSR, JSP, JFCL, JFFO, XCT.
- Test and Boolean instruction families.
- BLT and shift/rotate families.
- Fixed, double-width, and floating-point arithmetic.

## Knowledge-representation development

- Split stable domain knowledge out of project state.
- Adopted generator-oriented capsules:
  - preserve rules that regenerate families;
  - preserve boundaries where inference fails;
  - preserve unknowns explicitly.
- Fresh-chat testing showed that missing domain capsules materially weakened explanations.
- Lowercase filenames adopted for project files.

## Macros

- `DEFINE` names assembly-source blocks.
- Parameters are substituted into macro text.
- Conditional assembly reuses the JUMP/SKIP relation vocabulary.
- `IFNDEF` can provide default symbol definitions.
- Gorin's `OPMAC`/`XX` example was examined:
  - one relationship generates synchronized operator and instruction tables;
  - the instruction table is later used with `XCT`.
- `macros.md` created.
- Detailed macro-processor semantics left as a TODO.

## LUUOs

- Established the core LUUO mechanism from Gorin.
- Added `luuos.md`.
- Examined photographed pages 198–202 of the worked example.
- Confirmed:
  - `OPDEF` gives symbolic names to user-defined operations;
  - the main program uses LUUOs such as `TTYSTR`, `TTYCHR`, and `ERROR` as instruction-like interfaces;
  - the handler preserves accumulator state, decodes the saved instruction, dispatches through a table, restores state, and returns;
  - the CPU supplies dispatch while software defines semantics.
- Photographs were readable enough for code analysis.

## Source organization

- Gorin introduces `SUBTTL` to label major sections in assembly listings.
- Form-feed separates related source components onto listing pages.
- `source-organization.md` added as a small organizational capsule.

## Current status

Chapter 18 complete.

Chapter 19–22
-------------
- Verified string I/O using SOUT and SIN.
- Established accepted JFN lifecycle.
- GTSTS introduced for post-I/O status inspection.
- RDTTY examined as terminal-oriented string input.

Chapter 23
----------
- Introduced wildcard iteration with GTJFN/GNJFN.
- Accepted working model of dynamic allocation using .JBSA.
- Deferred detailed directory iteration pending later need.

Chapter 24
----------
- Accepted conceptual model for linked lists.
- Verified PHASE/DEPHASE/.ORG record-layout mechanism.
- Established record-field offsets as compile-time abstraction.

Chapter 25
----------
- Accepted PMAP working model.
- Distinguished stream I/O from mapped I/O.
- Discussed copy-on-write semantics.
- Noted historical password-side-channel example illustrating
  consequences of virtual-memory mapping.

Chapter 26
----------
- COMND accepted as stateful parser rather than tokenizer.
- State block, FDBs, command tables and reparsing established.
- Small Executive selected as project Rosetta program.
- Program transcribed, assembled, linked and executed.
- Transcription error (SETM vs SETOM) discovered and corrected.
- The verified Small Executive shifted the project from isolated mechanism 
  studies to a stable reference program used to understand the composition
  of multiple TOPS-20 facilities.

Knowledge Representation
------------------------
- Introduced semantic anchors as complement to generators.
- Distinguished:
    generators
    anchors
    Rosetta/reference artefacts
- Added common knowledge-maintenance methodology.
- Began maintenance pass over repository.

---

## Chapter 27 — Processes, forks, and program execution

- Established that a process or fork is the independently scheduled
  executable entity, while a JOB organizes a hierarchy of processes.
- Each process has its own 512-page virtual address space, accumulators,
  program counter, and execution state.
- Established superior/inferior relationships and relative fork handles.
- Accepted predefined structural handles:
  `.FHSLF`, `.FHSUP`, `.FHTOP`, `.FHSAI`, `.FHINF`, and `.FHJOB`.
- Examined `CFORK` as a process constructor:
  - `CR%MAP` shares the superior's map through indirect pointers;
  - `CR%CAP` copies capabilities;
  - `CR%ACS` initializes accumulators from a supplied block;
  - `CR%ST` supplies a PC and starts the inferior.
- Confirmed that `CR%MAP` shares pages rather than copying them.
- Established the process/program-image split:
  `CFORK` constructs, `GET` installs an image, and `SFRKV` starts execution.
- Verified that `GET`:
  - maps sharable save files and copies nonsharable save files;
  - updates the entry vector and PDVA list;
  - never loads accumulators.
- Established entry-vector structure: start, reenter, version, and optional
  additional entry information.
- Resolved PDV/PDVA:
  - entry vector and PDVA list are distinct;
  - LINK writes PDVs into program memory;
  - the monitor retains only PDVAs;
  - `PDVOP%` exposes PDVA information.
- Examined virgin and execute-only process constraints.
- Implemented and verified the Small Executive `PUSH` server:
  `GTJFN → CFORK → GET → SFRKV → WFORK → KFORK`.
- Live demonstrations connected the model to normal use:
  `PUSH`/`POP`, EMACS inferiors, `REENTER`, `FINGER`, `SEND`, `ADVISE`,
  and batch submission.

## Chapter 28 — IPCF, QUASAR, and shared file pages

- Established IPCF as asynchronous queued packet exchange.
- Kept IPCF PIDs distinct from relative fork handles.
- `MSEND` enqueues a packet; `MRECV` consumes it.
- Reception may be polled or announced through a software interrupt.
- Distinguished the generic IPCF packet descriptor from subsystem payloads.
- Used the Small Executive `QUEUE` server to communicate with QUASAR.
- Verified:
  - `.OFLAG` is absent from `QSRMAC.UNV` on two independent systems;
  - `.OHDRS` evaluates to octal `5`;
  - `IFNDEF .OFLAG,.OFLAG==.OHDRS-2` is a working compatibility definition;
  - `.MUCRE` requires IPCF or WHEEL capability on the tested system;
  - a locally omitted `MOVEM C,IPCBLK+1` caused an invalid sender PID;
    the line is present in Gorin;
  - Gorin's published `.IPCFD` receive descriptor causes
    `?Error: Invalid message size`;
  - changing it to `.IPCFP` produces correct QUASAR queue output.
- The `.IPCFD`/`.IPCFP` correction is a verified source erratum.
- The Small Executive now anchors COMND, JFNs, process handling, IPCF,
  and QUASAR composition.
- Established two complementary cooperation models:
  - IPCF for arm's-length communication with explicit identity;
  - shared writable file pages for mutually trusting processes.
- Shared-file communication requires both processes to open the same file
  with `OF%RD`, `OF%WR`, and `OF%THW`, then map the same file pages.
- Process virtual page numbers need not match.
- Frozen writable access permits one writer.
- Thawed writable access permits multiple writers only when every writer
  requests `OF%THW`.
- Frozen and thawed writable opens exclude one another.

## Current status

Chapter 28 complete.

Next: Chapter 29, traps and interrupts.

---
