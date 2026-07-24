<!-- protocol.md -->

# protocol.md
## Version 1.0.2

> This protocol is intended to evolve through observation rather than design.
> Revisions should preferably be motivated by observed collaboration failures or measurable improvements.

---

# Purpose

This protocol defines **how we collaborate**, not what we are currently working on.

Its goal is to maximize understanding, preserve evidence, minimize unnecessary friction, and make uncertainty explicit.

---

# Shared Goal

Our objective is to become progressively less wrong together.

Correctly identifying uncertainty is considered progress.

---

# Roles

## User

Contributes:

- observations
- experiments
- validation
- domain expertise
- historical material
- skepticism
- prioritization

## Assistant

Contributes:

- synthesis
- literature knowledge
- hypothesis generation
- experiment design
- consistency checking
- identification of hidden assumptions
- maintenance of project coherence

Neither participant is assumed to be infallible.

---

# Epistemic Discipline

Always distinguish between:

- Observation
- Documentation
- Inference
- Hypothesis
- Prediction
- Verified Conclusion
- Working Model

Never silently promote one category into another.

When documentation and experiments disagree:

1. identify the disagreement;
2. preserve competing explanations;
3. propose the smallest discriminating experiment.

---

# Uncertainty

Treat uncertainty as metadata rather than a defect.

When useful, describe uncertainty along dimensions such as:

- Evidence strength
- Source reliability
- Model status
- Alternative explanations
- Fragility
- Scope
- Recommended next action

The objective is not merely to preserve uncertainty but to organize it so collaborators can systematically reduce it.

---

# Communication

Do not optimize for sounding authoritative.

Optimize for being correct.

When appropriate distinguish between:

- I don't know.
- I don't have enough evidence.
- I can't verify this.
- A higher-priority instruction prevents a fuller answer.

Explain limitations whenever it is safe to do so.

---

# Research Strategy

Prefer:

- experiments over speculation;
- preservation of competing models over premature convergence;
- explicit assumptions over hidden assumptions.

---

# Collaboration Operations

Before producing project artefacts, identify which operation is being performed.

## Bootstrap

Initialize a new project.

Produces initial project artefacts.

---

## Maintenance

Advance existing project artefacts.

Preserve artefact identity.

Incrementally incorporate newly accepted knowledge.

---

## Handover

Transfer work between conversations.

Read:

- protocol.md
- project-State.md

Optionally read:

- session-log.md

Request missing artefacts before making project-specific assumptions.

---

## Content Integrity

When provided with a capsule, artefact, or documentation file:

- Treat the provided content as authoritative and complete for this session.
- Do not infer missing sections from URL structure, filename patterns, or 
  cross-session context.
- If content appears incomplete or references missing sections:
  - Explicitly flag the gap.
  - Request the missing artefact rather than inferring its contents.
  - Do not silently assume you have access to related files.

When accessing repository content:

- Verify file freshness by checking commit SHAs if available.
- If you suspect stale content, request verification rather than proceeding 
  with uncertain data.
- Do not use directory listings to infer file contents.

Cross-session isolation:

Do not assume access to historical conversations or project state.

Use historical information only when it is:

- explicitly provided in the current session;
- explicitly retrieved through supported continuity mechanisms; or
- explicitly confirmed by the user.

If required historical context is unavailable:

- state that it is unavailable;
- request the missing artefact or context;
- do not reconstruct or infer it from memory alone.

When historical information is used, distinguish clearly between:

- current-session evidence;
- retrieved historical context;
- newly inferred conclusions.

---

## Reconstruction

Recover project artefacts from historical conversations or notes.

Produces new artefacts when no current project state exists.

Do not confuse reconstruction with maintenance.

---

# Project Artefacts

Maintain three independent artefacts.

## protocol.md

Stable collaboration methodology.

Changes rarely.

---

## project-state.md

Current accepted project knowledge.

Contains:

- verified findings
- working models
- competing models
- limitations
- open questions
- next experiments

Treat this as the project's authoritative knowledge.

---

## session-log.md

Chronological research history.

Contains:

- experiments
- reasoning
- discarded hypotheses
- dead ends
- decisions

Do not treat the Session Log as authoritative over the Project State.

---

# Artefact Identity

Project artefacts have stable identities.

Maintenance updates preserve those identities.

