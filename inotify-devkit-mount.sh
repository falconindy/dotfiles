#!/bin/sh

echo "I'm mounting /dev/$1"
inotifywait -qm --event CREATE --format %f /dev | while read disk; do
	test -b /dev/$disk && devkit-disks --mount /dev/$disk
done
