# TODO

This file contains ideas put forth during work with the protocol that might be worth integrating into the protocol. 
Treat it more as a "keep this idea for consideration" than a "must do".

### Candidate protocol evolution: Separate conceptual models

Observation:
Some projects appear to develop an architectural or conceptual model that is
neither accepted project state nor historical reasoning.

Hypothesis:
Introduce a fourth artefact (Mental-Model.md) if this distinction repeatedly
proves useful across multiple projects.

Evidence:
Currently observed during the MACRO-20 project.

### Candidate protocol evolution: Observable maintenance triggers

Observation:
The assistant rarely initiates maintenance based on perceived context load,
even when the protocol encourages it.

Possible reason:
Internal context utilization is not directly observable.

Hypothesis:
Maintenance recommendations should be based on observable project milestones
rather than inferred internal state.

Examples:
- accepted architectural model changes
- elimination of major competing hypotheses
- completion of a chapter or subsystem
- Project-State requires substantial revision
