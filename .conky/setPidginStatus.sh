#!/bin/bash

XAUTHORITY=`cat /home/haruko/.Xauthority`

[[ $(DISPLAY=:0.0 ~/bin/getIdleTime) -lt 300000 ]] && DISPLAY=:0.0 /usr/bin/purple-remote "setstatus?status=available"
