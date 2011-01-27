# set a sane sorting locale
export LC_COLLATE=C

# progs
export EDITOR=vim
export VISUAL=$EDITOR
export BROWSER=chromium
export PAGER=less

# go
export GOOS=linux
export GOARCH=amd64
export GOROOT=$HOME/go

# path
export PATH=$HOME/go/bin:$HOME/bin:$PATH
export CDPATH=.:~:/mnt/Gluttony:/mnt/Haven

# local daemons
eval $(keychain --eval id_rsa)
#pidof gocode &>/dev/null || gocode

# if interactive, source .bashrc
[[ -n $PS1 && -f ~/.bashrc ]] && . ~/.bashrc
