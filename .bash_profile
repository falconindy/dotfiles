#startup programs
eval `keychain --eval --agents ssh id_rsa`
deluged &
deluge -u web &

if [[ -f ~/.bashrc ]]; then
	. ~/.bashrc
fi
