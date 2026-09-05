# project-state.md

## Project
cross-ai

## Objective
Compare startup behavior and collaboration friction across OpenAI, Copilot, and Gemini, with the goal of minimizing friction for users who move between platforms.

## Scope
- General test of startup issues and cross-platform differences.
- Focus on prompt startup, context reconstruction, and handoff behavior.
- Observe platform-specific differences as evidence, not assumptions.

## Known environment
- This repository contains the shared reasoning protocol and common collaboration artefacts.
- The project is being maintained in `projects/cross-ai/`.
- User handles persistence manually via local file replacement and Git commits.

## Accepted observations
- The project exists to reduce user friction across multiple AI platforms.
- The shared reasoning prompt format is robust and functionally model-agnostic during bootstrap.
- Gemini accepts and parses the concatenated prompt cleanly, exhibiting high startup compatibility alongside ChatGPT.
- Unlike platforms with direct workspace writeback (OpenAI cache, Copilot IDE integration), Gemini in this environment is constrained to text-based state output, requiring the user to manually enforce the Persistence Boundary.

## Working models
- Startup behavior can differ materially between platforms, but Shared Reasoning filters the structural noise effectively.
- Explicit mapping of platform boundaries (e.g., tool writeback vs. manual text extraction) directly informs how prompt architecture must be structured to minimize user workflow friction.

## Explicit unknowns
- Long-term context drift characteristics in Gemini compared to ChatGPT under extended debugging.
- Best optimization rules for Gemini's large context window when handling deep background libraries.

## Next useful experiment
Test Gemini's ability to navigate down the Three-Tier Context Funnel (Core -> Reference -> Background) when an obscure local semantic issue is injected.

