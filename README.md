# Qwen3-Coder-Local-Runner
A guide and scripts to run Qwen3-Coder-480B-A35B locally with llama.cpp + Unsloth GGUFs

# Qwen3-Coder-Local-Runner 🚀

[![CI](https://github.com/rajeevbarnwal/Qwen3-Coder-Local-Runner/actions/workflows/run_qwen.yml/badge.svg)](https://github.com/rajeevbarnwal/Qwen3-Coder-Local-Runner/actions)

> 🧠 Run Qwen3-Coder-480B-A35B locally using llama.cpp + Unsloth Dynamic GGUFs

[![Stars](https://img.shields.io/github/stars/rajeevbarnwal/Qwen3-Coder-Local-Runner?style=social)](https://github.com/rajeevbarnwal/Qwen3-Coder-Local-Runner/stargazers)
[![Forks](https://img.shields.io/github/forks/rajeevbarnwal/Qwen3-Coder-Local-Runner?style=social)](https://github.com/rajeevbarnwal/Qwen3-Coder-Local-Runner/network/members)
[![License](https://img.shields.io/github/license/rajeevbarnwal/Qwen3-Coder-Local-Runner)](./LICENSE)
[![Hugging Face](https://img.shields.io/badge/model-HuggingFace-blue)](https://huggingface.co/unsloth/Qwen3-Coder-480B-A35B-Instruct-GGUF)

---

## 📌 About This Project

This repo showcases how to run the powerful **Qwen3-Coder-480B-A35B** locally using `llama.cpp` and Unsloth’s optimized **GGUF** models. It includes:

- Setup scripts for llama.cpp
- Model download from Hugging Face
- Example inference commands
- Tool-calling demo
- Extended context (1M tokens) config
- Performance optimization tips

> 🔗 Related blog post: [How I Ran Qwen3-Coder Locally](https://medium.com/@rajeevbarnwal)

---

## 🧱 Setup Instructions

### 1. Install Prerequisites
```bash
sudo apt update
sudo apt install build-essential cmake curl pciutils libcurl4-openssl-dev -y
```

### 2. Clone & Build llama.cpp
```bash
git clone https://github.com/ggerganov/llama.cpp
cd llama.cpp
cmake . -B build -DBUILD_SHARED_LIBS=OFF -DGGML_CUDA=ON -DLLAMA_CURL=ON
cmake --build build --config Release -j --target llama-cli llama-gguf-split
cp build/bin/llama-* .
```

> 💡 Use `-DGGML_CUDA=OFF` for CPU-only.

---

## 📥 Download Qwen3 GGUF Model

```bash
pip install huggingface_hub hf_transfer
```

```python
from huggingface_hub import snapshot_download
snapshot_download(
  repo_id="unsloth/Qwen3-Coder-480B-A35B-Instruct-GGUF",
  local_dir="Qwen3-Coder",
  allow_patterns=["*UD-Q2_K_XL*"]
)
```

---

## 🧠 Run the Model

```bash
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
```

> 🧪 Offloading MoE layers to CPU reduces VRAM requirements and speeds up generation.

---

## 🧰 Tool Calling Demo

```python
def get_current_temperature(location: str, unit: str = "celsius"):
    return {"temperature": 26.1, "location": location, "unit": unit}
```

You can format prompts using the `transformers` tokenizer with ChatML-style templates.

```python
from transformers import AutoTokenizer

messages = [...]
tokenizer = AutoTokenizer.from_pretrained("unsloth/Qwen3-Coder-480B-A35B-Instruct")
prompt = tokenizer.apply_chat_template(messages, tokenize=False)
```

---

## 📏 Extend Context to 1M Tokens

```bash
--cache-type-k q5_1
--flash-attn
```

Make sure to use the **YaRN 1M context** GGUFs from Hugging Face.

---

## 📊 Benchmark Highlights

| Benchmark         | Qwen3 | Claude 4 | GPT-4.1 | Kimi-K2 |
|------------------|-------|----------|---------|---------|
| Aider Polyglot    | 61.8  | 56.4     | 52.4    | 60.0    |
| SWE-Bench (100T)  | 67.0  | 68.0     | 48.6    | 65.4    |
| WebArena          | 49.9  | 51.1     | 44.3    | 47.4    |
| Mind2Web          | 55.8  | 47.4     | 49.6    | 42.7    |

📎 Source: [Unsloth GitHub](https://github.com/unslothai/unsloth)

---

## 📂 Repo Structure

```
Qwen3-Coder-Local-Runner/
├── llama_cpp_setup.sh
├── run_qwen.sh
├── model_download.py
├── tool_calling_example.py
├── prompts/
│   ├── chat_template.txt
│   └── tool_call_prompt.json
├── benchmarks.md
└── assets/
    └── screenshots/
```

---

## 📃 License

This repo is licensed under the [MIT License](./LICENSE).

---

## 🤝 Contributing

Pull requests are welcome. Let’s make Qwen3 easier to run for everyone!

---

## 🙌 Credits

- [Unsloth.ai](https://github.com/unslothai/unsloth)
- [Hugging Face](https://huggingface.co/unsloth/Qwen3-Coder-480B-A35B-Instruct-GGUF)
- [llama.cpp by Georgi Gerganov](https://github.com/ggerganov/llama.cpp)

---

Happy Hacking! 💻
