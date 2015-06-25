#!/bin/bash

not_installed() {
  return $(dpkg-query -W -f='${Status}' $1 2>/dev/null | grep -c "ok installed")
}

if not_installed 'cmake'; then
  sudo apt-get install -y cmake
fi

if not_installed 'git'; then
  sudo apt-get install -y git gitk gitg
  git config --global credential.helper 'cache --timeout=3600'
  git config --global user.name "Alex Varyanik"
  git config --global user.email "varyanik@gmail.com"
fi

if not_installed 'curl'; then
  sudo apt-get install -y curl libcurl4-openssl-dev
fi

if not_installed 'zsync'; then
  sudo apt-get install -y zsync
fi

