# COMND reference program

## SMALL EXECUTIVE

```MACRO-20
	TITLE	SMALL EXECUTIVE		; Mark R. Crispin 12/79
	SEARCH	MACSYM,MONSYM,QSRMAC
	SALL

; Compatibility definition: some QSRMAC.UNV versions lack .OFLAG
IFNDEF	.OFLAG,.OFLAG==.OHDRS-2

;  Accumulator defs
A=1			; JSYS Args and temp AC's 
B=2
C=3
D=4
P=17			; stack pointer

OPDEF	CALL	[PUSHJ P,]
OPDEF	RET	[POPJ P,]

; Standard version info
VWHO==2			; Who last edited program
VMAJOR==2		; major version
VMINOR==7		; minor version
VEDIT==13		; edit version

; Assembly switches
; Note that CMDBSZ and ATMBSZ take on default values that can
; be overridden by the inclusion of a header file

PDLEN==100	; length of pushdown stack
IFNDEF CMDBSZ,CMDBSZ==^D50	; length of command text buffer
				; (250 characters)
IFNDEF ATMBSZ,ATMBSZ==^D20	; atom buffer length (100 chars)

	SUBTTL	Useful macro definitions

; Parse tring of noise words
DEFINE	NOISE (STRING) <
	MOVEI	B,[FLDDB. .CMNOI,,<-1,,[ASCIZ/STRING/]>]
	COMND
	ERCAL	FATAL
	TXNE	A,CM%NOP
	JRST	ERROR	>	;Definition of noise

; Obtain confirmation. an end of line indication. Tie off command line
DEFINE	CONFIRM <
	MOVEI	B,[FLDDB. .CMCFM]
	COMND
	ERCAL	FATAL
	TXNE	A,CM%NOP
	JRST	ERROR	>	; definition of CONFIRM

; Call this macro to help build the command table. This macro is more complex
;(and more useful) than the CMD macro decribed earlier
;This macro explained in 26.2.9, page 380
DEFINE	TBL (NAME,FLAGS,DISP) <
IFNB <DISP>,<..DISP==DISP>		;; If a dispatch is given, use it
IFB  <DISP>,<..DISP==.'NAME>		;; If none, default to .NAME
IFB  <FLAGS>,<[ASCIZ/NAME/],,..DISP>	;; If no flags assemble name
IFNB <FLAGS>,<[FLAGS!CM%FW		;; if flags use them and set CM%FW
	ASCIZ/NAME/],,..DISP>		;;
	PURGE	..DISP >		; TBL MACRO

	SUBTTL	Data Storage Area

PDLIST:	BLOCK	PDLEN		; Pushdown list
SAVPDL: 0			; Save pushdown pointer
				; in case of reparse
CORBEG==.			; This storage zeroed at start

				; Storage used by COMND
CMDBUF:	BLOCK	CMDBSZ		; command buffer
ATMBUF:	BLOCK	ATMBSZ		; atom buffer
GTJBLK:	BLOCK	.GJATR+1	; GTJFN block

				; Other storage
UDFLAG:	0			; Up/down count flag for COUNT
INPJFN:	0			; Input JFN for TYPE

; Storage used by the PUSH command. See section 27, page 387
EXCJFN:	0			; JFN for PUSH
FKHAN:	0			; Fork handle for PUSH

; Storage used for the QUEUE command. The server for this command is
; explained in section 28.1, page 397
IPCBLK:	BLOCK	.IPCFP+1	;Storage for IPCF JSYS calls
MYPID:	0			; PID for this program
QSRPID:	0			; PID for Quasar
FIRSTP:	0			; Flag used in GETQRP

COREND==.-1			; end of area zeroed at START

; Command State Block
CMDBLK:	0,,CMRPRS		; flags,,address of reparse routine
	.PRIIN,,.PRIOU		; JFNS for command I/O
	-1,,[ASCIZ/Small Executive>/]	;Ctrl-R buffer
	-1,,CMDBUF		; ptr to start of buffer
	-1,,CMDBUF		; ptr to start of next input
	CMDBSZ*5-1		; size of command buffer in bytes
	0			; number of unparsed characters
	-1,,ATMBUF		; ptr to start of atom buffer
	ATMBSZ*5-1		; size of atom buffer in bytes
	GTJBLK			; pointer to GTJFN block

	SUBTTL	Top level, first command dispatch and command table

START:	RESET			; initialize all i/o
	MOVE	P,[IOWD PDLEN,PDLIST]	; Initialize stack ptr
	SETZM	CORBEG		; Initialize data area
	MOVE	A,[CORBEG,,CORBEG+1]
	BLT	A,COREND

TOPLEV:	CALL	GETCMD		; get a command and run it
	SETO	A,		; here on return from command
	CLOSF			; clean up any stray JFNS left behind
	ERCAL	FATAL		; should not happen...
	JRST	TOPLEV		; back to top level

GETCMD:	MOVEI	A,CMDBLK	; Register A points to state block
	MOVEI	B,[FLDDB. .CMINI]	; Initialize state block, watch for
	COMND			; CTRL/H. Do output prompt
	ERCAL	FATAL		; Should never happen
	MOVEM	P,SAVPDL	; Save stack ptr for reparse
CMRPRS:	MOVE	P,SAVPDL	; Restore stack ptr for reparse
	MOVEI	B,[FLDDB. .CMKEY,,CMDTAB,<A command>]
	COMND
	ERCAL	FATAL
	TXNE	A,CM%NOP	; Parse fail?
	JRST	ERROR		; yes, report and return
	HRRZ	B,(B)		; ger address of command server
	JRST	(B)		; dispatch to it

; This table format discussed in 26.2.9, page 380

CMDTAB:	CMDTBL,,CMDTBL	;Actual,,max no of entries
	TBL(COUNT)
	TBL(EXIT)
	TBL(HELL,CM%NOR,0)	; Hell is an illegal abbreviation
	TBL(HELLO)		; for hello
	TBL(HELP)
	TBL(PUSH)
	TBL(Q,CM%INV!CM%ABR,$QUEUE)	; Q and QU are invisible 
	TBL(QU,CM%INV!CM%ABR,$QUEUE)	; abbrevs for queue
$QUEUE:	TBL(QUEUE)
	TBL(QUIT,CM%INV,.EXIT)	; Quit is an invisible alias for EXIT
	TBL(TYPE)
CMDTBL==<.-CMDTAB>-1		; Entries in table

	SUBTTL	Command Servers
; Server for count command
.COUNT:	SETZM	UDFLAG	;Assume count up
	MOVEI	B,[FLDDB. .CMKEY,,UDCTAB,<a direction to count.>,UP,UPNUM]
	COMND
	ERCAL	FATAL
	TXNE	A,CM%NOP	
	JRST	ERROR
	HRRZ	C,C	; Get address of function descriptor used
	CAIN	C,UPNUM	; did we parse a number
	JRST	CNUM2	; yes, result in B
	HRRZ	B,(B)	; no, must be a command
	JRST	(B)	; dispatch to handler

UPNUM:	FLDDB.	.CMNUM,CM%SDH,^D10,<a number to count up to>

UDCTAB:	UDCTLN,,UDCTLN	;Secondary kbd table for count command
	TBL	(DOWN)
	TBL	(UP)
UDCTLN==<.-UDCTAB>-1

.UP:	NOISE	(TO)
	MOVEI	B,[FLDDB. .CMNUM,CM%SDH,^D10,a number to count up to,20]
	JRST	CNUM
.DOWN:	NOISE	(FROM)
	SETOM	UDFLAG
	MOVEI	B,[FLDDB. .CMNUM,CM%SDH,^D10,a number to count down from,20]
CNUM:	COMND
	ERCAL	FATAL
	TXNE	A,CM%NOP
	JRST	ERROR
CNUM2:	JUMPLE	B,NONEG	; A negative argument makes no sense
	MOVE	D,B	; Save number over CONFIRM
	CONFIRM		; Tie off command
			; here to actually do the counting
	SKIPGE	UDFLAG	;Counting up or down, skip if up
	JRST	COUNT0	; counting down, udflag=-1, max value
	MOVEM	D,UDFLAG	; UDFLAG is now upper bound
	SKIPA	D,[1]	;and for up counting D is initially 1
COUNT0:	MOVN	D,D	;down count, D is initially -n
			; D is lower boudn, UDFLAG is 
			; upper bound. For counting down we'll
			; actually cound a neg num up to -1
	MOVEI	A,.PRIOU	; Set up to output to terminal
COUNT1:	MOVM	B,D		; get magnitude of number to output
	MOVEI	C,^D10		; decimal radix
	NOUT			; output it
	ERCAL	FATAL	
	HRROI	B,CRLF		; output delimiting crlf
	SETZ	C,		; terminate on null
	SOUT
	CAMGE	D,UDFLAG	; if counting down UDFLAG is -1
	AOJA	D,COUNT1
	RET

NONEG:	HRROI	A,[ASCIZ/?I can't count down that far!
/]
	PSOUT
	RET

; Server for EXIT command to have a graceful way of getting out
.EXIT:	NOISE	(FROM SMALL EXECUTIVE)
	CONFIRM
	HALTF
	RET

; Server for HELLO command
; Format for printing version is MAJOR.MINOR(EDIT)-WHO
.HELLO:	CONFIRM
	HRROI	A,[ASCIZ/Hello this is the Small Executive.
Version /]
	PSOUT
	MOVEI	A,.PRIOU	; Numeric object to terminal
	MOVEI	C,10	;radix 8
	LDB	B,[POINT 9,VERSIO,11]
	NOUT
	ERJMP	.+1
	MOVEI	B,"."
	BOUT
	LDB	B,[POINT 6,VERSIO,17]	; Minor version
	NOUT
	ERJMP	.+1
	MOVEI	B,"("
	BOUT
	HRRZ	B,VERSIO	; edit number in parens
	NOUT
	ERJMP	.+1
	HRROI	A,[ASCIZ/)-/]
	PSOUT
	MOVEI	A,.PRIOU
	LDB	B,[POINT 3,VERSIO,2]	;Finally, who edited
	NOUT
	ERJMP	.+1
	HRROI	A,CRLF
	PSOUT
	RET

; Server for HELP command
.HELP:	NOISE (IN USING THE SMALL EXECUTIVE)
	CONFIRM
	HRROI	A,HLPMSG
	PSOUT
	RET

HLPMSG:	ASCIZ/
The Small Executive is a simple command processor that demonstrate the
capabilities of the COMND JSYS. Try typing ? to see what commands are 
available.
/


	SUBTTL PUSH command
; The actual server for the PUSH command will be presented in section
; 27, page 387
.PUSH:	NOISE (COMMAND LEVEL)
	CONFIRM		; Tie off command
	MOVX	A,GJ%OLD!GJ%SHT	; Try to get an EXEC
	HRROI	B,[ASCIZ/SYSTEM:EXEC.EXE/]
	GTJFN
	ERJMP	ERROR
	MOVEM	A,EXCJFN		; Save JFN we got for EXEC
	
	MOVX	A,CR%CAP	; Make a fork, give it our capabilities
	CFORK			; Create FORK
	ERJMP	ERROR
	MOVEM	A,FKHAN		; Save fork handle
				; form JFN,,fork handle
	HRL	A,EXCJFN	; stuff fork with JFN for EXEC
	MOVS	A,A		; GET wants to see fork handle,,JFN
	GET			; Copy exec.exe into inferior fork
	ERCAL	FATAL
	
	MOVE	A,FKHAN		; Get fork handle back
	SETZ	B,		; Start at offset 0 in entry vector
	SFRKV			; Start fork
	ERCAL	FATAL
	WFORK			; Wait for it to complete
	ERCAL	FATAL
	KFORK			; Now kill that fork
	ERCAL	FATAL
	RET

	SUBTTL	QUEUE Command
; The actual server for the QUEUE program is presented in 
; section 28.1, page 397

; Select a page for IPCF replies from QUASAR
IFNDEF	MSGPAG,MSGPAG==670 ; Put replies on page 670
MSGLOC=MSGPAG_^D9 ; First location on MSGPAG

; This is the message we send to QUASAR to make it divulge the queues
QSRMSG:	QSRLEN,,.QOLIS	; Length of block,,list queues
	0,,'SYS'	; flags,,3 letter mnemonic
	0		; acknowledge word
	LS.ALL		; flags - I want to see everything
	1		; one argument following
	2,,.LSQUE	; 2 words this argument,,queues I want
	LIQALL		; list all queues
QSRLEN==.-QSRMSG	; Length of message.

.QUEUE:	NOISE (STATUS DISPLAY)
	CONFIRM
; First we need to get PIDs for QUASAR and for this process
	MOVEI	A,3		; Length of argument block for MUTIL
	MOVEI	B,IPCBLK	; Address of block for MUTIL
	MOVEI	C,.MURSP	; Read a PID from system PID table
	MOVEM	C,IPCBLK	; Store as function or MUTIL
; Get QUASAR's PID
	MOVEI	C,.SPQSR	; Code to reuest QUASAR PID
	MOVEM	C,IPCBLK+1	; from system PID table
	MUTIL	
	ERJMP	QERR1
	MOVE	C,IPCBLK+2	; QUASARS PID returned in argument BLK
	MOVEM	C,QSRPID	; Save QUASAR's PID

; Now get own PID
	SKIPE	MYPID		; Is there a pid for me already?
	JRST	QUEUE3		; Yes, ready to send off a message
	MOVEI	C,.MUCRE	; no, must create one
	MOVEM	C,IPCBLK	; Set Create PID function for MUTIL
	MOVEI	C,.FHSLF	; PID for this fork, no flags
	MOVEM	C,IPCBLK+1	; Required: supply .FHSLF argument to .MUCRE
	MUTIL
	ERJMP	QERR2
	MOVE	C,IPCBLK+2	; Returned value from .MUCRE
	MOVEM	C,MYPID		; Save as my PID
; Here we have the PIDs we need. Now tell Quasar to send us the information
QUEUE3:	SETZM	IPCBLK		; no flags
	MOVE	C,MYPID
	MOVEM	C,IPCBLK+1	; My PID
	MOVE	C,QSRPID
	MOVEM	C,IPCBLK+2	; QUASAR's PID
	MOVE	C,[QSRLEN,,QSRMSG]
	MOVEM	C,IPCBLK+3
	MOVEI	A,.IPCFP+1	; Length of packed descriptor block
	MSEND
	ERJMP	QERR3		; report an error and return to user
	SETOM	FIRSTP		;Set this is first time through GETGRP
; Loop, reading the replies from QUASAR
GETQRP:	MOVX	C,IP%CFV	;flag to request one page of data
	MOVEM	C,IPCBLK+.IPCFL	; in the packet descriptor flag
	SETZM	IPCBLK+.IPCFS	; sender (filled in by system)
	MOVE	C,MYPID		; My PID is
	MOVEM	C,IPCBLK+.IPCFR	; the receiver
	MOVE	C,[1000,,MSGPAG]	;put data on message page
	MOVEM	C,IPCBLK+.IPCFP	; Verified correction:
                            ; Gorin prints .IPCFD here;
							; .IPCFP is required by MRECV.
	MOVEI	A,.IPCFP+1		; length of packet descriptor block
	MOVEI	B,IPCBLK	; Address of our block
	MRECV			; get the reply
	ERJMP	QERR4
	MOVE	C,IPCBLK+.IPCFS	; Get sender PID for this message
	CAME	C,QSRPID	; Was it QUASAR
	JRST	[HRROI A,[ASCIZ/%Ignoring irrelevant IPCF message
/]
		PSOUT		; someone other than QUASAR sent to us
	JRST GETQRP]		; try again to get QUASAR's reply
	HRROI	A,MSGLOC+.OHDRS+1	; get ptr to text block
	HLRZ	B,MSGLOC+.OHDRS		; get block's size
	AOSN	FIRSTP		; is this the first message?
	ADD	A,B		; Yes, point past header message
	PSOUT
	MOVE	B,MSGLOC+.OFLAG	; Get flags from QUASAR
	TXNE	B,WT.MOR	; Are there more messages?
	JRST	GETQRP		; Yes, handle
	RET			; No, return

.TYPE:	NOISE	(FILE ON TERMINAL)
	SKIPE	A,INPJFN	; Any JFN lying around
	CLOSF		; Yes, try to close it
	ERJMP	.+1	; Ignore any failure
	SETZM	INPJFN	; and don't try to do it again
	MOVEI	A,CMDBLK	; Reload A with ptr to state block
	MOVEI	B,[FLDDB. .CMIFI,CM%SDH,,name of the file you want to type]
	COMND	; get an input file
	ERCAL	FATAL
	TXNE	A,CM%NOP	; Maybe not found or something?
	JRST	ERROR
	HRRZM	B,INPJFN	; Save the JFN we got
	CONFIRM			; Tie off command
	MOVE	A,INPJFN	; Open the file, using JFN from COMND
	MOVX	B,<FLD(7,OF%BSZ)+OF%RD>	; Read access, 7-bit bytes
	OPENF
	JRST	ERROR		;OPENF failed for some reason...
TYPE1:	MOVE	A,INPJFN
	BIN			; Simple byte-by-byte copy loop
	ERJMP	TYPE2
	MOVEI	A,.PRIOU	; brevity, not speed...
	BOUT
	JRST	TYPE1

TYPE2:	MOVE	A,INPJFN	; Error here, EOF?
	GTSTS
	TLNN	B,(GS%EOF)	
	CALL	ERROR		; Some serious problem; report it.
	MOVE	A,INPJFN
	CLOSF			; Close file
	ERCAL	FATAL
	SETZM	INPJFN		; Zero JFN storage
	RET

	SUBTTL Error handlers and miscellany

; Fatal error routine, for "impossible errors" only.
; Called by ERCAL FATAL after failing JSYS

FATAL:	CALL	ERROR	; First output reason JSYS died
	HRROI	A,[ASCIZ/, JSYS at PC=/]
	PSOUT
	MOVEI	A,.PRIOU	; Output PC
	POP	P,B		; get PC back from stack
	SUBI	B,2		; Back up over ERCAL to JSYS address
	MOVX	C,NO%MAG!10	; Output free format unsigned octal
	NOUT
	ERJMP	.+1		; This can't happen but avoid recursion
	HRROI	A,CRLF
	PSOUT
	MOVEI	A,.PRIIN	; Flush TTY input handler
	CFIBF
FATAL0: HALTF
	HRROI	A,[ASCIZ/?Can't continue
/]
	PSOUT
	JRST	FATAL0	; Disallow continue command

QERR1:	HRROI	A,[ASCIZ/MUTIL .MURSP failed: /]
	PSOUT
	JRST	ERROR


QERR2:	HRROI	A,[ASCIZ/MUTIL .MUCRE failed: /]
	PSOUT
	JRST	ERROR


QERR3:	HRROI	A,[ASCIZ/MSEND failed: /]
	PSOUT
	JRST	ERROR


QERR4:	HRROI	A,[ASCIZ/MRECV failed: /]
	PSOUT
	JRST	ERROR

; Ordinary JSYS routine. Just outputs the error string for the 
; failing JSYS and returns

ERROR:	HRROI	A,[ASCIZ/Error: /]
	ESOUT
	MOVEI	A,.PRIOU	; Errmsg to primary output
	HRLOI	B,.FHSLF	; This fork, last error
	SETZ	C,		; No limit
	ERSTR
	ERJMP	.+1		; Neither of these are supposed to happen
	ERJMP	.+1
	HRROI	A,CRLF
	PSOUT
	RET

CRLF:	BYTE(7)15,12

;Entry vector
EVEC:	JRST	START		; START entry point
	JRST	START		; REENTER entry point
VERSIO:	BYTE	(3)VWHO(9)VMAJOR(6)VMINOR(18)VEDIT ;version #. Label for Hello
EVECL==.-EVEC

	END	<EVECL,,EVEC>
```

### Sample session

```TOPS-20
@compile smexec.mac
MACRO:	SMALL

EXIT
@load smexec
LINK:	Loading
@save smexec
 SMEXEC.EXE.2 Saved
@smexec
Small Executive>? A command one of the following:
 COUNT	 EXIT	  HELLO	   HELP	    PUSH     QUEUE    TYPE
Small Executive>count ? a direction to count. one of the following:
 DOWN	UP
  or a number to count up to
Small Executive>count uP (TO) ? a number to count up to
Small Executive>count uP (TO) 11
1
2
3
4
5
6
7
8
9
10
11
Small Executive>hello
Hello this is the Small Executive.
Version 2.7(13)-2
Small Executive>hello ? confirm with carriage return
Small Executive>hello 
Hello this is the Small Executive.
Version 2.7(13)-2
Small Executive>quEUE (STATUS DISPLAY) 

Batch Queue:
Job Name   Req#   Run Time            User
--------  ------  --------  ------------------------
  BSEND        4  00:05:00  FLAX                  /After:31-Jul-2026 09:
	  /Uniq:Yes  /Restart:No  /Assist:Yes  /Output:Log
	  /Batlog:Append  /Seq:1711
There is 1 job in the queue (none in progress)
Small Executive>exit
```
