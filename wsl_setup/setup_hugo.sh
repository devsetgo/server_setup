#!/bin/bash
set -e
set -x

# update and upgrade server
sudo apt-get update & sudo apt-get upgrade -y
# GO
echo "Hugo INSTALL - START"
# install hugo
sudo apt-get install hugo -y
# Check version
hugo version
echo "Hugo INSTALL - COMPLETE"