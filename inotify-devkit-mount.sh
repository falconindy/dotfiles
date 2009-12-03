#!/bin/sh

inotifywait -qm --event CREATE --format %f /dev | while read disk; do
	if [[ -b /dev/$disk ]] && [[ ${disk:0:2} == 'sd' ]] && [[ ${disk:(-1)} == [[:digit:]] ]]; then
		devkit-disks --mount /dev/$disk
	fi
done
