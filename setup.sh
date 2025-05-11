#!/bin/sh

#
# Script Name: setup.sh
# Description: Setup scripts from this repository on your Raspberry Pi OS
# Author: Chirag
# Version: 1.0
#

# Check if running on Raspberry PI
RASPI_MODEL=cat /proc/device-tree/model | awk 'END {print $1" "$2}'
if [ $RASPI_MODEL != "Raspberry Pi" ]; then
    echo "[!] Device does not seem to be a Raspberry Pi. Continue? (Y/n)"
    read -r -p "Are you sure? [Y/n]" response
    response=${response,,} # tolower
    if [[ $response =~ ^(n| ) ]] || [[ -z $response ]]; then
        exit 1
    else
        echo "[!] Proceeding with setup. Scripts may not work as intended..."
    fi
fi 

# Check for updates and install
sudo apt-get update
sudo apt-get upgrade -y

# Install git
sudo apt-get install git -y

USER_DIR=`$HOME`
BIN_DIR="$HOME/bin"
SCRIPTS_DIR="/raspberrypi-scripts"
GITHUB_REPO_LINK="https://github.com/chiragpai/raspberrypi-setup.git"

# Check if ~/bin exists, else create it
if [ ! -d $BIN_DIR ]; then
    echo "[!] $BIN_DIR does not exist. Creating it..."
    mkdir $BIN_DIR
else
    echo "[.] $BIN_DIR exists. All scripts will be checkout there."
fi

# Clone the scripts
git clone $GITHUB_REPO_LINK $BIN_DIR$SCRIPTS_DIR

# Setup .bashrc to use the scripts
echo "" >> $HOME/.bashrc
echo "# Raspberry Pi scripts from $GITHUB_REPO_LINK" >> $HOME/.bashrc
echo "\$PATH=\$PATH:$BIN_DIR$SCRIPTS_DIR" >> $HOME/.bashrc

source $HOME/.bashrc