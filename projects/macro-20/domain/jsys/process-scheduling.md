# Process Scheduling and Execution Family

## Purpose

This capsule provides the conceptual reconstruction needed for monitor
calls that create, schedule, synchronize, and terminate execution within
TOPS-20.

It is intended for selective retrieval when work enters process control,
fork execution, scheduling, runtime state, or asynchronous execution.

This capsule is documentation-derived candidate domain knowledge.

It is not automatically part of Project State.

---

## Generator

Execution management is best understood as lifecycle management of
processes and forks rather than as individual monitor calls.

The monitor separates:

- creation;
- initialization;
- execution;
- waiting;
- interruption;
- termination;
- resource recovery.

Most scheduling-related JSYSes participate in one stage of this lifecycle.

---

## Conceptual Model

```text
construct process/fork
        ↓
establish execution environment
        ↓
start execution
        ↓
running
        ↓
wait / synchronize / interrupt
        ↓
terminate
        ↓
resource cleanup
```

Individual monitor calls implement transitions within this model.

---

## Retrieval Triggers

Retrieve this capsule when questions involve:

- forks;
- process execution;
- scheduling;
- waiting;
- runtime control;
- software interrupts affecting execution;
- process state;
- synchronization.

Typical questions:

- "How do I start another fork?"
- "How does HALTF differ from KFORK?"
- "How do I wait for another process?"
- "Which JSYS creates a new execution context?"

---

## Observed Relationships

Typical execution lifecycle:

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

Higher-level services compose these mechanisms rather than replacing
them.

Examples include the Small Executive PUSH command.

---

## Representative JSYSes

Examples include (not exhaustive):

- CFORK   Construct inferior process.
- GET     Install executable image.
- PMAP    Construct address space.
- SFRKV   Start execution through an entry-vector offset.
- SFORK   Start or continue a process in a single section.
- WFORK   Wait for process state.
- KFORK   Terminate process.
- RFORK   Read process state.
- HALTF   Suspend execution.
- RUNTM   Obtain processor runtime.

Additional calls belong here where documentation places them.

---

## Known Boundaries

This capsule provides conceptual reconstruction.

Do not infer:

- accumulator layouts;
- flag encodings;
- privilege requirements;
- exact return paths;
- version-specific behaviour.

Those require the documentation.

---

## Reference Mapping

Primary source:

TOPS-20 Monitor Calls Reference Manual

Retrieve the corresponding reference fragment for this family if available; 
otherwise retrieve the relevant sections from 
projects/macro-20/references/JSYS_REFERENCE.MEM.txt.

---

## Fallback

If the required monitor call is not covered here, retrieve the
corresponding section from:

projects/macro-20/references/JSYS_REFERENCE.MEM.txt

Inspect only the relevant monitor calls and nearby explanatory material.

Treat retrieved information as documentation-derived candidate knowledge.

Distil only reusable conceptual insights into generators,
anchors or project state.

