#startup programs
eval `keychain --eval --agents ssh id_rsa`
pgrep deluged || deluged

[[ `ps aux | grep 'deluge -u web' | grep -v grep`  ]] || deluge -u web &

if [[ -f ~/.bashrc ]]; then
	. ~/.bashrc
fi
