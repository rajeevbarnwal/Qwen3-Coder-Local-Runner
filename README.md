# Qwen3-Coder-Local-Runner
A guide and scripts to run Qwen3-Coder-480B-A35B locally with llama.cpp + Unsloth GGUFs

**Qwen3-Coder-480B-A35B Setup Guide**

Hi, I’m RajeevBarnwal, and this repository contains my guide and scripts to run Qwen3-Coder-480B-A35B locally using llama.cpp. This SOTA model, optimized by Unsloth, excels in agentic coding with a 61.8% Aider Polyglot score and supports up to 1M token contexts [1].

**Features**
Local setup for Qwen3-Coder with llama.cpp.
Support for 256K to 1M token contexts via YaRN [1].
Tool-calling example for dynamic tasks.
Benchmarks showcasing top-tier performance.

**Installation**
1. **Clone the Repository:**

git clone https://github.com/your-username/Qwen3-Coder-Setup.git
cd Qwen3-Coder-Setup

2. **Install Dependencies:** See my Medium article for detailed llama.cpp and model download instructions.
3. **Run the Model:** Use scripts in the scripts/ folder with optimized settings.

**Example: Tool Calling**
Check scripts/tool_calling.py for a temperature-fetching example.

**Benchmarks:**
**Aider-Polyglot:** 61.8% [1]
**SWE-bench Verified (500 turns):** 69.6% [1]
**WebArena:** 49.9% [1]
**BFCL-v3:** 68.7% [1]

**Contributing**
I’d love your contributions! Submit a pull request or open an issue.

**License**

MIT License

**References:**
1. Unsloth, “Qwen3-Coder-480B-A35B-Instruct-GGUF,” Hugging Face.
2. Qwen Team, “Qwen3 Technical Documentation,” Qwen GitHub.
3. llama.cpp, “Official Repository,” GitHub.
4. Hugging Face, “Hugging Face Hub,” Hugging Face.
