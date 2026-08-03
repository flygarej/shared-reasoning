# Process Scheduling and Execution Reference

## Purpose

This file is a selectively extracted reference for process construction,
program-image installation, process startup, synchronization, termination,
freezing/resumption, halting, and runtime accounting under TOPS-20.

It is intended to accompany `process-scheduling.md` and to provide exact
local JSYS semantics without requiring routine retrieval of the complete
monitor-call manual.

## Status and provenance

- Source: **TOPS-20 Monitor Calls Reference Manual**.
- Operating system scope: **TOPS-20 Version 7.0**.
- Revision: **November 1990**.
- Status: **documentation-derived reference material**.
- This file is not automatically accepted into Project State.
- The source text has been extracted and lightly normalized by removing page
  headers, page numbers, form-feed markers, and repeated heading underlines.
  The technical wording and organization of each JSYS entry are otherwise
  preserved.

## Included calls

- `CFORK` — create an inferior process.
- `GET` — install a save-file image in a process.
- `SFRKV` — start a process through an entry-vector position.
- `SFORK` — start a process at an explicit PC in section zero.
- `WFORK` — wait for inferior-process termination.
- `KFORK` — kill one or more processes.
- `RFORK` — resume directly frozen processes.
- `HALTF` — halt the current process and inferiors.
- `RUNTM` — obtain process or job runtime.

`EFORK` is not included because no `EFORK` JSYS entry occurs in the supplied
Version 7.0 reference manual. The earlier candidate list should therefore not
be treated as establishing such a call.

## Use boundary

Use this file for exact documented arguments, flags, return paths, side
effects, restrictions, and error mnemonics for the included calls.

Use `process-scheduling.md` for conceptual reconstruction and relationships.
Use the complete `JSYS_REFERENCE.MEM.txt` when a call or supporting section is
not covered here.


---

## 3.19  CFORK    JSYS 152

```text
Creates a process inferior to the calling process.  (Refer to  Section
   2.7.)

   ACCEPTS IN AC1:  Characteristics for inferior,,PC address for inferior

                    B0(CR%MAP) Make the inferior process's map  the  same
                               as  the  current process's map by means of
                               indirect pointers.  If this bit is not on,
                               the inferior process will have no pages in
                               its map.  If desired, the creating process
                               can  then  use PMAP or GET to add pages to
                               the inferior's map.

                    B1(CR%CAP) Make the inferior  process's  capabilities
                               the  same  as  the  current process's.  If
                               this bit is not on, the inferior process

                               has  no  capabilities  (all  bits  of  Job
                               Capability Word are 0).

                    B3(CR%ACS) Set the inferior process's  ACs  from  the
                               block  whose  address  is in AC2.  If this
                               bit is not on, the inferior process's  ACs
                               are set to 0.

                    B4(CR%ST)  Set the PC of the inferior process to  the
                               value  in  the right half of AC1 and start
                               the process.  If this bit is not  on,  the
                               inferior  process  is not started, and the
                               right half of AC1 is ignored.   (Also  see
                               the XSFRK% call.)

                    B18-35     PC value for the inferior process if CR%ST
                     (CR%PCV)  is on.

              AC2:  Address of 20 (octal) word  block  (optional).   This
                    block   contains  the  AC  values  for  the  inferior
                    process.  (Refer to bit CR%ACS above.)

   RETURNS     +1:  Failure, error code in AC1

               +2:  Success, relative process handle in AC1

   The inferior process receives the same primary input and  output  JFNs
   as  the  current  process.   However,  the primary input and/or output
   files may be changed with the SPJFN monitor call.

   The CR%MAP argument in AC1 allows the inferior to see the same address
   space  as  that  of the superior.  The inferior process will have read
   and write access to the  superior's  address  space.   The  pages  are
   shared, and changes made by one process will be seen by the other.

   CFORK creates a nonvirgin process if:

        1.  CR%ST is set and

        2.  CR%ACS and/or CR%MAP is set.

   CFORK creates an execute-only process if bit CR%MAP  is  set  and  the
   creating  process  is an execute-only process.  This is the only other
   way to create an execute-only process besides using the GET JSYS on  a
   virgin process.

   The KFORK monitor call can be used to kill one or more processes.

   CFORK ERROR MNEMONICS:

   FRKHX6:   All relative process handles in use

   FRKHX8:   Illegal to manipulate an execute-only process
   CFRKX3:   Insufficient system resources
```


---

