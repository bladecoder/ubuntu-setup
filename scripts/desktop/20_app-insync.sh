#!/bin/bash
set -euo pipefail

# Sync files with Google Drive using https://www.insynchq.com/
# Version for Ubuntu 25.04
curl -fsSL -o /tmp/insync.deb "https://cdn.insynchq.com/builds/linux/3.9.6.60027/insync_3.9.6.60027-plucky_amd64.deb"
[ -s /tmp/insync.deb ] || { echo "Insync download failed"; exit 1; }
sudo apt install -y /tmp/insync.deb
rm -f /tmp/insync.deb
