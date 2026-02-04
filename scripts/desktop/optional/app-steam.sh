#!/bin/bash

# Play games from https://store.steampowered.com/
wget -O /tmp/steam.deb https://cdn.akamai.steamstatic.com/client/installer/steam.deb
sudo apt install -y /tmp/steam.deb
rm /tmp/steam.deb

