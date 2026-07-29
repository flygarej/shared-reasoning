# Macros (projects/macro-20/domain/macros.md)

## Generator

MACRO-20 macros transform assembly source into assembly source during
assembly.

They do not execute at program runtime.

A macro packages a source-generation rule so that one accepted
relationship can produce many consistent pieces of assembled code or
data.

---

## Definition and Expansion

Accepted forms include:

```asm
DEFINE NAME <BODY>
```

and:

```asm
DEFINE NAME (ARGUMENTS) <BODY>
```

When the macro is invoked:

1. actual arguments are associated with formal parameters;
2. the macro body is expanded;
3. the resulting source is assembled normally.

The expansion is therefore part of assembly-time source construction,
not a runtime call.

---

## Parameters

Macro parameters allow one source pattern to be reused with different
values or source fragments.

Angle brackets delimit macro text and protect arguments that contain
characters such as commas.

The current project model establishes substitution at a conceptual level.

It does not yet establish the complete rescan, quoting, or nested
delimiter semantics of the macro processor.

---

## Conditional Assembly

Conditional assembly selects whether source is included during assembly.

Accepted relation tests include:

- greater;
- greater or equal;
- equal;
- not equal;
- less;
- less or equal.

These reuse the same relation vocabulary found in runtime JUMP and SKIP
families.

The relation keeps its meaning.

The controlled action changes from runtime control flow to assembly-time
source inclusion.

`IFNDEF` may provide a default definition when a symbol has not already
been defined.

---

## Relationship Generation

A macro may preserve one relationship and emit several synchronized
representations.

Gorin's accepted `OPMAC` / `XX` pattern demonstrates this:

1. operator and instruction pairs are written once;
2. `XX` is defined to emit the operator representation;
3. the relationship is expanded to generate `OPTAB`;
4. `XX` is redefined to emit the instruction representation;
5. the same relationship is expanded to generate `OPINS`;
6. the selected instruction is later executed through `XCT`.

This avoids maintaining parallel tables independently.

The general generator is:

```text
One accepted relationship
          ↓
Different macro interpretations
          ↓
Several synchronized artefacts
```

This is one powerful use of macros, not the defining purpose of every
macro.

---

## Interface Construction

Macros may also hide repeated source-level protocol.

Accepted examples include:

- `CALL` and `RET` operation definitions;
- COMND helpers such as `NOISE` and `CONFIRM`;
- table-construction helpers such as `TBL`;
- symbolic instruction interfaces created with `OPDEF`.

The value of such macros is not merely shorter source.

They preserve a repeated structural rule in one place.

---

## Conceptual Model

```text
Source relationship
        ↓
Macro definition
        ↓
Invocation and substitution
        ↓
Generated source
        ↓
Normal assembly
```

Macros generate source structure.

The assembler then interprets the generated source exactly as though it
had been written directly.

---

## Boundaries

Current project knowledge does **not** establish:

- exact nested-angle-bracket rules;
- quoting rules;
- complete rescanning behaviour;
- expansion order in complex nested macros;
- redefinition semantics in all cases;
- the exact boundary between textual substitution and assembler
  expression evaluation.

Do not infer these local semantics from the high-level source-generation
model.

---

## Open Questions

- Nested delimiters.
- Argument substitution details.
- Rescanning.
- Macro redefinition.
- Expansion order.
- Emitted-source inspection and listing behaviour.

---

## Related Capsules

- `instruction-families.md`
- `source-organization.md`
- `luuos.md`
- `comnd.md`
- `anchors.md`
