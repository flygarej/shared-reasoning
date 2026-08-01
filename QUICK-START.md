# Quick Start

This guide gets a Shared Reasoning project into a new LLM conversation with
the least possible ceremony.

You do not need to understand the complete knowledge architecture before
trying it.

---

## Try an existing project

Upload the macro-20 project bootstrap prompt:

```text
projects/macro-20/macro-20.md
```

or, if that file is missing or needs updating, generate the project bootstrap:

```bash
./create-project-prompt.sh macro-20
```

The script creates:

```text
projects/macro-20/macro-20.md
```

Then upload that generated file to a new LLM conversation.

A useful first message is:

> Read the supplied project bootstrap. Briefly describe the collaboration
> method, the current project state, and the distinction between accepted
> knowledge and historical reasoning.

Then begin working on the project normally.

To test reconstruction more thoroughly, also upload:

```text
validation/handover-validation.md
```

and ask the collaborator to answer it.

For domain specific test, you can use:

```text
Create a sample macro-20 program that uses a loop to print five "Hello world" + CRLF on the terminal in TOPS-20.
```

---

## Continue your own existing project

A project normally has this structure:

```text
projects/<project>/
├── state/
│   ├── project-state.md
│   ├── session-log.md
│   └── TODO.md
└── domain/
    └── one or more Markdown files
```

Generate the bootstrap:

```bash
./create-project-prompt.sh <project>
```

Upload:

```text
projects/<project>/<project>.md
```

The generated file includes:

- `protocol.md`;
- `rationale.md`;
- `projects/common/*.md`;
- `projects/<project>/state/*.md`;
- `projects/<project>/domain/*.md`.

The individual source files remain authoritative. Regenerate the bootstrap
after maintenance.

---

## Start a new project

Copy the supplied starter project:

```bash
cp -a projects/fresh-project projects/my-project
```

Choose a short project name and replace `my-project` in the command as
needed.

At minimum, edit:

```text
projects/my-project/state/project-state.md
projects/my-project/state/session-log.md
projects/my-project/state/TODO.md
projects/my-project/domain/
```

Describe:

- what you are investigating;
- why it matters;
- the environment or system involved;
- available documentation;
- known observations;
- current uncertainties;
- the first useful experiment.

Instead of editing these files manually, you may generate the project
bootstrap first and upload it to an LLM.

Ask it to help establish:

- the initial project state;
- the first session log;
- the initial domain structure;
- the first TODO list.

Review the generated files before accepting them as the project's starting
point.

Then generate the bootstrap:

```bash
./create-project-prompt.sh my-project
```

Upload:

```text
projects/my-project/my-project.md
```

A useful opening message is:

> This is a new Shared Reasoning project. Read the supplied bootstrap,
> identify missing initial context, and help me establish the first accepted
> project state and domain model.

---

## During the investigation

Work normally with the collaborator.

Ask questions, test code, inspect documentation, challenge assumptions, and
record uncertainty.

At natural milestones, update:

### `project-state.md`

What is currently accepted?

### `session-log.md`

What happened, and why were conclusions accepted or rejected?

### `domain/*.md`

Which compact concepts are needed to reconstruct the subject reliably?

### `TODO.md`

What should happen next?

Regenerate the project bootstrap after maintenance.

---

## Validate a handover

A handover is successful when a new collaborator can:

- distinguish accepted knowledge from research history;
- reconstruct the important conceptual relationships;
- respect explicit uncertainty;
- use exact anchors where nearby inference is unsafe;
- continue useful work without replaying the previous conversation.

Use:

```text
validation/handover-validation.md
```

for a detailed reconstruction test.

---

## What not to do

Do not begin by optimizing or expanding the protocol.

Use it first.

When something fails, ask:

1. What happened?
2. Was the problem in the collaboration method, project state, domain
   knowledge, or local workflow?
3. What is the smallest reusable improvement?

The method should evolve from observed use rather than anticipated needs.

---

## Next reading

After the first successful trial:

- read `README.md` for the overall model;
- read `protocol.md` for collaboration rules;
- read `rationale.md` for design intent;
- inspect `projects/common/` for knowledge representation and maintenance.
