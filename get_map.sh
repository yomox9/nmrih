#!/bin/sh

clear
path_sv=server/nmrih

getfile(){
	echo 1=$1 2=$2
	echo ___ wget http://nmrih.yomox9.club/steamcmd/nmrihsrv/nmrih/$1/$2 ___
	wget -c http://nmrih.yomox9.club/steamcmd/nmrihsrv/nmrih/$1/$2
	mv $2 $path_sv/$1/
}

while read line
do
	if [ ! $line = nmo_L4D_the_sacrifice_v1 ];then

	echo /// $line ////////////////////////////////////////
	echo ___ common files .bsp soundscape_$line.txt ___
	if [ ! -e $path_sv/maps/$line.bsp ];then
		getfile maps $line.bsp
	fi
	if [ ! -e $path_sv/scripts/soundscape_$line.txt ];then
		getfile scripts soundscape_$line.txt
	fi
	if [ `echo $line | cut -b 1-3` = nmo ];then
		echo ___ nmo files __________________________________
		if [ ! -e $path_sv/$line.nmo ];then
			getfile maps $line.nmo
		fi
		
	elif [ `echo $line | cut -b 1-3` = nms ];then
		echo ___ nms files __________________________________
	else
		echo *** unknown files!!! ****************************
	fi
	sleep 5
	fi
done<mapcycle/mapcycle_all.txt

