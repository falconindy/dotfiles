#startup programs
eval `keychain --eval id_rsa`

export EDITOR=vim
export VISUAL=$EDITOR
export BROWSER=chromium
export PATH=$HOME/bin:$PATH
export LC_COLLATE=C
export CDPATH=.:~:~/devel:~/doc/school:/mnt/Gluttony:/mnt/Destruction

# local daemons
pidof gocode &>/dev/null || gocode -s

[[ -f ~/.bashrc ]] && . ~/.bashrc
