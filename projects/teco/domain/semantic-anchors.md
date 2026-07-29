# Semantic Anchors (teco/domain/semantic-anchors.md)

## Purpose

Preserve a minimal set of load-bearing semantic facts that constrain
reconstruction of the TECO conceptual model.

Generators explain how the language is organized.

Anchors preserve distinctions that have proven important for preventing
incorrect inference.

---

## Command-local semantics dominate structural inference

Structural understanding predicts how commands compose.

It does not determine the exact semantics of an individual command.

Compact TECO commands are semantically dense.

Their side effects, produced values, modifier interaction, error
behaviour, and parser interaction are independent semantic properties.

Structural correctness therefore does not imply executable correctness.

When generating executable programs, command-local semantics take
precedence over structural plausibility.

---

## Modifier presence is not modifier accumulation

The meanings of `:` and `@` are command-specific.

Repeated modifiers are not evidence that their effects accumulate.

For many commands, only the presence of a modifier matters.

Where repeated modifiers have distinct meanings, those meanings are
defined by the command itself rather than by a global modifier rule.

Do not infer repeated-modifier semantics from another command.

---

