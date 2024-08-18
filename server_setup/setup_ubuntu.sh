#!/bin/bash
set -e
set -x

# System
echo "SYSTEM SETUP - START"

apt-get update && apt-get upgrade -y

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
    apt-get install -y rsync
fi

# add external login
rsync --archive --chown=$user_name:$user_name ~/.ssh /home/$user_name

echo "now test if the user ($user_name) can login"
echo "USER SETUP - COMPLETE"

# Docker
echo "DOCKER INSTALL - START"
# Update the apt package index and install packages to allow apt to use a repository over HTTPS
apt-get update
apt-get install -y ca-certificates curl gnupg

# Add Docker’s official GPG key
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
chmod a+r /etc/apt/keyrings/docker.gpg

# Set up the Docker repository
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update the apt package index and install Docker packages
apt-get update
apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "DOCKER INSTALL - COMPLETE"
echo "DOCKER Add $user_name to group"

# add user to docker group
usermod -aG docker $user_name

echo "Switching to $user_name"
echo "Try command 'id -nG' to see if user $user_name is added to sudo and docker groups."
echo "Run 'systemctl status docker' to confirm Docker is running."
echo "Run 'docker ps' to see if Docker commands are usable."
echo "If all pass, then setup is complete, and you can login as $user_name."
su - $user_name