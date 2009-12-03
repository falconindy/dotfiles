#!/bin/bash

for mount in $(mount | awk '{for(i=3;i<NF-2;i++) printf "%s ",$i;print '\n'}'); do
	result=($(echo "$PWD" | grep -o "${mount[*]}"))
	if [[ $(expr length "${result[*]}") -gt $(expr length "${mount_point[*]}") ]]; then
		mount_point="$result"
	fi
done

echo $mount_point
