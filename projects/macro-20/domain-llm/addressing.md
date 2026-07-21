# Addressing

Instruction fields: opcode, AC, I, X, Y.

Effective address is always computed first.

Rules: 1. X=0,I=0 =\> EA=Y. 2. X!=0 =\> EA=AC\[X\]+Y. 3. I=1 =\>
recursively resolve until I=0.

Immediate instructions use the address field itself.

Current JSYS model: arguments usually in AC1-AC4; HRROI builds a byte
pointer for PSOUT.

## Boundary

Effective address is computed before instruction execution.

Instructions that modify values involved in their own effective address calculation produce undefined or unpredictable behaviour.

Verified example:

- BLT must not use its own accumulator as an index register because BLT updates that accumulator while executing.
