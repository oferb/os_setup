#!/bin/bash

# Based on http://blog.self.li/post/74294988486/creating-a-post-installation-script-for-ubuntu


# Add repos
sudo add-apt-repository -y ppa:webupd8team/sublime-text-3
sudo add-apt-repository -y "deb http://archive.canonical.com/ $(lsb_release -sc) partner"
sudo add-apt-repository -y "deb http://linux.dropbox.com/ubuntu $(lsb_release -sc) main"
sudo add-apt-repository -y "deb http://dl.google.com/linux/chrome/deb/ stable main"
sudo add-apt-repository -y "deb http://dl.google.com/linux/talkplugin/deb/ stable main"
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -


# Basic update
sudo apt-get -y --force-yes update
sudo apt-get -y --force-yes upgrade


# Install apps
sudo apt-get -y install \
git k4dirstat meld openjdk-8-jdk openjdk-8-jre kile imagemagick gimp libreoffice octave php7.0-cli php7.0-curl curl gnome-terminal vlc cryptkeeper autokey-gtk autokey-common ffmpeg python2.7 python-pip python-dev python-pip virtualenv ipython ipython-notebook skype sublime-text-installer virtualbox virtualbox-dkms virtualbox-guest-additions-iso libappindicator1 ubuntu-restricted-extras rar latexdiff

sudo apt-get -y --allow-unauthenticated install \
dropbox google-chrome-stable google-talkplugin


# Pip installs
pip install --upgrade pip
sudo pip install virtualenvwrapper


# Folders
rm -rf ~/Documents
rm -rf ~/Public
rm -rf ~/Templates
rm -rf ~/Videos
rm -rf ~/Music
rm ~/examples.desktop
mkdir ~/devel
mkdir ~/opt

git clone https://github.com/oferb/os_setup.git

# Scripts
###mkdir ~/.scripts
###cp -ar ./data/scripts/* ~/.scripts/
###chmod +x ~/.scripts/*

# Dotfiles
cp os_setup/dotfiles/* ~/
###shopt -s dotglob
###cp -a ./data/dotfiles/* ~
###.bashrc
###.gitconfig
###.profile - possibly added "export CHROME_REMOTE_DESKTOP_DEFAULT_DESKTOP_SIZES=1024x768"
###.vimrc


# Arcanist install
cd ~/opt
mkdir arc
cd arc
git clone https://github.com/phacility/libphutil.git
git clone https://github.com/phacility/arcanist.git
arc upgrade
cd ~/


# Update system settings
gsettings set com.canonical.indicator.power show-percentage true
gsettings set com.canonical.Unity.Launcher favorites "['application://google-chrome.desktop', 'application://sublime-text.desktop', 'application://nautilus.desktop', 'application://gnome-control-center.desktop', 'application://gitg.desktop', 'application://gnome-terminal.desktop', 'unity://running-apps', 'unity://expo-icon', 'unity://devices']"
gsettings set com.canonical.Unity.Lenses remote-content-search 'none'
gsettings set org.gnome.desktop.privacy remember-recent-files false
gsettings set org.gnome.nautilus.preferences executable-text-activation 'ask'
gsettings set org.gnome.settings-daemon.plugins.power critical-battery-action 'shutdown'
gsettings set org.gnome.settings-daemon.plugins.power lid-close-ac-action 'nothing'
gsettings set org.gnome.settings-daemon.plugins.power lid-close-battery-action 'nothing'
gsettings set org.gnome.desktop.interface clock-show-date true
gsettings set org.gnome.gedit.preferences.editor auto-save true
gsettings set org.gnome.gedit.preferences.editor create-backup-copy false
gsettings set org.gnome.gedit.preferences.editor display-line-numbers true
gsettings set org.gnome.gedit.preferences.editor tab-size 2
gsettings set org.gnome.nautilus.preferences sort-directories-first true


# Update some more system settings
dconf write /org/compiz/profiles/unity/plugins/unityshell/icon-size 32
dconf write /org/compiz/profiles/unity/plugins/core/vsize 2
dconf write /org/compiz/profiles/unity/plugins/core/hsize 2

rm -rf os_setup
