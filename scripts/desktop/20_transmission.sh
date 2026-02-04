#!/bin/bash

sudo snap install -y transmission --classic

mkdir -p $HOME/.config/Code/User
cp ./configs/vscode.json $HOME/.config/Code/User/settings.json

# Install default supported themes
code --install-extension enkia.tokyo-night
