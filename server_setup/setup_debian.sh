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
# add user to sudo group
usermod -aG sudo $user_name
# Ensure the user variable is set
if [ -z "$user_name" ]; then
  echo "User name not set. Please export user_name variable."
  exit 1
fi

# Install rsync if not already installed
if ! command -v rsync &> /dev/null
then
    echo "rsync could not be found, installing..."
    apt-get update
    apt-get install -y rsync
fi

# add external login
rsync --archive --chown=$user_name:$user_name ~/.ssh /home/$user_name

echo "now test if the user ($user_name) can login"
echo "USER SETUP - START"

# Python
echo "PYTHON3 INSTALL - START"
# setup Python3
python3 -V

# Install pip
apt-get install -y python3-pip

# update pip
pip3 install --upgrade pip setuptools wheel

# install build libraries
apt-get install -y build-essential libssl-dev libffi-dev python3-dev

# install venv
apt-get install -y python3-venv

# install build libraries
apt-get install -y build-essential libssl-dev libffi-dev python3-dev

# install venv
apt-get install -y python3-venv
echo "PYTHON3 INSTALL - COMPLETE"
# Docker
echo "DOCKER INSTALL - START"
# Install libraries
apt-get install -y apt-transport-https ca-certificates curl software-properties-common

# GPG Key
curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -

# add docker repo
echo "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list

# update
apt-get update

# install docker
apt-get install -y docker-ce docker-ce-cli containerd.io

echo "DOCKER INSTALL - COMPLETE"
echo "DOCKER Add $user_name to group"

# add user to docker group
usermod -aG docker $user_name

echo "Switching to $user_name"
echo "Try command 'id -nG' to see if user $user_name is added to sudo and docker groups."
echo "Run 'systemctl status docker' to confirm Docker is running."
echo "Run 'docker ps' to see if Docker commands are usable."
echo "If all pass, then setup is complete, and you can login as $user_name."
