# graphical/display tweaking
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
xset +dpms +fp /usr/share/fonts/local,/usr/share/fonts/artwiz-fonts
feh --bg-scale $(randomWallpaper)
xscreensaver -no-splash &
xcompmgr -n -c -C -t-5 -l-5 -r4.2 -o.55 -f 2>/dev/null &

# input tweaking
setxkbmap -option terminate:ctrl_alt_bksp
xset r rate 220 45
xsetroot -cursor_name left_ptr

# autostart
{ sleep 1; chromium; } & # delay prevents start prior to xcompmgr
urxvtd -q -o -f
urxvtc -name tmux -geometry 122x77 -e tmux -L main attach
urxvtc -name htop -e htop
urxvtc -name ncmpcpp -e ncmpcpp
urxvtc -name werk

# i'm running a reparenting WM, honest!
wmname LG3D

nvidia-settings -l

exec ~/bin/startdwm

