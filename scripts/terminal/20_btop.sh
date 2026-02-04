#!/bin/bash

# This script installs btop, a resource monitor that shows usage and stats for processor, memory, disks, network and processes.
sudo apt install -y btop

# Use Omakase btop config
mkdir -p $HOME/.config/btop/themes
cp ./configs/btop.conf $HOME/.config/btop/btop.conf
cp ./configs/theme/btop.theme $HOME/.config/btop/themes/tokyo-night.theme

