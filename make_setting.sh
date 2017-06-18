#!/bin/sh -ex

setf=setting_nmrih_`hostname`.txt

servercfgpath=servercfg
mapcyclepath=mapcycle

if [ `hostname` = np25s ];then
	ip=192.168.112.80
	port=27080
	servercfgfile=server_np25s.cfg
	mapcycle=mapcycle_all.txt
	map=random
fi
ls -laF $servercfgpath/$servercfgfile server/nmrih/cfg/$servercfgfile
echo -----------------------------------------
rm $setf
while read line
do
	echo $line>>$setf
done <<END
ip=$ip
port=$port
servercfgpath=$servercfgpath
servercfgfile=$servercfgfile
mapcyclepath=$mapcyclepath
mapcycle=$mapcycle
map=$map
END
echo -----------------------------------------
echo cat $setf
cat $setf
