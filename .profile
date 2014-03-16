# progs
export EDITOR=vim
export VISUAL=$EDITOR
export BROWSER=chromium
export PAGER=less

# path
PATH=$HOME/bin:$PATH
export CDPATH=.:/mnt/Gluttony:/mnt/Haven

[ -f "$HOME/.profile.$HOSTNAME" ] && . ~/.profile."$HOSTNAME"
[ -n "$BASH" ] && [ -r "$HOME/.bashrc" ] && . ~/.bashrc
