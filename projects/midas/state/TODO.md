# MIDAS Project TODO

## Current goal

Build practical MIDAS literacy on the live TOPS-20 system, especially the assembly-time programming model, before serious decomposition of historical `TECO.MID`.

## Verified and now normal vocabulary

The following no longer need isolated introductory tests unless a boundary question arises:

- simple `DEFINE ... TERMIN` macros;
- textual macro arguments in the tested `SAY` form;
- `IFN` / `IFE` conditional assembly;
- `REPEAT`;
- `.RPCNT` as a zero-based `REPEAT` counter;
- `IRPS`;
- `.IRPCNT` as a zero-based counter in the tested `IRPS` usage.

Use these naturally in later exercises.

## Immediate investigation: MIDAS.458 initial symbols

- Determine the bare MIDAS.458 `.SYMCNT` value without adding avoidable user symbols.
- Find a documented listing/cref/debug/source mechanism that can enumerate untouched initial symbols; do not assume an output-file symbol table contains them.
- Locate and preserve relevant support files (`DECDFS.MID`, `DECBTS.MID`, `TNXDFS.MID`) and continue hunting `HLP:MIDAS.HLP`.
- Establish provenance/build relevance before claiming a support-file definition was compiled into MIDAS.EXE.458.
- Build a classified later symbol inventory suitable for direct comparison with AIM-090: machine opcodes, MIDAS pseudo-ops/specials, DEC monitor symbols, TOPS-20/TENEX JSYS symbols, aliases/compatibility names, site-specific additions.

## Near-term experiments

- From `TNXDFS` and the real-source corpus, resolve `=:` first, then isolate practical differences among `=`, `=:`, `==`, and `==:`.
- Explore `EQUALS` and `.SCALAR` in controlled examples.
- Explore storage/layout pseudo-ops: `BLOCK`, `LOC`, `CONSTANTS`, `VARIABLES`.
- Explore symbol definitions, labels, and expression syntax more deliberately.
- Exercise numeric syntax, especially octal-default versus decimal notation.
- Explore literals/constants and placement beyond the current `ASCIZ` use.
- Test `.INSRT` with a small controlled include file.
- Determine more precisely which TOPS-20 monitor/JSYS symbols are predefined.
- Compare old-style names such as `PSOUT` with `%`-style aliases such as `PSOUT%`.
- Add one new macro capability at a time: text concatenation with `!`, richer macro argument forms, nested/composed macros, more IRP-family iteration, and assembly-time assertions/errors.
- Use `TECO.MID` after each learned mechanism to identify a real historical usage pattern.
- Explore output modes and the relationship among MIDAS output, LINK, SAVE, and direct executable formats.

## Documentation / archaeology

- Keep `reference/midas.doc.txt` as the strongest current late general-manual/change-history candidate and use it before inventing experiments.
- Continue hunting for TOPS-20 `HLP:MIDAS.HLP`; likely value is executable command/switch documentation analogous to `HLP:MACRO.HLP`.
- If `MIDAS.HLP` remains unavailable, collect command/switch names from MIDAS source and test them harmlessly on MIDAS.458.
- AIM-090 diplomatic transcription is complete and proofread; retain the scan as authority and use the transcription as the working historical lineage source.

## Questions to keep open

- Exactly which TOPS-20-specific symbols and definitions are built into MIDAS.458?
- Which parts of the initial symbol environment are core MIDAS versus OS-specific additions?
- Where do meaningful source-level differences from MACRO-20 begin outside the assembly-time facilities?
- What output mode is selected by the simple `@MIDAS FOO` workflow?
- Which additional MIDAS features recur heavily enough in `TECO.MID` to deserve early study?

## Maintenance rules

- Prefer late/contemporary evidence for MIDAS.458: live experiments, `midas.doc`, and later INFO material. Treat AIM-90 as PDP-6 lineage evidence.
- Keep live verification distinct from documentation and inference.
- Treat MACRO-20 knowledge as a hypothesis generator, not MIDAS evidence.
- Do not generalize ITS runtime examples to TOPS-20 without testing.
- Accrue MIDAS features gradually and reuse them in subsequent exercises.

---
