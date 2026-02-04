#!/bin/bash

# Make video calls using https://zoom.us/
wget -O /tmp/zoom_amd64.deb https://zoom.us/client/latest/zoom_amd64.deb
sudo apt install -y /tmp/zoom_amd64.deb
rm /tmp/zoom_amd64.deb

