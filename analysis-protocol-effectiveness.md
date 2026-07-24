# Protocol Effectiveness Analysis: Shared Reasoning

> **Research task:** Evaluate the practical effectiveness of the collaboration protocol
> across the actual project investigations (TECO, MACRO-20, z80-cpm, etc.)
> and determine whether it produced measurable evidence of improved reasoning outcomes,
> better knowledge preservation, or more effective collaboration.

---

## Bottom Line

The framework is **genuinely useful and not just process theater**, especially for
long-running technical investigations. However, the evidence is **qualitative, local,
and self-reported**; it does not yet constitute measurable proof of improved outcomes
at scale.

| Claim | Strength |
|---|---|
| Useful for knowledge preservation and continuity | **Strongly supported** |
| Improves reasoning quality through epistemic hygiene | **Moderately supported** |
| Scales broadly or produces measurably better outcomes | **Weakly supported** |

---

## 1. Do the session logs show the protocol preventing errors or recovering from dead ends?

**Yes, in a limited but concrete way.**

### Strongest example: TECO

The TECO session log explicitly preserves a wrong assumption instead of silently overwriting it:

- `projects/emacs-teco/state/session-log.md:19-24` records that the investigation
  **identified an incorrect assumption**: bare `;` was assumed to be an unconditional
  iteration exit, then corrected by distinguishing `;`/`:;` from `n;`/`n:;`.
- `projects/emacs-teco/state/session-log.md:7-16` also shows model refinement from
  "lazy execution" to **selective structural scanning**.
- That corrected understanding is then promoted into accepted state at
  `projects/emacs-teco/state/project-state.md:45-61` and `:87-92`.

That is exactly the kind of error-recovery pattern the protocol claims to support:
preserve the dead end in the log, keep the corrected model in project state.

### Meta-level explicit claim

The methodology project itself claims the observation/inference discipline prevented errors:

- `projects/shared-reasoning/state/project-state.md:45-56` says the evidence-first
  distinction "**prevented several scope and reconstruction errors**."

That is useful evidence, though it is a retrospective claim rather than an
independently measured result.

### Weaker examples

- `projects/macro-20/state/session-log.md:11-14` records an initial build failure
  and recovery; `projects/macro-20/state/project-state.md:27-31` preserves the
  accepted result. Useful, but this is ordinary debugging.
- `projects/z80-cpm/state/session-log.md:111-130` shows documentation and experiment
  being reconciled before promotion to state, but not a dramatic recovery from a
  reasoning dead end.

**Assessment:** Real evidence of dead-end recovery and error containment exists,
especially in TECO, but not enough to call it broadly measured.

---

## 2. Do project-state documents demonstrate accumulated understanding over time?

**Yes. This is the strongest part of the evidence.**

### TECO

`projects/emacs-teco/state/project-state.md:8-114` is a clear accumulated knowledge artifact:

- verified search semantics (lines 18–33)
- conditional execution model (lines 43–61)
- conditional tests (lines 63–83)
- iteration interaction (lines 85–92)
- dialect understanding and EMACS architecture (lines 93–107)
- active questions (lines 108–113)

This is not just a transcript summary; it is a maintained knowledge base with
explicit distinctions between **Verified** sections and **Working Model** sections.

### Z80/CP-M

`projects/z80-cpm/state/project-state.md:20-177` accumulates:

- test environments
- toolchain baseline
- verified build workflow
- syntax-selection rules
- verified behaviour
- working models
- deferred topics

It also preserves uncertainty correctly: the default M80 mode is only a **working
model** until confirmed (`projects/z80-cpm/state/project-state.md:160-166`).

### MACRO-20

`projects/macro-20/state/project-state.md:6-16` explicitly delegates detailed knowledge
to separate domain files. Those files are real conceptual accumulators:

- `projects/macro-20/domain/instruction-families.md` — grammar-based instruction taxonomy
- `projects/macro-20/domain/macros.md` — generator-pattern documentation
- `projects/macro-20/domain/addressing.md` — boundary constraints with verified example

**Assessment:** The protocol clearly succeeds at knowledge preservation and accumulation.

---

## 3. Did the observation/inference/hypothesis discipline lead to different conclusions than casual reasoning would?

**Yes, especially in TECO.**

### TECO documentation discipline

`projects/emacs-teco/state/documentation-teco-overview.md` is strong evidence of
disciplined epistemics:

- Line 5–6: documentation is evidence, but experiments remain authoritative
- Line 17–18: cross-dialect disagreement must be **preserved and scoped**
- Line 73–80: TECOC is not authoritative for TOPS-20/TECO-64; capsule conflicts must be
  preserved, not normalized
- Line 141: documentation is a hypothesis source, not something that may overwrite
  experiment
- Lines 461–466: disagreements explicitly preserved, not normalized away

Casual reasoning would likely have collapsed similar TECO dialects into one model.
This project explicitly resists that.

### TECO domain boundary constraints

`projects/emacs-teco/domain/domain-teco.md:194-205` explicitly forbids overgeneralization:

- no universal dialect inference
- dead-branch scanning is not full parsing
- earlier broad models were too strong
- experiments establish behaviour, not internals

Lines 217–224 preserve unresolved implementation differences rather than pretending
they are settled. For example:

> "The capsules disagree about default search case sensitivity: one experiment set
> recorded lowercase-only matching, while a later capsule states case-insensitive
> default search. This remains unresolved and must not be silently normalized."

### Z80 example

`projects/z80-cpm/state/project-state.md:160-166` keeps the M80 default mode as a
**documentation-backed working model** rather than a verified conclusion.

**Assessment:** Yes—the epistemic discipline materially changes conclusions by forcing
**scope control, explicit uncertainty, and preservation of unresolved conflicts**.