## 3.70  GET    JSYS 200

```text
Gets  a  save  file,  copying  or  mapping  it  into  the  process  as
   appropriate.   It  updates  the monitor's data base for the process by
   copying the entry vector and the list of program data vector addresses
   (PDVAs)  from  the  save file.  (See the .POADD function of the PDVOP%
   monitor call.)

   This call can be executed for  either  sharable  or  nonsharable  save
   files  that  were  created  with  the  SSAVE  or  SAVE  monitor  call,
   respectively.  The file must not be open.

   RESTRICTIONS:    Some functions require WHEEL or  OPERATOR  capability
                    enabled.

   ACCEPTS IN AC1:  Process handle,, flag bits and a JFN.

              AC2:  Lowest process page number in left half, and  highest
                    process  page number in right half; or the address of
                    an argument block.  If this AC contains page numbers,
                    those  page  numbers control the parts of memory that
                    are loaded when GT%ADR is on.

   RETURNS     +1:  Always

   The defined bits in AC1 are as follows:

   Bit       Symbol    Meaning

   19        GT%ADR    Use the memory address limits given  in  AC2.   If
                       this  bit  is  off, all existing pages of the file
                       (according to its directory) are mapped.

   20        GT%PRL    Preload the pages being  mapped  (move  the  pages
                       immediately.)  If  this  bit is off, the pages are
                       read in from the disk when they are referenced.

   21        GT%NOV    Do not overlay existing pages  and  do  return  an
                       error.  If this bit is off, existing pages will be
                       overlaid.

   22        GT%ARG    If this bit is on, AC2 contains the address of  an
                       argument block.

   24-35     GT%JFN    JFN of the save file

   The format of the argument block follows:

   Word      Symbol    Meaning

   0         .GFLAG    Flags that indicate how the rest of  the  argument
                       block is to be used.

   1         .GLOW     Number of the lowest  page  in  the  process  into
                       which  a file page gets loaded.  This page must be
                       within the section specified by .GBASE.

   2         .GHIGH    Number of the highest page  in  the  process  into
                       which  a file page gets loaded.  This page must be
                       within the section specified by .GBASE.

   3         .GBASE    Number of the section into which  the  file  pages
                       are  loaded.   You  can  specify  the  section for
                       single-section save files only; use of  this  word
                       with a multiple-section save file causes an error.
                       The file pages are loaded  into  this  section  of
                       memory  regardless of the section specified in the
                       save file.

   The following flag bits are defined for use in .GFLAG:

   Bit       Symbol    Meaning

   0         GT%LOW    .GLOW contains  the  number  of  the  lowest  page
                       within the process to use.

   1         GT%HGH    .GHIGH contains the number  of  the  highest  page
                       within the process to use.

   2         GT%BAS    .GBASE contains the number of the section to use.

   3         GT%CCH    Clear  the  system's  program  cache.   (WHEEL  or
                       OPERATOR  capability  is  required for use of this
                       bit.)

   4         GT%CSH    Place in cache  the  name  of  the  program  being
                       loaded into memory.  (WHEEL or OPERATOR capability
                       is required for use of this bit.)

   When the GET call is executed for a sharable save file, pages from the
   file  are  mapped into pages in the process, and the previous contents
   of the process's page are overwritten.  If the file contains data  for
   only  a  portion  of  the process's page, the remainder of the page is
   zeroed.  Pages of the process not used by the file are unchanged.

   When the GET call is executed for a nonsharable save file,  individual
   words  of  the  file  are written into the process.  Since these files
   usually do not have words containing all zeros, a  GET  call  executed
   for  a nonsharable file never clears memory.  The GET call never loads
   the accumulators.

   The GET JSYS interacts with the JFN  of  the  file  that  the  GET  is
   performed upon in the following ways:

        1.  If the GET is performed on a CSAVE file, a file on a non-disk
            device, or a file that has another JFN open on it, the JFN is
            released.

        2.  Under normal conditions for a file with only one JFN open  on
            it, if the GET succeeds, it will eventually cause an implicit
            CLOSF for the file on which  the  GET  was  performed.   This
            occurs  through  the  following  mechanism:   GET changes the
            owner of the file from the process that issued the GET to the
            process  into  which  the  file  is  mapped.  When the latter
            process is killed, the JFN is released.

   Because a program can not be sure that GET has or has not released the
   JFN,  the  program  should  not  attempt  to release the JFN itself or
   attempt  to  use  the  JFN  again  (assuming  that  the  GET  actually
   succeeded).   At  the time that a program tried to erroneously release

   the JFN itself, the JFN might be associated with a file other than the
   file  on which the GET was performed.  This can be a source of program
   errors that are difficult to trace.

   This  call  can  cause  several   software   interrupts   or   process
   terminations on some file conditions.

   A GET call performed on an execute-only process is illegal unless  the
   process  is  .FHSLF.  If the JFN specified in the GET call refers to a
   file for which the user only has execute-only access, then the process
   specified must be a virgin process.

   Generates an illegal instruction  interrupt  on  the  following  error
   conditions:

   GET ERROR MNEMONICS:

   FRKHX1:   Invalid process handle
   FRKHX2:   Illegal to manipulate a superior process
   FRKHX3:   Invalid use of multiple process handle
   FRKHX8:   Illegal to manipulate an execute-only process
   GETX1:    Invalid save file format
   GETX2:    System Special Pages Table full
   GETX3:    Illegal to overlay existing pages
   GETX4:    Illegal to specify .GBASE for multisection file.
   SSAVX1:   Illegal to save files on this device
   OPNX2:    File does not exist

   All file errors can occur.
```


