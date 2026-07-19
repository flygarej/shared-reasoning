# documentation-overview.md

# Documentation Overview

| Reference                                                   | Coverage                                                                                        | Reliability       | Limitations                                                                  | Preferred Use                                                                                       |
| ----------------------------------------------------------- | ----------------------------------------------------------------------------------------------- | ----------------- | ---------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------- |
| **1985 Standard TECO Manual (`TECOC/doc/teco-manual.txt`)** | Core language semantics, parser behavior, command definitions                                   | Highest           | Earlier than the 1990 revision; does not include later documentation changes | Primary semantic reference for language behavior and parser reasoning                               |
| **1990 DEC Standard TECO Manual**                           | Updated reference manual, includes historical prefaces describing changes from the 1985 edition | Very high         | PDF-oriented; less convenient for searching than plain text                  | Historical deltas, clarification of language evolution, confirmation of later documentation changes |
| **TECO-64 `doc/index.md`**                                  | Indexed command reference with links into detailed documentation                                | High              | Documents one implementation; includes implementation-specific material      | Primary navigation aid and command lookup                                                           |
| **TECO-64 documentation**                                   | Modern implementation details and extensions                                                    | High              | Not identical to Reference TECO                                              | Investigating TECO-64 behavior and implementation differences                                       |
| **TECOC documentation / README**                            | Startup behavior, command-line options, implementation notes                                    | High              | Describes TECOC rather than the language                                     | Platform behavior, compatibility features, implementation-specific startup semantics                |
| **English Wikipedia (TECO)**                                | Historical overview and lineage                                                                 | Moderate          | Secondary source; not normative                                              | Historical orientation and bibliography only                                                        |
| **SDF Survival TECO / Twenex Wiki**                         | Introductory material and practical examples                                                    | Moderate          | Tutorial-oriented; not authoritative for language semantics                  | Orientation and practical usage, not semantic authority                                             |
| **1981 TOPS-20 EMACS Manual**                               | EMACS interaction with underlying TECO                                                          | High within scope | Describes EMACS, not standalone TECO                                         | Understanding TECO as embedded within early EMACS                                                   |
| **Project experiments**                                     | Verified implementation behavior                                                                | Highest           | Limited to tested cases                                                      | Preferred whenever experiments conflict with documentation or implementation assumptions            |

## Reference hierarchy

When determining accepted behavior, prefer:

1. Verified experiments.
2. Accepted project conclusions.
3. 1985 Standard TECO Manual.
4. 1990 Standard TECO Manual (especially documented changes).
5. TECO-64 implementation documentation.
6. Historical and tutorial sources.

## Observed disagreements

* TECOC and TECO-64 differ in internal newline representation (CRLF vs LF), while presenting equivalent editing semantics in tested cases.
* Interactive ESC handling differs between implementations, particularly the TECO-64 backtick surrogate; this is treated as implementation behavior rather than core language semantics.
* TECOC startup behavior (remembering the last edited file) is an implementation feature and should not be generalized to the language.

