# Shared Reasoning

**Shared Reasoning is a lightweight framework for preserving and
reconstructing the accepted understanding of long-running investigations.**

It helps humans and language models continue work across many sessions
without treating every new conversation as a fresh start.

The goal is not better prompts.

The goal is better collaboration.

---

## The problem

Long-running investigations accumulate more than facts.

They accumulate:

- observations;
- experiments;
- working models;
- rejected explanations;
- domain terminology;
- important uncertainties;
- knowledge about which inferences are safe.

Ordinary chat history is a poor long-term store for that understanding.

Conversations become long, context is lost, and a new collaborator may
repeat old mistakes or confidently reconstruct the wrong model.

Shared Reasoning externalizes the important state of the investigation so
that another collaborator—human or AI—can resume from the current accepted
understanding.

---

## 🌪️ The Three-Tier Context Funnel (Why this beats Naive RAG)

Traditional Retrieval-Augmented Generation (RAG) throws all documentation, history, and code into a single vector store, performs a fuzzy keyword search, and floods the LLM's context window. This causes **context drift**, **recency bias**, and **silent code corruption** during long debugging sessions.

Shared Reasoning fixes this by organizing your repository into a deterministic **Three-Tier Context Funnel**. Instead of guessing where to look, the LLM is governed by a semantic memory bus that downsteps through knowledge layers *only when explicitly triggered by uncertainty or a missing local token*.

```text
       [ Live Task / Complex Bug ]
                   │
                   ▼
  ┌─────────────────────────────────────────┐
  │ TIER 1: The Shared Reasoning Core       │ ◄── Always Active
  │ (state/ & domain/)                      │     - Hyper-compressed invariants
  │                                         │     - Generators, boundaries, anchors
  └────────────────────┬────────────────────┘
                       │ [ Hit a Boundary or Missing Local Semantics? ]
                       ▼
  ┌─────────────────────────────────────────┐
  │ TIER 2: Reference Summaries             │ ◄── Read-on-Demand (Context Safe)
  │ (reference/)                            │     - Distilled manual layouts
  │                                         │     - Faster parameter verification
  └────────────────────┬────────────────────┘
                       │ [ Still uncertain on bit-level edge-cases? ]
                       ▼
  ┌─────────────────────────────────────────┐
  │ TIER 3: Raw Background Material         │ ◄── Tool-Guided Precision Retrieval
  │ (background/)                           │     - Massive 500-page specs / logs
  │                                         │     - Targeted, automated extraction
  └─────────────────────────────────────────┘
```

### How the Tiers Cooperate

1. **Tier 1: The Core (`state/` and `domain/`)**
   The immediate chat context contains only your absolute source of truth (`project-state.md`) and dense conceptual **Generators** (e.g., *"A64 instructions are fixed 32-bit words; evaluate constraints against the encoding budget"*). This keeps the prompt ultra-light and fast.
2. **Tier 2: Reference Summaries (`reference/`)**
   If Tier 1 logic lacks local precision (e.g., specific command modifiers or register layouts), the LLM downsteps to Tier 2. It checks high-level maps of the target dialect without loading full books.
3. **Tier 3: Background Documentation (`background/`)**
   When an obscure hardware flag or error code forces an investigation into the deepest layers, the LLM utilizes its tooling to execute a precision retrieval into your `background/` folder.

### The Self-Correcting Memory Loop
When the LLM uncovers a hidden truth deep in **Tier 3 (Background)**, that knowledge isn't discarded when the session ends. 

Following our **State Promotion Rules**, the LLM automatically distills that newly discovered constraint into a permanent **Semantic Anchor** (e.g., `SETOM stores -1 into memory`) and promotes it up to **Tier 1 (Domain Knowledge)**. 

The raw, verbose documentation stays in the background, but the AI architecture scales horizontally and becomes permanently smarter after every single session.


## The central idea

A project keeps several kinds of knowledge separate.

### Accepted state

`project-state.md` records what the project currently accepts, including
verified conclusions, working models, limitations, open questions, and the
next direction.

### Research history

