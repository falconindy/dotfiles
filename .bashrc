#
# .bashrc - interactive shell configuration
#

# check for interactive
[[ $- = *i* ]] || return

# shell opts: see bash(1)
shopt -s cdspell dirspell extglob histverify no_empty_cmd_completion checkwinsize

set -o notify           # notify of completed background jobs immediately
ulimit -S -c 0          # disable core dumps
stty -ctlecho           # turn off control character echoing
setterm -regtabs 2      # set tab width of 4 (only works on TTY)

# more for less
LESS=-R # use -X to avoid sending terminal initialization
LESS_TERMCAP_mb=$'\e[01;31m'
LESS_TERMCAP_md=$'\e[01;31m'
LESS_TERMCAP_me=$'\e[0m'
LESS_TERMCAP_se=$'\e[0m'
LESS_TERMCAP_so=$'\e[01;44;33m'
LESS_TERMCAP_ue=$'\e[0m'
LESS_TERMCAP_us=$'\e[01;32m'
export "${!LESS@}"

# history
HISTIGNORE="&:ls:[bf]g:exit:reset:clear:cd*"
HISTCONTROL="ignoreboth:erasedups"
HISTSIZE=1000
HISTFILESIZE=2000
export "${!HIST@}"

# chroot prompt
if [[ -f /.chroot ]]; then
  root_name=$(< /.chroot)
  root_name=${root_name:-NONAME}
  PS1='[\u@\h${root_name} \w]\$ '
  return
fi

# External config
[[ -r ~/.dircolors && -x /bin/dircolors ]] && eval $(dircolors -b ~/.dircolors)
[[ -z $BASH_COMPLETION && -r /etc/bash_completion ]] && . /etc/bash_completion
for config in .aliases .functions .prompt; do
  [[ -r ~/$config ]] && . ~/$config
done

(( UID != 0 )) && eval $(keychain --eval id_rsa)
