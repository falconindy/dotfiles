# Keychain
eval $(keychain --eval id_rsa)

# Schenanagins
export CDPATH=~/:~/devel/:~/doc/school/:/mnt/Gluttony/:/mnt/Destruction/
export EDITOR=vi
export BROWSER=chromium
if [ -f ~/.zshrc ]; then
    . ~/.zshrc
fi

# vim: ft=zsh
