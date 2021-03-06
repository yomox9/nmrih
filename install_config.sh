#!/bin/sh -e
setf=setting_nmrih_`hostname`.txt

. ./$setf
cp -p ${mapcyclepath}/${mapcycle} server/nmrih/
ls -laF server/nmrih/$mapcycle

cp -p ${servercfgpath}/server_common.cfg server/nmrih/cfg/
cp -p ${servercfgpath}/${servercfgfile} server/nmrih/cfg/
ls -laF server/nmrih/cfg//server_common.cfg server/nmrih/cfg/$servercfgfile
echo ------------------------------------------
cat server/nmrih/cfg/$servercfgfile|head -5
echo ------------------------------------------

