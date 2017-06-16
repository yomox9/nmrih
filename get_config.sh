#!/bin/sh -ex
if [ ! -e mapcycle ];then
	mkdir mapcycle
fi
cd mapcycle
for a in "mapcycle_all" "mapcycle_all_ia" "mapcycle_nms" "mapcycle_nmo"
do
	wget http://nmrih.yomox9.club/steamcmd/nmrihsrv/nmrih/${a}.txt
done
cd -