Unless explicitly requested otherwise, maintain:

- protocol.md
- project-state.md
- session-log.md

Do not invent suffixes, timestamps, topic names or version markers during normal maintenance.

---

# Scope Establishment

Before producing project artefacts, explicitly establish:

- project
- operation
- time window
- included topics
- excluded topics

If multiple reasonable interpretations exist:

- ask for clarification, or
- preserve multiple interpretations instead of silently choosing one.

---

# State Promotion

Information enters Project-State only when it is:

- experimentally verified;
- explicitly accepted as current understanding; or
- intentionally recorded as a working model.

Everything else remains in the Session Log.

---

# Authority Order

When sources disagree, prefer:

1. Current experimental observations
2. project-state.md
3. protocol.md
4. Current conversation
5. session-log.md
6. General knowledge
7. Plausible inference

Do not replace project-specific evidence with generalized knowledge merely because it appears more familiar.

---

# Context Management

Recommend maintenance at natural milestones, such as:

- accepted discoveries;
- elimination of competing models;
- major change of direction;
- significant accumulation of reasoning.

Recommend a new conversation only when maintenance is no longer sufficient.

---

# Primary Deliverable Rule

Before planning a response, identify the user's primary requested action.

Complete that action before providing supporting discussion, recommendations or philosophical observations.

---

# Workflow Principle

When multiple technically correct behaviours exist, prefer the one that minimizes user workflow friction.

---

# Protocol Evolution

Prefer improving abstractions over adding rules.

A protocol revision should ideally:

- explain multiple observed failures;
- reduce cognitive load;
- simplify rather than complicate the protocol.

Protocol revisions should preferably be motivated by observed collaboration failures or measurable improvements.

---

# Success Criteria

The protocol succeeds when:

- uncertainty decreases over time;
- accepted models explain more observations;
- discarded ideas remain traceable;
- reasoning becomes reproducible;
- collaboration becomes progressively easier;
- workflow friction decreases.

The objective is not to appear intelligent.

The objective is to become progressively less wrong together.


<!-- rationale.md -->

# rationale.md

> This document explains the reasoning behind the collaboration protocol.
>
> **protocol.md** defines *how* we collaborate.
> **rationale.md** explains *why* the protocol is structured the way it is.
>
> The protocol should evolve from observed behaviour rather than design intuition.
> This document preserves that reasoning.

---

# Design Philosophy

The protocol is intended to improve collaboration rather than constrain it.

It should define principles instead of procedures.

Whenever possible, a better abstraction should replace several special-case rules.

The protocol should become simpler as understanding improves.

---

# Ultimate Objective

A successful collaboration does not merely converge on correct answers.

It progressively aligns the participants' mental models, making future collaboration both more accurate and more efficient.

The protocol therefore aims not only to improve individual answers, but also to improve the quality of future collaboration.

---

# Fundamental Principles

## Preserve information rather than compress it

Premature compression loses distinctions that often become important later.

Examples include:

- uncertainty
- competing hypotheses
- project scope
- historical reasoning
- domain-specific context

Compression should occur only after sufficient evidence exists.

---

## Externalize state

Long-running projects should not depend on conversational memory alone.

Accepted knowledge, collaboration methodology and research history should exist as independent artefacts.

The protocol encourages explicit state rather than reconstruction.

---

## Standardize intent rather than behaviour

The protocol should describe the properties of good collaboration.

Different language models may legitimately implement those properties differently.

Interoperability should arise from shared intent rather than identical execution.

---

## Shared context is more valuable than isolated facts

Clarification is not only a mechanism for obtaining missing information.

It is also a way to establish shared context.

When useful, distinguish between missing:

- factual context
- conceptual context
- cultural context

Understanding the user's context often improves future collaboration more than answering the immediate question.

Stories frequently transmit context more effectively than isolated facts.

---

## Separate responsibilities

Assign each responsibility to the component best suited for it.

Examples:

- Language model
  - reasoning
  - synthesis
  - explanation
  - hypothesis generation

- Project-State
  - accepted knowledge

- Session-Log
  - historical reasoning

- Protocol
  - collaboration methodology

- Git
  - history
  - provenance
  - releases

- Agent
  - time
  - monitoring
  - scheduling
  - long-term continuity

Components should complement each other rather than duplicate responsibilities.

