#!/bin/bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
while [ ! -d "$REPO_ROOT/configs" ] && [ "$REPO_ROOT" != "/" ]; do
  REPO_ROOT="$(dirname "$REPO_ROOT")"
done

sudo apt install -y interception-tools interception-caps2esc

sudo cp "$REPO_ROOT/configs/capstoesc/caps2esc.yaml" /etc/interception/udevmon.d/
sudo cp "$REPO_ROOT/configs/capstoesc/udevmon.service" /etc/systemd/system/
