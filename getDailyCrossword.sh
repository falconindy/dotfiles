#!/bin/bash

usage() {
	echo "Usage: getDailyCrossword.sh [date]"
	echo "   date can be in mm/dd/yy form or a valid token: yesterday|today|tomorrow"
	exit 0
}

case $1 in
  today|tomorrow|yesterday )
	DATESTRING=`date --date=$1 +%b%d%y`
  ;;
  *[[:digit:]]/*[[:digit:]]/*[[:digit:]] )
	DATESTRING=`date --date=$1 +%b%d%y`
  ;;
  *)
	usage
  ;;	
esac

COOKIE_JAR=cookies.tmp
WEB_PAGE=tmp.html
LOGIN_PAGE=http://www.nytimes.com/auth/login
USERNAME="USERID=gerald@thereisners.net"
PASSWORD="PASSWORD=dav1d1"
XWORD_URL="http://select.nytimes.com/premium/xword/$DATESTRING.puz"
HIDDEN_FIELDS="is_continue=true&URI=http://&OQ=&OP=Submit2=Log%20In"
OUTPUT_DIR="$HOME/Desktop"

echo -n "Logging in... "
curl --silent --cookie-jar $COOKIE_JAR \
	--output $WEB_PAGE \
	$LOGIN_PAGE

curl --silent --cookie $COOKIE_JAR --cookie-jar $COOKIE_JAR \
	--data "$HIDDEN_FIELDS&$USERNAME&$PASSWORD" \
	--output $WEB_PAGE \
	--location \
	$LOGIN_PAGE

# Make sure we're logged in
if [[ `cat $COOKIE_JAR | wc -l` -lt 7 ]]; then
	echo "failed!"
	exit 1
else
	echo "success!"
fi

# Get the puzzle
echo -n "Getting puzzle for $1... "
curl --silent --cookie $COOKIE_JAR --cookie-jar $COOKIE_JAR \
	--output $OUTPUT_DIR/$DATESTRING.puz \
	$XWORD_URL

#What type of file is our result?
RESULT=`file $OUTPUT_DIR/$DATESTRING.puz | cut -d\  -f2-`

case "$RESULT" in
  "data")
	echo "success!"
	rm $WEB_PAGE
	rm $COOKIE_JAR
  ;;
  "HTML document text")
	echo "error! (Puzzle not yet available?)"
	if [[ -e $OUTPUT_DIR/$DATESTRING.puz ]]; then
		rm $OUTPUT_DIR/$DATESTRING.puz
	fi
	exit 1
  ;;
esac

