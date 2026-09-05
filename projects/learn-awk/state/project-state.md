# Project state (project-state.md)

## Scope

Learning GNU awk on Ubuntu 24.10 through practical text-processing exercises.

The objective is to develop an accurate mental model of awk rather than merely producing working one-liners.

The project focuses on idiomatic GNU awk unless portability becomes an explicit investigation.

---

## Environment

Verified current environment:

- `awk` resolves to `/usr/bin/gawk`.
- GNU Awk 5.2.1.
- Host locale is `sv_SE.UTF-8`.
- Conversation and project material should remain in English.

---

## Current Objective

Learn awk by incrementally solving realistic text-processing problems.

Current record format:

`datetime<TAB>username<TAB>action<TAB>comment<newline>`

First exercise completed:

Convert timestamps from

`DD/MM/YYYY HH:MM:SS`

to ISO 8601 using the host's local timezone while preserving the remaining tab-separated fields.

---

## Verified Conclusions

- Input records are tab-separated; `FS = OFS = "\t"` provides a simple model for reading and rewriting them.
- The first field contains the timestamp.
- GNU awk's `mktime()` and `strftime()` can perform the timestamp conversion entirely within awk.
- Splitting the input timestamp on `/`, space, and `:` yields the components needed by `mktime()`.
- Passing `-1` as the DST field to `mktime()` lets the host determine daylight-saving status.
- `strftime("%Y-%m-%dT%H:%M:%S%z", timestamp)` supplies the local numeric timezone offset.
- GNU awk's `%z` output such as `+0200` can be transformed to strict ISO 8601 form `+02:00`.
- Replacing `$1` and printing the record preserves the other fields with tab output separators.
- Verified test:
  - input timestamp: `23/07/2026 09:15:30`
  - output timestamp: `2026-07-23T09:15:30+02:00`
  - remaining fields `alice`, `login`, `Successful login` were preserved.

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

The current working program is:

```awk
BEGIN {
    FS = OFS = "\t"
}

{
    split($1, part, /[\/ :]/)

    timestamp = mktime(part[3] " " part[2] " " part[1] " " part[4] " " part[5] " " part[6] " -1")

    iso = strftime("%Y-%m-%dT%H:%M:%S%z", timestamp)
    iso = substr(iso, 1, length(iso) - 2) ":" substr(iso, length(iso) - 1)

    $1 = iso
    print
}
```

---

## Open Questions

- How input errors or malformed timestamps should eventually be handled.
- Best idiomatic organization of larger awk programs.
- When associative arrays become preferable to shell tooling.
- Where awk's practical limits are compared with sed, grep and Perl.
- Portability differences are intentionally deferred unless they become relevant.

---

## Next Experiments

Continue from the verified timestamp exercise into further record processing, preferably introducing awk mechanisms incrementally rather than optimizing the existing solution prematurely.
