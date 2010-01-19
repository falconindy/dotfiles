#!/bin/bash
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

xcompmgr -c -t-5 -l-5 -r4.2 -o.55 -f &
feh --bg-scale $(find ~/pic/wallpaper/16\:10/ -type f | shuf -n 1)
setxkbmap -option terminate:ctrl_alt_bksp
xscreensaver -no-splash &
chromium-browser&
#pidgin &
urxvtd -q -o -f
exec ~/bin/startdwm

