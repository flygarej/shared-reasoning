# Session Log

-   Reconstructed pipeline from rsyslog through PostgreSQL.
-   Reviewed rsyslog parser and routing.
-   Reviewed import automation and duplicate protection.
-   Reviewed jq normalization contract.
-   Reviewed firewall.events schema and helper functions.
-   Reviewed fwq dispatcher and investigation queries.
-   Identified candidate future tests (jq conversion behaviour,
    fingerprint validation, timestamp semantics).
-   Added project-local selective-loading boundaries and implementation
	contract anchors after the initial full implementation review caused
	substantial active context load. Complete implementation artefacts
	remain authoritative for exact semantics but are now intended to be
	inspected on demand.
-   Validated end-to-end propagation of reported_tz and received_tz
	through rsyslog and jq. Initial suspicion of data loss was traced to
	inspection of historical rows imported before timezone support was
	added.
