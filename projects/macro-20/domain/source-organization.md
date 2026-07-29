# Source Organization (projects/macro-20/domain/source-organization.md)

## Generator

MACRO-20 source may be organized so that program structure is visible in
both the source text and the assembler listing.

Organizational directives do not change runtime semantics.

They preserve the human-readable structure of the program.

---

## Sections

`SUBTTL` names a major source section.

Accepted uses include separating:

- data definitions;
- top-level control;
- command servers;
- subroutines;
- error handling;
- entry and version information.

Section titles make large listings easier to navigate and preserve the
intended architecture of the source.

---

## Listing Pages

A form-feed may begin a new listing page.

This allows related source material to remain together while major
sections start cleanly in printed or generated listings.

The source file and assembler listing therefore have related but
distinct organization.

---

## Local Structure

Labels, comments, indentation, and nearby definitions should make local
relationships visible.

Accepted examples include:

- keeping storage locations together when a `BLT` depends on their
  contiguity;
- placing command tables near their dispatch logic;
- keeping a record-layout definition together;
- placing constants and helper strings near the routines that use them
  when this improves clarity.

Source order may therefore preserve semantic relationships even when the
assembler does not require that order.

---

## Reference-Program Pattern

The verified Small Executive demonstrates a useful large-program
organization:

```text
title and searches
        ↓
accumulator and macro definitions
        ↓
data storage
        ↓
top-level control and command table
        ↓
command servers
        ↓
error handling and miscellany
        ↓
entry vector and END
```

This is an accepted example, not a required universal layout.

---

## Conceptual Model

```text
Program architecture
        ↓
Source sections
        ↓
Assembler listing structure
        ↓
Human navigation and maintenance
```

Source organization externalizes the program's conceptual structure.

---

## Boundaries

Current project knowledge does **not** establish:

- a mandatory MACRO-20 source layout;
- complete listing-control semantics;
- all effects of `SALL`, `XALL`, and `LALL`;
- standard conventions across all TOPS-20 programs.

Do not infer runtime behaviour from source or listing organization.

---

## Open Questions

- Detailed listing controls and macro-expansion display.
- Common source-layout conventions in larger TOPS-20 programs.
- Entry-vector and version-layout conventions as later chapters expand
  the reference program.

---

## Related Capsules

- `macros.md`
- `records.md`
- `comnd.md`
- `luuos.md`

---

