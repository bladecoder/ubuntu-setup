#!/bin/bash
set -euo pipefail

# Needed for all installers
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install -y curl git unzip wget

# Create local folders
mkdir -p "$HOME/.local/bin"
mkdir -p "$HOME/.local/share/"
mkdir -p "$HOME/.config/"
