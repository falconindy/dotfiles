#!/bin/bash
alias !='sudo'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias cower='cower -c'
alias cdg='cd $(git rev-parse --git-dir)/..'
alias dsz='find $(pwd -P) -maxdepth 1 -type d -exec du -sh {} \; | sort -h'
alias dvdburn='growisofs -Z /dev/dvd -R -J'
alias gensums='[[ -f PKGBUILD ]] && makepkg -g >> PKGBUILD'
alias grep='grep --color'
alias j='jobs'
alias ls='ls --group-directories-first --color=auto'
alias ll='ls -l'
alias lla='ls -la'
alias lsd='ls -l | grep ^[dl] --color=none'
alias md5='md5sum'
alias pp='powerpill'
alias randbg='feh --bg-scale $(find ~/pic/wallpaper/16\:10/ -type f | shuf -n 1)'
alias rename='/usr/lib/perl5/vendor_perl/bin/rename'
alias spp='sudo powerpill'
alias udevinfo='udevadm info -q all -n'
alias v='vim'
alias wakeht='wakeonlan 6C:F0:49:17:BF:A3'
alias webshare='python /usr/lib/python2.6/SimpleHTTPServer.py 8001'
alias wgetxc='wget $(xclip -o)'

aget() {
  for pkg; do
    curl "http://aur.archlinux.org/packages/$pkg/$pkg.tar.gz" | tar -xzvf -
  done
}

cc() {
  eval $(sed -n 's/^\(\(LD\|C\)FLAGS.*\)/local \1/p' /etc/makepkg.conf)
  case ${1##*.} in
    c) CC="c99 -Wall -pedantic" ;;
    @(C|cpp)) CC="g++ -Wall -pedantic" ;;
  esac
  make CC="$CC" CFLAGS="$CFLAGS" LDFLAGS="$LDFLAGS" $1 ${1%.*} | grep -v "make: Nothing"
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

qp() {
  local pacman=$(type -p pacman-color || type -p pacman)
  res=($($pacman -Qsq $1))
  (( ${#res[@]} == 0 )) && { echo "No local results for '$1'. Searching syncs..."; $pacman -Ss $1; return; }
  (( ${#res[@]} == 1 )) && $pacman -Qi ${res[0]} || $pacman -Qs $1
}

calc() {
    echo "scale=3; $*" | bc
}

unwork() {
  if [[ -z $1 ]]; then
    echo "USAGE: unwork <dirname>"
  else
    if [[ -d $1 ]]; then
      local count=0
      while read f; do
        rm -rf $f
        (( ++count ))
      done < <(find $1 -name .svn)
      echo "SUCCESS. Directory is no longer a working copy ($count .svns removed)."
    else
      echo "ERROR: $1 is not a directory"
    fi
  fi
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

ex () {
  if [[ -f $1 ]]; then
    case $1 in
      *.tar.bz2)   bsdtar xvf $1  ;;
      *.tar.gz)    bsdtar xvf $1  ;;
      *.tar.xz)    bsdtar xvf $1  ;;
      *.bz2)       bsdtar xvf $1  ;;
      *.tar)       bsdtar xvf $1  ;;
      *.tbz2)      bsdtar xvf $1  ;;
      *.tgz)       bsdtar xvf $1  ;;
      *.zip)       bsdtar xvf $1  ;;
      *.Z)         uncompress $1  ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1      ;;
      *.lzma)      unxz $1        ;;
      *.7z)        7z x $1        ;;
      *.exe)       cabextract $1  ;;
      *)           echo "'$1': unrecognized file compression" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

hex2dec() {
  printf "%d\n" 0x$1
}

ljoin() {
  local OLDIFS=$IFS
  IFS=${1:?"Missing separator"}; shift
  echo "$*"
  IFS=$OLDIFS
}

t () {
    tmux -L main ${1:-attach}
}

miso () {
  [[ ! -f "$1" ]] && { echo "Provide a valid iso file"; return 1; }
  mountpoint="/media/${1//.iso}"
  sudo mkdir -p "$mountpoint"
  sudo mount -o loop "$1" "$mountpoint"
}

umiso () {
  mountpoint="/media/${1//.iso}"
  [[ ! -d "$mountpoint" ]] && { echo "Not a valid mount point"; return 1; }
  sudo umount "$mountpoint"
  sudo rm -ir "$mountpoint"
}

# vim: syn=sh ft=sh et
