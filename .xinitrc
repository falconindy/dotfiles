#!/bin/bash
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice

#exec ck-launch-session dwm

feh --bg-scale pictures/Wallpaper/archlinux1.jpg
setxkbmap -option terminate:ctrl_alt_bksp
xscreensaver --timeout 5 -no-splash &
pidgin&
chromium-browser&
exec ~/bin/startdwm

