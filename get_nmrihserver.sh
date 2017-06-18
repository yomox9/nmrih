#/bin/sh -ex

wget -c http://media.steampowered.com/client/steamcmd_linux.tar.gz
sleep 10
gzip -dk steamcmd_linux.tar.gz
sleep 10
tar -xvf steamcmd_linux.tar
sleep 10
./steamcmd.sh +login anonymous +force_install_dir "./server" +app_update 317670 validate +quit
sleep 10
rm steamcmd_linux.tar
sleep 10
