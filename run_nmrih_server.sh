#!/bin/sh -x
# ver0.01 2017/06/16 first version

setf=setting_file.txt

while read line
do
	$line
done<$setf

echo hostname=`hostname`
if [ -z $1];then
	if [ `hostname` = user-Endeavor-NP25S ];then
		echo --- parameter auto setting ---
		ip=192.168.112.80
		port=27080
		servercfgfile=server_np25s.cfg
	fi
else
	ip=$1;port=$2;servercfgfile=$3
fi
#sleep 10
expect -c "
set timeout 0
spawn /home/user/nmrih/server/srcds_run -game nmrih +ip $ip -port $port +servercfgfile ${servercfgfile} +map ${map} -maxplayers 8 -insecure
expect \"VAC secure mode disabled.\"
send \"changelevel ${map}\n\"
expect \"VAC secure mode disabled.\"
send \"status\n\"
interact
"

cd ..


