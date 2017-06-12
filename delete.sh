#!/bin/sh -xe

for a in "steamcmd_linux.tar.gz" "steamcmd_linux.tar" "steamcmd.sh" "server"
do
	if [ -e "$a" ];then
		rm -rf "$a"
	fi
done

