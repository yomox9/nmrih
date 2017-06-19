#!/bin/sh
while :
do
	printf "`date +%Y%m%d_%H%M%S`"
	if [ -e nmrih_d.lock ];then
		printf " lock O"
	else
		printf " lock X"
	fi
	#ps -ef|grep -v grep|grep srcds_linux|cut -d " " -f 14,15,16
	p=`ps -ef|grep -v grep|grep srcds_linux|cut -d " " -f 15`
	if [ "$p" = "./srcds_linux" ];then
		printf " proc O"
	else
		printf " proc X"
	fi
	echo
	sleep 1
done
