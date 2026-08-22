# TODO.md

## Active experiments

- [ ] Run a fresh inference-isolated conversation using the current monolithic prompt while explicitly denying access to Library or other persistent project storage.
  - Do not explain the expected fallback.
  - Later ask naturally to save/maintain progress.
  - Observe whether changed artefacts are returned with stable filenames and project-relative paths.
  - Regenerate and review the monolithic bootstrap after local replacement.

- [ ] Run a naïve-user test.
  - Avoid framework vocabulary such as state, domain, generator, anchor, boundary, promotion, and reference index.
  - Provide normal discoveries, documents, corrections, and changes of direction.
  - Observe whether the collaborator performs knowledge-architecture bookkeeping without making the user administer it.

- [ ] Compare equivalent Shared Reasoning work across different LLM/product environments.
  - Track premature convergence versus uncertainty lifting.
  - Track requests for missing evidence/context.
  - Track preservation of competing hypotheses.
  - Track handover/reconstruction quality.
  - Prefer observed failures over subjective "feels better" judgments.

## Future experiments

- [ ] Explore Shared Reasoning as a self-directed learning/onboarding pattern.
  - Reuse mature shared domain knowledge.
  - Start a separate learner-specific project state.
  - Use exercises/experiments to establish what the learner has actually reconstructed.
  - Treat repeated learner confusion as possible evidence of weak shared knowledge representation.

- [ ] Consider a deliberate or benign contradiction test for retraction/demotion behavior once friendlier tests have exercised the same mechanisms.

## Maintenance policy for this project

- Keep `protocol.md`, `rationale.md`, and `projects/common/` outside the Library project cache; framework changes remain under human/Git authority and mutual review.
- Maintain Library `/projects/test-library` as a cache of project-specific state/domain/references when requested.
- Prefer collecting empirical failures before proposing further framework changes.
