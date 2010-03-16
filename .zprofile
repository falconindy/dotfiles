# Keychain
eval $(keychain --eval id_rsa)

# Schenanagins
export CDPATH=~/:~/devel/:~/doc/school/:~/mnt/Gluttony/
export EDITOR=vi
export BROWSER=chromium
if [ -f ~/.zshrc ]; then
    . ~/.zshrc
fi

# vim: ft=zsh
