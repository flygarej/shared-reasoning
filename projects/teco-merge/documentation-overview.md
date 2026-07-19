# Documentation Overview

| Reference | Covers | Reliability | Limitations | Preferred Use |
|---|---|---|---|---|
| 1985 Standard TECO manual | Generic language | High | Documents features absent in TOPS-20 | Primary language reference. |
| 1990 TECO-64 manual | TECO-64 syntax and behavior | High | Describes TECO-64, not necessarily TOPS-20 | Fast searchable reference. |
| TOPS-20 TECO 540 experiments | Actual implementation | Highest | Limited to tested behavior | Authority for TOPS-20. |
| TOPS-20 EMACS init macros | Idiomatic production TECO | High | Usage, not specification | Discover practical constructs. |

## Accepted Disagreements

- `|` else: documented and verified in TECO-64, not observed in TOPS-20.
- Computed goto: documented and verified in TECO-64 (one-based), not observed in TOPS-20.

## Strategy

Prefer experiments over documentation for implementation behavior; use documentation to generate hypotheses; use EMACS sources to discover idioms worth testing.
