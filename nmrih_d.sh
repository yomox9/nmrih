#!/bin/sh

judge(){
	echo $$>nmrih_d.lock
	result=`ps -ef|grep srcds|grep -v grep`
	if [ "" = "$result" ];then
		echo run ./run_nmrih_server.sh `date`>>nmrih_d.log
		./run_nmrih_server.sh
	fi
	rm nmrih_d.lock
}

cd /home/user/nmrih
echo "start `date +%Y%m%d_%H%M%S`">>nmrih_d.log

while :
do

if [ ! -e nmrih_d.lock ];then
	judge
else
	sleep 5
fi

done
echo "end   `date +%Y%m%d_%H%M%S`">>nmrih_d.log


