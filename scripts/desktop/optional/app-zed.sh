#!/bin/bash
set -euo pipefail

curl -fsSL -o /tmp/zed-install.sh https://zed.dev/install.sh
[ -s /tmp/zed-install.sh ] || { echo "Zed installer download failed"; exit 1; }
sh /tmp/zed-install.sh
rm -f /tmp/zed-install.sh
