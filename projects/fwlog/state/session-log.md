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
-   Observed a rotated firewall logfile containing 875 NUL bytes after an
    unclean shutdown/power-loss condition; the NULs caused jq normalization
    to fail.
-   Verified `tr -d '\000'` as a narrow ingestion-stream mitigation: it
    removed all NUL bytes, the real jq normalization succeeded, and a
    deliberately NUL-corrupted copy produced byte-identical normalized output
    to the clean reference according to `cmp`. The source logfile remains
    unchanged.
