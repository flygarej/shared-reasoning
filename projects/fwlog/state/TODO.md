# TODO

-   Validate jq tonumber? behaviour with prepared sample logs.
-   Verify timestamp/session timezone semantics.
-   Review remaining SQL queries as the project evolves.
-   Consider future adapters for nftables/UFW while preserving canonical
    event model.
-   Observe whether implementation-interface contracts consistently reduce
	context requirements and improve reconstruction across multiple
	engineering sessions. If the pattern proves general rather than
	project-specific, consider promoting it into the common knowledge
	architecture as a distinct artefact or responsibility.
-   Determine the canonical reporting timezone.
    Current working model:
    - Canonical database representation remains timestamptz.
    - Reports may be rendered either in UTC or Europe/Stockholm,
      but the selected convention must be stated explicitly.
