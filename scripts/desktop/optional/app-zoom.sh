#!/bin/bash
set -euo pipefail

# Make video calls using https://zoom.us/
wget -O /tmp/zoom_amd64.deb https://zoom.us/client/latest/zoom_amd64.deb
[ -s /tmp/zoom_amd64.deb ] || { echo "Zoom download failed"; exit 1; }
sudo apt install -y /tmp/zoom_amd64.deb
rm -f /tmp/zoom_amd64.deb
