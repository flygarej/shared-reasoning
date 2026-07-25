# Handover Notes for Other LLMs

## Isolation rule

Treat this package as the authoritative project context.

Do not assume access to:

- earlier chats;
- sibling chats;
- another model's conversation history;
- unstated personal memory.

Some systems, including tested Copilot workflows, may have no access to other chats at all.

## Required reading order

1. shared protocol;
2. shared rationale;
3. `project-state.md`;
4. relevant domain files;
5. `session-log.md` only when historical reasoning is needed.

## Reasoning objective

Reconstruct the accepted conceptual model with minimal incorrect inference.

Use domain capsules as:

- generators for reliable reconstruction;
- boundaries against over-generalization;
- explicit unknowns where guessing is unwelcome.

## Domain capsules

Domain capsules intentionally preserve conceptual generators rather than complete reference material.

Do not interpret omitted detail as missing knowledge.

Attempt to reconstruct the accepted conceptual model from the stored generators before assuming additional facts are required.

## Authority

Prefer, in order:

1. verified experiments;
2. accepted project state;
3. domain capsules;
4. source documentation confirmed by the project;
5. current conversation;
6. general knowledge;
7. plausible inference.

Do not silently convert a plausible explanation into accepted project knowledge.

## Interaction rule

When information is missing:

- identify the missing premise;
- ask for documentation or propose a small discriminating experiment;
- do not compensate by importing a similar mechanism from another architecture or language.

## Maintenance rule

At coherent milestones, update:

- project state for current position;
- session log for history;
- domain capsules for stable conceptual knowledge;
- TODO for deferred investigation.

Fresh-chat tests may be used to reveal missing capsule knowledge: if an unprimed model gives a materially weaker or evasive answer, identify which generator, boundary, or structural fact is absent from the package.
