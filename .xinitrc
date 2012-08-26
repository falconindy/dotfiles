#!/bin/bash
#
# .xsession
#

# launch a dbus session bus and write the location to file
read machine_id </etc/machine-id
dbus-launch --autolaunch="$machine_id" --binary-syntax --close-stderr --exit-with-session
if [ -f "$HOME/.dbus/session-bus/$machine_id-${DISPLAY#:}" ]; then
  . "$HOME/.dbus/session-bus/$machine_id-${DISPLAY#:}"
  unset machine_id
  printf '%s\n' "$DBUS_SESSION_BUS_ADDRESS" > "$HOME/.dbus_address"
fi

# restore nvidia settings
nvidia-settings -l

# fonts
xset +dpms +fp /usr/share/fonts/local,/usr/share/fonts/artwiz-fonts

# background
feh --bg-scale "$HOME/var/pic/wallpaper/current.png"

# screensaver
xscreensaver -no-splash &

# input
setxkbmap -option terminate:ctrl_alt_bksp -option compose:ralt
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
