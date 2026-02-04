#!/bin/bash

# Sync files with Google Drive using https://www.insynchq.com/
# Version for Ubuntu 25.04
curl -sLo /tmp/insync.deb "https://cdn.insynchq.com/builds/linux/3.9.6.60027/insync_3.9.6.60027-plucky_amd64.deb"
sudo apt install -y /tmp/insync.deb
rm /tmp/insync.deb
