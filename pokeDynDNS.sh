#!/bin/bash

USERNAME=falconindy
PASSWORD=nightmare
IP=`curl http://www.whatismyip.com/automation/n09230945.asp`

curl -v -k "http://$USERNAME:$PASSWORD@members.dyndns.org/nic/update?hostname=notrly.mine.nu&myip=$IP&wildcard=NOCHG&mx=NOCHG&backmx=NOCHG"
