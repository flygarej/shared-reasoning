# JSYS Domain Mining Pack

This pack contains a compact JSYS index and detailed candidate domain
capsules mined from the TOPS-20 Monitor Calls Reference Manual.

## Purpose

This file is intended for repository maintenance and restructuring.

It is not part of the normal startup context and should only be retrieved when modifying or reviewing the organization of this deferred domain.


## Recommended repository layout

```text
projects/macro-20/domain/jsys.md
projects/macro-20/domain/jsys/
    jsys-interface.md
    monitor-designators.md
    monitor-resource-lifecycles.md
    jsys-return-model.md
    jsys-functional-families.md
    jsys-anchors.md
    reset.md
    jsys-boundaries.md
```

Include `domain/jsys.md` in the generated `macro-20.md` prompt.

Keep the files under `domain/jsys/` out of the default concatenation if
the prompt builder supports selective inclusion. Load them on demand.

The detailed capsules are documentation-derived candidate domain
knowledge, not automatic Project-State promotions.
