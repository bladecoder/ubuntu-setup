#!/bin/bash

echo "Downloading the VirtIO drivers to $HOME/Downloads"
mkdir -p $HOME/Downloads
wget -O $HOME/Downloads/virtio-win-0.1.240.iso https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/archive-virtio/virtio-win-0.1.240-1/virtio-win-0.1.240.iso

echo "Download the Windows 11 ISO..."
open https://www.microsoft.com/software-download/windows11
read -p "Have you finished downloading? [y/N]: " confirm
if [[ ! $confirm =~ ^[Yy]$ ]]; then
	echo "Please finish downloading and follow instructions in https://sysguides.com/install-a-windows-11-virtual-machine-on-kvm"
	exit 1
fi

echo "Follow instructions in..."
open https://sysguides.com/install-a-windows-11-virtual-machine-on-kvm
