#!/bin/bash
set -euo pipefail

LOCALSEND_VERSION="$(
  curl -fsSL "https://api.github.com/repos/localsend/localsend/releases/latest" \
    | grep -Po '"tag_name": "v\K[^"]*' \
    || true
)"
[ -n "$LOCALSEND_VERSION" ] || { echo "Unable to resolve LocalSend version"; exit 1; }
wget -O /tmp/localsend.deb "https://github.com/localsend/localsend/releases/latest/download/LocalSend-${LOCALSEND_VERSION}-linux-x86-64.deb"
[ -s /tmp/localsend.deb ] || { echo "LocalSend download failed"; exit 1; }
sudo apt install -y /tmp/localsend.deb
rm -f /tmp/localsend.deb
