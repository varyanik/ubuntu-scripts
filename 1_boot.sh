#!/bin/bash

# https://www.linux.com/learn/tutorials/776643-how-to-rescue-a-non-booting-grub-2-on-linux/

sudo add-apt-repository -y ppa:yannubuntu/boot-repair
sudo apt-get update
sudo apt-get install -y boot-repair && boot-repair

# Scripts to paste (example):
#sudo dpkg --configure -a
#sudo apt-get install -fy
#sudo apt-get purge -y --force-yes grub*-common grub-common:i386 shim-signed linux-signed*
#sudo apt-get install -y --force-yes grub-efi-amd64-signed shim-signed linux-signed-generic

