# COMND

## Generator

A command is represented as a tree of typed fields.

Each COMND call parses one field and advances command processing along one valid branch of that tree.

## Consequences

Because the current field has a declared type and context, COMND can provide:

- recognition;
- completion;
- context-sensitive help;
- validation;
- prompting;
- field-appropriate terminal behavior.

## Field roles introduced

- keywords select command branches;
- noise words improve readability without supplying application data;
- values provide arguments to the program.

## Boundary

COMND parses one field per call, not an entire command line in one operation.

The exact data structures and calling sequence used to describe fields have not yet been introduced.

## Parser state

COMND maintains parsing state within a command buffer.

Observed state includes:

- reprompt text;
- beginning of editable input;
- next field to parse;
- remaining unparsed characters;
- remaining free buffer space.

Each successful COMND call advances the parser state rather than reparsing the command from the beginning.

## Command state block

COMND maintains persistent command-processing state in a caller-supplied block.

The block contains:

- input and output JFNs;
- prompt/reprompt pointer;
- editable-input boundary;
- next parse position;
- free-space and unparsed-character counts;
- atom-buffer pointer and size;
- GTJFN argument-block address;
- a caller-provided reparse dispatch address.

The command buffer holds the continuing input dialogue.  
The atom buffer receives the contents of the current parsed field.

## Reparse principle

COMND preserves its parsing state, while the application supplies a reparse
entry point for restoring application control state.

An observed pattern saves a known stack pointer before parsing and restores
it at the reparse entry.

## Function descriptor blocks

Each COMND call describes the next expected field with a Function
Descriptor Block.

An FDB contains:

- field function code and flags;
- optional link to another FDB;
- function-specific data;
- help text;
- default text;
- optional break-mask information.

`FLDDB.` constructs these blocks.

## Keyword dispatch pattern

A `.CMKEY` field may refer to an alphabetically ordered command table.

The table associates recognized keywords with command-server addresses.
After COMND identifies an entry, the program obtains its server address
from the entry and dispatches indirectly.

This makes command recognition and execution data-driven rather than a
sequence of explicit string comparisons.

## Interactive field behavior

Observed in the verified Small Executive session:

- `?` displays help appropriate to the current field.
- `ESC` performs recognition or completion for the current field.
- A field default may be selected by completion when the user supplies no explicit value.
- Noise words may be emitted as part of completion to make the command readable.
- After help output, COMND redisplays the current command line and resumes at the same field.

Example:

`co<ESC><ESC>?`

progresses through:

- `COUNT`
- default direction `UP`
- noise word `(TO)`
- help for the required numeric field
