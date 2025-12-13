#!/bin/bash

ansi_art='┏━┓┏┳┓┏━┓╻┏ ┏━┓┏━┓┏━╸   ╻ ╻┏┓ ╻ ╻┏┓╻╺┳╸╻ ╻
┃ ┃┃┃┃┣━┫┣┻┓┣━┫┗━┓┣╸    ┃ ┃┣┻┓┃ ┃┃┗┫ ┃ ┃ ┃
┗━┛╹ ╹╹ ╹╹ ╹╹ ╹┗━┛┗━╸   ┗━┛┗━┛┗━┛╹ ╹ ╹ ┗━┛'

# Variables
REPO_URL="https://github.com/bladecoder/omakub-blade"
ZIP_URL="$REPO_URL/archive/refs/heads/main.zip"
TMP_DIR="/tmp/omakub-blade-main"

clear
echo -e "\033[35m$ansi_art\033[0m\n"

rm -rf "$TMP_DIR"
rm -f /tmp/omakub-blade.zip

echo "Downloading project zip..."
wget -q -O /tmp/omakub-blade.zip "$ZIP_URL"

echo "Unzipping to $TMP_DIR..."
unzip -q /tmp/omakub-blade.zip -d /tmp/

echo "Running install.sh..."
chmod +x "$TMP_DIR/install.sh"
"$TMP_DIR/install.sh"
