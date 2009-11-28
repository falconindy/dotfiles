#!/bin/bash
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

conky | dzen2 -e 'onstart=lower' -fg '#EEEEEE' -bg '#051122' -ta r -fn '-*-terminus-*-r-normal-*-*-120-*-*-*-*-iso8859-*' -y -20 &

xcompmgr -c -t-5 -l-5 -r4.2 -o.55 -f &
feh --bg-scale pictures/Wallpaper/archlinux1.jpg
setxkbmap -option terminate:ctrl_alt_bksp
xscreensaver --timeout 5 -no-splash &
pidgin&
chromium-browser&
urxvtd -q -o -f&
exec ~/bin/startdwm

