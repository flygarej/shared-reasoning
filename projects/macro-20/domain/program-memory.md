# Program Memory (projects/macro-20/domain/program-memory.md)

## Generator

A TOPS-20 program executes within a virtual address space.

Program code, data, stack, dynamically allocated storage, and mapped
file pages all occupy locations within this address space.

Different mechanisms establish these regions, but ordinary memory
references access them uniformly.

------------------------------------------------------------------------

## Program Layout

The loaded program occupies the lowest portion of the address space.

Accepted components include:

-   executable code;
-   static data;
-   literal pools;
-   pushdown lists (stacks).

The linker supplies information describing the loaded image.

------------------------------------------------------------------------

## Available Storage

The linker maintains `.JBSA`.

Accepted working model:

-   right half: program starting address;
-   left half: first free location above the loaded program.

Programs may use the first free address as the beginning of dynamically
allocated storage.

Current project knowledge does not yet establish a general-purpose
memory allocator.

------------------------------------------------------------------------

## Address Space

Memory is viewed as one linear sequence of PDP-10 words.

Arrays, records, stacks and mapped pages all occupy ordinary addresses.

Once an address has been established, the instruction set does not
distinguish how that storage was obtained.

------------------------------------------------------------------------

## Memory Mapping

`PMAP`

associates pages of an open file with pages in a fork's virtual
address space.

After mapping, the program accesses the file contents using ordinary
memory references.

No explicit read operation is required for each word.

------------------------------------------------------------------------

## Page Model

Accepted project knowledge:

-   TOPS-20 pages contain 512 words.
-   Page boundaries occur at addresses that are multiples of octal
    `1000`.
-   Several consecutive pages may be mapped by one PMAP request.

------------------------------------------------------------------------

## Copy-on-Write

PMAP may request copy-on-write access.

Reads access the original mapped page.

The first write creates a private copy.

Subsequent writes affect only the private page.

The underlying file remains unchanged.

------------------------------------------------------------------------

## Shared File Pages

Processes in independent JOBs may map the same writable file pages into
their own virtual address spaces.

The process page numbers need not match.

Both mappings refer to the same underlying file pages.

When the file is opened for thawed writable access, writes by one process
are visible through the other process's mapping.

Every participating writer must request `OF%THW`.

This provides shared memory for cooperating processes that deliberately
trust one another.

---

## Stream versus Mapping

TOPS-20 supports two complementary access models.

### Stream I/O

Data moves explicitly between file and program through JSYSes such as:

-   `SIN`
-   `SOUT`

### Memory Mapping

The monitor establishes an address-space mapping.

The program thereafter accesses the file using ordinary load and store
instructions.

------------------------------------------------------------------------

## Conceptual Model

The accepted abstraction is:

``` text
Program address space

    executable image
            │
     static storage
            │
      dynamic storage
            │
     mapped file pages
            │
ordinary PDP-10 memory references
```

The instruction set operates on addresses.

The operating system determines what those addresses represent.

------------------------------------------------------------------------

## Boundaries

Current project knowledge does **not** establish:

-   page replacement policy;
-   cache behaviour;
-   detailed page-table structure;
-   all sharing semantics between related forks;
-   page protection beyond accepted PMAP access modes;
-   synchronization protocols for concurrent writers.

Do not infer these from other virtual-memory systems.

------------------------------------------------------------------------

## Open Questions

-   Exact relationship between FORKs and inherited/shared maps.
-   Detailed PMAP access flags beyond accepted examples.
-   Interaction between PMAP and program growth.
-   Allocation strategy beyond `.JBSA`.

------------------------------------------------------------------------

## Related Capsules

-   `addressing.md`
-   `files-and-jfns.md`
-   `records.md`
-   `processes.md`
-   `ipcf.md`
-   `anchors.md`
