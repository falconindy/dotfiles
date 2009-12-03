#!/bin/sh

inotifywait -qm --event CREATE --format %f /dev | while read disk; do
	if test -b /dev/$disk && test `expr length $disk` -gt 3 && test `expr length $disk -lt 6`
	then
		sleep 3
		devkit-disks --mount /dev/$disk
	fi
done
