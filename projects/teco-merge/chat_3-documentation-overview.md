# Documentation Overview

## Purpose

Identify the significant sources used or established in this investigation so a human can relocate evidence without duplicating the conceptual model in `domain-teco.md`.

## TOPS-20 TECO 540(6124)-2

**What it covers**

The historical implementation used for direct experiments on conditionals, nested conditionals, counted iteration, nested iteration, zero-count iteration, structural skipping, delimiter matching, buffer effects, and runtime errors.

**Observed reliability**

Highest authority in this project for historical TECO semantics because behavior was observed directly.

**Important limitations**

- Interactive transcripts interleave prompts, echoed input, command terminators, output, and error text.
- Buffer state persists across command strings and can contaminate later observations.
- ESC echoes as `$`, which can be mistaken for a literal dollar sign.
- Typing mistakes can leave partial command text in error reports.

**Disagreements with accepted project knowledge**

None retained. When an initial explanation conflicted with observed TOPS-20 behavior, the explanation was discarded.

**When to prefer**

Prefer for deciding historical semantics and resolving ambiguity in modern implementations.

## TOPS-20 TECO Manual Consulted During the Session

**What it covers**

Conditional syntax and the existence of multiple predicate selectors following the `"` command.

**Observed reliability**

Useful for locating syntax and candidate behaviors, but project policy treats documentation as evidence requiring experimental confirmation.

**Important limitations**

The exact title and edition were not preserved in this thread. Do not infer more bibliographic precision than the conversation established.

**Disagreements with accepted project knowledge**

None retained after experimental checking.

**When to prefer**

Use to identify candidate commands, predicates, and syntax before designing small TOPS-20 experiments.

## TECOC

**What it covers**

Modern compatibility behavior for basic `"E` conditionals and multi-command conditional bodies.

**Observed reliability**

Matched TOPS-20 for the tested conditional behaviors.

**Important limitations**

It is a comparison target, not the semantic authority. Agreement supports portability; disagreement requires investigation rather than immediate rejection of TOPS-20 behavior.

**Disagreements with accepted project knowledge**

None observed in the tests retained here.

**When to prefer**

Use after TOPS-20 verification to determine whether accepted behavior survives in a modern implementation.

## TECO-64

**What it covers**

Modern compatibility behavior for basic `"E` conditionals and multi-command conditional bodies.

**Observed reliability**

Matched TOPS-20 for the tested conditional behaviors.

**Important limitations**

- ESC echoes as `` ` `` rather than `$`.
- Echo representation must not be mistaken for a language difference.
- It is a comparison target, not the semantic authority.

**Disagreements with accepted project knowledge**

None observed in the tests retained here.

**When to prefer**

Use after TOPS-20 verification to map compatibility and identify extensions or deviations.

## TECO Stage 3 Experiment Notes Produced from This Session

### `TECO_Stage3_Conditionals_Experiments.md`

**What it covers**

Early conditionals work: `"E`, multiple commands, nesting, skipped invalid code, and structural balancing.

**Observed reliability**

Derived from direct session experiments, but should be checked against the compact accepted model because early prose may contain stronger architectural wording than the experiments alone prove.

**Important limitations**

It preserves more explanatory framing than the domain capsule and may include candidate principles rather than only settled invariants.

**When to prefer**

Use to recover experiment context and individual test forms.

### `TECO_Stage3_Execution_Regions_Findings.md`

**What it covers**

Iteration tests and comparison between conditionals and loops as region-oriented constructs.

**Observed reliability**

Grounded in direct TOPS-20 experiments from the session.

**Important limitations**

The shared “balanced execution region” model is an accepted working model, not a verified implementation-internal architecture.

**When to prefer**

Use to recover the evidence supporting the execution-region abstraction.

### `TECO_Stage3_Handoff.md` and `TECO_Stage3_NextChat_Prompt.md`

**What they cover**

Session continuation state and methodology for downstream work.

**Observed reliability**

Useful as workflow artefacts, not primary evidence.

**Important limitations**

They compress the session and may omit transcript details.

**When to prefer**

Use when restarting the investigation, not when adjudicating a disputed semantic point.

## Source Preference Order

1. Clean, repeatable experiments on TOPS-20 TECO.
2. Accepted project conclusions derived from those experiments.
3. Manual statements confirmed by experiment.
4. Concordant TECOC and TECO-64 results.
5. Earlier session notes and handoff prose.
