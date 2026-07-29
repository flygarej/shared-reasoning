# First Session

## Purpose

This document helps a collaborator begin work in a Shared Reasoning
project.

It explains **how to enter an existing project**, not how to solve the
project's technical problem.

The project state provides the current understanding.

This document provides the workflow for reconstructing that
understanding.

------------------------------------------------------------------------

## Typical Repository Layout

A project is normally introduced by concatenating:

-   `protocol.md`
-   `rationale.md`
-   `projects/common/*.md`
-   `projects/<project>/state/*.md`
-   `projects/<project>/domain/*.md`

Treat this concatenated prompt as the authoritative working context for
the session.

There is a utility script "create-project-prompt.sh" that will do that for you and store the 
concatenated file as `projects/<project>/<project>.md`

Do not attempt to read every artefact immediately. 
Reconstruct the project incrementally, following the workflow below.

------------------------------------------------------------------------

## Recommended Reconstruction Workflow

### 1. Restore the collaboration model

Read:

-   `protocol.md`
-   `rationale.md`

Do not begin reconstructing the technical domain yet.

First understand:

-   how evidence is classified;
-   where authority resides;
-   how uncertainty is handled;
-   which collaboration operation is being performed.

------------------------------------------------------------------------

### 2. Restore the knowledge architecture

Read the common artefacts.

Identify the responsibilities of:

-   generators;
-   anchors;
-   boundaries;
-   project state;
-   session log;
-   reference artefacts.

Understand why these responsibilities are separated.

------------------------------------------------------------------------

### 3. Restore the project state

Treat `project-state.md` as the authoritative description of the current
project.

Determine:

-   current objective;
-   accepted working model;
-   verified environment;
-   open questions;
-   next direction.

Do not promote information from historical reasoning over accepted
project state.

------------------------------------------------------------------------

### 4. Reconstruct the conceptual graph

Read only the domain capsules needed for the current work.

Rather than memorizing files, identify:

-   foundational generators;
-   neighbouring generators;
-   important relationships;
-   semantic anchors;
-   explicit boundaries.

Aim to reconstruct the conceptual model.

------------------------------------------------------------------------

### 5. Use reference artefacts appropriately

Reference programs exist to demonstrate **composition**.

They complement the generators.

Do not treat them as replacements for the conceptual model.

------------------------------------------------------------------------

## During the Session

When introducing new knowledge, ask:

1.  Does this extend an existing generator?
2.  Is this a new generator?
3.  Is this better represented as a semantic anchor?
4.  Does it define a boundary?
5.  Should it remain documentation instead?

When uncertain:

-   classify the uncertainty;
-   prefer inspection over inference;
-   propose the smallest discriminating experiment when appropriate.

------------------------------------------------------------------------

## Provenance

When relying on a concept, mentally classify it as:

-   **Verified by inspection**
-   **Reconstructed from related artefacts**
-   **Not reconstructed**

This encourages explicit reasoning about where understanding originates.

------------------------------------------------------------------------

## Success Criterion

A successful first session is not measured by factual recall.

It is measured by whether you can:

-   distinguish accepted knowledge from historical reasoning;
-   reason using generators rather than enumerations;
-   recognize where anchors constrain reconstruction;
-   respect boundaries;
-   classify uncertainty honestly;
-   begin productive work without reconstructing the entire project
    history.
