# JSYS Return and Error Model

## Status

Documentation-derived candidate generator.

---

## Generator

A monitor call's interface includes both:

- the data exchanged with the monitor;
- the path through which control returns.

The reference manual describes return behavior using forms such as:

```text
RETURNS +1: condition
        +2: condition
```

`+1` refers to the instruction immediately following the call.

`+2` refers to the second instruction following the call.

The meaning of each path is defined by the individual monitor call.

---

## Conceptual Model

```text
JSYS invocation
      ↓
monitor operation
      ↓
return condition selected
      ↓
+1 path or +2 path
      ↓
caller handles outcome
```

A call description is incomplete if it records only arguments and ignores
return control.

---

## Error Handling

Monitor calls may interact with error-handling forms such as `ERJMP` and
`ERCAL`.

The existence of those mechanisms does not establish their exact
applicability to every call.

The caller must know:

- which outcomes use normal return paths;
- which outcomes are monitor errors;
- which information is returned in accumulators;
- whether an error handler is expected;
- what state may already have changed when an error is reported.

---

## Two-return Calls

A two-return convention often permits the monitor to select between two
caller-supplied continuations.

Do not globally equate:

- `+1` with failure;
- `+2` with success.

That relationship is common but must be established by the local JSYS
description.

---

## Unimplemented Calls

The presence of a symbol in `MONSYM` does not prove that the call is
implemented by the target monitor.

The reference manual states that an unimplemented monitor call causes an
illegal-instruction interrupt unless followed by an applicable `ERJMP` or
`ERCAL`, in which case the error path is taken.

This is a semantic anchor, not a general invitation to probe undefined
calls casually.

---

## Boundaries

This generator does not establish:

- which return path means success for a particular call;
- the exact error code location;
- rollback or partial-completion behavior;
- preserved accumulators;
- interrupt interactions;
- whether a call can produce multiple classes of nonfatal result.

Exact return semantics remain local.
