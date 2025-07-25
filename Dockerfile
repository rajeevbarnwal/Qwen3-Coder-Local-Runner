# Dockerfile for Qwen3-Coder Local Runner
FROM nvidia/cuda:12.2.0-devel-ubuntu22.04

ENV DEBIAN_FRONTEND=noninteractive
WORKDIR /workspace

# Install system deps
RUN apt-get update && \
    apt-get install -y python3 python3-pip git cmake build-essential pciutils curl libcurl4-openssl-dev && \
    rm -rf /var/lib/apt/lists/*

# Python deps
RUN pip3 install huggingface_hub hf_transfer transformers

# Build llama.cpp
RUN git clone https://github.com/ggerganov/llama.cpp && \
    cd llama.cpp && \
    cmake . -B build -DBUILD_SHARED_LIBS=OFF -DGGML_CUDA=ON -DLLAMA_CURL=ON && \
    cmake --build build --config Release -j && \
    cp build/bin/llama-* /usr/local/bin/

# Copy project files
COPY . /workspace
WORKDIR /workspace

CMD ["/bin/bash"]

