#startup programs
eval `keychain --eval --agents ssh id_rsa`
pgrep deluged > /dev/null 2>&1 || deluged > /dev/null 2>&1

[[ `ps aux | grep 'deluge -u web' | grep -v grep`  ]] || deluge -u web > /dev/null 2>&1 &

if [[ -f ~/.bashrc ]]; then
	. ~/.bashrc
fi
