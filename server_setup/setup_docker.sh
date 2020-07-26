#!/bin/bash
set -e
set -x

# update and upgrade server
sudo apt-get update & sudo apt-get upgrade -y
# Docker
echo "DOCKER INSTALL - START"
# Install libraries
sudo apt install apt-transport-https ca-certificates curl software-properties-common

# GPG Key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# add docker repo
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"

# update
sudo apt update

# install docker
sudo apt install docker-ce

# add user
sudo usermod -aG docker ${USER}
su - ${USER}
id -nG

# show running
sudo systemctl status docker
echo "DOCKER INSTALL - COMPLETE"