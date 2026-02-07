#!/bin/bash
set -euo pipefail

curl -fsSL -o /tmp/ollama-install.sh https://ollama.com/install.sh
[ -s /tmp/ollama-install.sh ] || { echo "Ollama installer download failed"; exit 1; }
sh /tmp/ollama-install.sh
rm -f /tmp/ollama-install.sh
