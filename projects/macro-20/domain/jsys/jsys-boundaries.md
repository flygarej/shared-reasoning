# JSYS Reconstruction Boundaries

## Purpose

Mark where the common JSYS generators no longer establish safe local
semantics.

---

## Reference Manual Boundary

The TOPS-20 Monitor Calls Reference Manual is written for programmers
already familiar with monitor calls.

Its individual entries are concise lookup material.

Therefore:

- an entry may establish exact local semantics;
- it may not explain the conceptual purpose or composition of the
  subsystem;
- absence of explanation is not evidence that no broader relationship
  exists.

Use Gorin, the Monitor Calls User's Guide, verified programs, and project
experiments for conceptual reconstruction.

---

## Common Calling Convention Boundary

The general AC and argument-block convention does not define an
individual JSYS.

Do not infer:

- argument placement;
- block size;
- output locations;
- accumulator preservation;
- flag layout;
- return behavior

without inspecting the call description or accepted project knowledge.

---

## Functional Family Boundary

Two calls in the same family may have different:

- ownership rules;
- access requirements;
- privilege requirements;
- handle lifetimes;
- error conventions;
- blocking behavior;
- side effects.

Family membership supports orientation, not substitution.

---

## Designator Boundary

Designators are typed by context.

Do not infer that:

- all file designators are JFNs;
- all process handles are globally meaningful;
- a source designator is valid as a destination;
- an address and a byte pointer are interchangeable;
- extended-addressing forms work where only local forms are documented.

---

## Version Boundary

The uploaded reference manual documents TOPS-20 Version 7.0 and includes
later revisions through November 1990.

The verified project environment may differ in:

- monitor version;
- installed universal files;
- optional facilities;
- implementation of symbols present in `MONSYM`;
- privilege and capability policy;
- source errata.

When documentation and the live system disagree, preserve both and
perform the smallest discriminating experiment.

---

## Privilege Boundary

The presence of a JSYS in the manual does not imply that an ordinary user
process may successfully invoke it.

Capabilities may be:

- assigned;
- enabled;
- required by a particular operation;
- restricted by access-control policy.

Do not infer privilege from syntax alone.

---

## Cleanup Boundary

Broad operations such as `RESET` do not eliminate the need to understand
normal resource cleanup.

Correct programs should not depend on broad cleanup when local lifecycle
semantics matter.

---

## Promotion Boundary

Documentation-derived material does not enter Project State merely
because it is authoritative documentation.

Promote it when it has been:

- explicitly accepted as current understanding;
- verified through a program or experiment;
- or intentionally retained as a working model.

Until then, keep it as domain knowledge with explicit provenance.
