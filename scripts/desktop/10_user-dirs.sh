#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
while [ ! -d "$REPO_ROOT/configs" ] && [ "$REPO_ROOT" != "/" ]; do
  REPO_ROOT="$(dirname "$REPO_ROOT")"
done

mkdir -p "$HOME/.config"

# Backup existing user-dirs configs before updating
for file in user-dirs.conf user-dirs.dirs user-dirs.locale; do
  if [ -f "$HOME/.config/$file" ]; then
    mv "$HOME/.config/$file" "$HOME/.config/$file.bak"
  fi
done

cp "$REPO_ROOT/configs/user-dirs/"* "$HOME/.config/"

mkdir -p \
  "$HOME/Documents" \
  "$HOME/Downloads" \
  "$HOME/Desktop" \
  "$HOME/Media" \
  "$HOME/Projects" \
  "$HOME/Workspace"
