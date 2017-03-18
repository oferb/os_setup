#!/usr/bin/env bash

if [ "$(uname)" == "Linux" ]; then
  sudo apt-get -y install git
  mkdir -p devel
  cd devel
  if [ ! -d "os_setup" ]
  then
    git clone https://github.com/oferb/os_setup.git
  else
    cd os_setup
    git pull
  fi
  cd ~/
  devel/os_setup/linux/setup.sh
elif [ "$(uname)" == "Darwin" ]; then
  # Untested:
  brew install git
  mkdir devel
  cd devel
  git clone https://github.com/oferb/os_setup.git
  cd ~/
  os_setup/mac/setup.sh
fi
