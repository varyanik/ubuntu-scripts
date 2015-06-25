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

if not_installed 'libmagickwand-dev'; then
  sudo apt-get install -y imagemagick libmagickwand-dev
fi

if not_installed 'libav-tools'; then
  sudo apt-get install -y libav-tools
fi

if not_installed 'mediainfo'; then
  sudo apt-get install -y mediainfo
fi

if not_installed 'audacity'; then
  sudo apt-get install -y audacity
fi

if not_installed 'vlc'; then
  sudo add-apt-repository -y ppa:videolan/stable-daily
  sudo apt-get update
  sudo apt-get install -y vlc
fi

if not_installed 'ffmpeg'; then
  sudo apt-add-repository -y ppa:jon-severinsson/ffmpeg 
  sudo apt-get update
  sudo apt-get install -y ffmpeg
  sudo apt-get install -y frei0r-plugins
fi

# http://help.ubuntu.ru/wiki/handbrake
if not_installed 'handbrake'; then
  sudo apt-get install -y handbrake
fi

if not_installed 'openshot'; then
  sudo apt-get install -y openshot
fi

if not_installed 'simplescreenrecorder'; then
  sudo add-apt-repository -y ppa:maarten-baert/simplescreenrecorder
  sudo apt-get update
  sudo apt-get install -y simplescreenrecorder
  # if you want to record 32-bit OpenGL applications on a 64-bit system
  sudo apt-get install -y simplescreenrecorder-lib:i386
fi

if not_installed 'shutter'; then
  sudo apt-get install -y shutter
fi

if not_installed 'gimp'; then
  sudo apt-get install -y gimp gimp-data gimp-plugin-registry gimp-data-extras
fi

if not_installed 'inkscape'; then
  sudo apt-get install -y inkscape
fi

if not_installed 'skype'; then
  # 32 bit dependency
  sudo apt-get install -y sni-qt:i386 libdbusmenu-qt2:i386 libqt4-dbus:i386 libxss1:i386
  # theme dependency
  sudo apt-get install -y libgtk2.0-0:i386 gtk2-engines:i386 libgconf-2-4:i386
  # audio dependency
  sudo apt-get install -y libasound2-plugins:i386
  # webcam dependency
  sudo apt-get install -y libv4l-0:i386
  # fix UI
  sudo apt-get install -y gtk2-engines-murrine:i386 gtk2-engines-pixbuf:i386

  sudo add-apt-repository -y "deb http://archive.canonical.com/ $(lsb_release -sc) partner"
  sudo apt-get update
  sudo apt-get -y install skype
fi
run_program 'skype'

if not_installed 'google-chrome-beta'; then
  wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
  sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
  sudo apt-get update
  sudo apt-get install -y google-chrome-beta
fi

if not_installed 'flashplugin-installer'; then
  sudo apt-get install -y flashplugin-installer
fi

if not_installed 'filezilla'; then
  sudo apt-get install -y filezilla
fi

# http://radiotray.sourceforge.net/
if not_installed 'radiotray'; then
  sudo apt-get install -y radiotray
fi
run_program 'radiotray'

if not_installed 'calibre'; then
  sudo add-apt-repository -y ppa:n-muench/calibre
  sudo apt-get update
  sudo apt-get install -y calibre
fi

# https://www.youtube.com/watch?v=Ulh4PlYYCDA
if not_installed 'ubuntu-restricted-extras'; then
  sudo apt-get install -y --force-yes --quiet ubuntu-restricted-extras
  # play DVDs
  sudo /usr/share/doc/libdvdread4/install-css.sh
  # accept EULA agreement
  echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | sudo debconf-set-selections
  # a few common codecs for better playback
  sudo apt-get install -y gstreamer0.10-plugins-ugly gxine libdvdread4 icedax tagtool easytag id3tool lame nautilus-script-audio-convert libmad0 mpg321 gstreamer1.0-libav
fi

if not_installed 'steam'; then
  sudo apt-get install -y --force-yes --quiet steam
fi
run_program 'steam'

