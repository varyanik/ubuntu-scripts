#!/bin/bash

# Kernel
mkdir kernel_v4.0-vivid && cd kernel_v4.0-vivid
wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.0-vivid/linux-headers-4.0.0-040000-generic_4.0.0-040000.201504121935_amd64.deb
wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.0-vivid/linux-headers-4.0.0-040000_4.0.0-040000.201504121935_all.deb
wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.0-vivid/linux-image-4.0.0-040000-generic_4.0.0-040000.201504121935_amd64.deb

sudo dpkg -i linux-*.deb
sudo update-grub
sudo apt-get autoremove

# Nvidia driver
sudo apt-add-repository -y ppa:xorg-edgers/ppa
sudo apt-get update
sudo apt-get install -y nvidia-346 nvidia-settings

# NVIDIA Optimus support
# http://help.ubuntu.ru/wiki/bumblebee
sudo add-apt-repository -y ppa:bumblebee/stable
sudo apt-get update
sudo apt-get install -y bumblebee bumblebee-nvidia primus primus-libs:i386
sudo apt-get purge -y nvidia-prime
#sudo apt-get install --reinstall bumblebee-nvidia
#sudo apt-get install -y linux-headers-generic xserver-xorg-video-all libgl1-mesa-glx libgl1-mesa-dri xserver-xorg-core

# Screen calibration (asus n550jk)
# http://snakelab.cc/2015/01/09/running_ubuntu_on_asus_n550jk.html
xrandr --output eDP1 --gamma 0.68:0.7:0.7

# Fix subwoofer
echo 'options snd-hda-intel model=asus-mode4' | sudo tee -a /etc/modprobe.d/alsa-base.conf

# Keyboard FN buttons
sudo sed -i 's/^#\?GRUB_CMDLINE_LINUX_DEFAULT=.*/GRUB_CMDLINE_LINUX_DEFAULT="quiet splash acpi_osi="/g' /etc/default/grub
sudo update-grub

