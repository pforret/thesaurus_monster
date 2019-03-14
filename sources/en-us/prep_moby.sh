#!/bin/bash
URL=https://github.com/words/moby/raw/master/words.txt
INPUT=$(basename $URL)
if [ ! -f "$INPUT" ] ; then
	echo Downloading $URL ...
	wget -q "$URL"
fi
OUTPUT=moby.words
if [ ! -f $OUTPUT ] ; then
	cat $INPUT \
	| tr ',' "\n" \
	| grep -v ' ' \
	| egrep -v '^$' \
	| sed 's/\r//g' \
	| tr '[:upper:]' '[:lower:]'  \
	| egrep '^\w+$' \
	| egrep -v '[0-9]' \
	| egrep '[aeiouyéèàù]' \
	| sort -u \
	> $OUTPUT
fi
wc -l $INPUT $OUTPUT
