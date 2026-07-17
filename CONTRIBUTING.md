# CONTRIBUTING.md

## Welcome

Thanks for contributing.

This repository is designed for collaborative research in domains where documentation may be sparse, inconsistent, or unreliable (for example: legacy system/code archaeology).

Primary objective: **improve shared understanding with traceable evidence**.

---

## Ground rules

Before contributing, read:

1. `Protocol.md`
2. `RATIONALE.md`
3. `QUICK-START.md`
4. relevant project `Project-State.md`
5. relevant project `Session-Log.md` (latest entries first)

If these conflict, follow authority order defined in `Protocol.md`.

---

## Repository model

This repo uses stable artefact identities:

- `Protocol.md` → collaboration method (changes rarely)
- `Project-State.md` → current accepted project understanding
- `Session-Log.md` → chronological reasoning and experiments

Do not create derivative filenames for normal maintenance (no suffixes/timestamps) unless explicitly requested by maintainers.

---

## What to contribute

Good contributions include:

- new observations from source material or experiments
- explicit competing hypotheses
- contradiction reports
- smallest discriminating experiment proposals
- careful maintenance updates to project artefacts

Avoid “polished certainty” without evidence.

---

## Epistemic labeling (required)

Label substantive claims as one of:

- Observation
- Documentation
- Inference
- Hypothesis
- Prediction
- Verified Conclusion

Do not silently promote one category into another.

---

## Promotion policy: Session-Log vs Project-State

### Keep in `Session-Log.md` when work is still exploratory:

- intermediate reasoning
- tentative hypotheses
- dead ends
- unresolved contradictions
- unverified interpretations

### Promote to `Project-State.md` only when:

- experimentally verified, **or**
- explicitly accepted as current working model

When promoting, include scope/limits and remaining uncertainty.

---

## Minimal evidence block (recommended)

Use this compact format in issues, PRs, or notes:

- **Claim**:
- **Type**: Observation / Inference / Hypothesis / etc.
- **Evidence**:
- **Confidence**: Low / Medium / High
- **Scope**:
- **Contradictions**:
- **Next check**:

---

## Pull request expectations

A PR should clearly state:

1. **Operation type**: Bootstrap / Maintenance / Handover / Reconstruction
2. **What changed**
3. **Why it changed**
4. **Evidence basis**
5. **What remains uncertain**
6. **Recommended next step**

If updating `Project-State.md`, include a short “promotion rationale”.

---

## Preferred workflow

1. Open an issue (or discussion) for non-trivial changes.
2. State operation + scope before large edits.
3. Keep commits focused and reversible.
4. Preserve rejected paths in `Session-Log.md` (don’t erase useful dead ends).
5. Ask for review when uncertainty is high.

---

## Forking & specialization

Forks are encouraged for domain-specific adaptations.

If you specialize a fork:

- preserve core artefact identities
- document protocol deviations explicitly
- keep epistemic discipline and uncertainty labeling
- provide migration notes if terminology changes

Upstream sync is easier when structure and naming remain stable.

---

## Anti-patterns (please avoid)

- Treating legacy docs as unquestioned truth
- Replacing project evidence with generic prior knowledge
- Dropping contradictory evidence to “tidy” narrative
- Editing Project-State without explicit acceptance basis
- Process-heavy changes that increase friction without better outcomes

---

## Review criteria

Contributions are evaluated on:

- evidence quality
- clarity of uncertainty
- traceability of reasoning
- reversibility of decisions
- reduction of workflow friction
- net improvement in shared project understanding

---

## Maintainer note

This is a canonical repository.  
Contributors are welcome; forks for specialization are welcome; clarity and evidence are mandatory.
