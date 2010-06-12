#!/bin/bash

XAUTHORITY=`cat /home/haruko/.Xauthority`

message=$(~/.scripts/getRandomLyric.sh)

DISPLAY=:0.0 /usr/bin/purple-remote "setstatus?message=${message}"
