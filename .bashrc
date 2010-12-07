# Check for an interactive session
[[ -z "$PS1" ]] && return

# shell opts: see bash(1)
shopt -s cdspell dirspell extglob globstar histverify no_empty_cmd_completion

# External config
[[ -r ~/.dircolors && -x /bin/dircolors ]] && eval $(dircolors -b ~/.dircolors)
[[ -r ~/.bash_aliases ]] && . ~/.bash_aliases
[[ -r /etc/bash_completion ]] && . /etc/bash_completion

set -o notify           # notify of completed background jobs immediately
ulimit -S -c 0          # disable core dumps
stty -ctlecho           # turn off control character echoing
setterm -regtabs 2      # set tab width of 4 (only works on TTY)
_expand() { return 0; } # disable tidle expansion by overriding it

# more for less
LESS=-R # use -X to avoid sending terminal initialization
LESS_TERMCAP_mb=$'\e[01;31m'
LESS_TERMCAP_md=$'\e[01;31m'
LESS_TERMCAP_me=$'\e[0m'
LESS_TERMCAP_se=$'\e[0m'
LESS_TERMCAP_so=$'\e[01;44;33m'
LESS_TERMCAP_ue=$'\e[0m'
LESS_TERMCAP_us=$'\e[01;32m'
export ${!LESS@}

# history
HISTIGNORE="&:ls:[bf]g:exit:reset:clear:cd*"
HISTCONTROL="ignoreboth:erasedups"
HISTSIZE=1000
HISTFILESIZE=2000
export ${!HIST@}

# chroot prompt
if [[ -f /.chroot ]]; then
  root_name=$(< /.chroot)
  root_name=${root_name:-NONAME}
  PS1='[\u@\h${root_name} \w]\$ '
  return
fi

# a functional but sane prompt
bash_prompt() {
  case $TERM in
    @(xterm|rxvt)*)
      local TITLEBAR='\[\e]0;\u:${NEW_PWD}\007\]' ;;
  esac

  local NONE="\[\e[0m\]"    # unsets color to term's fg color

  # regular colors
  local K="\[\e[0;30m\]" R="\[\e[0;31m\]" G="\[\e[0;32m\]" Y="\[\e[0;33m\]" \
        B="\[\e[0;34m\]" M="\[\e[0;35m\]" C="\[\e[0;36m\]" W="\[\e[0;37m\]"

  # emphasized (bolded) colors
  local EMK="\[\e[1;30m\]" EMR="\[\e[1;31m\]" EMG="\[\e[1;32m\]" EMY="\[\e[1;33m\]" \
        EMB="\[\e[1;34m\]" EMM="\[\e[1;35m\]" EMC="\[\e[1;36m\]" EMW="\[\e[1;37m\]"

  # username/host color for root/other
  (( UID != 0 )) && local UC=$W || local UC=$R

  RET_VALUE='$((( RET )) && printf ":\[\e[1;31m\]$RET\[\e[0m\]")'

  # space goes inside the printf so its not there when there's no git branch
  PS1="$TITLEBAR ${EMK}┌┤${UC}\u${EMK}@${UC}\h${RET_VALUE}\$(__git_ps1 ' \[\e[0;32m\]%s\[\e[0m\]') ${EMB}\w${EMK}${UC}\n ${EMK}└╼${NONE} "
  PS4='+$BASH_SOURCE:$LINENO:$FUNCNAME: '
}

# show return val of last command
PROMPT_COMMAND='RET=$?'
GIT_PS1_SHOWDIRTYSTATE=yes
bash_prompt
unset bash_prompt

