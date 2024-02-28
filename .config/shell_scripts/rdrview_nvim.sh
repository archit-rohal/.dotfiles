#!/bin/zsh

# Use the first argument as the URL
url=$1

# Use rdrview to fetch webpage and pipe it to NeoVim
rdrview "$url" | vim -
