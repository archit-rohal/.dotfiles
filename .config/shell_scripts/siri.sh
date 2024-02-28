#!/bin/bash
tgpt -q "Adopt a sharp, sarcastic tone reminiscent of a renowned, witty author (think PG Wodehouse at his most humorous). Condense your answer to under 100 words, ensuring it's rich with information yet brief, and pack every sentence with value without sparing any critical detail. Cover all angles without lingering too long on any one point., $(voice_to_text)" | /usr/local/bin/piper/piper --model /usr/local/bin/piper/en_US-libritts-high.onnx --output-raw | \aplay -r 22050 -f S16_LE -t raw - 2>/dev/null 2>&1 