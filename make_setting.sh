#!/bin/sh -ex

setf=setting_nmrih_`hostname`.txt

servercfgpath=servercfg
mapcyclepath=mapcycle

if [ `hostname` = user-Endeavor-NP25S ];then
	ip=192.168.112.80
	port=27080
	servercfgfile=server_np25s.cfg
	mapcycle=mapcycle_all.txt
	map=random
fi
#cp -p ${servercfgpath}/${servercfgfile} server/nmrih/cfg/
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
cat $setf
