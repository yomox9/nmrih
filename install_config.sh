#!/bin/sh -ex
setf=setting_nmrih_`hostname`.txt

. ./$setf
cp -p ${mapcyclepath}/${mapcycle} server/nmrih/
ls -laF server/nmrih/$mapcycle

cp -p ${servercfgpath}/${servercfgfile} server/nmrih/cfg/
ls -laF server/nmrih/cfg/$servercfgfile
echo ------------------------------------------
cat server/nmrih/cfg/$servercfgfile
echo ------------------------------------------

