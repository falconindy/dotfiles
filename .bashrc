# Check for an interactive session
[[ -z "$PS1" ]] && return

# External files
[[ -e /bin/dircolors ]] && eval $(dircolors -b ~/.dircolors)
[[ -f /etc/bash_completion ]] && . /etc/bash_completion
[[ -f ~/.bash_completion ]] && . ~/.bash_completion
[[ -f ~/.bash_aliases ]] && . ~/.bash_aliases

# default umask
umask 0022

# shell opts
shopt -s cdspell
shopt -s extglob
shopt -s histverify
shopt -s no_empty_cmd_completion
shopt -s dirspell

# notify of completed background jobs immediately
set -o notify

# turn off control character echoing
stty -ctlecho

# more for less
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# history options
export HISTIGNORE="&:ls:[bf]g:exit:reset:clear:cd*"
export HISTFILESIZE=2000
export HISTCONTROL="ignoreboth"
export HISTSIZE=500

# disable tidle expansion by overriding it
_expand() { return 0; }

# set tab width of 4 (only works on TTY)
setterm -regtabs 2

# disable core dumps
ulimit -S -c 0

# a functional but sane prompt
bash_prompt() {
  case $TERM in
    xterm*|rxvt*)
      local TITLEBAR='\[\033]0;\u:${NEW_PWD}\007\]' ;;
    *)
      local TITLEBAR="" ;;
  esac

  local NONE="\[\033[0m\]"    # unsets color to term's fg color

  # regular colors
  local K="\[\033[0;30m\]"    # black
  local R="\[\033[0;31m\]"    # red
  local G="\[\033[0;32m\]"    # green
  local Y="\[\033[0;33m\]"    # yellow
  local B="\[\033[0;34m\]"    # blue
  local M="\[\033[0;35m\]"    # magenta
  local C="\[\033[0;36m\]"    # cyan
  local W="\[\033[0;37m\]"    # white

  # emphasized (bolded) colors
  local EMK="\[\033[1;30m\]"
  local EMR="\[\033[1;31m\]"
  local EMG="\[\033[1;32m\]"
  local EMY="\[\033[1;33m\]"
  local EMB="\[\033[1;34m\]"
  local EMM="\[\033[1;35m\]"
  local EMC="\[\033[1;36m\]"
  local EMW="\[\033[1;37m\]"

  local UC=$W                   # user's color
  [[ $UID -eq "0" ]] && UC=$R   # root's color

  RET_VALUE='$(if [[ $RET -ne 0 ]];then echo -n ":\[\033[1;31m\]$RET\[\033[0m\]";fi)'
  PS1="$TITLEBAR ${EMK}┌┤${UC}\u${EMK}@${UC}\h${RET_VALUE}"'$(__git_ps1 " \[\033[0;32m\]%s\[\033[0m\]")'" ${EMB}\w${NONE}${EMK}${UC}\n ${EMK}└─${NONE}\\$ "
}

# show return val of last command
PROMPT_COMMAND='RET=$?'


# after all that, change prompts inside a chroot
if [ -e /.chroot ]; then
  PS1='[\u@\h32 \w]\$ '
else
  GIT_PS1_SHOWDIRTYSTATE=yes bash_prompt
fi

unset bash_prompt

