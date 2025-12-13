#!/bin/bash

# NOTE: Latest platform tools are in https://dl.google.com/android/repository/platform-tools-latest-linux.zip

# Check for java installation
if ! type -p java >/dev/null; then
    echo "Java is required to install Android SDK. Please install it first."
    exit 1
fi


ANDROID_HOME=$HOME/apps/android-sdk
mkdir -p $ANDROID_HOME
wget -P "/tmp" https://dl.google.com/android/repository/commandlinetools-linux-8092744_latest.zip
unzip "/tmp/commandlinetools-linux-8092744_latest.zip" -d $ANDROID_HOME
rm /tmp/commandlinetools-linux-8092744_latest.zip

# Avoid annoying warning from sdkmanager
mkdir -p $HOME/.android
touch $HOME/.android/repositories.cfg

# move cmdline-tools to proper location
mv $ANDROID_HOME/cmdline-tools $ANDROID_HOME/latest
mkdir -p $ANDROID_HOME/cmdline-tools
mv $ANDROID_HOME/latest $ANDROID_HOME/cmdline-tools/

# Accept all licences
yes | $ANDROID_HOME/cmdline-tools/latest/bin/sdkmanager --licenses
# Update to lastest tools version
$ANDROID_HOME/cmdline-tools/latest/bin/sdkmanager --update
$ANDROID_HOME/cmdline-tools/latest/bin/sdkmanager "build-tools;35.0.1" "platforms;android-35" "emulator" "platform-tools" "system-images;android-29;default;x86_64"

mkdir -p $HOME/.local/bin
ln -s $ANDROID_HOME/platform-tools/adb $HOME/.local/bin/adb