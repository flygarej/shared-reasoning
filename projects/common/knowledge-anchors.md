# Semantic Anchors (common/knowledge-anchors.md)

## Purpose

Generators reconstruct conceptual models.

They intentionally compress knowledge.

Compression introduces the possibility of inference drift when several
plausible interpretations exist.

Semantic anchors constrain reconstruction by preserving a minimal set of
load-bearing facts.

Anchors complement generators.

They do not replace them.

---

## Characteristics

An anchor should:

- represent a semantically important distinction;
- prevent a known or plausible inference drift;
- be substantially smaller than the documentation it replaces;
- support multiple future reasoning tasks.

Anchors are not reference documentation.

If a fact does not constrain reasoning, it should usually remain in
documentation.

---

## Sources

Anchors may originate from:

- verified experiments;
- accepted project conclusions;
- authoritative documentation;
- repeated inference failures.

The preferred order is the same as for project knowledge.

---

## Selection Criteria

A candidate anchor should answer "yes" to most of the following.

- Would removing it likely increase inference errors?
- Does it constrain more than one possible mistake?
- Does it represent a semantic distinction rather than syntax?
- Can it be expressed much more compactly than its documentation?

---

## Types

### Semantic anchors

Preserve the exact meaning of concepts.

Example:

SETOM stores -1 into memory.

---

### Structural anchors

Preserve structural relationships.

Example:

COMND returns the FDB actually used in RH(AC3).

---

### Behavioral anchors

Preserve invariants.

Example:

COUNT DOWN implies UDFLAG < 0.

---

## Relationship to generators

Generators explain how a conceptual mechanism operates.

Anchors preserve the minimum semantic facts needed to prevent nearby
incorrect reconstructions.

Generators maximize reconstruction.

Anchors minimize drift.

Both are necessary.

---

## Evolution

Anchors should usually be discovered.

Do not create anchors preemptively.

Instead:

1. Observe successful reasoning.
2. Observe failures or ambiguity.
3. Identify the smallest missing semantic constraint.
4. Add that constraint as an anchor.
5. Re-evaluate whether it continues to provide value.

Unused anchors should be removed.

The objective is the smallest accepted anchor set that reliably supports
the generators.
