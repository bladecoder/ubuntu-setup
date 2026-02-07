#!/bin/bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
while [ ! -d "$REPO_ROOT/configs" ] && [ "$REPO_ROOT" != "/" ]; do
  REPO_ROOT="$(dirname "$REPO_ROOT")"
done

curl -fsSL -o /tmp/inky.zip "https://github.com/inkle/inky/releases/latest/download/Inky_linux.zip"
[ -s /tmp/inky.zip ] || { echo "Inky download failed"; exit 1; }
rm -rf /tmp/Inky
unzip -oq /tmp/inky.zip -d /tmp/Inky
mkdir -p "$HOME/apps"
rm -rf "$HOME/apps/Inky"
if [ -d /tmp/Inky/Inky ]; then
  mv "/tmp/Inky/Inky" "$HOME/apps/Inky"
else
  mv "/tmp/Inky" "$HOME/apps/Inky"
fi
rm -f /tmp/inky.zip
mkdir -p "$HOME/.local/bin"
ln -sfn "$HOME/apps/Inky/inky" "$HOME/.local/bin/inky"

cp "$REPO_ROOT/configs/icons/inky-icon.png" "$HOME/apps/Inky/"

# Create desktop entry
APP_NAME="Inky"
APP_PATH="$HOME/apps/Inky/inky"
ICON_PATH="$HOME/apps/Inky/inky-icon.png"
DESKTOP_FILE="$HOME/.local/share/applications/${APP_NAME}.desktop"
mkdir -p "$HOME/.local/share/applications"

cat > "$DESKTOP_FILE" <<EOF
[Desktop Entry]
Version=1.0
Name=$APP_NAME
Comment=$APP_NAME
Exec=$APP_PATH
Terminal=false
Type=Application
Icon=$ICON_PATH
Categories=Apps;
EOF
