# Quick Start

## Quick quick-start

Use one of the packaged capsules to start up a pre-defined reasoning session, such as capsules/teco.md, capsules/new-reasoning.md or capsules/learn-collaboration.md

A capsule consists of protocol.md, rationale.md and a specific project-state and session-log concatenated together.  
That capsule can be uploaded or pasted into a chat to get things up and running.
Suggested initial prompt to get an overview of the project:

"Read this capsule. Describe the collaboration methodology, the current project state, and explain how you distinguish accepted knowledge from historical reasoning."

## Starting a new investigation

Upload:

- protocol.md
- rationale.md
- templates/new-project-state.md
- templates/new-session-log.md
- templates/common/*.md

Then describe:

- what you are investigating;
- why it matters;
- any existing evidence or documentation.

The protocol will establish a collaborative workflow and request additional context if needed.

You can also concatenate all the files into one prompt, and upload that.

---

## Continuing an investigation

Upload:

- protocol.md
- rationale.md
- templates/common/*.md
- your project's project-state.md
- your project's session-log.md
- your project's domain knowledge markdown files.

The collaborator should resume from the accepted project state while preserving continuity.

You can also concatenate all the files into one prompt, and upload that.

---

## More information

See README.md for the philosophy behind Shared Reasoning.

## A heads-up

Don't optimize the protocol before you've used it.

The protocol evolved through practical collaboration. If something feels awkward, try it first—then decide whether the protocol or your workflow should change.

### LLM Quirks

I've found these prompts work really well with ChatGPT, while Copilot tends to shirk collaboration to the user. Working on that...
This difference in behaviour was also the reason for adding domain knowledge as OpenAI tend to glance at other chats when inferring, while Copilot seem to not do that. With condensed domain knowledge it becomes easier for Copilot to participate in a discussion.
