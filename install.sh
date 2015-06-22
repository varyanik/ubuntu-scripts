#!/bin/bash

#settings
gsettings set com.canonical.desktop.interface scrollbar-mode normal
gsettings set org.compiz.unityshell:/org/compiz/profiles/unity/plugins/unityshell/ launcher-hide-mode 1
gsettings set com.canonical.Unity.Lenses disabled-scopes "['more_suggestions-amazon.scope', 'more_suggestions-u1ms.scope', 'more_suggestions-populartracks.scope', 'music-musicstore.scope', 'more_suggestions-ebay.scope', 'more_suggestions-ubuntushop.scope', 'more_suggestions-skimlinks.scope']"
gsettings set com.canonical.Unity.Lenses remote-content-search 'none'
gsettings set com.canonical.unity.webapps integration-allowed false

#reset unity
#sudo apt-get install --reinstall unity ubuntu-desktop
#dconf reset -f /org/compiz/ && unity --reset-icons &disown

not_installed() {
  return $(dpkg-query -W -f='${Status}' $1 2>/dev/null | grep -c "ok installed")
}

sudo apt-get update
sudo apt-get -y autoremove
sudo apt-get -y --force-yes upgrade

if not_installed 'classicmenu-indicator'; then
  sudo apt-add-repository -y ppa:diesch/testing
  sudo apt-get update
  sudo apt-get install -y classicmenu-indicator
fi

if not_installed 'mc'; then
  sudo apt-get install -y mc
fi

if not_installed 'p7zip'; then
  sudo apt-get install -y p7zip p7zip-full p7zip-rar unace unrar zip unzip sharutils rar uudeview mpack arj cabextract file-roller
fi

if not_installed 'curl'; then
  sudo apt-get install -y curl libcurl4-openssl-dev
fi

if not_installed 'gparted'; then
  sudo apt-get install -y gparted
fi

if not_installed 'skype'; then
  #32 bit dependency
  sudo apt-get install -y sni-qt:i386 libdbusmenu-qt2:i386 libqt4-dbus:i386 libxss1:i386
  #theme dependency
  sudo apt-get install -y libgtk2.0-0:i386 gtk2-engines:i386 libgconf-2-4:i386
  #audio dependency
  sudo apt-get install -y libasound2-plugins:i386
  #webcam dependency
  sudo apt-get install -y libv4l-0:i386
  #fix UI
  sudo apt-get install -y gtk2-engines-murrine:i386 gtk2-engines-pixbuf:i386

  sudo add-apt-repository -y "deb http://archive.canonical.com/ $(lsb_release -sc) partner"
  sudo apt-get update
  sudo apt-get -y install skype
fi

if not_installed 'git'; then
  sudo apt-get install -y git gitk gitg
  git config --global credential.helper 'cache --timeout=3600'
  git config --global user.name "Alex Varyanik"
  git config --global user.email "varyanik@gmail.com"
fi

if not_installed 'google-chrome-beta'; then
  wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
  sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
  sudo apt-get update
  sudo apt-get install -y google-chrome-beta
fi

if not_installed 'vlc'; then
  sudo add-apt-repository -y ppa:videolan/stable-daily
  sudo apt-get update
  sudo apt-get install -y vlc
fi

if not_installed 'flashplugin-installer'; then
  sudo apt-get install -y flashplugin-installer
fi

if not_installed 'gimp'; then
  sudo apt-get install -y gimp gimp-data gimp-plugin-registry gimp-data-extras
fi

if not_installed 'ubuntu-restricted-extras'; then
  sudo apt-get install -y --force-yes --quiet ubuntu-restricted-extras
  #play DVDs
  sudo /usr/share/doc/libdvdread4/install-css.sh
  #accept EULA agreement
  echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | sudo debconf-set-selections
  #a few common codecs for better playback
  sudo apt-get install -y gstreamer0.10-plugins-ugly gxine libdvdread4 icedax tagtool easytag id3tool lame nautilus-script-audio-convert libmad0 mpg321 gstreamer1.0-libav
fi

if not_installed 'virtualbox-4.3'; then
  wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | sudo apt-key add -
  sudo sh -c 'echo "deb http://download.virtualbox.org/virtualbox/debian $(lsb_release -sc) contrib" >> /etc/apt/sources.list'
  sudo apt-get update
  sudo apt-get install -y virtualbox-4.3
  sudo usermod -G vboxusers -a $(whoami)
fi

if not_installed 'filezilla'; then
  sudo apt-get install -y filezilla
fi

if not_installed 'linux-headers-generic'; then
  sudo apt-get install -y linux-headers-generic
fi

if not_installed 'build-essential'; then
  sudo apt-get install -y build-essential
fi

if not_installed 'cmake'; then
  sudo apt-get install -y cmake
fi

if not_installed 'ffmpeg'; then
  sudo apt-add-repository -y ppa:jon-severinsson/ffmpeg 
  sudo apt-get update
  sudo apt-get install -y ffmpeg
  sudo apt-get install -y frei0r-plugins
fi

if not_installed 'inkscape'; then
  sudo apt-get install -y inkscape
fi

if not_installed 'libmagickwand-dev'; then
  sudo apt-get install -y imagemagick libmagickwand-dev
fi

if not_installed 'aptitude'; then
  sudo apt-get install -y aptitude
fi

if not_installed 'dconf-tools'; then
  sudo apt-get install -y dconf-tools
fi

if not_installed 'zsync'; then
  sudo apt-get install -y zsync
fi

if not_installed 'ssh'; then
  sudo apt-get install -y ssh openssh-client
fi

if not_installed 'samba'; then
  sudo apt-get install -y samba
fi

if not_installed 'mediainfo'; then
  sudo apt-get install -y mediainfo
fi

if not_installed 'libav-tools'; then
  sudo apt-get install -y libav-tools
fi

if not_installed 'oracle-java8-installer'; then
  sudo add-apt-repository -y ppa:webupd8team/java
  sudo apt-get update
  sudo apt-get install -y --force-yes --quiet oracle-java8-installer icedtea-plugin
fi

if not_installed 'radiotray'; then
  sudo apt-get install -y radiotray
fi

if not_installed 'steam'; then
  sudo apt-get install -y --force-yes --quiet steam
fi

if not_installed 'shutter'; then
  sudo apt-get install -y shutter
fi

if not_installed 'audacity'; then
  sudo apt-get install -y audacity
fi

if not_installed 'openshot'; then
  sudo apt-get install -y openshot
fi

if not_installed 'handbrake'; then
  sudo apt-get install -y handbrake
fi

if not_installed 'wine'; then
  sudo add-apt-repository -y ppa:ubuntu-wine/ppa
  sudo apt-get update
  sudo apt-get install -y wine winetricks
  winetricks d3dx9
fi

if not_installed 'touchpad-indicator'; then
  sudo add-apt-repository -y ppa:atareao/atareao
  sudo apt-get update
  sudo apt-get install -y touchpad-indicator
fi

