# Arithmetic

## Fixed-point width model

Arithmetic scales through:

- one word;
- doubleword;
- four-word quantities.

## Multiplication

- `IMUL` keeps a one-word result and assumes the useful product fits.
- `MUL` produces the full doubleword product in `AC,AC+1`.
- `DMUL` multiplies doubleword operands and produces a four-word result.

## Division

Division naturally produces two outputs:

- quotient;
- remainder.

Placement:

- quotient begins in `AC`;
- remainder follows in `AC+1` for the documented AC-result forms.

## Boundary

The memory forms are not fully predicted by the ordinary destination grammar.

Open:

- exact `IDIVM` remainder behavior;
- exact `DIVM` remainder behavior.

## Doubleword moves

Selected doubleword MOVE operations transfer or negate consecutive word pairs rather than generating the complete single-word MOVE matrix.

## Floating point

Single precision uses one word.

Double precision uses two words, extending the fraction into the second word.

The photographed/transcribed chapter description left an apparent bit-position overlap, so exact field boundaries remain unaccepted pending verification.

## Floating instruction generator

Single precision:

`F` + operation + optional rounding + destination form

Double precision:

`DF` + operation

Operations:

- add;
- subtract;
- multiply;
- divide.

## Conversion and scaling

- `FIX`: floating to fixed without rounding.
- `FIXR`: floating to fixed with rounding.
- `FLTR`: fixed to floating with rounding.
- `FSC`: adjust the exponent by `E` and normalize.
