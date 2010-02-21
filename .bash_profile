#startup programs
eval `keychain --eval id_rsa`
pgrep deluged > /dev/null 2>&1 || deluged > /dev/null 2>&1

[[ `ps aux | grep 'deluge -u web' | grep -v grep`  ]] || deluge -u web > /dev/null 2>&1 &

export EDITOR=vi
export BROWSER=chromium
if [[ -f ~/.bashrc ]]; then
    . ~/.bashrc
fi
