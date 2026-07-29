# Records (projects/macro-20/domain/records.md)

## Generator

Records provide symbolic structure for heterogeneous data stored in
ordinary PDP-10 memory.

A record describes the relationship between fields.

It does not create a new runtime object.

---

## Layout Generation

Record layout is constructed during assembly.

Accepted mechanisms include:

- `PHASE`
- `.ORG`
- `DEPHASE`

These allow symbolic field offsets to be generated without allocating
storage.

The generated offsets may later be applied to any compatible record
instance.

---

## Symbolic Fields

Fields are accessed symbolically rather than by numeric offsets.

The assembler performs the offset calculation.

Programs therefore express:

- field identity;
- record structure;

instead of embedding literal addresses.

---

## Record Instances

A record definition may describe many independent instances.

Each instance shares one layout while occupying different storage.

Conceptually:

```text
Record definition
        ↓
Field offsets
        ↓
Instance base address
        ↓
Effective address
        ↓
Field
```

The layout is constant.

Only the instance base changes.

---

## Relationship to Arrays

Records organize heterogeneous fields.

Arrays organize homogeneous elements.

A program frequently combines both:

- arrays of records;
- records containing arrays.

The two abstractions are complementary.

---

## Relationship to Addressing

Record access is ultimately ordinary effective-address calculation.

The record definition contributes the field offset.

The current instance contributes the base address.

The addressing mechanism computes the final effective address.

---

## Conceptual Model

```text
Record layout
      ↓
Symbolic field
      ↓
Field offset
      ↓
Instance base
      ↓
Effective address
      ↓
Memory
```

Records generate structure rather than storage.

---

## Boundaries

Current project knowledge does **not** establish:

- variable-length record layouts;
- compiler-generated record descriptors;
- runtime type information;
- automatic alignment or padding rules.

Do not infer higher-level language record semantics from the assembly
model.

---

## Open Questions

- Common TOPS-20 library conventions for record layouts.
- Typical use of records together with dynamically allocated storage.
- Additional assembler facilities related to symbolic layout.

---

## Related Capsules

- `addressing.md`
- `arrays.md`
- `program-memory.md`
- `macros.md`
- `anchors.md`

---

