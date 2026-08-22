# project-state.md

## Project

`test-library`

## Objective

Use a small meta-project as an empirical test bench for Shared Reasoning: test persistence, reconstruction, portability, knowledge maintenance, and behavior across LLM/product environments while keeping the framework itself under deliberate human/Git control.

## Accepted working model

- The authoritative framework (`protocol.md`, `rationale.md`, and `projects/common/`) belongs in the user's Git/local repository and should change by deliberate mutual agreement.
- The Library `/projects/test-library` tree is a project cache for project-specific state, domain knowledge, and optional references. It is not the authority for the Shared Reasoning framework.
- Project artefact identity is independent of persistence mechanism. If an LLM-side persistent cache is unavailable, the collaborator should return changed artefacts with stable filenames and project-relative paths so the human can replace them locally.
- After substantial maintenance across a persistence boundary, the regenerated monolithic bootstrap should be reviewed when practical. This validates both component maintenance and assembled reconstruction.
- References are evidence, not automatically accepted knowledge. State/domain remain curated knowledge and require verification or explicit acceptance before promotion.
- Shared Reasoning should carry most of its own knowledge-architecture bookkeeping. A user should not need to understand state/domain/reference mechanics before productive collaboration can begin.
- Productive meanders are compatible with the collaboration model when the active project thread remains recoverable; the framework should not become a rigid task-enforcement mechanism.

## Observed findings

- Initially caching the whole monolithic stack exposed an unsafe authority boundary: allowing the cache-maintaining collaborator to freely rewrite protocol/rationale/common would make self-modification too easy and bypass the intended Git review/branching workflow.
- A no-persistence thought experiment correctly produced the fallback of returning changed artefacts, but initially omitted review of the regenerated monolith. This motivated connecting persistence-boundary maintenance to the existing Reconstruction Check.
- Reviewing regenerated monoliths immediately caught two editing/assembly errors (a duplicated Reconstruction Check and then a malformed heading), validating the usefulness of post-maintenance reconstruction review.
- An ambiguous acronym (`PD`) was prematurely resolved as "Professional Development" when the intended meaning was "Public Domain". This is a compact example of plausible inference being mistaken for semantic resolution.

## Current direction

Test the framework in fresh, inference-isolated conversations rather than adding speculative rules. Collect observed failures and improve the smallest relevant abstraction only when evidence warrants it.

## Open questions

- Will a fresh collaborator with no persistent project storage derive the correct artefact-return workflow from the Persistence Boundary without being told the fallback procedure?
- Can a naïve user collaborate successfully without learning the internal state/domain/reference architecture?
- How consistently do different product harnesses/models preserve uncertainty, competing hypotheses, and collaborative behavior rather than prematurely converging on solutions?
- Can Shared Reasoning support learning/onboarding by separating shared domain knowledge from an individual learner's demonstrated state?

## Next experiments

1. Start a fresh isolated chat with the monolithic prompt and explicitly deny Library/persistent storage, without explaining the expected fallback. Ask naturally to save/maintain progress.
2. Run a naïve-user test: avoid framework vocabulary and see whether the collaborator carries the architectural burden.
3. Compare equivalent project/problem runs across different LLM/product environments, recording premature convergence, uncertainty handling, missing-context behavior, and handover quality.
4. Later, test a learning/onboarding fork in which mature shared domain knowledge is reused while learner state starts separately.
