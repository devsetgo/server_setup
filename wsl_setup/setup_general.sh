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
sudo apt install net-tools -y
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
# install microk8s
./wsl_setup/ubuntu-wsl2-systemd-script.sh
# Add the user to the microk8s group
USERNAME=$(whoami)
sudo usermod -a -G microk8s $USERNAME
# Set the ownership of the .kube directory back to the user
sudo chown -f -R $USERNAME ~/.kube

# store git credentials for Github
echo -n "git user name (e.g. mike): "
read gitname
echo -n "git user email (e.g. mike@something.com): "
read gitemail
echo -n "github personal token: "
read githubtoken

git config --global credential.helper store -y
git config --global user.name $gitname
git config --global user.email $gitemail
git config --global user.password $githubtoken
echo "General Setup - COMPLETE"
echo "You will need to create a new session to use microk8s without sudo"

echo "Run Python Github utility to clone all public repos"