#!/bin/bash
#
# .xsession
#

for _ in /etc/X11/xinit/xinitrc.d/*; do
  [[ -f $_ ]] && . "$_"
done

systemctl --user import-environment 'DISPLAY'
# systemctl --user start xorg.target

# fonts
xset +dpms +fp /usr/share/fonts/local,/usr/share/fonts/artwiz-fonts

# background
feh --bg-scale "$HOME/var/pic/wallpaper/current.png"

# screensaver
xscreensaver -no-splash &

# input
setxkbmap -option terminate:ctrl_alt_bksp,compose:ralt
xset r rate 220 45
xsetroot -cursor_name left_ptr

# Xresources
xrdb -merge ~/.Xresources

# urxvt daemon
urxvtd -q -o -f

# apps
chromium &
urxvtc -name werk
urxvtc -name tmux -geometry 122x77 -e tmux -L main attach
urxvtc -name ncmpcpp -e ncmpcpp
urxvtc -name htop -e htop

exec /usr/bin/i3
