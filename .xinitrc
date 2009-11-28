#!/bin/bash
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

xcompmgr -c -t-5 -l-5 -r4.2 -o.55 -f &
feh --bg-scale pictures/Wallpaper/archlinux1.jpg
setxkbmap -option terminate:ctrl_alt_bksp
xscreensaver --timeout 5 -no-splash &
pidgin&
chromium-browser&
urxvtd -q -o -f&
exec ~/bin/startdwm