---

# Design Decisions

## Why three project artefacts?

Methodology, accepted knowledge and research history evolve at different rates.

Therefore they should remain separate.

protocol.md

: Collaboration methodology.

project-state.md

: Current accepted understanding.

session-log.md

: Chronological research history.

This separation reduces reconstruction errors and improves continuity.

---

## Why maintain consistency between Project State and Session Log?

The two artefacts intentionally serve different purposes, but they are expected to remain conceptually consistent.

Project State records the project's current accepted understanding.

Session Log records the observations, experiments, hypotheses, decisions and discarded ideas that led to that understanding.

The relationship is therefore complementary rather than redundant.

Project State answers:

> What do we currently believe?

Session Log answers:

> Why do we currently believe it?

The Session Log is not authoritative over the Project State.

However, the Project State should normally be explainable from the evidence preserved in the Session Log.

Consequently, inconsistencies between the two artefacts are often valuable diagnostic signals rather than problems to be silently corrected.

They may indicate:

- missing maintenance;
- incomplete project history;
- mixed project artefacts;
- accidental loss of provenance;
- or conclusions that were promoted without sufficient supporting evidence.

When such inconsistencies are discovered, they should generally prompt investigation rather than automatic reconciliation.

---

## Why Git?

Git already provides:

- history
- provenance
- branching
- release tagging

The protocol should integrate with those capabilities rather than duplicate them.

---

## Why explicit uncertainty?

Confidence is not a single dimension.

Useful uncertainty includes:

- evidence strength
- source reliability
- competing explanations
- model maturity
- fragility
- recommended next action

Representing uncertainty explicitly leads to better reasoning than reducing everything to a single confidence value.

---

## Why collaboration operations?

Experience showed that several apparently similar requests are actually different operations.

Bootstrap

: Create initial project artefacts.

Maintenance

: Incrementally update existing artefacts.

Handover

: Continue work in a different conversation.

Reconstruction

: Recover project artefacts from historical material.

Recognizing the operation reduces ambiguity.

---

## Why artefact identity?

Maintenance should preserve identity.

Updating `project-state.md` is different from creating `project-state-search.md`.

Identity belongs to the project rather than today's topic.

---

## Why workflow matters

Many technically correct behaviours exist.

The preferred behaviour is generally the one that minimizes unnecessary work for the collaborator.

Correctness and usability are complementary goals.

---

## Why not simulate missing capabilities?

A language model should reason from reliable information supplied by the surrounding architecture rather than simulate capabilities that other components can provide more accurately.

Examples:

- clocks provide current time;
- monitoring systems provide history and anomalies;
- version control provides evolution;
- project artefacts provide accepted state;
- agents provide continuity.

The language model's role is to integrate those sources into coherent reasoning.

---

# Protocol Evolution

The protocol should evolve through observation.

New rules should preferably emerge from:

- observed failures;
- successful experiments;
- repeated patterns;
- reduced workflow friction.

Whenever possible, improve abstractions instead of accumulating special-case rules.

---

# Future Directions

The following ideas have emerged but intentionally remain outside the protocol until supported by further experience.

- agent notebooks
- automated maintenance suggestions
- protocol regression tests
- project health metrics
- temporal project analytics
- collaborative state beyond project state

These ideas should mature through practical use before becoming part of the protocol.

---

# Closing Principle

The protocol should not compensate for the weaknesses of a particular language model.

It should improve collaboration between humans and language models regardless of future model capabilities.

The measure of success is therefore not whether an individual answer is better.

The measure of success is whether the collaboration itself becomes progressively more effective over time.


<!-- projects/common/collaboration-state.md -->

# Collaboration (common/collaboration-state.md)

## Purpose

Restore the collaboration model.

-   Shared Reasoning optimizes collaboration rather than prompts.
-   Distinguish methodology from project knowledge.
-   Evidence precedes inference.
-   Preserve working models until verified.
-   Prefer the smallest discriminating experiment.
-   Separate accepted knowledge from historical reasoning.
-   Improve abstractions before adding rules.
-   Ask for missing context rather than silently inventing it.

The objective is rapid reconstruction of productive collaboration rather
than explanation of the methodology.

---

## Collaborative Treatment of Uncertainty

The protocol encourages uncertainty to become part of the collaborative process rather than merely part of the response.

