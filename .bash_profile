#startup programs
eval `keychain --eval id_rsa`

export EDITOR=vi
export BROWSER=chromium
if [[ -f ~/.bashrc ]]; then
    . ~/.bashrc
fi
