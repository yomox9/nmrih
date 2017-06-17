#!/bin/sh

clear
path_sv=server/nmrih

getfile(){
	echo 1=$1 2=$2
	echo wget -c -nv http://nmrih.yomox9.club/steamcmd/nmrihsrv/nmrih/$1/$2
	wget -c -nv http://nmrih.yomox9.club/steamcmd/nmrihsrv/nmrih/$1/$2
	if [ -e $2 ];then
		echo mv $2 $path_sv/$1/
		mv $2 $path_sv/$1/
	fi
}

while read line
do
	prefix=nmo
	echo 
	echo line=$line _________________
	if [ ! $line = nmo_L4D_the_sacrifice_v1 ];then

	echo common files .bsp soundscape_$line.txt oooooooooooooo
	if [ ! -e $path_sv/maps/$line.bsp ];then
		getfile maps $line.bsp
	fi
	if [ ! -e $path_sv/scripts/soundscape_$line.txt ];then
		getfile scripts soundscape_$line.txt
	fi
	if [ $prefix = nmo ];then
		echo nmo files ooooooooooooooooooooooooooooooooooo
		if [ ! -e $path_sv/$line.nmo ];then
			getfile maps $line.nmo
		fi
		
	elif [ $prefix = nms ];then
		echo nms files ooooooooooooooooooooooooooooooooooo
	else
		echo unknown files ooooooooooooooooooooooooooooooo
	fi
	sleep 5
	fi
done < mapcycle/mapcycle_all.txt
