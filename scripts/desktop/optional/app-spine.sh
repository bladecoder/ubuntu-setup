#!/bin/bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
while [ ! -d "$REPO_ROOT/configs" ] && [ "$REPO_ROOT" != "/" ]; do
  REPO_ROOT="$(dirname "$REPO_ROOT")"
done

read -p "Enter your Spine activation code: " ACTIVATION_CODE
curl -sLo /tmp/spine.tar.gz "https://eu.esotericsoftware.com/launcher/linux/$ACTIVATION_CODE"
tar -xzf /tmp/spine.tar.gz -C /tmp
mkdir -p "$HOME/apps"
mv "/tmp/Spine" "$HOME/apps/"

cp "$REPO_ROOT/configs/icons/spine-icon.png" "$HOME/apps/Spine/"

# Create desktop entry
APP_NAME="Spine"
APP_PATH="$HOME/apps/Spine/Spine.sh"
ICON_PATH="$HOME/apps/Spine/spine-icon.png"
DESKTOP_FILE="$HOME/.local/share/applications/${APP_NAME}.desktop"

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
