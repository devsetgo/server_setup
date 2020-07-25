#!/bin/bash
set -e
set -x

# update and upgrade server
sudo apt-get update & sudo apt-get upgrade -y
# GO
echo "GO INSTALL - START"
sudo apt install golang-go -y
sudo apt install gccgo-go -y
# Check Version
go version
# GO ENV
go env
echo "GO INSTALL - COMPLETE"