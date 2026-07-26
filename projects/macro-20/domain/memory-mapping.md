# Memory Mapping

## Generator

Open files may be accessed either through stream I/O or by mapping file pages into a process address space.

## PMAP

PMAP associates a file page with a virtual memory page.

Subsequent access uses ordinary memory instructions.

## Observed options

- read access
- copy-on-write

Copy-on-write provides a private modified page while leaving the file unchanged.

## Principle

Memory mapping operates on page-sized aligned regions.

---

