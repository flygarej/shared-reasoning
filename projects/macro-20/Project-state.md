# Project-State.md

## Project
**MACRO-20 on TOPS-20 (Bootstrap phase)**

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

## Current Model
- PDP-10 words are 36 bits, two's complement.
- Five 7-bit ASCII characters pack into one word.
- ASCII packs only characters.
- ASCIZ appends a terminating zero byte.
- Normal instruction fields: opcode, AC, I, X, Y.
- Effective address is computed before execution.
- JSYS arguments normally use AC1–AC4.
- HRROI builds a common byte pointer for PSOUT.
- MOVE family is a regular instruction matrix.
- JRST uses the AC field to select related operations.
- JSR is non-reentrant, JSP reentrant, XCT executes an instruction from memory.

## Open Questions
- Hexadecimal syntax in MACRO-20.
- Detailed JSYS encoding.
- Processor flags.
- Stack instructions (PUSH/PUSHJ/POPJ).
- Byte pointer internals.

## Next
Continue Gorin through tests, booleans, stack operations and arithmetic, validating interesting claims experimentally.
