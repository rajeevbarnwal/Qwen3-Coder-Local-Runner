#!/bin/bash
./llama-cli \
  --model ./Qwen3-Coder/...UD-Q2_K_XL-00001-of-00004.gguf \
  --threads -1 \
  --ctx-size 16384 \
  --n-gpu-layers 99 \
  -ot ".ffn_.*_exps.=CPU" \
  --temp 0.7 \
  --top-p 0.8 \
  --top-k 20 \
  --repeat-penalty 1.05

