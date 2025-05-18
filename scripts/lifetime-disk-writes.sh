#!/bin/sh

#
# Script Name: lifetime-disk-writes.sh
# Description: Prints the total disk writes on Raspberry Pi OS
# Author: Chirag
# Version: 1.0
#

cat /sys/fs/ext4/mmcblk0p2/lifetime_write_kbytes | awk '{print "Lifetime writes: "$1/1024/1024"G"}'