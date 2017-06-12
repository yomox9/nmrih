#!/bin/sh -Ceu
cd server
./srcds_run -game nmrih +ip 192.168.112.81 -port 27081 +map nmo_broadway -maxplayers 8 -insecure
cd ..


