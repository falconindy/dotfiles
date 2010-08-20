# set a sane sorting locale
export LC_COLLATE=C

# progs
export EDITOR=vim
export VISUAL=$EDITOR
export BROWSER=chromium

# path
export PATH=$HOME/bin:$PATH
export CDPATH=.:~:/mnt/Gluttony:/mnt/Destruction

# local daemons
eval $(keychain --eval id_rsa)
pidof gocode &>/dev/null || gocode -s

# if interactive, source .bashrc
[[ -n $PS1 && -f ~/.bashrc ]] && . ~/.bashrc
