#!/bin/sh -x

# envrionment
# ip
# port
# servercfgfile
# map

#default
ip=192.168.1.xxx
port=27015
servercfgfile=server.cfg
map=nmo_broadway

cd server

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
interact
"

cd ..


