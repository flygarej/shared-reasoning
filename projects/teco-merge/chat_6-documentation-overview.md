# documentation-overview.md

# Documentation Overview

## Dan Murphy — "TECO becomes a programming language"

### Covers

- Evolution of TECO from editor to programmable system.
- Introduction of text variables.
- Introduction of macro execution.
- Historical motivation for Q-registers and loops.

### Reliability

High.

Primary source written by TECO's original author.

### Limitations

Historical narrative rather than implementation specification.

Does not describe parser internals or execution algorithm.

### Agreements

Strongly supports accepted stream-interpreter model by describing `M` as executing text **as a TECO command string**.

Confirms that:

- text variables preceded numeric variables;
- Q-registers conceptually hold both text and numeric values.

### Preferred Use

Architectural intent.

Not suitable for precise parser semantics.

---

## TECO Pocket Guide (1979)

### Covers

- Command reference.
- Auxiliary stream commands.
- Architectural stream diagram.
- Compact language overview.

### Reliability

High for conceptual architecture.

### Limitations

Very concise.

Not intended to specify implementation details.

### Agreements

The auxiliary-stream diagram strongly supports the accepted execution model:

- independent command stream;
- independent text input stream;
- independent text output stream.

### Preferred Use

Execution architecture and stream relationships.

---

## Standard TECO / TECO-64 Manuals (1990)

### Covers

- Language reference.
- Standardized command semantics.
- Modifier documentation.

### Reliability

High for Standard TECO and TECO-64.

### Limitations

Cannot be assumed to describe TOPS-20 TECO 540.

### Disagreements

Documents:

- `::S` as compare-at-point.

TOPS-20 experiments demonstrate different behavior.

Modifier documentation correctly states that `:` and `@` may appear in either order.

Experiments extend this by showing numeric arguments may also be interleaved for tested commands.

### Preferred Use

Reference for portable semantics unless contradicted by verified TOPS-20 experiments.

---

## TOPS-20 TECO 540 Experiments

### Covers

- Parser behavior.
- Modifier semantics.
- Search semantics.
- Arithmetic interaction.
- Dialect-specific behavior.

### Reliability

Highest.

Direct observation of target implementation.

### Limitations

Applies only to experimentally verified behaviors.

Unverified commands should not be inferred.

### Preferred Use

Authoritative source whenever implementation differs from documentation.

---

## Working Rule for Source Selection

Priority:

1. Verified TOPS-20 experiments.
2. Accepted project model.
3. Murphy architectural descriptions.
4. Pocket Guide architectural documentation.
5. Standard/TECO-64 language reference.
6. Historical documentation not confirmed experimentally.

When documentation conflicts with experiments, preserve both and treat the experiment as authoritative for TOPS-20 TECO 540.
