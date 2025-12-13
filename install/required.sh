#!/bin/bash

# Needed for all installers
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install -y curl git unzip
mkdir -p $HOME/.local/bin
