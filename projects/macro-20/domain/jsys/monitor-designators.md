# Monitor Designators

## Status

Documentation-derived candidate generator.

---

## Generator

TOPS-20 monitor calls describe monitor-visible objects through typed
designators.

A designator is not merely a numeric value or memory address.

Its interpretation depends on:

- the designator class;
- the receiving JSYS;
- the context established by that JSYS.

Accepted categories described by the monitor-call reference include:

- words of data;
- memory addresses;
- page numbers;
- section numbers;
- byte pointers;
- file handles and file designators;
- source and destination designators;
- device designators;
- process handles;
- combined process/file handles.

---

## Conceptual Model

```text
program value
    ↓
typed designator convention
    ↓
JSYS-specific interpretation
    ↓
monitor-visible object
```

This provides a compact interface language between user programs and the
monitor.

---

## Source and Destination Abstraction

Some monitor interfaces accept a source or destination designator rather
than one fixed kind of object.

This permits a common operation to work with several classes of endpoint,
such as:

- a file designator;
- a byte pointer or ASCII string;
- a special designator;
- a numeric designator.

The abstraction supports composition across files, terminals, strings,
and other monitor-defined endpoints.

It does not imply that every designator is valid for every operation.

---

## Handles and Identity

A handle is a compact reference to monitor-maintained state.

Examples include:

- JFNs for files;
- process handles for forks;
- process/file combinations where a call must identify both an address
  space and a file-related object.

A handle separates application identity from the monitor's internal
representation.

The exact ownership, visibility, and lifetime of a handle remain
subsystem-specific.

---

## Relationship to Existing Project Knowledge

The accepted JFN model is one instance of this broader designator model.

The accepted process-handle model is another.

The generator connects these without claiming they have identical
ownership or lifecycle rules.

---

## Boundary

Do not treat a designator as interchangeable with:

- a raw address;
- a global identifier;
- a permanent name;
- a universally valid operand.

Exact encoding, scope, and permitted alternatives are local semantics.

Consult the relevant JSYS description whenever the distinction affects
correctness.
