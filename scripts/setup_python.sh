#!/bin/bash
set -e
set -x

# update and upgrade server
sudo apt-get update & sudo apt-get upgrade -y
python3 -V
# Install pip
sudo apt install -y python3-pip
# update pip
sudo pip3 install --upgrade pip setuptools wheel
# install build libraries
sudo apt install -y build-essential libssl-dev libffi-dev python3-dev
# install venv
sudo apt install -y python3-venv