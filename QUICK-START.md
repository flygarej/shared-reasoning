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

You may generate the project bootstrap first (bash create-project-prompt.sh my-project) and upload it to an LLM.

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

If you prefer to edit the initial state yourself, edit:

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

---

## Step by step

### Create a new project

Assume you want to brush up your perl skills, with the AI in a collaborator role.

```bash
cd <root of this repo clone>
cp -r projects/fresh-project projects/learn-perl
bash create-project-prompt.sh learn-perl
ls -R projects/learn-perl
```

learn-perl should have a prompt learn-perl.md in the root, and state should contain TODO.md, session-log.md and project-state.md.
domain folder is empty.

#### Set up cache if available

OpenAI provides a library that's available to the LLM.
Create library/projects/learn-perl and create domain and state folders.

#### Start with the prompt

Upload the learn-perl.md and state something along the lines of:
```text
This is your prompt. Describe current project status and if there are inconsistencies in the prompt.
```

You should get a response stating that this is a new project that needs to be bootstrapped.

#### Set up cache and/or handling of domain/state.

If you have a library available to the LLM, state:
```text
Project name is learn-perl.
Your cache is in the library with path projects/learn-perl. The state and domain folder is currently
empty but after bootstrap you can write current domain and state there.
```

If you do not have a library, state:
```text
Project name is learn-perl.
In this project we do not have a cache available to you, so during maintenance I will need the updated
domain and state files  as downloadable markdown files.
```

#### Bootstrap

Let the LLM know the project goal, expectations and what environment you have to test ideas in.

```text
This project will be aimed at brushing up my perl skills and hopefully learn something new.
I will be running perl in Ubuntu, and perl -v responds:

"This is perl 5, version 38, subversion 2 (v5.38.2) built for x86_64-linux-gnu-thread-multi
(with 64 registered patches, see perl -V for more detail)"

Is this enough information for you to bootstrap, or do you need anything else?
```

A typical response would be:

```text
Yes. That is enough to bootstrap learn-perl without inventing anything we don't yet know.

I would establish the initial project state roughly as follows: the objective is to refresh existing Perl
skills while deliberately looking for things you haven't learned before; this is therefore not a beginner-from-zero course.
 The verified execution environment is Ubuntu, x86_64, Perl 5.38.2, threaded build.
We have not yet established which parts of Perl you remember well, which are rusty, or which areas are genuinely new, s
o those should remain explicit unknowns rather than assumptions.

For the learning approach, the existing Shared Reasoning machinery gives us a particularly nice path:
use small exercises and experiments to reveal your current knowledge, then let the curriculum emerge from the results.
 That avoids spending three sessions patiently explaining $scalar, @array, and %hash to someone who may
immediately start throwing references and regexes back at me.

A sensible initial working model would therefore be: start with compact exercises covering ordinary modern Perl usage,
 use your solutions to identify rusty/new areas, and progressively deepen from there.
We can promote stable Perl concepts into domain/ as they become useful, while project-state.md tracks what we've covered,
the environment, current direction, and open areas.

Things like whether your historical Perl usage was mostly scripting, sysadmin work, text processing, OO Perl, modules,
etc. would certainly help later, but I don't need them to bootstrap.
We can discover that naturally through the first exercises.

So: bootstrap information is sufficient. We can now replace the fresh-project placeholders and begin the project proper.
```

##### Create and (if needed) download the bootstrap files

```text
Great, create the bootstrap files in the cache. I will download them later.
```
or
```text
Great, create the bootstrap files as downloadable markdown for me.
```

The files should now be created. If using cache, check that the files are created (in projects/learn-perl/state) and
download them. If given the files to download manually, overwrite the files in projects/learn-perl/state.
If you want you can now recreate the prompt and test it in a new chat, the LLM should know this is a perl project
for self learning.

### Starting an existing project

#### Create an up-to-date prompt for the project

in top level of repo, do
```bash
bash create-project-prompt.sh macro-20
```
to create a current and up-to-date prompt. In this case the file projects/macro-20/macro-20.md will be created.

#### If needed, transfer project files to library cache

In this example, recreate and transfer all the folders and files under local projects/macro-20 *EXCEPT* the created
prompt macro-20.md. This will ensure the LLM can update state, domain, references and background materials if
needed.

#### Upload the prompt and validate it

Upload macro-20.md and tell the LLM it is the prompt to use, describe the project purpose etc.

#### Test the prompt

Ask the LLM to either produce a program or analyze code.

```text
Create a macro-20 program that uses sane aliases for accumulators used, reads a number and a string from the terminal using COMND
and then loops the given number of times, printing "Hello <string given>" with a CRLF after each line.
```

or

```text
Analyze the program pasted and tell me what it does.
```
