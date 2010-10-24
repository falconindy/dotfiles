# Check for an interactive session
[[ -z "$PS1" ]] && return

# External config
[[ -r ~/.bash_aliases ]] && . ~/.bash_aliases
[[ -r ~/.dircolors && -x /bin/dircolors ]] && eval $(dircolors -b ~/.dircolors)

# shell opts: see bash(1)
shopt -s cdspell dirspell extglob globstar histverify no_empty_cmd_completion

umask 0022              # default file permissions
set -o notify           # notify of completed background jobs immediately
ulimit -S -c 0          # disable core dumps
stty -ctlecho           # turn off control character echoing
setterm -regtabs 2      # set tab width of 4 (only works on TTY)
_expand() { return 0; } # disable tidle expansion by overriding it

# more for less
LESS=-R # use -X to avoid sending terminal initialization
LESS_TERMCAP_mb=$'\E[01;31m'
LESS_TERMCAP_md=$'\E[01;31m'
LESS_TERMCAP_me=$'\E[0m'
LESS_TERMCAP_se=$'\E[0m'
LESS_TERMCAP_so=$'\E[01;44;33m'
LESS_TERMCAP_ue=$'\E[0m'
LESS_TERMCAP_us=$'\E[01;32m'
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
      local TITLEBAR='\[\033]0;\u:${NEW_PWD}\007\]' ;;
  esac

  local NONE="\[\033[0m\]"    # unsets color to term's fg color

  # regular colors
  local K="\[\033[0;30m\]" R="\[\033[0;31m\]" G="\[\033[0;32m\]" Y="\[\033[0;33m\]" \
        B="\[\033[0;34m\]" M="\[\033[0;35m\]" C="\[\033[0;36m\]" W="\[\033[0;37m\]"

  # emphasized (bolded) colors
  local EMK="\[\033[1;30m\]" EMR="\[\033[1;31m\]" EMG="\[\033[1;32m\]" EMY="\[\033[1;33m\]" \
        EMB="\[\033[1;34m\]" EMM="\[\033[1;35m\]" EMC="\[\033[1;36m\]" EMW="\[\033[1;37m\]"

  local UC=$W                   # user's color
  [[ $UID -eq "0" ]] && UC=$R   # root's color

  RET_VALUE='$((( RET )) && printf ":\[\033[1;31m\]$RET\[\033[0m\]")'
  PS1="$TITLEBAR ${EMK}┌┤${UC}\u${EMK}@${UC}\h${RET_VALUE}"'$(__git_ps1 " \[\033[0;32m\]%s\[\033[0m\]")'" ${EMB}\w${NONE}${EMK}${UC}\n ${EMK}└╼${NONE} "
  PS4='+$BASH_SOURCE:$LINENO:$FUNCNAME: '
}

# show return val of last command
PROMPT_COMMAND='RET=$?'
GIT_PS1_SHOWDIRTYSTATE=yes
bash_prompt
unset bash_prompt

