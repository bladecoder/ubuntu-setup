#!/bin/bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
while [ ! -d "$REPO_ROOT/configs" ] && [ "$REPO_ROOT" != "/" ]; do
  REPO_ROOT="$(dirname "$REPO_ROOT")"
done

sudo apt install -y keyd

# Stop the previous remapper before keyd takes control of the keyboards.
sudo systemctl daemon-reload
if systemctl cat udevmon.service >/dev/null 2>&1; then
  sudo systemctl disable --now udevmon.service
fi

# Retire only the files installed by the previous version of this script.
for legacy_file in \
  /etc/interception/udevmon.d/caps2esc.yaml \
  /etc/systemd/system/udevmon.service; do
  if sudo test -f "$legacy_file"; then
    sudo cp -a --backup=numbered "$legacy_file" "$legacy_file.bak"
    sudo rm -- "$legacy_file"
  fi
done

sudo install -d -m 0755 /etc/keyd
if sudo test -f /etc/keyd/default.conf && \
  ! sudo cmp -s "$REPO_ROOT/configs/keyd/default.conf" /etc/keyd/default.conf; then
  sudo cp -a --backup=numbered /etc/keyd/default.conf /etc/keyd/default.conf.bak
fi
sudo install -m 0644 "$REPO_ROOT/configs/keyd/default.conf" /etc/keyd/default.conf

sudo systemctl daemon-reload
sudo systemctl enable --now keyd.service
sudo systemctl restart keyd.service
