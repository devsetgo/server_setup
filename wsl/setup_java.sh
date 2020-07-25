#!/bin/bash
set -e
set -x

# update and upgrade server
sudo apt-get update & sudo apt-get upgrade -y
# JAVA
echo "JAVA 11 INSTALL - START"
# Install OpenJDK 11
sudo apt-get install openjdk-11-jdk -y
# Check version
java -version
echo "JAVA INSTALL - COMPLETE"