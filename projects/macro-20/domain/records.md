# Records

## Generator

A record layout is represented by symbolic field offsets rather than absolute addresses.

`PHASE` allows field offsets to be generated automatically while assembling.

`DEPHASE` restores normal location counting.

`.ORG` may reclaim the temporary storage used during layout generation.

## Principle

Compile-time layout descriptions need not occupy runtime memory.

## Boundary

The current model describes record layout generation only.

Record allocation, traversal, and list manipulation are introduced later.

---

