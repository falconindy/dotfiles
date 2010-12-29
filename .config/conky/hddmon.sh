#!/bin/bash

[[ -z $1 ]] && exit 0

df -P | nawk '
  /^\/dev/ {
    sub("%", "", $5);
    if ($5 + 0 > '$1') {
      printf " [ %s: %s%% ]",$6,$5;
    }
  }
'

