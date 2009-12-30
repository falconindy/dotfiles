#!/bin/bash
# Print any mount points that have passed 60% capacity

df -h | tail --lines=+2 | awk '{split($5,a,"%"); if (a[1] > 60) printf " [ %s: %s ]", $6, $5;}'
