# progs
export EDITOR=vim
export VISUAL=$EDITOR
export BROWSER=chromium
export PAGER=less

# path
PATH=$HOME/bin:$PATH
export CDPATH=.:/mnt/Gluttony:/mnt/Haven

[ -n ~/.profile."$HOSTNAME" ] && . ~/.profile."$HOSTNAME"
[ -n $BASH -a -r ~/.bashrc ] && . ~/.bashrc
