#!/bin/bash

envsubst < ./configs/xcompose > $HOME/.XCompose
ibus restart
gsettings set org.gnome.desktop.input-sources xkb-options "['compose:caps']"
