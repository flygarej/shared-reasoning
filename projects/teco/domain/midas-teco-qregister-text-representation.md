# MIDAS TECO Q-register text representation — black-box fingerprint

## Purpose

This capsule records experimentally established black-box behavior of text-valued
Q-registers in the startup MIDAS TECO environment. Its purpose is to provide the
MIDAS source-analysis project with a precise behavioral fingerprint to explain.

It is deliberately not a source-level explanation. Terms such as pointer,
descriptor, allocator, heap, tag, header, and string pool remain hypotheses until
supported by the MIDAS implementation and, where useful, targeted runtime tests.

## Provenance and scope

Target environment: startup MIDAS TECO reached through the normal TOPS-20 startup
path used in the TECO project (`@emacs\:teco` after the usual login/terminal setup).

This is called *startup MIDAS TECO*, not "bare TECO", because the startup command
may perform initialization that has not yet been reconstructed.

Human-readable command streams below use `$` for ESC.

The observations in this capsule apply only to the tested startup MIDAS TECO
environment unless explicitly stated otherwise.

## Established surrounding Q-register behavior

Earlier experiments established:

- Numeric store/retrieve works conventionally: `5UA` followed by `QA=` yields `5`.
- Text storage via `Xq` replaces the previously observable numeric value with a
  large negative numeric value when read through `Qq=`.
- `Xq` is non-destructive with respect to the source buffer in startup MIDAS TECO.
- `Gq` inserts stored text into the buffer.
- Numeric store after text makes the numeric value active; the old text is not
  observed as an independently preserved parallel value.
- Q-register contents persist across separately executed command streams.
- The Q-register PDL does not persist across separately executed interactive
  command streams, but is shared across nested `M` execution within one active
  execution context.

These facts distinguish startup MIDAS TECO from both the tested TOPS-20 TECO and
TECOC models in important details.

## Fresh-start origin

In two separate fresh startup sessions, the first experimental operation

```teco
HK IABC$ HXA QA=$$
```

produced exactly:

```text
QA = -34359735078
```

This establishes reproducibility of the first observed text-Q numeric value under
the two tested fresh-start conditions.

It does **not** establish that the value is a hard-coded constant, fixed address,
pointer, descriptor, or any other mechanism.

## Untouched register

In the fresh-start experiment session, after text writes to A and B but before any
experimental write to C:

```teco
QC=$$
```

produced:

```text
0
```

Thus an experimentally untouched C read numerically as zero in that session.

Do not generalize this observation to every possible untouched Q-register or
startup path without further evidence.

## Register-local retention and cross-register progression

After the first text write:

```text
QA = -34359735078
```

writing the same `ABC` buffer to B produced:

```text
QB = -34359735071
```

while A retained its earlier value.

Thus:

- assigned negative values are retained by the individual Q-registers until
  overwritten;
- the numeric progression nevertheless crosses Q-register identities;
- the next value is not determined solely by the destination register's previous
  contents.

An earlier independent A-to-B experiment showed the same cross-register +7
behavior.

## Empirical transition model

The best-supported black-box model in the tested domain is:

```text
Q_n = Q_(n-1) + L_(n-1) + 4
```

where `L_(n-1)` is the length of the text stored by the **previous `Xq`
operation**, not:

- the previous text length of the destination Q-register; nor
- the length of the text being extracted by the current `Xq`.

The `+4` is an observed intercept. It is **not** established as a header size,
allocation overhead, word count, or any other implementation structure.

### Observed transition examples

Across the exploration, observed previous-X lengths and subsequent deltas included:

| Previous X text length | Observed next delta |
| ---: | ---: |
| 0 | +4 |
| 3 | +7 |
| 5 | +9 |
| 6 | +10 |
| 8 | +12 |
| 10 | +14 |
| 20 | +24 |

The model made successful preregistered predictions including previously untested
length 10 and the boundary case length 0.

## Why the variable is `previous X length`

This distinction was discovered only after separating variables that had
previously covaried.

### Destination-old-length discriminator

After fresh startup:

```text
HXA("ABC") -> QA = -34359735078
HXB("ABC") -> QB = -34359735071
```

B had not been experimentally written in that session. The observed step was +7,
matching the preceding X text length 3, rather than the +4 expected if an empty
destination's old length controlled the step.

This falsified the simple destination-old-content interpretation.

### Current-source-length discriminator

State before the test:

```text
last X text length = 3
QB = -34359735071
```

The buffer was then changed, without an intervening X, to ten characters:

```teco
HK I1234567890$ HXC QC=$$
```

Preregistered predictions were:

```text
previous-X-length model:  +7  -> -34359735064
current-source model:    +14  -> -34359735057
```

Observed:

```text
QC = -34359735064
```

Thus the current X source length did not control the value assigned by that same
X operation. The previous-X-length model predicted the result exactly.

This is the strongest reason for the semantic interpretation of `L_(n-1)` in the
current empirical model.

## Content independence within tested cases

Experiments using different character contents at matching lengths included
strings such as:

```text
ABC
DEF
123456
XYZ123
```

The observed progression followed the relevant length/state relationships rather
than the particular character values in these tests.

This falsifies simple models in which the observed progression is directly
determined by the specific ASCII content. It does not prove universal content
independence for every possible text or encoding case.

## Gq between X operations

After C had received ten characters:

```text
QC = -34359735064
```

