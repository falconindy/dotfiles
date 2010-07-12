#startup programs
eval `keychain --eval id_rsa`

export EDITOR=vim
export VISUAL=$EDITOR
export BROWSER=uzbl-browser
export PATH=$HOME/bin:$PATH
export LC_COLLATE=C
export CDPATH=.:~:~/devel:~/doc/school:/mnt/Gluttony:/mnt/Destruction

[[ -f ~/.bashrc ]] && . ~/.bashrc
