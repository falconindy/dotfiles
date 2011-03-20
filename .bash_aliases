#!/bin/bash
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias callgrind='valgrind --tool=callgrind'
alias cdg='cd_up .git'
alias cdp='cd_up PKGBUILD'
alias dsz='find $(pwd -P) -maxdepth 1 -type d -exec du -sh {} + 2>/dev/null | sort -h'
alias dvdburn='growisofs -Z /dev/dvd -R -J'
alias gensums='[[ -f PKGBUILD ]] && makepkg -g >> PKGBUILD'
alias getflags='eval $(sed -n "s/^\(\(C\|LD\|MAKE\)FLAGS\)/export \1/p" /etc/makepkg.conf)'
alias grep='grep --color'
alias info='info --vi-keys'
alias j='jobs'
alias ll='ls -l'
alias lla='ls -la'
alias ls='ls --group-directories-first --color'
alias lsd='ls -l | grep ^[dl] --color=none'
alias md5='md5sum'
alias pacconf='./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --disable-doc --enable-git-version --enable-debug'
alias pm='pacman-color'
alias pqu='paste -d "" <(printf "%-20.20s %12s => \n" $(pacman -Qu)) <(pacman --config <(grep -v "^Ignore" /etc/pacman.conf) -Sddp --print-format "%v" $(pacman -Qqu))'
alias randbg='feh --bg-scale $(randomWallpaper)'
alias rename='/usr/lib/perl5/vendor_perl/bin/rename'
alias space='LD_PRELOAD=$HOME/lib/libspace.so'
alias sudo='sudo '
alias udevinfo='udevadm info -q all -n'
alias v='vim'
alias vgfull='valgrind --leak-check=full --show-reachable=yes'
alias wakeht='wakeonlan 6C:F0:49:17:BF:A3'
alias webshare='python /usr/lib/python2.7/SimpleHTTPServer.py 8001'
alias wgetxc='wget $(xclip -o)'
alias wtc="curl --silent 'http://whatthecommit.com/index.txt'"

alias curlpac="PACMANDL=curl $HOME/src/c/pacman/src/pacman/pacman"

aget() {
  for pkg; do
    if curl -s --compressed "https://aur.archlinux.org/packages/$pkg/$pkg.tar.gz" | tar xz 2>/dev/null; then
      echo ":: downloaded $pkg"
    else
      echo ":: $pkg not found"
    fi
  done
}

calc() {
    echo "scale=3; $*" | bc
}

cget() {
  curl -fOL --compressed "$@"
}

cd_up() {
  curpath=$PWD
  while [[ $curpath && ! -e $curpath/$1 ]]; do
    curpath=${curpath%/*}
  done
  [[ $curpath ]] && cd $curpath
}

cg2dot() {
  { type -P gprof2dot || type -P dot; } &>/dev/null || return 1
  (( $# == 2 )) || { echo "Usage: $FUNCNAME: <input> <output>"; return 1; }
  gprof2dot --format=callgrind $1 | dot -T${2##*.} -o "$2"
}

debugflags() {
  CFLAGS="-Wextra -Wempty-body -Wfloat-equal -Wignored-qualifiers -Wmissing-declarations -Wmissing-parameter-type -Wmissing-prototypes -Wold-style-declaration -Woverride-init -Wsign-compare -Wstrict-prototypes -Wtype-limits -Wuninitialized -fstack-protector-all"
  CPPFLAGS='-D_FORTIFY_SOURCE=2'
  LDFLAGS='-lssp'
  export {LD,C{,PP}}FLAGS
}

deps() {
  local prog
  if [[ -f "$1" ]]; then
    prog=$1
  else
    prog=$(type -P $1)
    echo -e "$1 => $prog\n"
  fi

  [[ -z $prog ]] && { echo "File not found"; return 1; }
  readelf -d $prog | sed -n '/NEEDED/s/.* library: \[\(.*\)\]/\1/p'
}

depscan() {
  [[ -z $1 ]] && { echo "usage: depscan <package>"; return; }
  while read elfobj; do
    readelf -d $elfobj | sed -n 's|.*NEEDED.*\[\(.*\)\].*|'$elfobj' -- \1|p'
  done < <(file $(pacman -Qlq $1) | sed -n '/ELF/s/^\(.*\):.*/\1/p') | nl
}

ex() {
  if [[ -f $1 ]]; then
    case $1 in
      *.tar.@(bz2|gz|xz))  tar xvf $1     ;;
      *.@(tar|tbz2|tgz))   tar xvf $1     ;;
      *.bz2)               bunzip2 $1     ;;
      *.rar)               unrar x $1     ;;
      *.gz)                gunzip $1      ;;
      *.lzma)              unxz $1        ;;
      *.rpm)               bsdtar xf $1   ;;
      *.zip)               unzip $1       ;;
      *.Z)                 uncompress $1  ;;
      *.7z)                7z x $1        ;;
      *.exe)               cabextract $1  ;;
      *)                   echo "'$1': unrecognized file compression" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

