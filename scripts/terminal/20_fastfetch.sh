#!/bin/bash

# Display system information in the terminal
sudo apt install -y fastfetch

# TODO: custom fastfetch config

# Only attempt to set configuration if fastfetch is not already set
#if [ ! -f "$HOME/.config/fastfetch/config.jsonc" ]; then
#  # Use Omakase fastfetch config
#  mkdir -p $HOME/.config/fastfetch
#  cp ./configs/fastfetch.jsonc $HOME/.config/fastfetch/config.jsonc
#fi
