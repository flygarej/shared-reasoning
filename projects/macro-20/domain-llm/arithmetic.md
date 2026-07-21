# Arithmetic (arithmetic.md)

## Fixed point

### Width model

Single-word
Double-word
Quad-word

Arithmetic instructions expand naturally with operand width.

## Multiplication

IMUL
    one-word result

MUL
    double-word result

DMUL
    quadruple-word result

## Division

Division produces two outputs:

- quotient
- remainder

Known asymmetry

IDIVM and DIVM require verification of remainder handling.

## Floating point

Representation

Single precision
Double precision

Instruction grammar

F/DF
+
operation
+
optional rounding
+
destination variant

Conversions

FIX
FIXR
FLTR
FSC

Open questions

- Verify exact floating-point bit layout.
- Verify complete floating instruction matrix.
