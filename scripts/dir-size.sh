#!/bin/sh

#
# Script Name: dir-size.sh
# Description: Prints the disk space used by contents of the directory
# Author: Chirag
# Version: 1.0
#

du -sh $1/* | sort -h