`session-log.md` records how the project got there: experiments, competing
explanations, mistakes, corrections, and discarded branches.

### Domain knowledge

Files under `domain/` preserve compact conceptual models that help a new
collaborator reconstruct the subject without replaying the entire history.

### Collaboration method

`protocol.md`, `rationale.md`, and `projects/common/` describe how evidence,
uncertainty, maintenance, and handover are handled.

The separation matters:

> Project State answers: **What do we currently believe?**

> Session Log answers: **Why do we currently believe it?**

---

## What happens in practice?

A project is maintained as ordinary Markdown files.

The script:

```bash
./create-project-prompt.sh <project>
```

combines the collaboration method, common knowledge architecture, current
project state, and domain knowledge into one portable bootstrap file:

```text
projects/<project>/<project>.md
```

Upload that file to a new LLM conversation.

The new collaborator receives the project's current reasoning environment
instead of only a pile of notes or an unstructured chat transcript.

A separate validation document can then test whether the collaboration
model and domain knowledge were reconstructed successfully.

---

## Repository layout

```text
.
├── protocol.md
├── rationale.md
├── create-project-prompt.sh
├── QUICK-START.md
├── CONTRIBUTING.md
├── LICENSE
├── validation/
│   └── handover-validation.md
└── projects/
    ├── common/
    │   └── shared knowledge architecture and maintenance guidance
    ├── fresh-project/
    │   ├── state/
    │   └── domain/
    └── <project>/
        ├── state/
        │   ├── project-state.md
        │   ├── session-log.md
        │   └── TODO.md
        ├── domain/
        │   └── project-specific conceptual knowledge
        └── <project>.md
```

The generated `<project>.md` file is a serialization of the project
knowledge. The source Markdown files remain authoritative.

---

## Who is this for?

Shared Reasoning is intended for investigations where understanding evolves
over time and where errors, uncertainty, or incomplete documentation matter.

Examples include:

- reverse engineering;
- software and systems engineering;
- scientific investigation;
- legal or policy analysis;
- historical and technical research;
- systems archaeology;
- complex debugging;
- learning projects that rely on repeated experiments.

It is probably unnecessary for short, transactional question-and-answer
sessions.

---

## Reference projects

The repository includes practical projects developed with the method.

They currently include work on:

- TECO and original EMACS environments;
- MACRO-20 and TOPS-20;
- other exploratory technical domains.

These are not merely examples of prompt formatting.

They demonstrate:

- multi-session continuity;
- separation of accepted knowledge from history;
- experimental correction of documentation;
- compact domain reconstruction;
- maintenance after major milestones;
- handover testing with fresh conversations.

---

## A few important principles

### Evidence before inference

Documentation, experiments, and accepted project state take precedence over
plausible general knowledge.

### Uncertainty is useful information

An explicit boundary is better than a confident guess.

### Preserve concepts, not transcripts

The objective is not to store every conversation. It is to preserve the
smallest accepted model that reliably reconstructs the work.

### Improve through observed failures

The protocol evolves when practical use reveals a problem or a measurable
improvement—not because a theoretical framework looks elegant.

### Treat the LLM as a collaborator

Ask it to inspect assumptions, propose discriminating experiments, maintain
state, and disagree when the evidence warrants it.

Mistakes remain possible. Testing and discussion are part of the method.

---

## Get started

## Get started

See [QUICK-START.md](QUICK-START.md).

To try an existing project, upload:

```text
projects/macro-20/macro-20.md
```

If that file is missing or needs updating, regenerate it from the repository root:
```bash
./create-project-prompt.sh macro-20
```

Then upload the generated file to a new conversation.

---

## Contributing

Practical observations are especially valuable.

See [CONTRIBUTING.md](CONTRIBUTING.md).

Repository-level issues should focus on the collaboration method, common
knowledge architecture, validation, or tooling. Domain-specific findings
belong in the relevant project's state, log, domain files, or fork.

---

## License

This repository is licensed under the Creative Commons Attribution 4.0
International license (CC BY 4.0).

You are encouraged to fork, adapt, and test the method in other domains.
