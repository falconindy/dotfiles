#!/bin/bash

eval $(curl -s 'http://weather.yahooapis.com/forecastrss?w=12760842' | xmllint --xpath '//*/@temp' -)
echo "$temp°F"
