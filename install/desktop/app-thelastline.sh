#!/bin/bash

APP_VERSION=$(curl -s "https://api.github.com/repos/bladecoder/thelastline/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -sLo /tmp/thelastline.tar.gz "https://github.com/bladecoder/thelastline/releases/download/v${APP_VERSION}/thelastline-v${APP_VERSION}-x86_64-linux.tar.gz"
tar -xzf /tmp/thelastline.tar.gz -C /tmp
mkdir -p $HOME/apps
mv /tmp/thelastline-v${APP_VERSION}-x86_64-linux/thelastline $HOME/apps/

# Create desktop entry
APP_NAME="The Last Line"
APP_PATH="$HOME/apps/thelastline/bin/thelastline"
ICON_PATH="$HOME/apps/thelastline/lib/thelastline.png"
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
Categories=Games;
EOF
