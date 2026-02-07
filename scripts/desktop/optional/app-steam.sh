#!/bin/bash
set -euo pipefail

# Play games from https://store.steampowered.com/
wget -O /tmp/steam.deb https://cdn.akamai.steamstatic.com/client/installer/steam.deb
[ -s /tmp/steam.deb ] || { echo "Steam download failed"; exit 1; }
sudo apt install -y /tmp/steam.deb
rm -f /tmp/steam.deb
