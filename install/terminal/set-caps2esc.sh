#!/bin/sh

sudo apt install -y interception-tools interception-caps2esc

sudo cp ./configs/capstoesc/caps2esc.yaml /etc/interception/udevmon.d/
sudo cp ./configs/capstoesc/udevmon.service /etc/systemd/system/