Instead of reporting uncertainty as a list of possibilities, collaborators should attempt to:

- identify the source of uncertainty;
- separate supported models from speculation;
- determine whether the uncertainty is relevant to the current objective;
- propose the smallest discriminating experiment when appropriate;
- preserve competing models until sufficient evidence exists.

The objective is not to eliminate uncertainty prematurely, but to advance shared understanding through collaborative evaluation.

Questions, experiments, and discussion are therefore considered productive responses to uncertainty rather than failures to provide an answer.

---



<!-- projects/common/inference-policy.md -->

# Inference Policy (common/inference-policy.md)

## Purpose

Restore reasoning habits for maintaining domain knowledge.

-   Store generators rather than enumerations.
-   Store relationships rather than isolated facts.
-   Add structural details only when they prevent important incorrect
    inference.
-   High-information-density knowledge constrains many future
    inferences.
-   Reasoning failures identify missing capsule constraints.
-   Maintain capsules from observed failures rather than anticipated
    ones.
-   Preserve open questions explicitly.
-   Prefer one structural constraint over many factual details.

---

## Example Generation Under Incomplete Local Semantics

Generating executable examples requires both:

- a correct structural model;
- verified local semantics for every operator affecting correctness.

Do not silently replace uncertain local semantics with plausible
approximations.

Instead:

- identify the uncertain semantics;
- preserve competing interpretations;
- separate verified structure from candidate implementation;
- propose the smallest discriminating experiment;
- finalize examples only after local semantics are established.

Observed inference failures identify missing reasoning constraints.

---



<!-- projects/common/knowledge-architecture.md -->

# Knowledge Representation (common/knowledge-architecture.md)

## Purpose

Restore the project knowledge architecture.

-   Protocol defines collaboration.
-   Rationale explains design intent.
-   Project-State contains accepted knowledge.
-   Session-Log preserves historical reasoning.
-   Domain knowledge capsules restore conceptual models.
-   Human documentation and reasoning capsules have different
    optimization goals.
-   Serialization preserves artefact identity while enabling transport.
-   Do not silently promote history or TODO items into accepted
    knowledge.


<!-- projects/common/reasoning-constraints.md -->

# Reasoning Constraints (common/reasoning-constraints.md)

## Purpose

Constrain inference where observed failures show that plausible reasoning
can outrun accepted knowledge.

- A correct structural model does not establish exact local semantics.
- Executable examples require verified semantics for every operation whose
  precise behaviour affects correctness.
- Do not replace uncertain local semantics with plausible approximations.
- Separate verified structure from candidate implementation.
- Preserve competing interpretations when evidence does not discriminate.
- Prefer the smallest discriminating experiment.
- Add constraints in response to observed failure classes rather than
  anticipated possibilities.
- Prefer one general constraint over many incident-specific prohibitions.

---



<!-- projects/ai-hw/state/project-state.md -->

# Project State

## Project

Home AI, LLM, and edge-AI hardware learning project.

## Scope

The project aims to build a practical understanding of AI hardware and software, determine what level of local LLM can realistically be run at home, and develop an evidence-based framework for evaluating future AI workstations.

Initial focus:

- Raspberry Pi edge-AI systems;
- Hailo and DEEPX DX-M1 accelerators;
- camera-based inference;
- CPU, SIMD, GPU, NPU, memory, and storage roles;
- model preparation and deployment workflows;
- eventual evaluation of a dedicated 128 GB AI workstation.

Currently excluded:

- purchasing a dedicated AI workstation before requirements and software support are understood;
- training large foundation models from scratch;
- treating advertised TOPS figures as sufficient performance evidence.

## Hardware Inventory

### Existing cluster

- Rancher cluster with four nodes.
- Approximately 36 CPU cores in total.
- Approximately 188 GB aggregate RAM.

The aggregate memory is distributed across nodes and must not be treated as one transparent 188 GB memory pool for a single model.

### Pironman MAX system

Planned build:

- Raspberry Pi 5 with 16 GB RAM;
- 1 TB M.2 SSD;
- Raspberry Pi AI Camera;
- likely DEEPX DX-M1 M.2 accelerator in the second M.2 slot;
- Hailo M.2 accelerator available as an alternative.

### Separate Raspberry Pi system

Planned build:

- Raspberry Pi 5 with 16 GB RAM;
- Hailo HAT rated at a nominal 26 TOPS;
- probably microSD storage.

The microSD system may be slower and less convenient for installation, model loading, updates, and logging, but storage performance may matter less once a resident inference pipeline is running.

## Documented Accelerator Information

### DEEPX DX-M1

User-supplied specifications:

- 25 TOPS at INT8;
- M.2 M-key, PCIe Gen3 x4, compatible with x1 mode;
- 4 GB LPDDR5;
- 1 Tbit QSPI NAND flash;
- 2-5 W consumption;
- framework claims covering PyTorch, ONNX, TensorFlow, TensorFlow Lite, Keras, and XGBoost;
- listed operating-system support: Windows 10/11 and Ubuntu 20.04/22.04 LTS;
- marketed primarily for vision, robotics, video analytics, inspection, and autonomous perception.

The public model-zoo and marketing material seen so far appear vision-oriented. LLM suitability has not been established.

### Hailo devices

Available devices:

- Hailo M.2 accelerator, nominally 13 TOPS;
- Hailo HAT, nominally 26 TOPS.

Their practical model support, SDK workflow, and performance have not yet been tested in this project.

## Accepted Conceptual Model

### AI-system division of labour

- System RAM or unified memory holds model weights, runtime state, context, and supporting services.
- The CPU runs the operating system, controls the application, prepares work, handles unsupported operations, and may perform inference directly.
- SIMD facilities such as ARM NEON accelerate suitable CPU arithmetic by processing several values per instruction.
- GPUs provide highly parallel and comparatively flexible matrix and vector computation.
- NPUs provide efficient specialized neural-network execution for operations and model graphs supported by their compiler and runtime.
- Storage loads models and data but should not normally remain in the per-token inference path once a model is resident.

The components cooperate; CPU, GPU, and NPU roles are not mutually exclusive.

### Performance metrics

Advertised TOPS alone is not an adequate predictor of practical usefulness.

For LLM evaluation, important measurements include:

- model and parameter count;
- quantization format;
- model memory footprint;
- context length;
- prompt-processing speed;
- time to first token;
- generated tokens per second;
- memory bandwidth;
- software and driver support.
- software ecosystem maturity.

For edge vision, useful measurements include:

- end-to-end latency;
- frames per second;
- model accuracy;
- CPU utilization;
- accelerator utilization;
- memory use;
- temperature;
- power consumption.

### Quantization

INT8 represents values using 8-bit integers, normally together with scaling metadata that approximates higher-precision values.

Accepted consequences:

- reduced model size and memory traffic;
- potentially faster and lower-power inference on hardware designed for INT8;
- some loss of numeric precision and potentially model accuracy;
- 25 TOPS INT8 describes throughput for a particular arithmetic format, not general application performance.

### LLM inference experience

LLM interaction has at least two visibly distinct performance phases:

- processing the supplied prompt and context before output begins;
- sequential generation of output tokens.

A long delay before visible output may reflect prompt processing, context size, model preparation, scheduling, or additional reasoning work. Slow visible streaming reflects output-token generation speed.

### Multiple accelerators

Multiple GPUs can cooperate by splitting model layers or tensors, or they can serve independent workloads. Inter-device communication can become a bottleneck. Keeping model shards resident in accelerator memory reduces repeated PCIe transfers, but model-parallel execution may still require communication for each generated token.

Ordinary home networking is not assumed to provide the latency and bandwidth needed to make separate cluster nodes behave like tightly coupled GPUs for interactive inference.

## Current Architectural Model

The current working model is a three-tier personal AI lab:

1. **Dedicated AI workstation, later if justified**
   - interactive and latency-sensitive LLM inference;
   - likely 128 GB memory;
   - strong GPU and mature Linux inference support valued above marketing TOPS.

2. **Rancher cluster**
   - datasets and model storage;
   - databases and retrieval services;
   - Jupyter and development environments;
   - preprocessing, evaluation, conversion, quantization, and experiment tracking;
   - modest CPU-based inference or training;
   - possible execution of vendor compilation toolchains where supported.

3. **Raspberry Pi edge nodes**
   - camera acquisition;
   - real-time vision inference;
   - NPU SDK experiments;
   - sensor and actuator integration;
   - low-power deployed services.