the following was executed:

```teco
HK GA HXD QD=$$
```

`GA` returned A's `ABC` text to the buffer and the following `HXD` produced:

```text
QD = -34359735050
```

This was the preregistered value:

```text
-34359735064 + (10 + 4) = -34359735050
```

Therefore, in this test:

- the intervening `GA` did not disturb the state represented by the empirical
  transition model;
- transferring text through `A -> GA -> buffer -> HXD -> D` did not reproduce
  A's earlier observable numeric Q value.

The latter falsifies a simple alias model in which the observable Q value itself
would be preserved through this route. It does not rule out copying, pointers, or
shared storage mechanisms generally.

## Verified 36-bit representation

The observed signed decimal values, interpreted modulo `2^36`, are:

| Signed decimal | Unsigned 36-bit decimal | Octal (12 digits) | Hex (9 digits) |
| ---: | ---: | ---: | ---: |
| -34359735078 | 34359741658 | `400000006332` | `800000CDA` |
| -34359735071 | 34359741665 | `400000006341` | `800000CE1` |
| -34359735064 | 34359741672 | `400000006350` | `800000CE8` |
| -34359735050 | 34359741686 | `400000006366` | `800000CF6` |

Natural PDP-10 halfword presentation:

```text
LH      RH
400000  006332
400000  006341
400000  006350
400000  006366
```

For the first value:

```text
-34359735078 = -2^35 + 3290
```

and the 36-bit word can be written:

```text
400000000000 + 000000006332
```

The high/sign bit remains set in these observed text-Q values while the lower
portion follows the measured progression.

### Important correction

Earlier exploratory calculations proposed `777777770032` and later
`000400006332` for the first value. Both were incorrect.

The verified 36-bit octal representation is:

```text
400000006332
```

No source-level interpretation should be based on the discarded conversions.

## Falsified or unsupported interpretations

The experiments have falsified or failed to support the following simple models:

- fixed `+7` progression;
- destination Q-register's old text length controls the next step;
- current X source length controls the value assigned by that same X;
- simple content/checksum dependence on the tested character strings;
- simple `GA` aliasing in which the old observable Q value is restored in a new
  destination.

The following remain **unverified mechanisms**, not established knowledge:

- `400000000000` is a text/type tag;
- the low value is a memory address;
- the low value is a byte pointer;
- the low value is an allocator cursor;
- the value points to a descriptor;
- text is stored in a heap or string pool;
- `+4` is descriptor/header/allocation overhead;
- the sequence is literally a counter.

The empirical model describes observable dynamics; it does not explain their
implementation.

## Source-analysis fingerprint

The MIDAS source-level explanation must account for all of the following together:

1. An experimentally untouched Q-register C read as numeric zero.
2. Numeric stores produce ordinary numeric Q values.
3. Text `Xq` stores produce large negative observable numeric Q values.
4. The first tested `ABC` text store after fresh startup reproducibly produced
   `400000006332` in two sessions.
5. Individual Q-registers retain their assigned observable values.
6. New text writes across different Q-registers follow a common progression.
7. The progression observed in the tested domain satisfies
   `Q_n - Q_(n-1) = L_(n-1) + 4`.
8. The controlling length is associated with the previous X operation, not the
   destination's previous contents or the current source length.
9. `GA` between X operations did not disturb the measured progression.
10. `A -> GA -> buffer -> X -> D` did not preserve A's observable Q value.
11. Observed text-Q words have `LH = 400000` and a changing RH in the tested range.

A proposed source-level mechanism that explains only the arithmetic progression
but not the register retention, one-operation lag, numeric/text behavior, and
36-bit shape is incomplete.

## MIDAS source-analysis targets

When the MIDAS project is ready to inspect the TECO implementation, prioritize:

- dispatch/implementation of `Xq`, including `HXq`;
- Q-register storage layout and routines used to set/get Q-register contents;
- implementation of numeric `Qq` evaluation;
- `Gq` implementation and whether it copies, references, or reconstructs text;
- any global or shared text-storage state modified by `Xq`;
- instructions that construct, test, mask, or preserve `400000000000`;
- arithmetic corresponding to text length and the observed `+4`;
- allocation, relocation, descriptor, pointer, or buffer routines called from
  the X path;
- startup initialization that can explain the reproducible first observed value.

Do not search only for the literal first RH value: it may arise from initialized
state plus arithmetic rather than a literal constant.

## Reconciliation workflow

The intended next phase is:

```text
black-box fingerprint
        |
        v
MIDAS source analysis
        |
        v
source-derived representation hypothesis
        |
        v
targeted startup MIDAS TECO falsification
```

When source analysis suggests a mechanism:

1. state the exact source-derived hypothesis;
2. identify which black-box observations it explains;
3. identify observations it does not yet explain;
4. derive a runtime consequence that differs from plausible alternatives;
5. test that consequence on startup MIDAS TECO;
6. promote the mechanism to accepted project knowledge only if source and runtime
   evidence reconcile.

## Open question

The central unresolved question remains:

> What does the observable 36-bit value of a text-written Q-register represent,
> particularly the `400000xxxxxx` form and its one-operation-lagged progression?

The black-box phase intentionally stops here because the MIDAS source is available.
Further indirect probing should be driven by concrete source-derived hypotheses
rather than increasingly elaborate guesses about the implementation.
