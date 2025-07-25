from transformers import AutoTokenizer

def get_current_temperature(location: str, unit: str = "celsius"):
    return {"temperature": 26.1, "location": location, "unit": unit}

tokenizer = AutoTokenizer.from_pretrained("unsloth/Qwen3-Coder-480B-A35B-Instruct")
messages = [
    {'role': 'user', 'content': "What's the temperature in San Francisco now?"},
    {'role': 'assistant', 'function_call': None, 'tool_calls': [{
        'id': 'ID',
        'function': {'name': 'get_current_temperature', 'arguments': {"location": "San Francisco, CA, USA"}},
        'type': 'function'
    }]},
    {'role': 'tool', 'content': '{"temperature": 26.1, "location": "San Francisco, CA, USA", "unit": "celsius"}', 'tool_call_id': 'ID'},
]
prompt = tokenizer.apply_chat_template(messages, tokenize=False)
print(prompt)

