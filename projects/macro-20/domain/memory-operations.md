# Memory Operations

## BLT generator

The `BLT` accumulator is the moving state of the copy operation:

- left half: current source address;
- right half: current destination address.

The accumulator is updated as words are copied.

## Consequences

- `BLT` modifies its accumulator.
- The `BLT` accumulator cannot be used as its own index register.
- Anything used in the instruction's effective-address calculation must remain stable.
- Copy order is from low source addresses upward.
- Overlapping copies must account for that direction.
- If the destination overwrites the `BLT` accumulator, it must be the final destination.
- If the destination overwrites the `BLT` instruction, it must be the final destination.

## Boundary

`BLT` is not automatically overlap-safe in the general sense of a direction-selecting move operation.
