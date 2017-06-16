#!/bin/sh -ex

setf=setting_file.txt

if [ `hostname` = user-Endeavor-NP25S ];then
	ip=192.168.112.80
	port=27080
	servercfgfile=server_np25s.cfg
	mapcycle=mapcycle_all.txt
fi
cp -p ${servercfgfile} server/nmrih/cfg/
ls -laF $servercfgfile server/nmrih/cfg/$servercfgfile
echo -----------------------------------------
echo ip=$ip>$setf
echo port=$port>>$setf
echo servercfgpath=servercfg
echo servercfgfile=$servercfgfile>>$setf
echo mapcyclepath=mapcycle
echo mapcycle=$mapcycle>>$setf
echo -----------------------------------------
cat $setf
