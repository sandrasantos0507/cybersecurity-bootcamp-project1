#!/bin/bash

#I am assuming the script will be run like the folling example:
# ./roulette_dealer_finder_by_time.sh 0310 08:00:00 AM 
# note: I have added a third argument for am/pm

awk -F" " '{print($1, $2, $5, $6)}' $1_Dealer_schedule | grep -E "$2 $3"
