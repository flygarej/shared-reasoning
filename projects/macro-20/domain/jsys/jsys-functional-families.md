# JSYS Functional Families

## Status

Documentation-derived candidate conceptual map.

---

## Generator

Individual JSYSes are best understood as members of monitor subsystems
rather than as an alphabetical list of unrelated operations.

The monitor-call reference manual itself separates functional
organization from alphabetical lookup.

This suggests two complementary views:

```text
functional family → conceptual reconstruction
alphabetical entry → exact local lookup
```

---

## Candidate Families

### File naming, access, and metadata

Responsibilities include:

- parsing or acquiring file specifications;
- obtaining and releasing JFNs;
- establishing access;
- reading and changing file attributes;
- iterating wildcard references;
- closing, renaming, and deleting files.

Existing project capsules already cover much of this family.

---

### Data transfer and conversion

Responsibilities include:

- byte and string input/output;
- block or dump transfer;
- numeric conversion;
- date and time conversion;
- formatted input and output.

These calls often compose with source/destination designators.

---

### Devices and terminals

Responsibilities include:

- device characterization;
- terminal modes and characteristics;
- input/output buffering;
- terminal linking and advising;
- device-specific control operations.

The common file interface does not eliminate device-specific semantics.

---

### Processes and scheduling

Responsibilities include:

- constructing processes;
- installing images;
- starting, stopping, waiting for, and terminating forks;
- reading and changing process state;
- scheduling and runtime control.

Existing process capsules provide the accepted high-level model.

---

### Memory, pages, and save files

Responsibilities include:

- mapping pages;
- querying and changing access;
- save-file construction and loading;
- entry vectors and PDV-related structures;
- working-set and mapping control.

---

### Software interrupts, traps, and asynchronous control

Responsibilities include:

- establishing interrupt tables;
- assigning and activating channels;
- terminal interrupts;
- dismissing interrupts;
- software traps and later asynchronous facilities.

This family is directly relevant to the project's next phase.

---

### IPCF and subsystem protocols

Responsibilities include:

- acquiring IPCF identities;
- sending and receiving packets;
- querying IPCF services;
- layering protocols such as QUASAR over packet payloads.

Existing IPCF knowledge remains authoritative where already accepted.

---

### Capabilities, access, and privilege

Responsibilities include:

- reading and enabling process capabilities;
- access checking;
- privileged monitor operations;
- execute-only restrictions;
- system-management interfaces.

Capability possession and capability activation are distinct concepts
where documented.

---

### Synchronization and queues

Responsibilities include:

- enqueue and dequeue operations;
- waiting and wakeup;
- timers;
- interprocess coordination independent of IPCF payload exchange.

This family should be refined only when the project uses it.

---

### System information and administration

Responsibilities include:

- system tables;
- job, user, device, and system information;
- accounting;
- logical names;
- configuration and privileged administration.

These calls often require stronger privilege boundaries than ordinary
application calls.

---

## Boundary

Membership in one family does not establish a uniform call grammar.

Families support conceptual reconstruction.

Individual entries establish:

- exact arguments;
- flags;
- return paths;
- privilege requirements;
- version restrictions;
- side effects.

Do not infer local semantics merely because two JSYSes serve neighboring
functions.
