# Prompt construction

To create a complete prompt you need several layers. The easiest way is to concatenate the relevant files into one prompt file.

You can create a new project by using the capsules/new-reasoning.md which concatenates the files below, or you can create your own
by tweaking them.

## Protocol

The protocol.md defines HOW the LLM should reason, as a collaboration partner, and how it should treat uncertainty in inferences.
This, by the way means you should not have to prompt "list the five most likely answers" and such, it's built into the model.
The protocol.md also allows the LLM to devise tests to determine which inference can be proven to be right/working.

## Rationale

The rationale.md adds a layer to the protocol, stating WHY it should reason this way.

## Project State

The project-state.md (usually kept in a project specific folder named "state") contains project specific information to let
you restart the project in a new chat if context gets heavy.

## Session Log

The session-log.md contains specific information the current session have found that is relevant to the project. Also kept in the "state" folder.

## Domain knowledge

As the project-state grows, the LLM should suggest moving domain knowledge to this file. The file name will be specific to each project, and there may be several of them. 
These files are kept in a project specific folder "domain".
Most important, the file content will be geared to be useful to the LLM, not to you as a human. This means:
- It will list facts that are useful to the inference engine it uses.
- It will also list boundaries that prevents it from hallucinating or making bad inferences.

This means that to start a new chat, you should feed it the concatenation of protocol.md, rationale.md, project-state.md, session-log.md (or all files in "state") and all files in "domain". 
The new chat will now be able to start where the last one stopped, with all the knowledge gathered during that session.

## Caveat

Since the domain knowledge is saved in LLM friendly fashion, there will at times be imperfect handovers. 
Treat the LLM as a collaboration partner that came back after the weekend, bring it up to date and correct any minor mistakes. 
It will be up to speed very quickly.

## create-project-prompt.sh

The script create-project-prompt.sh is a utility script to concatenate all the files mentioned above and put it into a ready-to-use
prompt in the named folder under "projects".  
This means it can be used to update the knowledge in a project by:
- Ask the LLM for maintenance of state and domain. It should provide you project-state.md, session-log.md and any relevant domain
  knowledge files.
- Put the project state and session log in a "state" folder under "projects", and the domain knowledge files in a "domain" folder for the same project.
- Assuming the project was named "my-project" (projects/my-project) and the state/domain folders were populated as above, running the 
  "bash create-project-prompt.sh my-project" will concatenate all the relevant files into a "projects/my-project/my-project.md" file.
  This file can then be uploaded to kick-start a new prompt.
