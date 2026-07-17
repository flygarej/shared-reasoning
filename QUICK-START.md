# QUICK-START.md

## Purpose

This document helps a new collaborator become productive quickly in a project that uses this protocol for research under sparse, vague, or unreliable documentation.

Goal: contribute useful work **without** polluting project state with unverified assumptions.

---

## 0) Collaboration model in one minute

This repository separates collaboration into stable artefacts:

- **Protocol.md**: how we reason together (stable method)
- **Project-State.md**: current accepted project understanding (authoritative project knowledge)
- **Session-Log.md**: chronological work history (experiments, dead ends, decisions)

Rule of thumb:

- Put **accepted current understanding** in Project-State.
- Put **everything else** in Session-Log until accepted.

---

## 1) First 15 minutes (mandatory reading order)

Read in this order:

1. `Protocol.md`
2. `RATIONALE.md`
3. `TODO.md` (if present)
4. project-specific `Project-State.md`
5. project-specific `Session-Log.md` (at least latest entries)

As you read, extract:

- project scope
- current working model(s)
- open questions
- active uncertainties
- next intended experiments

If scope or operation is unclear, stop and clarify before making assumptions.

---

## 2) Allowed operations

Before doing work, explicitly state which operation you are performing:

- **Bootstrap**: start a new project
- **Maintenance**: advance existing artefacts
- **Handover**: resume from prior artefacts
- **Reconstruction**: rebuild state from historical notes/conversations

Do not mix operations silently.

---

## 3) Evidence discipline (non-optional)

When adding claims, label them as one of:

- Observation
- Documentation
- Inference
- Hypothesis
- Prediction
- Verified Conclusion

Never silently upgrade one category to another.

If docs and experiments disagree:

1. record disagreement,
2. preserve competing explanations,
3. propose the smallest discriminating experiment.

---

## 4) What goes where

### Add to Project-State.md only when:

- experimentally verified, or
- explicitly accepted as current understanding, or
- intentionally recorded as a working model.

### Add to Session-Log.md:

- experiments run,
- assumptions considered,
- rejected ideas,
- dead ends,
- intermediate reasoning,
- pending checks.

Session-Log is traceability.  
Project-State is the current map.

---

## 5) Minimal contribution format

When contributing findings, use this compact structure:

- **Claim**: (one sentence)
- **Type**: Observation / Inference / Hypothesis / etc.
- **Evidence**: (files, behaviour, test, notes, source)
- **Confidence**: Low / Medium / High
- **Scope**: where this holds
- **Contradictions**: what does not fit
- **Next check**: smallest action to reduce uncertainty

This keeps collaboration consistent across people and forks.

---

## 6) Promotion checklist (before editing Project-State)

Promote only if all are true:

- [ ] Claim is evidence-backed or explicitly accepted as a working model
- [ ] Competing explanations are preserved (or explicitly retired)
- [ ] Scope and limits are stated
- [ ] Contradictions are documented
- [ ] A next validation step exists (if uncertainty remains)

If any box is unchecked, keep it in Session-Log for now.

---

## 7) Forking and specialization policy

This repository is the canonical base protocol.

Forks are encouraged for domain specialization.  
When forking:

- preserve artefact identities (`Protocol.md`, `Project-State.md`, `Session-Log.md`)
- document intentional protocol deviations explicitly
- avoid changing terminology without a migration note
- keep epistemic labeling intact

---

## 8) Anti-patterns to avoid

- Treating old documentation as ground truth.
- Writing polished conclusions without evidence trail.
- Deleting failed hypotheses (they prevent repeated mistakes).
- Moving fast by skipping uncertainty labels.
- Letting Session-Log become authoritative over Project-State.

---

## 9) Suggested first task for a new collaborator

1. Read required files.
2. Summarize current project state in 10 bullets.
3. List top 3 uncertainties.
4. Propose 1 smallest discriminating experiment.
5. Wait for confirmation before promoting new state.

This is usually enough to align collaboration quality quickly.

---

## 10) Definition of done (for a session)

A session is “done” when:

- new evidence is logged,
- accepted updates (if any) are reflected in Project-State,
- unresolved items are explicit,
- next step is unambiguous for the next contributor.

---

## TL;DR

Be explicit, evidence-first, uncertainty-aware, and reversible.  
Optimize for becoming less wrong over time, not sounding certain.
