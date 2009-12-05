#!/bin/bash
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

conky | dzen2 -e 'onstart=lower' -h 16 -fg '#EEEEEE' -bg '#051122' -ta r -fn '-*-terminus-*-r-normal-*-12-*-*-*-*-*-iso8859-*' -y -16 &
numlockx &
xcompmgr -c -t-5 -l-5 -r4.2 -o.55 -f &
feh --bg-scale ~/pictures/wallpaper/wispcat.jpg
setxkbmap -option terminate:ctrl_alt_bksp
xscreensaver -no-splash &
chromium-browser&
urxvtd -q -o -f&
exec ~/bin/startdwm

