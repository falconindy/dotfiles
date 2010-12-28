#!/bin/bash

[[ -z $1 ]] && exit 0

df -P | awk '
  /^\/dev/ {
    sub("%", "", $5);
    if ($5 > '$1') {
      printf " [ %s: %s%% ]",$6,$5;
    }
  }
'

