# Macros (macros.md)

## Generator

Macros transform assembly source into assembly source during assembly.

They do not execute at run time.

### Observed pattern: 
A macro can encode one relationship and emit multiple synchronized representations by redefining a helper macro.

## Structure

DEFINE name <body>

DEFINE name(parameters) <body>

## Conditional assembly

IF relation(expression,0)

↓

assemble enclosed source

or

omit enclosed source

IFNDEF provides default symbol definitions when a symbol has not already been defined.

## Open Questions

- Exact macro expansion semantics.
- Nested delimiter handling.
- Argument rescanning and expansion order.
- Redefinition rules.

---

