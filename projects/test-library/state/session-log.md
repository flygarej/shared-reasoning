# session-log.md

## 2026-08-18 — Initial `test-library` exploration

### Project purpose established

Created `test-library` as a meta-project for exploring ChatGPT/LLM capabilities using persistent Library storage as a cache for project state and domain knowledge.

### Cache authority boundary discovered

The first cache population included the full monolithic prompt stack. Discussion exposed a dangerous self-modification path: if the cache-maintaining collaborator owned `protocol.md`, `rationale.md`, and common framework artefacts, an erroneous maintenance step could modify the rules governing its own future maintenance.

Decision: preserve the existing authority split. The user maintains framework/common material in the authoritative local/Git repository; the LLM-side Library cache holds project-specific state/domain/references when requested. Framework changes can be tested on Git branches before mutual acceptance and merge.

### Persistence without Library

Considered how Shared Reasoning should operate for a collaborator with no LLM-side persistent storage. The desired invariant was identified: maintenance semantics and artefact identities remain unchanged; only responsibility for persistence crosses to the human collaborator.

This led to a new `Persistence Boundary` section in `common/knowledge-maintenance.md`: when persistent project storage is unavailable, changed artefacts should be returned with stable filenames and expected project-relative paths for local replacement.

### Reconstruction review connection

A no-persistence walkthrough revealed that the first inferred workflow stopped after local replacement and bootstrap regeneration; it did not initially suggest returning the regenerated monolith for validation.

Rather than expanding the Persistence Boundary, the existing `Reconstruction Check` was extended: after substantial maintenance across a persistence boundary, regenerate the bootstrap and, when practical, review the assembled result before handover.

This check immediately proved useful. Review of regenerated monoliths caught first a duplicated `Reconstruction Check` section and then a malformed `## ## Reconstruction Check` heading. Both were corrected in the user's authoritative local framework.

### References versus curated knowledge

Discussion confirmed that references should remain below state/domain in epistemic status. A discovered manual or document may be relevant, obsolete, version-specific, or misunderstood. It becomes grounding for state/domain only after relevance/scope/authority are checked and the resulting understanding is verified or explicitly accepted.

### Naïve-user and portability tests proposed

The framework should ideally let a user collaborate without administering its internal knowledge architecture. Proposed tests include:

- a fresh chat explicitly denied Library/persistent storage, without telling it the fallback behavior;
- a deliberately naïve user who never says "state", "domain", "promotion", etc.;
- comparison across LLM/product environments to observe whether the same project context produces collaboration, uncertainty lifting, or premature solution convergence.

### Ambiguity failure observed

During discussion of possible workplace uses, the user said it was good that Shared Reasoning was placed in `PD`. The assistant confidently interpreted `PD` as "Professional Development"; the intended meaning was "Public Domain".

This was accepted as a small, clean example of an inference failure: an ambiguous abbreviation had a plausible contextual expansion, but ambiguity was not surfaced before the inference was treated as resolved.

### Learning/onboarding direction

A possible future application emerged: mature domain knowledge curated from senior experience could be cloned/forked into an individual learning project while keeping learner state separate. Repeated learner failures could then expose weak generators, missing anchors, or uncaptured tribal knowledge in the shared domain.

This remains a future experiment rather than an accepted framework requirement.

### Maintenance decision

The project has accumulated enough accepted meta-knowledge to replace its bootstrap placeholders. Preserve the technical/meta findings above; leave conversational meanders in conversation history unless they expose a reusable reasoning failure (as the `PD` example did).
