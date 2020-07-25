#!/bin/bash
set -e
set -x

# update and upgrade server
sudo apt-get update & sudo apt-get upgrade -y
# install Libraries
# GIT
sudo apt install git -y
# wget
sudo apt install wget -y
# run installers
# Python
./wsl/setup_python.sh
# Golang
./wsl/setup_go.sh
# Node and NPM
./wsl/setup_javascript.sh
# JAVA
./wsl/setup_java.sh
# store git credentials for Github
git config --global credential.helper store -y
echo "General Setup - COMPLETE"