---

## 4. Did the three-file structure preserve information better than typical conversation?

**Probably yes. This is the most convincing practical benefit.**

### The structure is explicitly complementary

- `protocol.md:171-212` defines the three artifacts and their distinct roles.
- `rationale.md:127-183` explains why the separation exists and why inconsistencies
  between the log and state are **diagnostically useful rather than errors to be fixed**.

### Real project evidence

The TECO project is the best proof:

- wrong assumption retained in log: `projects/emacs-teco/state/session-log.md:19-24`
- corrected accepted model in state: `projects/emacs-teco/state/project-state.md:87-92`

In a normal chat, the earlier mistake would usually be buried or overwritten.

The Z80 project explicitly labels promotion events:

- "Promoted to Project State" at `projects/z80-cpm/state/session-log.md:88`, `:107`, `:130`

This is a concrete mechanism for preserving provenance separately from accepted knowledge.

### Important caveat

In practice the repo grows **beyond three artifacts** when needed:

- TECO adds `projects/emacs-teco/state/documentation-teco-overview.md`
- MACRO-20 adds domain files under `projects/macro-20/domain/`

The three-file structure is a **good base**, but not always sufficient by itself.
The framework accommodates this gracefully.

**Assessment:** Yes, the structure improves preservation over ordinary conversation—but
real use tends to require project-specific auxiliary artifacts.

---

## 5. Is there explicit reflection on whether the protocol helped or hindered?

**Yes, but mostly in the meta-project and capsule comments, not as formal evaluation
in each domain project.**

### Evidence that it helped

- `projects/shared-reasoning/state/session-log.md:68-79`: collaboration increasingly
  challenged **evidence quality, scope, abstraction level, and retrieval success**,
  not just conclusions.
- `projects/learn-collaboration/state/session-log.md:11-16`: productive discussions
  often began with wrong or incomplete explanations that were preserved until evidence
  separated them.
- `projects/teco-merge/chat_4-suggestion.md:1-3`: the extraction format is
  "**working as intended**" because threads yield conceptual generators rather than
  command lists.
- `projects/teco-merge/chat_5-suggestion.md:5-7`: the extraction protocol helped
  preserve structural insights with "minimal incorrect inference."

### Evidence of friction

The MACRO capsule records actual friction:

- `capsules/macro-10.md:1028-1039` suggests the artifact model may be missing a
  distinct **conceptual-model** artifact (proposed `Mental-Model.md`).
- `capsules/macro-10.md:1041-1058` says the assistant **"rarely initiates maintenance
  based on perceived context load"** and recommends observable triggers instead.

These are important protocol failure observations, preserved in the format the protocol
prescribes: Observation → Hypothesis → Evidence.

**Assessment:** Yes, there is explicit reflection. It is mostly positive but not
uncritical. The project records its own friction.

---

## 6. Were domain knowledge capsules reused or merged smoothly?

**Partly. Reuse exists, but "smoothly" is an overstatement.**

### Evidence that reuse/merge worked

- `projects/teco-merge/README.md:1-6` documents an actual merge workflow across nine
  TECO chats.
- `projects/teco-merge/prompt-merge.md:20-45` and `:58-75` instructs the merger to
  treat capsules as independent observations and preserve disagreements.
- `projects/teco-merge/chat_4-suggestion.md:1-3`: the merge is cleaner because
  capsules capture conceptual generators rather than command lists.
- The merged result in `projects/emacs-teco/domain/domain-teco.md:5-8` and `:194-249`
  is a successful conceptual synthesis with preserved constraints and disagreements.

### Evidence that reuse was not seamless

- The merge flow is **manual and multi-step** (`projects/teco-merge/README.md:1-6`),
  not effortless.
- Capsule conflicts remain unresolved:
  - `projects/emacs-teco/state/documentation-teco-overview.md:78-80`
  - `projects/emacs-teco/domain/domain-teco.md:222-223`
- The Z80 project still lists "Initial domain knowledge capsules" as **deferred**
  (`projects/z80-cpm/state/project-state.md:170-177`; session-log lines 134–139),
  suggesting capsule reuse is not yet routine across all domains.

**Assessment:** Capsule reuse/merge is **promising and functional** within TECO, but
the evidence does not show a frictionless or fully scalable process yet.

---

## Summary

| Question | Answer |
|---|---|
| Protocol prevents errors / recovers from dead ends? | **Yes, in TECO**—wrong assumption preserved in log, corrected model in state |
| Project state demonstrates accumulated understanding? | **Yes, strongly**—TECO, MACRO-20, Z80 all show layered, curated knowledge bases |
| Epistemic discipline leads to different conclusions? | **Yes**—scope control, dialect separation, unresolved disagreements explicitly preserved |
| Three-file structure preserves information better? | **Yes, with caveats**—real projects need auxiliary artifacts; promotion events are explicit |
| Explicit reflection on protocol help/hindrance? | **Yes, both sides**—positive evidence plus recorded friction and unresolved suggestions |
| Capsule reuse smooth? | **Partially**—merge within TECO worked; not yet generalised across domains |

### What this is not

- There is no A/B comparison against ordinary chat
- There are no metrics: no recovery time, error rate, onboarding speed, or repetition count
- The project itself acknowledges limited evidence:
  `projects/shared-reasoning/state/project-state.md:91-97`:
  > "Evidence remains limited by small sample size and early adopters."

### Final verdict

**Useful and real, especially for long-running technical investigations—but not yet
empirically proven at scale.**

The framework improves continuity, knowledge preservation, and epistemic hygiene in
ways that casual LLM conversation does not. Whether those improvements are large
enough to justify the overhead for shorter or simpler investigations remains an open
question.
