#!/bin/bash


mkdir -p $HOME/.local/share/fonts

# CascadiaMono
wget -q -O /tmp/CascadiaMono.zip https://github.com/ryanoasis/nerd-fonts/releases/latest/download/CascadiaMono.zip
unzip -q /tmp/CascadiaMono.zip -d /tmp/CascadiaFont
cp /tmp/CascadiaFont/*.ttf $HOME/.local/share/fonts
rm -rf /tmp/CascadiaMono.zip /tmp/CascadiaFont

# iA Fonts
wget -q -O /tmp/iafonts.zip https://github.com/iaolo/iA-Fonts/archive/refs/heads/master.zip
unzip -q /tmp/iafonts.zip -d /tmp/iaFonts
cp /tmp/iaFonts/iA-Fonts-master/iA\ Writer\ Mono/Static/iAWriterMonoS-*.ttf $HOME/.local/share/fonts
rm -rf /tmp/iafonts.zip /tmp/iaFonts

fc-cache

