#!/bin/bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
while [ ! -d "$REPO_ROOT/configs" ] && [ "$REPO_ROOT" != "/" ]; do
  REPO_ROOT="$(dirname "$REPO_ROOT")"
done

# Set Spanglish keyboard layout
# Source: https://github.com/bladecoder/spanglish-keyboard-layout
cp -r "$REPO_ROOT/configs/xkb" "$HOME/.config/"
