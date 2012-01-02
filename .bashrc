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

if [[ $TERM = linux ]]; then
  setterm -regtabs 2    # set tab width of 4 (only works on TTY)
fi

# more for less
export LESS=-R # use -X to avoid sending terminal initialization
export LESS_TERMCAP_mb=$'\e[01;31m'
export LESS_TERMCAP_md=$'\e[01;31m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;44;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[01;32m'

# history
export HISTIGNORE="&:ls:[bf]g:exit:reset:clear:cd*"
export HISTCONTROL="ignoreboth:erasedups"
export HISTSIZE=1000
export HISTFILESIZE=2000

# External config
[[ -r ~/.dircolors && -x /bin/dircolors ]] && eval $(dircolors -b ~/.dircolors)
[[ -z $BASH_COMPLETION && -r /etc/bash_completion ]] && . /etc/bash_completion
for config in .aliases .functions .prompt .bashrc."$HOSTNAME"; do
  [[ -r ~/$config ]] && . ~/"$config"
done
unset config

if type -p keychain >/dev/null && (( UID != 0 )); then
  keys=("$HOME"/.ssh/id_rsa!(*.pub))
  keys=("${keys[@]#$HOME/.ssh/}")
  eval $(keychain --eval "${keys[@]}")
  unset keys
fi
