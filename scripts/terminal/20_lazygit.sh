#!/bin/bash
set -euo pipefail

LAZYGIT_VERSION="$(
  curl -fsSL "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" \
    | grep -Po '"tag_name": "v\K[^"]*' \
    || true
)"
[ -n "$LAZYGIT_VERSION" ] || { echo "Unable to resolve Lazygit version"; exit 1; }
curl -fsSL -o /tmp/lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar -xzf /tmp/lazygit.tar.gz -C /tmp lazygit
sudo install /tmp/lazygit /usr/local/bin
rm -f /tmp/lazygit.tar.gz /tmp/lazygit
mkdir -p "$HOME/.config/lazygit/"
touch "$HOME/.config/lazygit/config.yml"
