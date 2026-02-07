#!/bin/bash
set -euo pipefail

LAZYDOCKER_VERSION="$(
  curl -fsSL "https://api.github.com/repos/jesseduffield/lazydocker/releases/latest" \
    | grep -Po '"tag_name": "v\K[^"]*' \
    || true
)"
[ -n "$LAZYDOCKER_VERSION" ] || { echo "Unable to resolve Lazydocker version"; exit 1; }
curl -fsSL -o /tmp/lazydocker.tar.gz "https://github.com/jesseduffield/lazydocker/releases/latest/download/lazydocker_${LAZYDOCKER_VERSION}_Linux_x86_64.tar.gz"
tar -xzf /tmp/lazydocker.tar.gz -C /tmp lazydocker
sudo install /tmp/lazydocker /usr/local/bin
rm -f /tmp/lazydocker.tar.gz /tmp/lazydocker
