# session-log.md

## 2026-08-17 — Project bootstrap and first TOPS-20 program

The project was established to learn MIDAS assembly language on TOPS-20. Initial work established `MIDAS.458`, the assembly/link/save/run path, the original MIDAS INFO manual, `.INSRT`, initial TOPS-20 symbols including `PSOUT` and `HALTF`, and the first working TOPS-20 MIDAS output program. An omitted `HALTF` produced a useful failure by falling through into literal/constants storage.

Historical EMACS material also established that the TECO supporting EMACS is written in MIDAS and that `TECO.MID` is a future advanced specimen for this project.

---

## 2026-08-19 — TECO.MID reconnaissance and learning strategy

A structural inspection of `TECO.MID` strongly supported the conclusion that it contains the TECO interpreter/runtime expected by historical EMACS, with included support files such as terminal-specific code.

For the MIDAS project, `TECO.MID` was adopted as an advanced specimen rather than a language authority. The source revealed a layered picture: ordinary PDP-10 instructions remain familiar, while MIDAS adds substantial assembly-time functionality including conditionals, `.INSRT`, macros, textual composition, `REPEAT`, `IRPS`, generated tables, and assertions.

The project decided to accrue these capabilities one layer at a time.

---

## 2026-08-20 — First macro, conditional, and iteration experiments

A simple `SAY` macro was verified:

```text
DEFINE SAY TEXT
        HRROI A,[ASCIZ /TEXT
/]
        PSOUT
TERMIN
```

`SAY Hello from MIDAS` assembled and executed correctly. Three invocations printed three separate lines, confirming straightforward textual macro substitution and composition with literal generation.

Conditional assembly was then verified using `IFN` and `IFE`. A debug message appeared when `DEBUG==1` and was absent when `DEBUG==0`, demonstrating assembly-time selection rather than runtime branching.

`REPEAT 3,[...]` was tested using the existing `SAY` macro and emitted three copies as predicted.

`.RPCNT` was isolated with `IFE` tests. Inside `REPEAT 3,[...]`, runtime output demonstrated the sequence `0, 1, 2`, so `.RPCNT` is zero-based for this use.

Next, `IRPS` was tested:

```text
IRPS WORD,,[ONE, TWO, THREE]
        SAY WORD
        ...
TERMIN
```

It iterated over `ONE`, `TWO`, and `THREE`; `.IRPCNT` likewise yielded `0, 1, 2`. Deliberately adding commas also confirmed that those separators did not interfere with this syllable scan, consistent with the MIDAS manual.

At this point `DEFINE`, basic conditional assembly, `REPEAT/.RPCNT`, and `IRPS/.IRPCNT` are promoted to experimentally verified working knowledge.

---

## 2026-08-20/22 — Real-source corpus, documentation archaeology, and AIM-90

Five small historical MIDAS programs (`ELINK`, `ITAGS`, `QM`, `WM`, `XJSYS`) were inspected as a source-driven curriculum. They expose a progression from ordinary PDP-10 code through symbol/storage machinery to pass-sensitive and advanced macro generation. Near-term targets are `=`, `=:`, `==`, `==:`, `EQUALS`, `.SCALAR`, `BLOCK`, `LOC`, `CONSTANTS`, and `VARIABLES`.

Additional documentation changed the evidence picture. `midas.doc.txt` appears to be a strong late MIDAS general manual/change-history source and documents DEC/TENEX/Twenex evolution. `HLP:MIDAS.HLP` remains wanted primarily as likely TOPS-20 command/switch help; source inspection plus live MIDAS.458 experiments are the fallback.

AIM-90 was identified unambiguously as documentation for PDP-6 MIDAS, not TOPS-20 MIDAS. It remains valuable for MIDAS and PDP-6 -> PDP-10 lineage study. A searchable OCR PDF and OCR text are cached as references. A separate verbatim transcription effort has begun for historical preservation: the scan is authoritative, apparent original errors are preserved, and damaged/reconstructed text is explicitly marked.

The project learning strategy is now explicitly source-driven: observe constructs in real code, consult the best-era documentation, formulate narrow hypotheses, verify uncertain/TOPS-20-specific behavior on MIDAS.458, then promote supported conclusions.

---
