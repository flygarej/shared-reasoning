# BLT (projects/macro-20/domain/blt.md)

## Generator

`BLT` performs bulk transfer over a contiguous region of memory.

It treats memory as a sequence of words rather than as individual
variables.

The instruction preserves the relationship between source and destination
while advancing through both regions automatically.

---

## Contiguous Memory

`BLT` operates on contiguous PDP-10 words.

Typical uses include:

- copying arrays;
- initializing storage;
- moving records;
- clearing work areas.

The data being copied is interpreted only by the surrounding program.

`BLT` copies words.

---

## Address Progression

The instruction establishes its effective source and destination
addresses before transfer begins.

Transfer then proceeds sequentially through memory.

This explains why effective-address calculation belongs to the
addressing generator rather than to `BLT` itself.

---

## Relationship Preservation

`BLT` preserves spatial relationships within the copied region.

If two fields are adjacent before the transfer, they remain adjacent
after the transfer.

The operation therefore preserves structure as well as contents.

---

## Source Organization

Programs sometimes place related storage definitions contiguously because
they are intended to be initialized or copied by a single `BLT`.

Source order may therefore express runtime relationships.

---

## Relationship to Other Generators

- `program-memory.md` explains the address space.
- `addressing.md` explains effective-address calculation.
- `arrays.md` explains contiguous collections.
- `records.md` explains symbolic layouts.

`BLT` provides an efficient operation over those structures.

---

## Conceptual Model

```text
Contiguous memory region
          ↓
Source / destination pair
          ↓
Sequential word transfer
          ↓
Equivalent contiguous region
```

The operation copies layout and contents together.

---

## Boundaries

Current project knowledge does **not** establish:

- optimal overlap strategies;
- interruptibility during long transfers;
- microarchitectural implementation;
- every corner case involving self-overlapping regions.

Do not infer byte-oriented behaviour from the word-transfer model.

---

## Open Questions

- Exact overlap semantics.
- Performance characteristics on different PDP-10 implementations.
- Typical monitor and library uses beyond the accepted examples.

---

## Related Capsules

- `addressing.md`
- `arrays.md`
- `records.md`
- `program-memory.md`
- `anchors.md`

---

