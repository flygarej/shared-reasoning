# Documentation Overview

## Standard TECO Manual (1985)

### Covers

Standard TECO language definition used by TECOC.

### Reliability

Primary documentation for TECOC.

### Limitations

Documentation occasionally requires experimental confirmation for subtle execution semantics.

### Preferred Use

Primary language reference unless contradicted by experiment.

---

## TECO-64 Manual (1990)

### Covers

Modern TECO-64 language and implementation.

### Reliability

High for TECO-64.

### Limitations

Contains dialect extensions beyond TECOC.

### Preferred Use

Use for TECO-64 behavior and when comparing dialect evolution.

---

## PDP-10 TECO Manual (TECO 23B, 1975)

### Covers

Historical TOPS-10/TOPS-20 TECO.

### Reliability

High historical reference.

### Limitations

Older implementation with missing functionality compared to Standard TECO.

Observed documentation occasionally disagrees with later implementations.

### Preferred Use

Historical behavior and TOPS-20 comparison.

---

## TECO Pocket Guide (1978)

### Covers

Compact command reference.

### Reliability

Useful quick lookup.

### Limitations

Insufficient for execution-model questions.

### Preferred Use

Command reminder.

---

## TECO User's Guide (1979)

### Covers

General TECO usage.

### Reliability

Good supporting reference.

### Limitations

Not authoritative for subtle execution semantics.

### Preferred Use

General language behavior.

---

## TECOC Programming Guide

### Covers

Implementation-specific TECOC topics.

### Reliability

Good implementation reference.

### Limitations

Implementation-oriented rather than language-model oriented.

### Preferred Use

TECOC-specific behavior.

---

# Experimental Authority

For parser behavior, conditional execution, conditional scanning, and predicate semantics:

Experimental results override documentation.

Accepted experiments established:

- selective structural scanning of untaken branches;
- separation of structural scanning from semantic execution;
- numeric predicate behavior;
- character predicate behavior;
- iteration predicate semantics.

These observations should be treated as authoritative for reconstructing the accepted conceptual model.

---

# Dialect Guidance

## TECOC

Primary experimental platform.

Preferred for reconstructing the accepted language model.

## TECO-64

Use to identify later language evolution and dialect differences.

Do not infer Standard TECO solely from TECO-64 behavior.

## TOPS-20 TECO

Treat as historical implementation.

Use primarily for historical comparison rather than language definition.
