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
