# COMND

## Generator

COMND and the application cooperate to execute a typed interactive
grammar.

COMND owns the interactive parsing process.

The application owns the command grammar and the command semantics.

Each call to COMND parses one field and advances the parse state.

------------------------------------------------------------------------

## Command State

The application owns the command state block.

The state block preserves the dialogue between successive COMND calls.

Accepted components include:

-   command buffer;
-   atom buffer;
-   input/output JFNs;
-   parsing pointers and counters;
-   GTJFN argument block pointer;
-   application reparse entry.

The command buffer contains the editable command.

The atom buffer contains the current parsed field.

------------------------------------------------------------------------

## Parsing Model

COMND parses one field at a time.

A complete command is therefore interpreted as a sequence (or tree) of
typed fields rather than as one monolithic command line.

The application advances through the grammar by selecting the next
Function Descriptor Block (FDB) chain.

COMND advances through the input by recognizing the next field.

------------------------------------------------------------------------

## Function Descriptor Blocks

An FDB describes one expected field.

Accepted FDB responsibilities include:

-   field type;
-   function-specific data;
-   help text;
-   default value;
-   alternate FDB;
-   optional break handling.

Alternate FDB chains allow one grammar position to accept several
different field types.

------------------------------------------------------------------------

## Command Tables

Keyword tables associate recognized command words with application data.

Application data commonly identifies the command server.

Recognition policy is controlled by keyword flags such as:

-   explicit abbreviations;
-   invisible aliases;
-   non-recognized entries.

The table therefore describes both recognition and dispatch.

------------------------------------------------------------------------

## Responsibility Split

COMND owns:

-   command-line editing;
-   recognition;
-   completion;
-   contextual help;
-   defaults;
-   field parsing;
-   textual parse state.

The application owns:

-   grammar;
-   FDB selection;
-   dispatch;
-   persistent state;
-   command semantics.

------------------------------------------------------------------------

## Interactive Behaviour

Accepted behaviour includes:

-   `?` displays help for the current field.
-   `ESC` performs recognition or completion.
-   Defaults may be supplied.
-   Noise words improve readability.
-   Confirmation is parsed explicitly.
-   Reparsing resumes from application-defined state.

------------------------------------------------------------------------

## Return Convention

Normally COMND returns:

-   AC1: status flags and command-state-block address.
-   AC2: parsed value or error code.
-   AC3: first supplied FDB and FDB actually used.

The FDB actually used identifies which alternative matched.

If reparsing is required and the command-state block supplies a reparse
entry, COMND transfers there instead of returning normally.

------------------------------------------------------------------------

## Conceptual Model

``` text
User
   ↓
Command buffer
   ↓
COMND
   ↓
Current FDB chain
   ↓
Parsed field
   ↓
Application
   ↓
Next FDB chain
   ↓
COMND
```

The monitor and the application jointly execute the command grammar.

------------------------------------------------------------------------

## Boundaries

Current project knowledge does **not** establish:

-   every COMND function code;
-   every field type;
-   internal parser implementation;
-   detailed interaction between `.CMIFI` and long-form `GTJFN`;
-   all command-state flags.

Do not infer undocumented COMND behaviour from the accepted model alone.

------------------------------------------------------------------------

## Open Questions

-   Detailed long-form `GTJFN` integration.
-   Complete FDB catalogue.
-   Reparse behaviour in more complex grammars.
-   Additional COMND field types introduced later in Gorin.

------------------------------------------------------------------------

## Related Capsules

-   `files-and-jfns.md`
-   `program-memory.md`
-   `anchors.md`