ghclone() {
  (( $# == 2 )) || return 1
  git clone git://github.com/$1/${2%.git}.git
}

hex2dec() {
  printf "%d\n" 0x$1
}

kopt() {
  [[ $1 ]] || return 1
  declare -u opt=$1
  zgrep "$opt" /proc/config.gz
}

ljoin() {
  local OLDIFS=$IFS
  IFS=${1:?"Missing separator"}; shift
  echo "$*"
  IFS=$OLDIFS
}

man2pdf() {
  if [[ -z $1 ]]; then
    echo "USAGE: man2pdf <manpage>"
    return
  fi

  local manpage=(/usr/share/man/man[0-9]*/$1.*)
  if [[ -f ${manpage[0]} ]]; then
    local out=/tmp/$1.pdf
    [[ ! -e $out ]] && man -t $1 | ps2pdf - > $out
    [[ -e $out ]] && xo $out
  else
    echo "ERROR: manpage \"$1\" not found."
  fi
}

mkcd() {
  [[ $1 ]] || return 0
  [[ ! -d $1 ]] && mkdir -vp "$1"
  [[ -d $1 ]] && builtin cd "$1"
}

pushd() {
  [[ $1 ]] && builtin pushd "$@" || builtin pushd ~
}

qp() {
  local pacman=$(type -p pacman-color || type -p pacman)
  local res=($($pacman -Qsq $1))
  (( ${#res[@]} == 0 )) && { echo "No local results for '$1'. Searching syncs..."; $pacman -Ss $1; return; }
  (( ${#res[@]} == 1 )) && $pacman -Qi ${res[0]} || $pacman -Qs $1
}

t() {
  tmux -L main ${1:-attach}
}

sprunge() (
  [[ -t 0 ]] && exec 0<"$1"
  URI=$(curl -sF 'sprunge=<-' 'http://sprunge.us')
  [[ ! -t 1 ]] && flag='-n'
  echo $flag "$URI"
)

unwork() {
  if [[ -z $1 ]]; then
    echo "USAGE: unwork <dirname>"
    return 1
  fi

  if [[ -d $1 ]]; then
    local count
    read count < <(find "$1" -type d -name '.svn' -printf 'foo\n' -exec rm -rf {} + | wc -l)
    if [[ $? != 0 ]]; then
      echo "Error occurred. Nothing done." >&2
    elif [[ $count = 0 ]]; then
      echo "Nothing done."
    else
      echo "SUCCESS. Directory is no longer a working copy ($count .svns removed)."
    fi
  else
    echo "ERROR: $1 is not a directory"
  fi
}

up() {
  declare -i x=$1
  local traverse

  [[ $1 ]] || { cd ..; return; } # default to 1 level
  (( x == 0 )) && return # noop

  # build a path to avoid munging OLDPWD
  while (( x-- )); do
    traverse+='../'
  done

  cd $traverse
}

xclipc() {
  xclip -selection clipboard "$@"
}

xkbreset() {
  [[ $DISPLAY ]] || return 1
  eval $(grep 'xset r rate' ~/.xinitrc)
  eval $(grep 'terminate' ~/.xinitrc)
}

# vim: syn=sh ft=sh et