---

## 3.201  SFRKV    JSYS 201

```text
Starts the specified process using the given  position  in  its  entry
   vector.

   ACCEPTS IN AC1:  Process handle

              AC2:  Word (0-n) in the  entry  vector  that  contains  the
                    address  to  use  for  the  start address.  Word 0 is
                    always the primary start address, and word 1  is  the
                    reenter address.

   RETURNS     +1:  Always

   The process starts execution at  the  address  that  is  the  starting
   address  of  the  entry vector plus the offset specified in AC2.  That
   location must contain an executable instruction.

   If the process has a TOPS-10 format entry vector  (JRST  in  the  left
   half),  then  the  left  half  of  AC2  in the SFRKV call is the start
   address offset.  The only legal offsets are 0 and 1, and they are only
   legal  for entry vector position 0 (start address).  Thus, for TOPS-10
   entry vectors, the left half of AC2 will be added to the  contents  of
   the  right half of .JBSA to determine the start address.  Entry vector
   position 0 means "use the contents of the right half of .JBSA (120) as
   the  start  address,"  and  position  1 means "use the contents of the
   right half of .JBREN (124) as the reenter address."

                                    NOTE

           It is illegal to use an entry  vector  position  other
           than 0 or 1 for an execute-only process.

   Generates an illegal instruction interrupt on error conditions below.

   SFRKV ERROR MNEMONICS:

   FRKHX1:   Invalid process handle
   FRKHX2:   Illegal to manipulate a superior process
   FRKHX3:   Invalid use of multiple process handle
   FRKHX4:   Process is running
   FRKHX8:   Illegal to manipulate an execute-only process
   SFRVX1:   Invalid position in entry vector
```


---

## 3.198  SFORK    JSYS 157

```text
Starts the specified process in a single section.  If the  process  is
   frozen, the SFORK call changes the PC but does not resume the process.
   The RFORK call must be used to resume the process.

   ACCEPTS IN AC1:  Flags,,process handle

                    Flags:

                    SF%CON(1B0)    Used to continue a  process  that  has
                                   previously  halted.  If SF%CON is set,
                                   the address in AC2 is ignored, and the
                                   process  continues  from  where it was
                                   halted.

              AC2:  PC of the process being  started.   The  PC  contains
                    flags  in  the  left  half  and  the process starting
                    address in the right half.   This  call  obtains  the
                    section number of the PC from the entry vector of the
                    process.

   RETURNS     +1:  Always

   The SFRKV monitor call can be used to  start  a  process  at  a  given
   position in its entry vector.

   Generates an illegal instruction interrupt on error conditions below.

   SFORK ERROR MNEMONICS:

   FRKHX1:   Invalid process handle
   FRKHX2:   Illegal to manipulate a superior process
   FRKHX3:   Invalid use of multiple process handle
   FRKHX5:   Process has not been started
   FRKHX8:   Illegal to manipulate an execute-only process
```


---

## 3.262  WFORK    JSYS 163

