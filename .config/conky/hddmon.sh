#!/bin/bash

[[ -z $1 ]] && exit 0

df -x nfs -x tmpfs -x devtmpfs | while read _ _ _ _ used mount; do
  used=${used%\%}
  (( used > $1 )) && echo " [ ${mount}: $used% ]"
done
