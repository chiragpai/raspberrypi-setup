#!/bin/bash

#
# Script Name: setup.sh
# Description: Setup scripts from this repository on your Raspberry Pi OS
# Author: Chirag
# Version: 1.0
#

# Check if running on Raspberry PI
RASPI_MODEL=$(awk 'END {print $1" "$2}' </proc/device-tree/model)
if [ "$RASPI_MODEL" != "Raspberry Pi" ]; then
    echo "[!] Device does not seem to be a Raspberry Pi. Continue? (Y/n)"
    read -r -p "Are you sure? [Y/n] " response
    response=$(echo "$response" | tr '[:upper:]' '[:lower:]')
    if [[ "$response" =~ ^(n| ) ]] || [[ -z "$response" ]]; then
        exit 1
    else
        echo "[!] Proceeding with setup. Scripts may not work as intended..."
    fi
fi 

# Install git
sudo apt-get install git -y

USER_DIR="$HOME"
BIN_DIR="$HOME/bin"
SCRIPTS_DIR="$BIN_DIR/raspberrypi-scripts"
GITHUB_REPO_LINK="https://github.com/chiragpai/raspberrypi-setup.git"

# Check if ~/bin exists, else create it
if [ ! -d "$BIN_DIR" ]; then
    echo "[!] $BIN_DIR does not exist. Creating it..."
    mkdir "$BIN_DIR"
else
    echo "[.] $BIN_DIR exists. All scripts will be checked out there."
fi

if [ -d "$SCRIPTS_DIR" ]; then
    cd $SCRIPTS_DIR && git pull
else
    # Clone the scripts
    git clone "$GITHUB_REPO_LINK" "$SCRIPTS_DIR"
fi

cd $SCRIPTS_DIR/scripts && chmod 755 ./*

echo $PATH | grep -q $SCRIPTS_DIR
if [ $? -ne 0 ]; then
    # Setup .bashrc to use the scripts
    echo "" >> $HOME/.bashrc
    echo "# Raspberry Pi scripts from $GITHUB_REPO_LINK" >> $HOME/.bashrc
    echo "PATH=\$PATH:$SCRIPTS_DIR/scripts" >> $HOME/.bashrc

    source $HOME/.bashrc
    echo "Updated .bashrc to include $SCRIPTS_DIR"
else
    echo "[.] $SCRIPTS_DIR already included in ~/.bashrc"
fi