#!/bin/sh -Ceu
cd server
./srcds_run -game nmrih +ip $1 -port $2 +servercfgfile $3 +map nmo_broadway -maxplayers 8 -insecure
cd ..


