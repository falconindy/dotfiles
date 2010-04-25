#!/bin/bash
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

# Input options
xset r rate 220 45
setxkbmap -option terminate:ctrl_alt_bksp

# Background services
xcompmgr -c -C -t-5 -l-5 -r4.2 -o.55 -f &
feh --bg-scale $(find ~/pic/wallpaper/16\:10/ -type f | shuf -n 1)
xscreensaver -no-splash &
xsetroot -cursor_name left_ptr

# Startup programs
chromium &
urxvtd -q -o -f && urxvtc

# Startup
wmname LG3D

exec ~/bin/startdwm

