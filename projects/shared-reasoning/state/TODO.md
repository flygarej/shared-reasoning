# TODO.md

This document collects observations, ideas and potential improvements that have emerged during practical use of Shared Reasoning.

Items recorded here are intentionally **not** part of the accepted methodology.

They are preserved so they can mature through repeated observation before being considered for promotion into:

- protocol.md
- rationale.md
- project-state.md

Most items are expected to remain here until multiple independent observations support the same abstraction.

The objective is to improve the methodology through evidence rather than anticipation.

---

# Potential changes to protocol.md

- Long-running collaborations should periodically re-establish the current abstraction level when rapidly switching between implementation, methodology, and philosophy.

- During long collaborations, restarting after a maintenance point reduces accidental mixing of implementation, methodology, and philosophical discussion while preserving accepted knowledge through the project artefacts.

# Potential changes to rationale.md

- The protocol is not primarily about overcoming context limits. It is about preserving conceptual integrity as a project evolves.

# Potential evolution

- Investigate whether Shared Reasoning should explicitly support transitions between collaboration phases.

  Current experience suggests the methodology provides the greatest value during periods of high uncertainty (discovery, investigation, requirements, reverse engineering, hypothesis formation).

  Once the project's conceptual model stabilizes, it may be beneficial to generate a lightweight handover prompt optimized for execution-oriented work (implementation, coding, optimization, routine engineering).

  The objective would not be to replace Shared Reasoning, but to allow the collaboration style to adapt as uncertainty decreases.

  Evidence needed:
  - Does this transition occur consistently across different domains?
  - Which information should be preserved in such a handover?
  - Can the transition be recognized automatically from project state?
