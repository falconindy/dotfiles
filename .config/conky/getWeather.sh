#!/bin/bash

curl --silent 'http://weather.yahooapis.com/forecastrss?w=12760842' |\
   grep -A1 "Current Conditions" |\
   sed -n 's|.*, \([0-9]*\) F<.*|\1°F|p'
