#!/bin/bash
alias !='sudo'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias cc='c99 -Wall -pedantic -pipe'
alias cower='cower -c'
alias cdg='cd $(git rev-parse --git-dir)/..'
alias dsz='find $(pwd -P) -maxdepth 1 -type d -exec du -sh {} \; | sort -h'
alias dvdburn='growisofs -Z /dev/dvd -R -J'
alias grep='grep --color'
alias j='jobs'
alias ls='ls --group-directories-first --color=auto'
alias ll='ls -l'
alias lla='ls -la'
alias lsd='ls -l | grep ^[dl] --color=none'
alias md5='md5sum'
alias pp='powerpill'
alias randbg='feh --bg-scale $(find ~/pic/wallpaper/16\:10/ -type f | shuf -n 1)'
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

deps() {
    [[ ! -f "$1" ]] && { echo "File not found"; return 1; }
    readelf -d $1 | sed -n '/NEEDED/s/.* library: \[\(.*\)\]/\1/p'
}

qp() {
    pacman-color -Qi $1 2> /dev/null
    if [[ $? -gt 0 ]]; then
        echo "$1 not found, searching..."
        pacman-color -Qs $1
        [[ $? -gt 0 ]] && echo "No local results for $1"
    fi
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
  out=/tmp/$1.pdf
  [[ ! -e $out ]] && man -t $1 | ps2pdf - > $out
  [[ -e $out ]] && xo $out
  else
    echo "ERROR: manpage \"$1\" not found."
  fi
}

ex () {
  if [[ -f $1 ]]; then
    case $1 in
      *.tar.bz2)   tar xvjf $1    ;;
      *.tar.gz)    tar xvzf $1    ;;
      *.tar.xz)    tar xvJf $1    ;;
      *.bz2)       bunzip2 $1     ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1      ;;
      *.lzma)      unxz $1        ;;
      *.tar)       tar xvf $1     ;;
      *.tbz2)      tar xvjf $1    ;;
      *.tgz)       tar xvzf $1    ;;
      *.zip)       unzip $1       ;;
      *.Z)         uncompress $1  ;;
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
