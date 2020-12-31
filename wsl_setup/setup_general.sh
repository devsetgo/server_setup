#!/bin/bash
set -e
set -x

# update and upgrade server
sudo apt-get update && sudo apt-get upgrade -y
# install Libraries
# GIT
sudo apt install git -y
# wget
sudo apt install wget -y
# run installers
# Python
./wsl_setup/setup_python.sh
# Golang
./wsl_setup/setup_go.sh
# Node and NPM
./wsl_setup/setup_javascript.sh
# JAVA
./wsl_setup/setup_java.sh
# Hugo
./wsl_setup/setup_hugo.sh
# store git credentials for Github
git config --global credential.helper store -y
echo "General Setup - COMPLETE"
echo "Run Python Github utility to clone all public repos"