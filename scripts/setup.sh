#!/bin/bash
set -e
set -x

# System
echo "SYSTEM SETUP - START"

sudo apt-get update & sudo apt-get upgrade -y
echo "USER SETUP - START"
user_name=${1?Error: no name given}
# # add user from input
adduser $user_name
# # add user to sudo
usermod -aG sudo $user_name
# # external login
rsync --archive --chown=$user_name:$user_name ~/.ssh /home/$user_name

echo "now test if the user ($user_name) can login"
echo "USER SETUP - START"
# Python
echo "PYTHON3 INSTALL - START"
# setup Python3
python3 -V
# Install pip
apt install -y python3-pip
# update pip
pip3 install --upgrade pip setuptools wheel
# install build libraries
apt install -y build-essential libssl-dev libffi-dev python3-dev
# install venv
apt install -y python3-venv
echo "PYTHON3 INSTALL - COMPLETE"
# Docker
echo "DOCKER INSTALL - START"
# Install libraries
apt install apt-transport-https ca-certificates curl software-properties-common

# GPG Key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# add docker repo
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"

# update
sudo apt update

# install docker
sudo apt install docker-ce

# add user 
usermod -aG docker $user_name
su - $user_name
id -nG

# show running
systemctl status docker
echo "DOCKER INSTALL - COMPLETE"

# anything else?

echo "SYSTEM SETUP - COMPLETE"