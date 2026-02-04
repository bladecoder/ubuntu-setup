#!/bin/bash

curl -sLo /tmp/inky.zip "https://github.com/inkle/inky/releases/latest/download/Inky_linux.zip"
unzip -q /tmp/inky.zip -d /tmp/Inky
mv /tmp/Inky $HOME/apps
rm -f /tmp/inky.zip
ln -s $HOME/apps/Inky/inky $HOME/.local/bin/inky

cp ./configs/icons/inky-icon.png $HOME/apps/Inky/

# Create desktop entry
APP_NAME="Inky"
APP_PATH="$HOME/apps/Inky/inky"
ICON_PATH="$HOME/apps/Inky/inky-icon.png"
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


