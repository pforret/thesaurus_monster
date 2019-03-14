#!/bin/bash
URL=https://github.com/hunspell/mythes/raw/master/th_en_US_new.dat
INPUT=$(basename $URL)
if [ ! -f "$INPUT" ] ; then
	echo Downloading $URL ...
	wget -q "$URL"
fi
OUTPUT=mythes.words
if [ ! -f $OUTPUT ] ; then
	< $INPUT awk -F\| '
	NF == 2  { print $1}
	' \
	| tr '[:upper:]' '[:lower:]'  \
	| egrep '^\w+$' \
	| egrep -v '[0-9]' \
	| egrep '[aeiouyéèàù]' \
	> $OUTPUT
fi
wc -l $INPUT $OUTPUT
