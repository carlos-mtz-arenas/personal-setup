#!/bin/bash

log_msg() {
  msg=$1
  # green messages, because green is love
  tput setaf 2; echo "$msg"
}

log_msg "installing git"
dnf install git

log_msg "installing node dependencies"
# node <3
dnf install npm node
npm -g install n
n latest


j_version="1.8.0"
log_msg "installing Java, version $j_version"
# hopefully will be the same name on the new distribution xD
dnf install "java-$j_version-openjdk"

log_msg "installing build tools for Java"
# java build tools
dnf install ant maven

log_msg "installing zsh and a nice theme"
dnf install zsh

omzsh=~/Documents/bzsh
mkdir $omzsh

pushd $omzsh
# now install the oh-my-zsh with all the beautiful teams :D
wget --no-check-certificate http://install.ohmyz.sh -O - | sh
popd -1

# setup the theme that I like
cat 'ZSH_THEME="avit"' >> ~/.zshrc

