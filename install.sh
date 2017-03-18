#!/usr/bin/env bash

if [ "$(uname)" == "Linux" ]; then
  sudo apt-get install git
  mkdir devel
  cd devel
  git clone https://github.com/oferb/os_setup.git
  os_setup/linux/setup.sh
elif [ "$(uname)" == "Darwin" ]; then
  # Untested:
  brew install git
  mkdir devel
  cd devel
  git clone https://github.com/oferb/os_setup.git
  os_setup/mac/setup.sh
fi
