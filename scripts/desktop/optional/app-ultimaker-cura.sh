#!/bin/bash
set -euo pipefail

APP_VERSION="$(
  curl -fsSL "https://api.github.com/repos/Ultimaker/Cura/releases/latest" \
    | grep -Po '"tag_name": "\K[^"]*' \
    || true
)"
[ -n "$APP_VERSION" ] || { echo "Unable to resolve Ultimaker Cura version"; exit 1; }

mkdir -p "$HOME/apps"
APP_PATH="$HOME/apps/UltiMaker-Cura-${APP_VERSION}-linux-X64.AppImage"
curl -fsSL -o "$APP_PATH" "https://github.com/Ultimaker/Cura/releases/download/${APP_VERSION}/UltiMaker-Cura-${APP_VERSION}-linux-X64.AppImage"
[ -s "$APP_PATH" ] || { echo "Ultimaker Cura download failed"; exit 1; }
chmod +x "$APP_PATH"

# Create desktop entry
APP_NAME="Ultimaker Cura"
#ICON_PATH="$HOME/apps/thelastline/lib/thelastline.png"
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
EOF
