#!/bin/bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
while [ ! -d "$REPO_ROOT/configs" ] && [ "$REPO_ROOT" != "/" ]; do
  REPO_ROOT="$(dirname "$REPO_ROOT")"
done

# This script installs btop, a resource monitor that shows usage and stats for processor, memory, disks, network and processes.
sudo apt install -y btop

# Use Omakase btop config
mkdir -p "$HOME/.config/btop/themes"
cp "$REPO_ROOT/configs/btop.conf" "$HOME/.config/btop/btop.conf"
cp "$REPO_ROOT/configs/theme/btop.theme" "$HOME/.config/btop/themes/tokyo-night.theme"
