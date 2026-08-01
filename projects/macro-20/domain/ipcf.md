# IPCF (projects/macro-20/domain/ipcf.md)

## Generator

The InterProcess Communication Facility exchanges queued message packets
between cooperating processes.

IPCF is asynchronous.

The sender places a packet in the receiver's input queue.

The receiver consumes it later.

---

## IPCF Identity

Each participating process uses a system-assigned IPCF Process Identifier.

An IPCF PID is distinct from a JOB number, terminal number, relative fork
handle, or JFN.

---

## Message Flow

```text
sender
  ↓ MSEND
receiver input queue
  ↓ MRECV
receiver
```

The sender and receiver do not execute in lockstep.

---

## Reception

A receiver may poll with `MRECV` or request a software interrupt when a
packet arrives.

Notification does not replace `MRECV`; it announces queued input.

---

## Packet Descriptor

Accepted fields include:

- `.IPCFL` — flags;
- `.IPCFS` — sender PID;
- `.IPCFR` — receiver PID;
- `.IPCFP` — message length,,message address;
- `.IPCFD` — sender user number;
- `.IPCFC` — sender capabilities;
- `.IPCSD` — sender connected directory;
- `.IPCAS` — sender account-string pointer;
- `.IPCLL` — sender node-name pointer.

The monitor supplies sender context for received packets.

---

## Arm's-Length Cooperation

IPCF supports cooperation between processes that need not fully trust one
another.

Routing and sender context are explicit.

Applications and subsystems still define the payload protocol.

The generic IPCF envelope must be kept distinct from subsystem-specific
message layouts.

---

## QUASAR Example

The verified Small Executive `QUEUE` command:

1. obtains QUASAR's PID;
2. creates its own IPCF PID;
3. sends a list-queues request;
4. receives one or more replies;
5. rejects non-QUASAR senders;
6. outputs returned text;
7. tests `WT.MOR` for further packets.

---

## Verified Implementation Corrections

Some `QSRMAC.UNV` files omit `.OFLAG`.

Verified compatibility definition:

```asm
IFNDEF .OFLAG,.OFLAG==.OHDRS-2
```

For `MRECV`, the receive length and address belong in `.IPCFP`.

Gorin's published `.IPCFD` form produced:

`?Error: Invalid message size`

Changing it to `.IPCFP` produced correct QUASAR output.

On the tested system, `.MUCRE` requires IPCF or WHEEL capability.

---

## Shared File Pages

Processes in independent JOBs that trust one another may communicate
through shared file pages.

Each process:

- agrees on the file;
- has read and write permission;
- opens it with `OF%RD`, `OF%WR`, and `OF%THW`;
- maps the same file pages into its own address space.

The virtual page numbers need not match.

Writes by one process are visible to the other.

---

## Frozen and Thawed Access

Normal writable access is frozen and permits one writer.

`OF%THW` requests thawed access.

Thawed access permits multiple simultaneous writers only when every
writer requests it.

Frozen and thawed writable opens exclude one another.

Thawed access permits concurrent writers but does not supply
synchronization or locking.

---

## Communication Choice

```text
Arm's-length cooperation
    → IPCF packets, identity, queues

Mutual trust
    → shared thawed file pages, shared state
```

---

## Boundaries

Current project knowledge does **not** establish:

- complete `MUTIL` semantics;
- PID cleanup conventions;
- queue limits;
- complete software-interrupt integration;
- QUASAR's full protocol;
- synchronization for shared writers;
- all version-specific security policy.

Do not substitute fork handles for IPCF PIDs.

Do not place the receive descriptor in `.IPCFD`.

Do not infer that `OF%THW` supplies locking.

---

## Open Questions

- PID deletion and cleanup.
- Software-interrupt integration.
- Synchronization patterns for shared pages.
- Other subsystem IPCF protocols.

---

## Related Capsules

- `processes.md`
- `program-memory.md`
- `files-and-jfns.md`
- `comnd.md`
- `anchors.md`

---
