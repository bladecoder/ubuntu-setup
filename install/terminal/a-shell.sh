#!/bin/bash

# Configure the bash shell using defaults (only if not already installed)
if [ ! -d ~/.local/share/bash/ ]; then
    [ -f ~/.bashrc ] && mv ~/.bashrc ~/.bashrc.bak
    cp ./configs/bashrc ~/.bashrc
else
    echo "Bash configuration already exists, skipping .bashrc (user customizations preserved)..."
fi

# Configure the inputrc using defaults (always update)
[ -f ~/.inputrc ] && mv ~/.inputrc ~/.inputrc.bak
cp ./configs/inputrc ~/.inputrc

# Copy bash configs to local share (always update)
mkdir -p ~/.local/share/bash
cp ./configs/bash/* ~/.local/share/bash/

## make the user shell bash if not already
if [ "$SHELL" != "$(which bash)" ]; then
    chsh -s "$(which bash)"
fi
