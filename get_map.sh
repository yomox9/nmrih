#!/bin/sh

clear
path_sv=server/nmrih

getfile(){
	#echo 1=$1 2=$2 3=$3
	if [ "$3" = "silence" ];then
		echo wget silence $1 $2 $3
		wget -c -nv http://nmrih.yomox9.club/steamcmd/nmrihsrv/nmrih/$1/$2>null 2>&1
	else
		echo wget -c -nv http://nmrih.yomox9.club/steamcmd/nmrihsrv/nmrih/$1/$2
		wget -c -nv http://nmrih.yomox9.club/steamcmd/nmrihsrv/nmrih/$1/$2
	fi
	if [ -e $2 ];then
		echo mv $2 $path_sv/$1/
		mv $2 $path_sv/$1/
	fi
}

get_bsp_nav_sound(){
	#echo ___ .bsp ___________________________________________
	if [ ! -e $path_sv/maps/$line.bsp ];then
		getfile maps $line.bsp
	fi
	#echo ___ .nav ___________________________
	if [ ! -e $path_sv/maps/$line.nav ];then
		getfile maps $line.nav silence
	fi
	#echo ___ soundscapes_$line.txt ___________________________
	#if [ ! -e $path_sv/scripts/soundscapes_$line.txt ];then
	#	getfile scripts soundscapes_$line.txt silence
	#fi
}

get_main(){
	prefix=`echo $line | cut -b 1-3`
	#echo prefix=$prefix
	if [ $prefix = nmo ];then
		#echo ___ this is nmo _____________________________
		if [ ! -e $path_sv/maps/$line.nmo ];then
			getfile maps $line.nmo 
		fi
		get_bsp_nav_sound
		
	elif [ $prefix = nms ];then
		#echo ___ this is nms _____________________________
		get_bsp_nav_sound
	else
		echo ___ this is unknown _____________________________
	fi
}

while read line
do
	echo 
	echo /// line=$line /////////////////////////////////////
	if [ ! $line = nmo_L4D_the_sacrifice_v1 ];then
		get_main
		#sleep 5
	fi
done < mapcycle/mapcycle_all.txt
