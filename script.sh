#!/bin/bash

log_msg() {
  msg=$1
  # green messages, because green is love
  tput setaf 2; echo "$msg"
}

install_utils() {
  log_msg "installing zsh and a nice theme"
  dnf install -y zsh

  # ZSH!
  omzsh=~/Documents/bzsh
  mkdir $omzsh

  pushd $omzsh
  # now install the oh-my-zsh with all the beautiful teams :D
  sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
  popd -1
  # setup the theme that I like
  cat 'ZSH_THEME="avit"' >> ~/.zshrc

  log_msg "Configuring VIM"
  touch ~/.vimrc
  cat vim_configuration.vim >> ~/.vimrc
}

log_msg "installing git"
dnf install -y git

log_msg "installing node dependencies"
# node <3
dnf install -y npm node
npm -g install n
n latest


# java stuff
j_version="1.8.0"
log_msg "installing Java, version $j_version"
# hopefully will be the same name on the new distribution xD
dnf install -y "java-$j_version-openjdk"

log_msg "installing build tools for Java"
# java build tools
dnf install -y ant maven

# relational database
log_msg "Installing mariadb"
dnf install -y mariadb mariadb-server

install_utils

log_msg "script finished, review log to make sure everything got properly installed"
