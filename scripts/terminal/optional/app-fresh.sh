#!/bin/bash
set -euo pipefail

# Install and Updates the Fresh editor

ARCH="$(dpkg --print-architecture)"
FRESH_DEB_URL="$(
  curl -fsSL https://api.github.com/repos/sinelaw/fresh/releases/latest \
    | grep "browser_download_url.*_${ARCH}\\.deb" \
    | cut -d '\"' -f 4 \
    | head -n 1 \
    || true
)"
[ -n "$FRESH_DEB_URL" ] || { echo "No Fresh .deb found for architecture: $ARCH"; exit 1; }

curl -fsSL -o /tmp/fresh-editor.deb "$FRESH_DEB_URL"
[ -s /tmp/fresh-editor.deb ] || { echo "Fresh download failed"; exit 1; }
sudo dpkg -i /tmp/fresh-editor.deb
rm -f /tmp/fresh-editor.deb
