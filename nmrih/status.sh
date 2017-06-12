#!/bin/sh

for a in "steamcmd_linux.tar.gz" "steamcmd.sh" "server"
do
	printf "$a "
	if [ -e $a ];then echo Exist; else echo nothing; fi
done

