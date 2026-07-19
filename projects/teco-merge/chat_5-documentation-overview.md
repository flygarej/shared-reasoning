# Documentation Overview

## TOPS-20 TECO 540

Implementation ground truth. Highest authority for TOPS-20 behaviour.

## Standard TECO (1985)

Good reference when experimentally confirmed. Do not assume it matches
TOPS-20.

## TECO-64 Manual (1990)

Reliable for TECO-64. Documents features absent from TOPS-20
(e.g. computed goto, `|` else).

## TECO Pocket Guide (1978)

Best reference for DEC-era conceptual organization. Documents indefinite
`<...>`, counted `n<...>`, and iteration/flow semantics that align well
with observed TOPS-20 behaviour.

## Project Rule

Experiments override documentation. Preserve implementation differences
explicitly instead of inferring consistency.
