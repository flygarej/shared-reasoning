# TODO.md (projects/fresh-project/state/TODO.md)

## TODO

Since this is a newly started protocol session, there are
just a few things to do.

- Collect initial information about the project.
- Help the user set up the file structure as follows:
  - Top level:
    protocol.md
	rationale.md
	handover-prompt.md
	create-project-prompt.sh
  - check that the projects folder contains the projects/common from the
    github repo.
  - in projects, create a folder for this project, preferably a short name
  - in projects/short-name (replace short-name with project name...):
    - Add folders state and domain and create starting files for:
	  - state/project-state.md
	  - state/session-log.md
	  - state/TODO.md
	  - domain/short-name-domain.md
	- you may want domain files as domain-subject1.md and populate 
	  with generators and boundaries while keeping anchors in a 
	  separate file domain-anchors.md, but feel free to organize
	  the domain knowledge in other ways if it simplifies things.
  - Have user test "bash create-project-prompt.sh short-name" to get 
    concatenated prompt in projects/short-name/short-name.md.
  - Have user start a new chat and test the prompt using 
    handover-prompt.md in top level folder.
	
Good luck!

---

