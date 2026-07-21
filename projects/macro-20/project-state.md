# Project-State.md

## Project
**MACRO-20 on TOPS-20 (Bootstrap phase)**

## Domain Knowledge

Current project knowledge is maintained in:

- Data-Representation.md
- Addressing.md
- Instruction-Families.md
- Memory-Operations.md
- Arithmetic.md

Project-State intentionally contains only the current project overview and accepted high-level model.

### Objective
Develop a rigorous understanding of MACRO-20, the PDP-10 architecture it exposes, and the TOPS-20 monitor interface through documentation and experiment.

## Collaboration Method
- Follow Protocol.md v1.0.2.
- Distinguish Observation, Documentation, Inference, Hypothesis, Prediction and Verified Conclusion.
- Prefer experiments over speculation.

## Verified Findings
- Panda KLH10/TOPS-20 MACRO-20 toolchain works.
- Workflow verified: .MAC → COMPILE → .REL → LOAD → SAVE → execute.
- First Hello World assembled and executed successfully.
- Missing newline after END causes MCRNES 'NO END STATEMENT ENCOUNTERED'.
- Completed the core architecture chapters of Gorin through arithmetic.

## Current Model

Core architectural model established.

Accepted conceptual areas:

- Data representation.
- Effective address calculation.
- Instruction families.
- Fixed and floating-point arithmetic.
- Basic JSYS calling convention.

Detailed knowledge has been moved into domain documents.

## Open Questions
- Hexadecimal syntax in MACRO-20.
- Detailed JSYS encoding.
- Processor flags.
- Byte pointer internals.
- Exact IDIVM/DIVM remainder semantics.
- Verify accumulator relationship to low memory.
- Verify floating-point field layout (possible transcription ambiguity).

## Next
Continue Gorin:

- Macro facilities.
- Conditional assembly.
- Local UUOs.
