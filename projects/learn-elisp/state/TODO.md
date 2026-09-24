# Fresh Project TODO

## Goal

Establish enough accepted project knowledge that another collaborator can
continue the investigation without replaying the original conversation.

---

## Initial setup

- Choose a short project name.
- Rename or copy `projects/fresh-project` to `projects/<project>`.
- Confirm that the repository contains:
  - `protocol.md`;
  - `rationale.md`;
  - `create-project-prompt.sh`;
  - `validation/handover-validation.md`;
  - `projects/common/`.

---

## Establish the project

Update `state/project-state.md` with:

- project name;
- objective;
- scope;
- known environment;
- available evidence and documentation;
- accepted observations;
- current working models;
- explicit unknowns;
- next useful experiment.

Update `state/session-log.md` with the initial discussion, evidence, decisions,
and unresolved alternatives.

Create one or more files under `domain/` when stable conceptual knowledge
begins to emerge.

Start small. A single domain file is sufficient.

---

## During the first session

- Distinguish observation, documentation, inference, hypothesis, working
  model, and verified conclusion.
- Ask for missing factual or conceptual context.
- Prefer a small discriminating experiment over speculative expansion.
- Keep unresolved alternatives visible.
- Do not create a large domain taxonomy before the investigation requires it.

---

## Generate the bootstrap

Run:

```bash
./create-project-prompt.sh <project>
```

Confirm that this creates:

```text
projects/<project>/<project>.md
```

Upload the generated file to a new conversation.

---

## Validate reconstruction

Use:

```text
validation/handover-validation.md
```

A successful handover should demonstrate that the new collaborator can:

- identify the current accepted state;
- distinguish state from history;
- reconstruct important conceptual relationships;
- respect uncertainty and boundaries;
- begin productive work.

Record any reconstruction failure.

Use observed failures to improve the smallest relevant project or common
artefact.

---

## After validation

- Correct missing or misleading project knowledge.
- Regenerate the bootstrap.
- Continue the investigation.
- Perform maintenance at natural milestones.
- Compact only after successful reconstruction has been demonstrated.

---

## Bootstrap Completion

Once the project has completed its first successful maintenance:

- Replace state/TODO.md with the contents of state/standard-project-TODO.md, 
  then delete state/standard-project-TODO.md.
- Remove bootstrap-specific instructions that no longer apply.
- Keep only work items relevant to the active project.

The TODO should thereafter function as the project's active work queue,
not as bootstrap documentation.

