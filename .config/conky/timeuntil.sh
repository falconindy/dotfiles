#!/bin/bash

future="June 30 2010"
[[ $# -gt 0 ]] && future="$*"

diff=$(( $(date --date="$future" +%s) - $(date +%s) ))

[[ $diff -gt 0 ]] && {

    days=$(echo "$diff / 86400" | bc);
    diff=$(echo "$diff % 86400" | bc);

    hours=$(echo "$diff / 3600" | bc);
    diff=$(echo "$diff % 3600" | bc);

    minutes=$(echo "$diff / 60" | bc);
    seconds=$(echo "$diff % 60" | bc);

    printf "%0d:%02d:%02d:%02d until %s\n" $days $hours $minutes $seconds "$future";
    exit 0
}

echo "Schoooooooooooool's out! for! ever!"

