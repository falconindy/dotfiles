#!/bin/sh

inotifywait -qm --event CREATE --format %f /dev | while read disk; do
	if test -b /dev/$disk
	then
		sleep 3
		devkit-disks --mount /dev/$disk
	fi
done
