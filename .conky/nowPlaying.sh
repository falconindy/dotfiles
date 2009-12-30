#!/bin/bash

track=$(mpc current)
if [[ "!$track" != "!" ]]; then
    echo "[ $track ] "
fi
