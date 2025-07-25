#!/bin/bash
set -e

# Allow local override: export GGML_CUDA=ON for CUDA builds
CUDA_FLAG=${GGML_CUDA:-OFF}

sudo apt-get update
sudo apt-get install pciutils build-essential cmake curl libcurl4-openssl-dev -y

# Clone & build
git clone https://github.com/ggml-org/llama.cpp
cd llama.cpp

cmake . -B build \
  -DBUILD_SHARED_LIBS=OFF \
  -DGGML_CUDA=$CUDA_FLAG \
  -DLLAMA_CURL=ON

cmake --build build --config Release -j --target llama-cli llama-gguf-split

# Copy binaries out
cp build/bin/llama-* ..

