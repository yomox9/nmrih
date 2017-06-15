#!/bin/sh -Ceu

ip=192.168.112.80
port=27080
servercfgfile=server_np25s.cfg

cd ~/nmrih/server
./srcds_run -game nmrih +ip $ip -port $port +servercfgfile $servercfgfile +map nmo_broadway -maxplayers 8 -insecure
cd


