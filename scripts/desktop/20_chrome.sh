#!/bin/bash
set -euo pipefail

# Browse the web with the most popular browser. See https://www.google.com/chrome/
curl -fsSL -o /tmp/google-chrome-stable_current_amd64.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
[ -s /tmp/google-chrome-stable_current_amd64.deb ] || { echo "Chrome download failed"; exit 1; }
sudo apt install -y /tmp/google-chrome-stable_current_amd64.deb
rm -f /tmp/google-chrome-stable_current_amd64.deb
xdg-settings set default-web-browser google-chrome.desktop
