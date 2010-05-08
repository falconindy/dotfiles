#startup programs
eval `keychain --eval id_rsa`

export EDITOR=vi
export BROWSER=chromium
export PATH=$HOME/bin:$PATH

# turn off control character echoing
stty -ctlecho

if [[ -f ~/.bashrc ]]; then
    . ~/.bashrc
fi
