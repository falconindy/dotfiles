#!/bin/bash

shopt -s extglob

MAXLEN=50

mpd() {
  socat - tcp-connect:localhost:6600
}

while IFS=':' read attr val; do
  case "$attr" in
    Artist) artist="${val:1}";;
    Title) title="${val:1}" ;;
  esac
done < <(mpd <<< "currentsong")

track="$artist - $title"

if (( ${#track} > MAXLEN )); then
  truncated=${track:0:MAXLEN}
  track=${truncated% *}...
fi

[[ -n $track ]] && echo "[ $track ] "