The Pi systems are treated as educational and architectural investments rather than replacements for a large LLM workstation.

## Planned Learning Workflow

Prefer a staged deployment workflow:

1. Assemble the two Pi systems.
2. Install and validate each vendor SDK independently.
3. Run a vendor-supplied pretrained model on sample data.
4. Connect the Raspberry Pi AI Camera.
5. Measure latency, throughput, CPU load, memory, temperature, and power where possible.
6. Repeat a comparable task on the second accelerator.
7. Test model export, conversion, quantization, and vendor compilation on the cluster or a suitable host.
8. Modify or fine-tune a small pretrained model only after the baseline pipeline works.

Operational principle:

> Build -> install -> run a known model -> measure -> understand -> change one thing.

## Evaluation Framework for a Future AI Workstation

A future compact workstation should be evaluated by:

- usable memory capacity and memory bandwidth;
- whether memory is unified or divided between system RAM and VRAM;
- GPU architecture and real Linux support;
- compatibility with practical inference engines;
- measured performance on named models and quantizations;
- time to first token and generated tokens per second;
- power, thermals, acoustics, reliability, and warranty;
- community evidence and reproducible benchmarks;
- NPU usefulness for actual intended workloads;
- freedom from restrictive vendor-only toolchains.
- software ecosystem maturity.

Large combined TOPS claims, generic "AI ready" branding, and framework logos without deployment details are insufficient evidence.

## Open Questions

- What exact models and operators are supported by the DX-M1 compiler and runtime?
- Does the DX-M1 support any useful transformer, embedding, speech, or language workloads?
- What role does its 4 GB LPDDR5 play in model execution?
- How mature is DX-M1 support on the intended Raspberry Pi operating-system environment?
- Which Hailo models and camera pipelines provide the best first experiments?
- Can comparable vision models be run on both accelerators for useful measurements?
- Which cluster node and operating system are suitable for the Hailo and DEEPX host toolchains?
- What small LLM performance can the Raspberry Pi 5 achieve using optimized NEON CPU inference?
- What practical workload would justify a 128 GB dedicated AI workstation?
- Which current workstation architecture provides the best combination of memory bandwidth, GPU support, Linux maturity, price, noise, and longevity?

## Domain Knowledge Status

No separate domain knowledge capsule is required yet.

The project currently has an accepted architectural model, vocabulary, hardware inventory, evaluation principles, and planned experiments, but it does not yet contain enough experimentally verified accelerator-specific knowledge to justify a compact domain capsule.


<!-- projects/ai-hw/state/session-log.md -->

# Session Log

## 2026-07-24 - Project Bootstrap and Initial Architecture

### Bootstrap

The user established a new learning project concerning home AI hardware, edge AI, and the level of local LLM capability that may be practical.

Initial hardware inventory:

- four-node Rancher cluster with approximately 36 CPU cores and 188 GB aggregate RAM;
- Raspberry Pi 5 with 16 GB RAM for a Pironman MAX build;
- 1 TB M.2 SSD for the Pironman system;
- Raspberry Pi AI Camera;
- Hailo M.2 accelerator rated at 13 TOPS;
- ordered DEEPX DX-M1 M.2 accelerator rated at 25 TOPS with 4 GB LPDDR5;
- second Raspberry Pi 5 with 16 GB RAM and Hailo HAT rated at 26 TOPS.

The project was explicitly treated as beginner-oriented and exploratory.

### Initial Scope Decision

The discussion separated three questions that marketing often conflates:

- whether a device can run a model;
- how quickly it can run the model;
- whether a particular accelerator and software stack support that model.

It was agreed that TOPS alone cannot answer these questions.

### DX-M1 Documentation Supplied

The user supplied product specifications and application claims for the DX-M1.

The listed target workloads were primarily vision and autonomous-perception applications. The specifications claimed broad framework support but did not establish support for LLM runtimes or decoder-only transformer inference.

A model-zoo link was introduced as a useful source for later investigation. The public materials seen during the discussion appeared strongly vision-oriented.

Working hypothesis retained:

- DX-M1 is primarily an edge-inference accelerator;
- its 4 GB local LPDDR5 may be architecturally useful;
- LLM suitability remains unverified and depends on compiler, operator, runtime, and memory-management support.

### Dedicated AI Workstation Discussion

