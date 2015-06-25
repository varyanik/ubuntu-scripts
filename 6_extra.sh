#!/bin/bash

not_installed() {
  return $(dpkg-query -W -f='${Status}' $1 2>/dev/null | grep -c "ok installed")
}

if not_installed 'virtualbox-4.3'; then
  wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | sudo apt-key add -
  sudo sh -c 'echo "deb http://download.virtualbox.org/virtualbox/debian $(lsb_release -sc) contrib" >> /etc/apt/sources.list'
  sudo apt-get update
  sudo apt-get install -y virtualbox-4.3
  sudo usermod -G vboxusers -a $(whoami)
fi


