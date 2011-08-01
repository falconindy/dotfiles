# environment
export EDITOR=vim
export VISUAL=$EDITOR
export BROWSER=chromium
export PAGER=less

export LC_COLLATE=C
export PATH=$HOME/bin:$PATH
export CDPATH=.:/mnt/Gluttony:/mnt/Haven

# if interactive, source .bashrc
[[ $- = *i* && -f ~/.bashrc ]] && . ~/.bashrc
