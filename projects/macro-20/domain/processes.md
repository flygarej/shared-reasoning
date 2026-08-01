# Processes (projects/macro-20/domain/processes.md)

## Generator

A TOPS-20 process or fork is an independently scheduled execution
environment.

A JOB organizes a hierarchy of processes.

The process and the program image it executes are distinct.

TOPS-20 therefore constructs, populates, and starts a process through
separate mechanisms.

---

## Process Components

Each process has its own virtual address space, accumulators, program
counter, and execution state.

A process may exist before a program image has been installed or before
execution has begun.

---

## JOB Hierarchy

A JOB contains a hierarchy of superior and inferior processes.

The usual interactive JOB has an EXEC at the top level. Programs such as
EMACS, Lisp systems, pushed EXECs, and application programs may occupy
inferior processes.

TOPS-20 schedules processes rather than whole JOBs.

---

## Fork Handles

A relative fork handle is meaningful within the superior that receives it.

Different superiors may receive the same numeric handle for different
inferiors.

Predefined handles express structural relationships:

- `.FHSLF` — current process;
- `.FHSUP` — immediate superior;
- `.FHTOP` — top-level process;
- `.FHSAI` — current process and all inferiors;
- `.FHINF` — all inferiors;
- `.FHJOB` — all processes in the JOB.

---

## Process Construction

`CFORK` creates an inferior process.

Accepted construction choices include:

- `CR%MAP` — share the superior's map;
- `CR%CAP` — copy capabilities;
- `CR%ACS` — initialize accumulators from a supplied block;
- `CR%ST` — supply a PC and start immediately.

Without `CR%MAP`, the process initially has no mapped pages.

Without `CR%ACS`, its accumulators are zero.

Without `CR%ST`, it is not started.

`CR%MAP` shares pages rather than copying them.

---

## Program Image Installation

`GET` copies or maps a save file into an existing process.

Sharable files are mapped.

Nonsharable files are copied.

`GET` updates the entry vector and PDVA list.

`GET` never loads accumulators.

---

## Entry Vector

The accepted initial entry-vector words are:

1. program start instruction;
2. program reenter instruction;
3. program version word.

Additional words may contain entry-specific data.

`SFRKV` starts a process through an offset in the entry vector.

---

## Program Data Vectors

LINK writes Program Data Vectors into program memory.

The monitor retains Program Data Vector Addresses rather than complete
PDVs.

Other programs may obtain PDVAs through `PDVOP%` and then inspect the
program-owned metadata.

The entry vector and PDVA list are distinct save-file structures.

---

## Execution Lifecycle

```text
CFORK
   ↓
GET and/or PMAP
   ↓
SFRKV
   ↓
execution
   ↓
WFORK
   ↓
KFORK
```

Higher-level facilities such as `PUSH` and `CRJOB` compose these
mechanisms.

---

## Virgin and Execute-Only Processes

A new JOB's top-level process is virgin.

An execute-only file may be mapped only into a virgin process.

A process may also become execute-only by sharing the map of an
execute-only superior.

The detailed security rationale remains incomplete.

---

## Boundaries

Current project knowledge does **not** establish:

- complete capability semantics;
- every execute-only restriction;
- exact JOB/FORK/JFN ownership;
- all process-state manipulation JSYSes;
- scheduler policy.

Do not treat relative fork handles as global PIDs.

Do not assume `GET` initializes accumulators.

Do not collapse JOB, process, and executable image into one object.

---

## Open Questions

- Exact JOB/FORK/JFN ownership.
- Detailed capability inheritance and enabling.
- Complete execute-only restrictions.
- Interaction with traps, PSI, and asynchronous control transfer.

---

## Related Capsules

- `program-memory.md`
- `files-and-jfns.md`
- `ipcf.md`
- `comnd.md`
- `anchors.md`

---
