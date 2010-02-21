# Keychain
eval $(keychain --eval id_rsa)

# User Daemons
deluged

# Schenanagins
export EDITOR=vi
if [ -f ~/.zshrc ]; then
    . ~/.zshrc
fi

# vim: ft=zsh
