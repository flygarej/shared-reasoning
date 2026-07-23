# Memory Operations (memory-operations.md)

## BLT

Principle

The BLT accumulator contains the moving source and destination addresses.

Generator

The accumulator is updated during execution.

Consequences

- BLT modifies its own accumulator.
- Never use that accumulator during EA calculation.
- Copy proceeds from low addresses upward.
- If BLT overwrites its own accumulator, that must be the final destination.
- If BLT overwrites the BLT instruction, that must be the final destination.

Boundary

Overlapping copies require careful ordering because BLT copies upward.
