# Keychain
eval $(keychain --eval id_rsa)

# Schenanagins
export CDPATH=.:..:~/:~/devel/:~/doc/school/:/mnt/Gluttony/:/mnt/Destruction/
export PATH=~/bin:$PATH
export CLASSPATH=.:~/doc/school/COMP228/
export EDITOR=vi
export BROWSER=chromium
export LC_COLLATE=C

if [ -f ~/.zshrc ]; then
    . ~/.zshrc
fi

# vim: ft=zsh
