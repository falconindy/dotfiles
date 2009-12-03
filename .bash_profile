#startup programs
eval `keychain --eval --agents ssh id_rsa`
pgrep deluged || deluged
deluge -u web &

if [[ -f ~/.bashrc ]]; then
	. ~/.bashrc
fi
