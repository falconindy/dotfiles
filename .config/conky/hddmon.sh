#!/bin/bash
# Print any mount points that have passed 60% capacity

df | awk '/^\/dev\/sd/{split($5,a,"%"); if (a[1] > 60) printf " [ %s: %s ]", $6, $5;}'
