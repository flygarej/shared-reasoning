# Addressing

## Invariant

Effective address calculation occurs before instruction semantics.

## Instruction structure

Normal instructions contain:

- opcode;
- accumulator field;
- indirect bit `I`;
- index field `X`;
- address field `Y`.

## Effective-address generator

- `X=0, I=0` → `EA=Y`
- `X≠0` → add the selected accumulator to `Y`
- `I=1` → fetch an indirect word and repeat until `I=0`

Indirection is therefore recursive, not restricted to one level.

## Immediate operands

Immediate forms use the resolved address value rather than fetching `C(E)`.

Example:

- `MOVEI AC,E` loads `0,,E`.

## JSYS calling convention

Current introductory model:

- low accumulators, normally AC1–AC4, carry JSYS arguments;
- `PSOUT` receives a byte pointer in AC1;
- `HRROI` constructs the common pointer form used in the first example.

## Boundary: effective-address stability

An instruction must not unpredictably change values needed for its own effective-address calculation.

Verified example:

- `BLT` updates its accumulator while executing;
- that accumulator must never also serve as the `BLT` index register.

## Open questions

- Byte-pointer bit structure.
- Architectural relationship between accumulators and low memory.
