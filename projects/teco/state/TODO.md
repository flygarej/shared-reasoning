# TODO (teco/TODO.md)

## Purpose

Record planned investigations, maintenance tasks, and deferred work.

Unlike Project State, this file contains **intentions rather than
accepted knowledge**.

Completed items should normally result in updates to:

- project-state.md;
- session-log.md;
- domain capsules;
- semantic anchors;
- reasoning constraints;

before being removed from this file.

---

## Current Tasks

### Repository

- [ ] Populate `session-log.md` from significant historical work.

### Documentation

- [ ] Continue reviewing TECOC implementation documentation.
- [ ] Continue reviewing TECO-64 command documentation.

### Open investigations

- [ ] Verify composed "`<= 0`" conditional idiom in TECOC.
- [ ] Resolve TECOC search case-sensitivity.
- [ ] Continue mapping command producer/consumer relationships.
- [ ] Continue investigation of TECO EMACS runtime structures.
- [ ] Continue MIDAS TECO capability fingerprinting against TOPS-20 TECO and TECOC.
- [ ] Determine whether `@emacs\:teco` performs implicit bootstrap loading before the interactive prompt.
- [ ] Determine the meaning/representation of large negative `Qq` values for text-valued MIDAS TECO Q-registers.
- [ ] Test MIDAS TECO macro numeric-argument passing and additional execution-context behaviour.

---

This file is intentionally lightweight.

Project direction belongs in `project-state.md`.
Historical reasoning belongs in `session-log.md`.

---

