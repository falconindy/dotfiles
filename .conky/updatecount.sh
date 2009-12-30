#!/bin/bash
#apt-get
#NUM=`aptitude search ~U | wc -l | tail`
#echo "$NUM update(s) available."

#pacman
echo $(pacman -Qu | wc -l)
