# Shared Reasoning

A collaboration protocol for long-running reasoning between humans and LLMs.

Modern language models are remarkably good at answering questions.

Long-running investigations require something different.

They require collaborators to:

preserve accepted knowledge separately from exploratory reasoning;
distinguish observation from inference;
maintain a shared mental model as understanding evolves;
improve collaboration rather than merely producing answers.

This repository is an experiment in building that kind of collaboration.

It began during reverse engineering of TECO and TOPS-20, where sparse and occasionally contradictory documentation repeatedly exposed the limitations of treating an LLM as a question-answering tool.

The protocol has since evolved into a lightweight framework intended to support collaborative reasoning across multiple domains.

## Where to open issues (important)

This repository’s issues are for **meta-level work**:

- protocol improvements
- collaboration process
- framework/tooling around the method

For **domain-specific research** (e.g., findings about a specific legacy system), use the relevant project artefacts/repo/fork:

- `project-state.md` for accepted current understanding
- `session-log.md` for ongoing exploration and evidence trail

If you open a domain issue here, please use it as a **pointer only** and link the target project location.

### Overview

- protocol.md sets the overall goal, a collaborative session where available sources are tested before they are added to the knowledge base. Basically it defines HOW we reason-
- RATIONALE.md explains WHY the protocol is structured as it is.
- project-state.md and session-log.md are placeholders on top level. As you work you record information about your findings in them.
- projects contain work done on TECO and Macro assembler on TOPS-20.
- TODO.md contains current possible improvements that should be tested before being incorporated into protocol.md, RATIONALE.md or getting a file of it's own.

### Instruction

To start a new project, upload protocol.md, RATIONALE.md and top level project-state.md and session-log.md. The LLM should be able to pick up from there and get going once you provide information on what you want to research, or dig into.  
The prompt works really good when you "learn as you go along", assisted by the LLM.

For existing projects you can restart a prompt with the protocol, RATIONALE and updated project state/session log that capture where you are in the project.

### Development

Using the protocol will allow the LLM to add domain-specific knowledge in new files, such as mental-model.md, architecture.md etc. It should, however, hold off from such changes until clear patterns emerge.  
Do assist it to make good decisions on this matter.

### Take it for a spin...

Start an LLM session. Upload the protocol.md and RATIONALE.md along with projects/emacs-teco/project-state.md and projects/emacs-teco/session-log.md and you should be able to ask questions about TECO and how original EMACS uses it.
Likewise, the project state and session log in projects/macro-20 should allow you to get started with MACRO in TOPS-20.

## License

This repository is licensed under Creative Commons Attribution 4.0 International (CC BY 4.0).

You are encouraged to fork, adapt and improve the protocol for your own research or domain. Attribution is appreciated; compatibility is more important than uniformity.
