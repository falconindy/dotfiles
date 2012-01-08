# environment
export EDITOR=vim
export VISUAL=$EDITOR
export BROWSER=chromium
export PAGER=less

export GOARCH=amd64
export GOROOT=$HOME/go
export GOBIN=$GOROOT/bin

export LC_COLLATE=C
export PATH=$GOBIN:$HOME/bin:$PATH
export CDPATH=.:/mnt/Gluttony:/mnt/Haven

# if interactive bash, source .bashrc
[ -n $BASH -a $- = *i* -a -f ~/.bashrc ] && . ~/.bashrc