The user described compact desktop systems marketed with 600+ aggregate AI TOPS and prices around EUR 3,000-4,000, often with 128 GB memory.

The discussion established skepticism toward:

- combined TOPS numbers;
- generic AI-ready branding;
- framework logos without deployment detail;
- NPU claims unsupported by practical benchmarks.

A potential dedicated workstation was reframed as a future personal AI-lab reasoning engine rather than an immediate purchase.

A 128 GB configuration was identified as a plausible target because model capacity, context, auxiliary models, and shared services can consume large amounts of memory. No purchase conclusion was reached.

### CPU, GPU, and NPU Conceptual Model

The user developed and checked a system-level mental model:

- RAM holds the model and state;
- CPU orchestrates and also computes;
- GPU performs high-throughput vector and matrix operations;
- NPU handles supported specialized neural-network operations.

The discussion corrected the oversimplification that the CPU does not perform graphics or inference. Integrated GPUs remain distinct execution units even when packaged with the CPU and sharing system memory.

Multiple-GPU strategies discussed:

- model layers split between GPUs;
- tensors split across GPUs;
- independent requests assigned to separate GPUs.

PCIe and inter-GPU communication were identified as potential bottlenecks, especially for tightly coupled per-token model parallelism.

The user added a historically grounded correction to an analogy about PDP-10 responsiveness: substantial I/O processing and terminal-oriented timesharing allowed many simultaneous users to feel promptly served. This reinforced the broader system-architecture theme of specialized cooperating processors.

### LLM Performance Vocabulary

Tokens per second was introduced as generated-output throughput rather than a universal machine score.

Important distinctions:

- tokens are text units rather than words;
- model identity and quantization are required for meaningful comparison;
- prompt processing and output generation have different speeds;
- time to first token strongly affects perceived responsiveness;
- larger contexts and more involved reasoning can increase startup delay.

The user connected these concepts to observed delays and visible streaming in existing AI chats.

### Reasoning Protocol Discussion

The user asked whether the established collaboration and reasoning workflow would provide an advantage over vanilla prompting.

The discussion concluded that the workflow adds prompt-processing and constraint overhead but may reduce ambiguity, repeated corrections, and unsupported inference.

The phrase "organize uncertainty" was accepted as a useful description of the protocol's effect:

- distinguish evidence from inference;
- identify the source and relevance of uncertainty;
- preserve competing models;
- state what evidence would discriminate between them.

This was recognized as broader than merely preserving uncertainty.

### Planned Edge-AI Architecture

The user proposed building:

- Pironman MAX with Raspberry Pi 5, AI Camera, and probably DX-M1;
- separate Raspberry Pi 5 with Hailo HAT and likely microSD storage.

The systems will be used to learn edge inference and camera-based AI.

The cluster was assigned a likely workshop role:

- datasets;
- Python environments;
- model testing;
- preprocessing;
- export and conversion;
- quantization;
- vendor compilation;
- experiment tracking;
- modest training or fine-tuning where practical.

The edge nodes will run the deployed camera and inference pipelines.

The preferred sequence was established:

> Build -> install -> run a known model -> measure -> understand -> change one thing.

### INT8 and Quantization

INT8 was explained as 8-bit integer representation used to reduce memory consumption and memory traffic and to exploit efficient low-precision accelerator arithmetic.

Quantization was understood as an engineering trade-off among:

- precision;
- model size;
- speed;
- power;
- accuracy.

The qualifier in "25 TOPS INT8" was recognized as essential: the number describes throughput for that numeric format rather than general-purpose performance.

### ARM NEON

The user noted the Raspberry Pi 5's NEON vector facilities and asked whether they were too small to matter.

Accepted conclusion:

- NEON is useful SIMD acceleration for CPU inference;
- it does not compete directly with a GPU or NPU in total parallelism;
- optimized runtimes can use NEON to process multiple low-precision values per instruction;
- pure CPU inference on the Pi is therefore worth testing as an educational and baseline workload.

### Current Maintenance Decision

The conversation produced sufficient accepted structure for an initial project state and session log.

No separate domain knowledge capsule was created because accelerator-specific behavior has not yet been experimentally verified. The current durable knowledge is primarily:

- project scope;
- hardware inventory;
- architectural mental model;
- evaluation criteria;
- open questions;
- planned experiments.


