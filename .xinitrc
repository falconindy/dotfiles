# graphical/display tweaking
#
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
xset +dpms +fp /usr/share/fonts/local,/usr/share/fonts/artwiz-fonts
feh --bg-scale $(randomWallpaper)
xscreensaver -no-splash &
nvidia-settings -l
wmname LG3D

# input tweaking
setxkbmap -option terminate:ctrl_alt_bksp
xset r rate 220 45
xsetroot -cursor_name left_ptr

start-pulseaudio-x11
PATH=$HOME/bin:$PATH exec ~/bin/startdwm

