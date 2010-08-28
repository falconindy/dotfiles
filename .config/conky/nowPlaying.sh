#!/bin/bash

MAXLEN=50

read track < <(mpc current)

# Truncate if longer than maxlength
if (( ${#track} > MAXLEN )); then
  truncated=${track:0:MAXLEN}
  track=${truncated% *}...
fi

# Display
[[ -n $track ]] && echo "[ $track ] "
