#!/bin/bash

APP_VERSION=$(curl -s "https://api.github.com/repos/Ultimaker/Cura/releases/latest" | grep -Po '"tag_name": "\K[^"]*')
curl -sLo $HOME/apps/UltiMaker-Cura-${APP_VERSION}-linux-X64.AppImage "https://github.com/Ultimaker/Cura/releases/download/${APP_VERSION}/UltiMaker-Cura-${APP_VERSION}-linux-X64.AppImage"
chmod +x $HOME/apps/UltiMaker-Cura-${APP_VERSION}-linux-X64.AppImage

# Create desktop entry
APP_NAME="Ultimaker Cura"
APP_PATH="$HOME/apps/UltiMaker-Cura-${APP_VERSION}-linux-X64.AppImage"
#ICON_PATH="$HOME/apps/thelastline/lib/thelastline.png"
DESKTOP_FILE="$HOME/.local/share/applications/${APP_NAME}.desktop"

cat > "$DESKTOP_FILE" <<EOF
[Desktop Entry]
Version=1.0
Name=$APP_NAME
Comment=$APP_NAME
Exec=$APP_PATH
Terminal=false
Type=Application
EOF
