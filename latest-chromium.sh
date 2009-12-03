#!/bin/bash
[[ "$1" = "yes" ]] && yaourt -S chromium-browser-bin && exit

echo "Currently using build: `pacman -Qi chromium-browser-bin | grep Version | cut -d: -f2`"
echo "Latest build available: `curl --silent http://build.chromium.org/buildbot/snapshots/chromium-rel-linux-64/LATEST`"
