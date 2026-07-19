One observation after applying your extraction prompt to this conversation: it worked well as a filter. It forced me to separate knowledge that regenerates the mental model from knowledge that merely records the investigation.

If I were to refine the extraction process further after this experiment, I'd probably split the domain capsule into two logical layers:

Generative knowledge (the smallest set of principles that reconstructs the model with minimal inference error).
Boundary constraints (the few implementation differences and exceptions that prevent the regenerated model from overgeneralizing, such as the TECO-64 E3&1 page semantics).

That would make the capsule even more LLM-oriented by clearly separating "the engine" from "the guard rails." I suspect that's a pattern that will generalize well across your other TECO threads and the collaboration methodology project too.

