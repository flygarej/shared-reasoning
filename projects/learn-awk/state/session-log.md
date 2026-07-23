# Session log (session-log.md)

## Session Purpose

Bootstrap an awk learning project.

---

## Chronology

Initial project direction established.

Goals:

- Learn GNU awk rather than alternative Unix text-processing tools.
- Use practical text-processing tasks as learning exercises.
- Prefer understanding over shortest possible solutions.

First exercise selected:

Convert timestamps from

DD/MM/YYYY HH:MM:SS

to ISO 8601 while preserving the host's local timezone.

An initial solution outline was discussed using:

- FS
- split()
- sprintf()
- mktime()
- strftime()

Future work will build the solution incrementally rather than immediately optimizing it.
