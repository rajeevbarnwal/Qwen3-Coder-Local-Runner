#!/bin/bash
sudo apt-get update
sudo apt-get install pciutils build-essential cmake curl libcurl4-openssl-dev -y
git clone https://github.com/ggerganov/llama.cpp
cd llama.cpp
cmake . -B build -DBUILD_SHARED_LIBS=OFF -DGGML_CUDA=ON -DLLAMA_CURL=ON
cmake --build build --config Release -j --target llama-cli llama-gguf-split
cp build/bin/llama-* ..

