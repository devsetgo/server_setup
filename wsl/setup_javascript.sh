#!/bin/bash
set -e
set -x

# update and upgrade server
sudo apt-get update & sudo apt-get upgrade -y
# Python
echo "JavaScript INSTALL - START"
# install NodeJS
sudo apt install nodejs -y
# Install NPM
sudo apt install npm -y
# Check NodeJS version
nodejs -v
# Check NPM Version
npm -v
echo "JavaScript INSTALL - COMPLETE"