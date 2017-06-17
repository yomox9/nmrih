#!/bin/sh -ex

echo ------------------------------------------
ps -ef | grep srcds | grep -v grep
ps -ef | grep srcds | grep -v grep | cut -d ' ' -f 7
echo ------------------------------------------
SRCDSID=`ps -ef | grep srcds | grep -v grep | cut -d ' ' -f 7`
for ID in $SRCDSID
do
	echo --- kill $ID ---
	kill $ID
done
echo ------------------------------------------
ps -ef | grep srcds | grep -v grep
echo ------------------------------------------
