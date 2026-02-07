#!/bin/bash
set -euo pipefail

DESKTOP_TWEAKS_APPLIED=false

cleanup() {
  if [ "$DESKTOP_TWEAKS_APPLIED" = true ]; then
    gsettings set org.gnome.desktop.screensaver lock-enabled true
    gsettings set org.gnome.desktop.session idle-delay 300
  fi
}

on_error() {
  echo -e "\n\033[31mUbuntu Setup installation failed! You can retry by running: ./setup.sh\033[0m"
}

trap cleanup EXIT
trap on_error ERR

# Check the distribution name and version and abort if incompatible
source ./scripts/check-version.sh
source ./scripts/required.sh >/dev/null
source ./scripts/identification.sh

# Desktop software and tweaks will only be installed if we're running Gnome
if [[ "${XDG_CURRENT_DESKTOP:-}" == *"GNOME"* || "${XDG_CURRENT_DESKTOP:-}" == *"Unity"* ]]; then
  # Ensure computer doesn't go to sleep or lock while installing
  gsettings set org.gnome.desktop.screensaver lock-enabled false
  gsettings set org.gnome.desktop.session idle-delay 0
  DESKTOP_TWEAKS_APPLIED=true

  echo "Installing terminal and desktop tools..."

  # Install terminal tools
  source ./scripts/terminal.sh

  # Install desktop tools and tweaks
  source ./scripts/desktop.sh

else
  echo "Only installing terminal tools..."
  source ./scripts/terminal.sh
fi
