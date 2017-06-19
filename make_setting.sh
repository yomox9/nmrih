#!/bin/sh

setf=setting_nmrih_`hostname`.txt

servercfgpath=servercfg
mapcyclepath=mapcycle

echo hostname=`hostname`

echo -----------------------------------------
if [ `hostname` = np25s ];then
	ip=192.168.112.80
	port=27080
	servercfgfile=server_np25s.cfg
	mapcycle=mapcycle_all.txt
	map=random
fi
echo -----------------------------------------
if [ `hostname` = tpx31 ];then
	ip=192.168.112.81
	port=27081
	servercfgfile=server_tpx31.cfg
	mapcycle=mapcycle_all.txt
	map=random
fi
echo -----------------------------------------
if [ `hostname` = tpx60t ];then
	ip=192.168.112.82
	port=27082
	servercfgfile=server_tpx60t.cfg
	mapcycle=mapcycle_all.txt
	map=random
fi
echo -----------------------------------------
echo -----------------------------------------
echo ls -laF $servercfgpath/$servercfgfile
ls -laF $servercfgpath/$servercfgfile
echo -----------------------------------------
if [ -e $setf ];then
	rm $setf
fi
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
