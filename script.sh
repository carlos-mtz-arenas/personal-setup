#!/bin/bash

user=$1

log_msg() {
  msg=$1
  # green messages, because green is love
  tput setaf 2; echo "$msg"
}

install_utils() {
  log_msg "installing zsh and a nice theme"
  sudo dnf install -y zsh

  su - $user
  # now install the oh-my-zsh with all the beautiful teams :D
  sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

  # setup the theme that I like
  log_msg "Configuring VIM"
  touch ~/.vimrc
  ls -lh ~/.vimrc
  cat vim_configuration.vim >> ~/.vimrc
}

log_msg "installing git"
sudo dnf install -y git

log_msg "installing node dependencies"
# node <3
sudo dnf install -y npm node
sudo npm -g install n
sudo n latest


# java stuff
j_version="1.8.0"
log_msg "installing Java, version $j_version"
# hopefully will be the same name on the new distribution xD
sudo dnf install -y "java-$j_version-openjdk"

log_msg "installing build tools for Java"
# java build tools
sudo dnf install -y ant maven

# relational database
log_msg "Installing mariadb"
sudo dnf install -y mariadb mariadb-server

install_utils

log_msg "script finished, review log to make sure everything got properly installed"

