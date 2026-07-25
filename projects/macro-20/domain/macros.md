# Macros

## Generator

Macros transform assembly source into assembly source during assembly.

They do not execute at program runtime.

## Structure

- `DEFINE name <body>`
- `DEFINE name(parameters) <body>`

Actual arguments are substituted into the macro body, and the expanded source is then assembled normally.

## Conditional assembly

Conditional assembly compares an expression with zero and either includes or omits enclosed source.

It reuses the JUMP/SKIP relation vocabulary.

`IFNDEF` may provide a default definition for a symbol that is otherwise undefined.

## Observed pattern

Macros may encode a relationship once and generate multiple consistent representations.

Gorin's `OPMAC`/`XX` example:

- stores operator/instruction pairs once;
- defines `XX` to select the character and emits `OPTAB`;
- redefines `XX` to select the instruction and emits `OPINS`;
- the completed program executes the selected instruction through `XCT`.

This is one demonstrated use, not the defining purpose of all macros.

## Boundaries and open questions

Angle brackets delimit and protect macro text, including arguments containing commas.

Not yet established:

- exact nested-delimiter rules;
- quoting;
- rescanning;
- expansion order;
- redefinition details.

Revisit the macro processor when later examples require these semantics.
