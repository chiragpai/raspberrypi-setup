#!/bin/sh

#
# Script Name: disable-wifi-power-management.sh
# Description: Disable WiFi power management on Raspberry Pi OS
# Author: Chirag
# Version: 1.0
#

sudo /sbin/iwconfig wlan0 power off
echo "[`date`] [LOG] Disabiling wifi power management" >> ~/bin/logs/disable-wifi-power-management.log
