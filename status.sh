#!/bin/sh

setf=setting_nmrih_`hostname`.txt

echo -----------------------------------------------------
echo hostname=`hostname`
ls -laF "steamcmd_linux.tar.gz" "steamcmd.sh" "server/nmrih/cfg/"
for a in "server"
do
	printf "$a directory="
	if [ -d $a ];then echo Exist; else echo nothing; fi
done
echo -----------------------------------------------------
echo cat $setf
cat $setf
echo -----------------------------------------------------
ls -laF server/nmrih/mapcycle*.txt
echo line=`wc -l server/nmrih/mapcycle*.txt`
echo --- "ls -1 server/nmrih/maps/*.bsp | wc -l" ---------
echo There are `ls -1 server/nmrih/maps/*.bsp | wc -l` maps
echo -----------------------------------------------------
ls -laF server/nmrih/cfg/server_common.cfg server/nmrih/cfg/server_`hostname`.cfg
echo -----------------------------------------------------
cat server/nmrih/cfg/server_`hostname`.cfg | head -3
echo -----------------------------------------------------
echo --- "ps -ef|grep srcds | grep -v grep" --------------
ps -ef|grep srcds | grep -v grep
echo -----------------------------------------------------

