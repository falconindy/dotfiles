#!/bin/bash

track=$(mpc current)
maxlength=50

# Truncate if longer than maxlength
[[ ${#track} -gt $maxlength ]] && track=${track:0:$maxlength}...

# Display
[[ -n "$track" ]] && echo "[ $track ] "