```text
Causes the current process to wait for a specific inferior process  or
   all inferior processes to terminate (voluntarily or involuntarily).  A
   process is considered terminated if its  state  is  either  .RFHLT  or
   .RFFPT (see RFSTS JSYS for a description of process status).

   ACCEPTS IN AC1:  Inferior process handle, or -4 (.FHINF)in  the  right
                    half  to  wait  for  all of the inferior processes to
                    terminate

   RETURNS     +1:  Always, when the specified process(es) terminates

   This call returns immediately if the specified process(es) has already
   terminated.

   Generates an illegal instruction interrupt on error conditions below.

   WFORK ERROR MNEMONICS:

   FRKHX1:   Invalid process handle
   FRKHX2:   Illegal to manipulate a superior process
```


---

## 3.107  KFORK    JSYS 153

```text
Kills one or more processes.  When a process is  killed,  all  private
   memory  acquired  by  the  process  and  its Process Storage Block are
   released.  Also, any JFNs the process has created  are  released,  and
   any  terminal  interrupt  assignments  that were acquired from another
   process are passed back.  (Note that because the  process  is  deleted
   asynchronously,  a  page of a file mapped into a lower process may not
   be unmapped before the KFORK call returns.)

   ACCEPTS IN AC1:  Process handle

   RETURNS     +1:  Always, unless the current process attempts  to  kill
                    itself

   The KFORK call will not release a process  handle  that  identifies  a
   process  already  killed  by another process.  In this case, the RFRKH
   call must be used to release the handle.

   The CFORK monitor call can be used to create an inferior process.

   Generates an illegal instruction interrupt on error conditions below.

   KFORK ERROR MNEMONICS:

   FRKHX1:   Invalid process handle
   FRKHX2:   Illegal to manipulate a superior process
   FRKHX3:   Invalid use of multiple process handle
   KFRKX1:   Illegal to kill top level process
   KFRKX2:   Illegal to kill self
```


---

## 3.160  RFORK    JSYS 155

```text
Resumes one or more processes that had  been  directly  frozen.   This
   monitor  call  does  not  resume  a  process  that has been indirectly
   frozen.  (See Section 2.7.3.1.) Also, the RFORK call cannot be used to
   resume  a  process  that  is  suspended  because  of  a  monitor  call
   intercept.  (See the UTFRK call.)

   ACCEPTS IN AC1:  Process handle

   RETURNS     +1:  Always

   The RFORK monitor call is a no-op if the referenced process(s) was not
   directly frozen.

   The FFORK monitor call can be used to freeze one or more processes.

   Generates an illegal instruction interrupt on error conditions below.

   RFORK ERROR MNEMONICS:

   FRKHX1:   Invalid process handle
   FRKHX2:   Illegal to manipulate a superior process
   FRKHX3:   Invalid use of multiple process handle
```


---

## 3.95  HALTF    JSYS 170

```text
Halts the current process and any inferior processes  of  the  current
   process.   Sets  the process's PC to the next after the call and saves
   it in  the  Process  Storage  Block  (PSB)  in  case  the  process  is
   continued.   The  user can continue the process by typing the CONTINUE
   command, which causes the process to start at the next instruction.

   Sets bits  1-17(RF%STS)  in  the  status  word  for  this  process  to
   2(.RFVPT).   See  the  RFSTS monitor call for the format of the status
   word.

   If the top level process executes a HALTF call and does not have WHEEL
   or  OPERATOR  capability  enabled,  the job is logged out.  If the top
   level process executes a HALTF call and does have  WHEEL  or  OPERATOR
   capability enabled, control passes to mini-exec level.
```


---

## 3.179  RUNTM    JSYS 15

```text
Returns the run time of the specified process or of the entire job.

   ACCEPTS IN AC1:  Process handle, or .FHJOB (-5) for the entire job

   RETURNS     +1:  Always,    with     runtime     (in     milliseconds)
                    right-justified  in AC1, a divisor to convert time to
                    seconds in AC2, and console time (in milliseconds) in
                    AC3.   AC2  always  contains  1000;  thus,  it is not
                    necessary to examine its contents.

   Generates an illegal instruction interrupt on error conditions below.

   RUNTM ERROR MNEMONICS:

   FRKHX1:   Invalid process handle
   RUNTX1:   Invalid process handle -3 or -4
```


---

## Relationship to the verified Small Executive

The verified `PUSH` server composes the following subset of this reference:

```text
GTJFN → CFORK → GET → SFRKV → WFORK → KFORK
```

That program is executable evidence of composition. This file remains the
manual-derived source for the individual documented interfaces.

## TODO:
Locate EFORK in the reference manual or verify whether the JSYS name
differs in TOPS-20 V7.0.
