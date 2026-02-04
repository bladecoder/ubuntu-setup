#!/bin/bash

# Favorite apps for dock
apps=(
	"google-chrome.desktop"
	"org.gnome.Ptyxis.desktop"
	"org.gnome.Nautilus.desktop"
	"code.desktop"
	"intellij-idea-community_intellij-idea-community.desktop"
)

# Array to hold installed favorite apps
installed_apps=()

# Directory where .desktop files are typically stored
desktop_dirs=(
	"/var/lib/flatpak/exports/share/applications"
	"/usr/share/applications"
	"/usr/local/share/applications"
	"$HOME/.local/share/applications"
)

# Check if a .desktop file exists for each app
for app in "${apps[@]}"; do
	for dir in "${desktop_dirs[@]}"; do
		if [ -f "$dir/$app" ]; then
			installed_apps+=("$app")
			break
		fi
	done
done

# Convert the array to a format suitable for gsettings
favorites_list=$(printf "'%s'," "${installed_apps[@]}")
favorites_list="[${favorites_list%,}]"

# Set the favorite apps
gsettings set org.gnome.shell favorite-apps "$favorites_list"

# Set dock to auto-hide
gsettings set org.gnome.shell.extensions.dash-to-dock autohide true

# Set dock to the right side
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position 'RIGHT'
