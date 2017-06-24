#!/bin/sh -x

path_sv=server/nmrih

#get_mapcycle_name
. ./setting_nmrih_`hostname`.txt
echo mapcycle=$mapcycle

get_mapcycle_main(){
	wget -nv http://nmrih.yomox9.club/steamcmd/nmrihsrv/nmrih/$mapcycle
	mv $mapcycle ${mapcycle}.tmp
	sed "s///g" ${mapcycle}.tmp >$mapcycle
	rm ${mapcycle}.tmp
	
	cp -p $mapcycle ../server/nmrih/
	echo --- ls -laF $mapcycle ../server/nmrih/ ---
	ls -laF $mapcycle ../server/nmrih/$mapcycle
	echo ------------------------------
	tail -3 $mapcycle
	echo ------------------------------
	tail -3  ../server/nmrih/$mapcycle
	echo ------------------------------
}

cd ~/nmrih/mapcycle
if [ $? ];then
	if [ -n $mapcycle ];then
		rm $mapcycle
		get_mapcycle_main
	else
		echo error: mapcycle=$mapcycle is empty
	fi
else
	echo error: cd
	pwd
fi
