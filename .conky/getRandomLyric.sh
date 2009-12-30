#!/bin/bash
# Fetches a random lyric from the Sonata built lyric database in ~/.lyrics.
# Filters out any blank line and attempts to filter lines starting with punctuation or blank space
sourcedir=~/.lyrics

line=""
while [[ $line = "" ]] || [[ -z `echo $line | cut -c1 | sed -e "s/[\ \/\'\<\{\(]//g"` ]]; do
	file=${sourcedir}/$(ls $sourcedir | sort -R | head -1)
	num=$(($RANDOM % $(cat "$file" | wc -l) + 1))
	line=$(head -${num} "$file" | tail -1)
done

echo $line | sed -e 's/[\(\<\>\)\{\}]//g'	#final filter
