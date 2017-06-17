#!/bin/sh

setf=setting_nmrih_`hostname`.txt

echo hostname=`hostname`
ls -laF "steamcmd_linux.tar.gz" "steamcmd.sh" "server/nmrih/cfg/"
for a in "server"
do
	printf "$a directory="
	if [ -d $a ];then echo Exist; else echo nothing; fi
done
cat $setf
