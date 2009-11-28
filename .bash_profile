eval `keychain --eval --agents ssh id_rsa`

if [[ -f ~/.bashrc ]]; then
	. ~/.bashrc
fi
