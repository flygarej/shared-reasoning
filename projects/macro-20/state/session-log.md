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


