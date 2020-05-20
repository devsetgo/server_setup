#!/bin/bash
set -e
set -x

# System
echo "SYSTEM SETUP - START"
user_name=${1?Error: no name given}
echo "HELLO! $user_name" 