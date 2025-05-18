#!/bin/sh

#
# Script Name: ram-swap-usage.sh
# Description: Prints the current RAM & SWAP usage
# Author: Chirag
# Version: 1.0
#

free -m | awk 'BEGIN {printf "{\n"} NR==2 {printf "\"RAM used\": \"%.2f%%\",\n", $3/$2*100} NR==3 {printf "\"SWAP used\": \"%.2f%%\"\n", $3/$2*100} END {printf "}\n"}'