# LUUOs (projects/macro-20/domain/luuos.md)

## Generator

Local Unimplemented User Operations (LUUOs) let a program define
application-specific instructions.

The processor supplies the dispatch mechanism.

Software defines the operation, calling convention, and semantics.

The opcode identifies the local operation.

The resolved effective address supplies the operand or argument location.

---

## Processor Mechanism

When a LUUO executes:

1. the processor calculates the effective address;
2. a normalized instruction image is stored at location `40`;
3. the saved image preserves the opcode and AC fields;
4. the indirect and index fields are cleared;
5. the address field is replaced by the resolved effective address;
6. the processor executes the instruction at location `41` as though
   through `XCT 41`.

Gorin states that location `41` is presumed to contain a subroutine call to
the program's LUUO handler; either `JSR` or `PUSHJ` may be used. Because the
instruction at `41` is executed in the `XCT 41` context, the PC saved by that
subroutine call points to the instruction following the original LUUO.

The processor does not interpret the local opcode beyond invoking this
mechanism.

---

## Software Responsibility

The LUUO handler is responsible for:

- preserving any required accumulator state;
- recovering the opcode, AC field, and effective address;
- validating the local opcode;
- dispatching to the selected operation;
- defining argument conventions;
- performing the operation;
- restoring state;
- returning to the instruction following the LUUO.

The CPU supplies entry.

Software supplies meaning.

---

## Interface Construction

`OPDEF` may assign symbolic instruction-like names to LUUO operations.

Accepted examples from Gorin's worked program include:

- `ERROR`;
- `TTYSTR`;
- `TTYCHR`.

The main program can then use these names as compact application-level
interfaces.

This creates a local instruction vocabulary without changing the
processor's hardware instruction set.

---

## Dispatch Pattern

The accepted handler pattern is:

```text
LUUO executed
      ↓
effective address resolved
      ↓
instruction image saved at 40
      ↓
control transferred through 41
      ↓
handler preserves state
      ↓
opcode decoded
      ↓
software dispatch table
      ↓
selected operation
      ↓
state restored
      ↓
return to following instruction
```

Dispatch tables make the relationship between local opcodes and software
handlers explicit and maintainable.

### Verified minimal PUSHJ pattern

A minimal `HELLO` LUUO was assembled, linked, and run successfully on the
project Panda 7.1 system. The verified entry/return pattern is:

```asm
        OPDEF   HELLO [001000,,0]

        LOC     41
        PUSHJ   P,UUOHND
        RELOC

        ...

START:  ...
        MOVE    P,[IOWD PDLEN,PDLIST]
        HELLO
        ...

UUOHND: ...
        POPJ    P,
```

Observed output proved that the handler ran and that `POPJ P,` resumed at the
instruction following `HELLO`. The saved `assembly-examples/luuo1.mac` is the
canonical minimal executable anchor for this pattern.

Gorin also explicitly permits `JSR` at location `41`, but the project does not
yet have a verified JSR-style handler pattern. An attempted JSR variant returned
to the continuation without executing the intended handler body. Do not infer
the exact JSR handler layout from generic JSR knowledge; revisit it against the
source material.

---

## Invariants

- Effective-address calculation occurs before handler entry.
- The processor does not define the local operation's semantics.
- The processor does not automatically save accumulators for the handler.
- The handler receives a normalized instruction image rather than the
  original unresolved addressing fields.
- Software defines the calling convention.
- Return must continue with the instruction following the LUUO.

---

## Cost Model

LUUOs are more expensive than ordinary subroutine calls.

They should normally justify their overhead by providing a substantial
operation or a useful application-level interface.

Their value is architectural and organisational, not raw execution speed.

---

## Relationship to Subroutines

A subroutine call transfers control directly according to a calling
convention.

A LUUO presents an instruction-like interface and reaches software
through the processor's local-opcode dispatch mechanism.

Both may ultimately execute ordinary software.

They differ in how the interface is encoded and entered.

---

## Relationship to Monitor Calls

LUUOs are local, program-defined operations.

TOPS-20 JSYS calls invoke monitor services.

Do not equate the two merely because both can look instruction-like at
the source level.

---

## Conceptual Model

```text
Application instruction vocabulary
              ↓
            OPDEF
              ↓
          Local opcode
              ↓
      Processor LUUO mechanism
              ↓
       Software dispatcher
              ↓
      Application-defined semantics
```

The processor creates the doorway.

The program decides what lies behind it.

---

## Boundaries

Current project knowledge does **not** establish:

- a universal LUUO calling convention;
- typical opcode allocation conventions across real programs;
- every handler save/restore pattern;
- interaction with later asynchronous facilities;
- whether later Gorin chapters introduce stronger design conventions.

Do not infer TOPS-20 monitor-call semantics from the LUUO model.

Do not assume the processor preserves application state beyond the
documented dispatch mechanism.

---

## Open Questions

- Common argument conventions used by real MACRO-20 programs.
- Common patterns for allocating local opcodes.
- Further design lessons from Gorin's complete worked example.
- Interaction with traps, pseudo-interrupts, or process facilities if
  later documentation connects them.

---

## Related Capsules

- `addressing.md`
- `instruction-families.md`
- `macros.md`
- `source-organization.md`
- `anchors.md`

---

