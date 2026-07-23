# Project state (project-state.md)

## Scope

Learning GNU awk on Ubuntu 24.10 through practical text-processing exercises.

The objective is to develop an accurate mental model of awk rather than merely producing working one-liners.

The project focuses on idiomatic GNU awk unless portability becomes an explicit investigation.

---

## Current Objective

Learn awk by incrementally solving realistic text-processing problems.

Current exercise:

Convert timestamps from

DD/MM/YYYY HH:MM:SS

to ISO 8601 using the host's local timezone.

---

## Verified Conclusions

- GNU awk provides built-in date/time functions including `mktime()` and `strftime()`.
- The current exercise can be solved entirely within awk without invoking external programs.
- Input records are tab-separated.
- The first field contains the timestamp.
- Timestamp conversion is an appropriate first exercise because it touches field handling, string parsing, formatting and date/time functions.

---

## Working Model

Learning should proceed from simple mechanisms toward complete solutions.

Prefer understanding:

- field splitting
- string manipulation
- built-in functions
- record modification
- output formatting

before optimization or compact one-liners.

---

## Open Questions

- Exact input timestamp variations.
- Best idiomatic organization of larger awk programs.
- When associative arrays become preferable to shell tooling.
- Where awk's practical limits are compared with sed, grep and Perl.

---

## Next Experiments

1. Parse fields using FS.
2. Parse the timestamp.
3. Rearrange date components.
4. Convert via `mktime()`.
5. Format with `strftime()`.
6. Produce strict ISO 8601 timezone formatting.
