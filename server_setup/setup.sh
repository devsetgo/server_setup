#!/bin/bash
set -e
set -x

# System
echo "SYSTEM SETUP - START"

sudo apt-get update && sudo apt-get upgrade -y

# start User setup
echo "USER SETUP - START"
read -p "Enter username: " user_name
if [ -z "$user_name" ]; then
  echo "Error: No name given"
  exit 1
fi
# add user from input
adduser $user_name
# add user to sudo
usermod -aG sudo $user_name
# add external login
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
sudo apt install docker-ce -y

echo "DOCKER INSTALL - COMPLETE"
echo "DOCKER Add $user_name to group"

# add user
usermod -aG docker $user_name
echo "Switching to $user_name"
echo "Try command 'id -nG' to see user $user_name is added to sudo and docker"
echo "Run 'systemctl status docker' to confirm docker running"
echo "Run 'Docker ps' to see if docker commands are useable"
echo "If all pass, then setup is complete and you can login as $user_name"
su - $user_name
