# SSD_offloading

## Overview
This modeling tool builds upon the [simulator](https://github.com/scale-snu/LLMSimulator.git) introduced in the MICRO 2024 paper “Duplex: A Device for Large Language Models with Mixture of Experts, Grouped Query Attention, and Continuous Batching.” The modeling tool supports breaking down the energy consumption and token generation latency of LLM inference on a per-operation basis (e.g., QKV generation, attention, output projection). For Mixture-of-Experts (MoE) models, the breakdown can be detailed based on whether the gated expert weights are offloaded to CPU-memory or SSD.

Key features:
- The CPU-memory and SSD read bandwidths—and the consequent reduction in device-memory bandwidth available for GPU compute when weights offloaded to CPU-memory or SSD are read concurrently with the GPU compute—are incorporated.
- The memory/storage access energy, the GPU compute energy, and the latency are calculated using the modeling tool.
- In the experimental workflow, the resulting latency is incorporated to calculate the background energy due to the memory’s static power and the GPU’s idle power.


## Prerequisites
- Compiler: g++ version 11.4.0
- cmake, clang++


## Getting Started
### Build
1. Clone the repository
```bash
   $ git clone https://github.com/scale-snu/SSD_offloading.git
   $ cd SSD_offloading
   $ git submodule update --init --recursive
```
2. Apply patches
```bash
   $ ./patches.sh
```
3. Build executable files
```bash
   $ cd LLMSimulator
   $ mkdir build && cd build
   $ cmake ..
   $ make -j$(nproc)
```

### Experiment workflow
```bash
   $ cd ..

   # Figure 4 and 5
   $ python figure_4_and_5.py

   # Figure 6
   $ python figure_6.py
```

## Contact
Kwanhee Kyung kwanhee.kyung@scale.snu.ac.kr

Sungmin Yun sungmin.yun@snu.ac.kr
