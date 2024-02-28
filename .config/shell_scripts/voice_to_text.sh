#!/bin/bash

# Define the audio source
AUDIOSOURCE="alsa_input.pci-0000_00_1f.3.analog-stereo"

# Define the output file path
OUTPUTFILE="$HOME/.cache/audio.wav"

# Choose vosk-model 
# 1 Gb -
VOSKMODEL="$HOME/data/vosk-model-en-in-0.5"
#36 mb - 
#VOSKMODEL="$HOME/data/vosk-model-small-en-in-0.4" 

# Record 4 seconds of audio
ffmpeg -y -f pulse -i "$AUDIOSOURCE" -t 5 -acodec pcm_s16le -ar 16000 -ac 1 "$OUTPUTFILE" >/dev/null 2>&1 
vosk-transcriber -m "$VOSKMODEL" -i ~/.cache/audio.wav -o ~/.cache/transcript.txt >/dev/null 2>&1 
cat ~/.cache/transcript.txt
