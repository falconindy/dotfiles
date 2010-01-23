#!/bin/bash

track=$(mpc current)
maxlength=50
if [[ ${#track} -gt $maxlength ]]; then
    track=${track:0:$maxlength}...
fi

if [[ "!$track" != "!" ]]; then
    echo "[ $track ] "
fi
