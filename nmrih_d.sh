#!/bin/sh

echo >>nmrih_d.log
echo "run   `date +%Y%m%d_%H%M%S`">>nmrih_d.log
cd /home/user/nmrih
result=`ps -ef|grep srcds|grep -v grep`
if [ "" = "$result" ];then
	echo "start `date +%Y%m%d_%H%M%S`">>nmrih_d.log
	./run_nmrih_server.sh &
	echo "end   `date +%Y%m%d_%H%M%S`">>nmrih_d.log
fi
