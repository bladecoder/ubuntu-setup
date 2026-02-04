#!/bin/bash

wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor >/tmp/packages.microsoft.gpg
sudo install -D -o root -g root -m 644 /tmp/packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" | sudo tee /etc/apt/sources.list.d/vscode.list >/dev/null
rm -f /tmp/packages.microsoft.gpg

sudo apt update -y
sudo apt install -y code

mkdir -p $HOME/.config/Code/User
cp ./configs/vscode.json $HOME/.config/Code/User/settings.json

# Install default supported themes
code --install-extension enkia.tokyo-night
