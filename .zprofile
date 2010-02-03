# Keychain
eval `keychain --eval --agents ssh id_rsa`

# Deluge
(pgrep deluged || deluged) > /dev/null 2>&1 &
#[ $(ps aux | grep 'deluge -u web' | grep -v grep) ] || deluge -u web > /dev/null 2>&1 &

# Schenanagins
export EDITOR=vi
if [ -f ~/.zshrc ]; then
    . ~/.zshrc
fi

