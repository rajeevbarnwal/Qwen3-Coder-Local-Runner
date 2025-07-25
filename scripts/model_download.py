from huggingface_hub import snapshot_download

snapshot_download(
    repo_id="unsloth/Qwen3-Coder-480B-A35B-Instruct-GGUF",
    local_dir="Qwen3-Coder",
    allow_patterns=["*UD-Q2_K_XL*"]
)

