#!/bin/bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
while [ ! -d "$REPO_ROOT/configs" ] && [ "$REPO_ROOT" != "/" ]; do
  REPO_ROOT="$(dirname "$REPO_ROOT")"
done

envsubst < "$REPO_ROOT/configs/xcompose" > "$HOME/.XCompose"
ibus restart
gsettings set org.gnome.desktop.input-sources xkb-options "['compose:caps']"
