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
