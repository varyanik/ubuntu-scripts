#!/bin/bash

not_installed() {
  return $(dpkg-query -W -f='${Status}' $1 2>/dev/null | grep -c "ok installed")
}

is_stopped() {
  return $(ps aux | grep $1 | grep -v 'grep' | grep -c $1)
}

run_program() {
  if is_stopped $1; then
    $1 &>/dev/null &
  fi
}

sudo apt-get update
sudo apt-get -y --force-yes upgrade
sudo apt-get -y autoremove

if not_installed 'linux-headers-generic'; then
  sudo apt-get install -y linux-headers-generic
fi

if not_installed 'build-essential'; then
  sudo apt-get install -y build-essential
fi

if not_installed 'aptitude'; then
  sudo apt-get install -y aptitude
fi

if not_installed 'dconf-tools'; then
  sudo apt-get install -y dconf-tools
fi

if not_installed 'gparted'; then
  sudo apt-get install -y gparted
fi

if not_installed 'mc'; then
  sudo apt-get install -y mc
fi

if not_installed 'p7zip'; then
  sudo apt-get install -y p7zip p7zip-full p7zip-rar rar unrar zip unzip unace sharutils uudeview mpack arj cabextract file-roller
fi

if not_installed 'curl'; then
  sudo apt-get install -y curl libcurl4-openssl-dev
fi

if not_installed 'ssh'; then
  sudo apt-get install -y ssh openssh-client
fi

# http://help.ubuntu.ru/wiki/samba
if not_installed 'samba'; then
  sudo apt-get install -y samba
fi

# http://help.ubuntu.ru/wiki/wine_%D1%83%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B0
if not_installed 'wine'; then
  sudo add-apt-repository -y ppa:ubuntu-wine/ppa
  sudo apt-get update
  sudo apt-get install -y wine winetricks
  winetricks d3dx9 ddr=opengl orm=fbo glsl=disabled videomemorysize=2048
fi

# http://www.howtogeek.com/105997/how-to-install-the-classic-gnome-menu-in-unity-in-ubuntu-11.10/
if not_installed 'classicmenu-indicator'; then
  sudo apt-add-repository -y ppa:diesch/testing
  sudo apt-get update
  sudo apt-get install -y classicmenu-indicator
fi
run_program 'classicmenu-indicator'

# http://ubuntuhandbook.org/index.php/2014/06/calendar-indicator-fixed-icon-broken-crash/
# 
if not_installed 'calendar-indicator'; then
  sudo add-apt-repository -y ppa:atareao/atareao
  sudo apt-get update
  sudo apt-get install -y calendar-indicator
fi

# http://compizomania.blogspot.com/2014/08/touchpad-indicator-ubuntu.html
if not_installed 'touchpad-indicator'; then
  #sudo add-apt-repository -y ppa:atareao/atareao
  #sudo apt-get update
  sudo apt-get install -y touchpad-indicator
fi
run_program 'touchpad-indicator'

if not_installed 'window-list'; then
  sudo add-apt-repository -y ppa:jwigley/window-list
  sudo apt-get update
  sudo apt-get install -y window-list
fi
run_program 'window-list'

# https://www.digitalocean.com/community/tutorials/java-ubuntu-apt-get-ru
if not_installed 'oracle-java8-installer'; then
  sudo add-apt-repository -y ppa:webupd8team/java
  sudo apt-get update
  sudo apt-get install -y --force-yes --quiet oracle-java8-installer icedtea-plugin
fi

