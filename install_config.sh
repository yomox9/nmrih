#!/bin/sh -ex
setf=setting_nmrih_`hostname`.txt

. ./$setf
cp -p ${servercfgpath}/${servercfgfile} server/nmrih/cfg/
cp -p ${mapcyclepath}/${mapcycle} server/nmrih/



