#!/bin/bash
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias callgrind='valgrind --tool=callgrind'
alias cdg='cd_up .git'
alias cdp='cd_up PKGBUILD'
alias cower='cower -c'
alias dsz='find $(pwd -P) -maxdepth 1 -type d -exec du -sh {} + 2>/dev/null | sort -h'
alias dvdburn='growisofs -Z /dev/dvd -R -J'
alias gensums='[[ -f PKGBUILD ]] && makepkg -g >> PKGBUILD'
alias getflags='eval $(sed -n "s/^\(\(C\|LD\|MAKE\)FLAGS\)/export \1/p" /etc/makepkg.conf)'
alias grep='grep --color'
alias j='jobs'
alias ll='ls -l'
alias lla='ls -la'
alias ls='ls --group-directories-first --color'
alias lsd='ls -l | grep ^[dl] --color=none'
alias md5='md5sum'
alias pm='pacman-color'
alias pqu='paste -d "" <(printf "%-20.20s %12s => \n" $(pacman -Qu)) <(pacman --config <(grep -v "^Ignore" /etc/pacman.conf) -Sdp --print-format "%v" $(pacman -Qqu))'
alias randbg='feh --bg-scale $(randomWallpaper)'
alias rename='/usr/lib/perl5/vendor_perl/bin/rename'
alias so='source'
alias udevinfo='udevadm info -q all -n'
alias v='vim'
alias vgfull='valgrind --leak-check=full --show-reachable=yes'
alias wakeht='wakeonlan 6C:F0:49:17:BF:A3'
alias webshare='python /usr/lib/python2.7/SimpleHTTPServer.py 8001'
alias wgetxc='wget $(xclip -o)'
alias wtc="curl --silent 'http://whatthecommit.com' | sed -n '/^<p>/s/<p>\(.*\)/\1/p'"

aget() {
  for pkg; do
    if curl -s "https://aur.archlinux.org/packages/$pkg/$pkg.tar.gz" | tar xz 2>/dev/null; then
      echo ":: downloaded $pkg"
    else
      echo ":: $pkg not found"
    fi
  done
}

calc() {
    echo "scale=3; $*" | bc
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
  zgrep "${1^^}" /proc/config.gz
}

ljoin() {
  local OLDIFS=$IFS
  IFS=${1:?"Missing separator"}; shift
  echo "$*"
  IFS=$OLDIFS
}

miso() {
  [[ ! -f "$1" ]] && { echo "Provide a valid iso file"; return 1; }
  local mountpoint="/media/${1%.iso}"
  sudo mkdir -p "$mountpoint"
  sudo mount -o loop "$1" "$mountpoint"
}

man2pdf() {
  if [[ -z $1 ]]; then
    echo "USAGE: man2pdf <manpage>"
    return
  fi

  if [[ $(find /usr/share/man -name $1\* | wc -l) -gt 0 ]]; then
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

qp() {
  local pacman=$(type -p pacman-color || type -p pacman)
  local res=($($pacman -Qsq $1))
  (( ${#res[@]} == 0 )) && { echo "No local results for '$1'. Searching syncs..."; $pacman -Ss $1; return; }
  (( ${#res[@]} == 1 )) && $pacman -Qi ${res[0]} || $pacman -Qs $1
}

t() {
  tmux -L main ${1:-attach}
}

sprunge() {
  local flag URI;
  URI=$(curl -sF 'sprunge=<-' 'http://sprunge.us')
  [[ ! -t 1 ]] && flag='-n'
  echo $flag "$URI"
}

umiso() {
  local mountpoint="/media/${1%.iso}"
  [[ ! -d "$mountpoint" ]] && { echo "Not a valid mount point"; return 1; }
  sudo umount "$mountpoint"
  sudo rm -ir "$mountpoint"
}

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

xkbreset() {
  [[ $DISPLAY ]] || return 1
  eval $(grep 'xset r rate' ~/.xinitrc)
  eval $(grep 'terminate' ~/.xinitrc)
}

# vim: syn=sh ft=sh et
