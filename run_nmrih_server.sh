#!/bin/sh -x
# ver0.01 2017/06/16 first version

clear

setf=setting_nmrih_`hostname`.txt

. ./$setf
echo -----------------------------------------------------
echo ip=$ip
echo port=$port
echo servercfgfile=$servercfgfile
echo map=$map
echo mapcycle=$mapcycle
echo -----------------------------------------------------
if [ $map = random ];then
	mapcycle_line=`cat mapcycle/mapcycle_all.txt | wc -l`
	echo mapcycle_line=$mapcycle_line
	target_line=`jot -r 1 1 $mapcycle_line`
	echo target_line=$target_line
	map=`head -n $target_line server/nmrih/$mapcycle | tail -n 1`
	echo map=$map
fi
echo -----------------------------------------------------
sleep 1

expect -c "
set timeout 30
spawn /home/user/nmrih/server/srcds_run -game nmrih +ip $ip -port $port +servercfgfile ${servercfgfile} +map ${map} -maxplayers 8 -insecure
expect \"VAC secure mode disabled.\"
send \"changelevel ${map}\n\"
expect \"cfg/motd_text.txt' was not found.\)\"\n
send \"status\n\"
interact
"

cd ..


