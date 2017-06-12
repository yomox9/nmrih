#/bin/sh -xe

wget http://media.steampowered.com/client/steamcmd_linux.tar.gz
gzip -dk steamcmd_linux.tar.gz
tar -xvf steamcmd_linux.tar
./steamcmd.sh +login anonymous +force_install_dir "./server" +app_update 317670 validate +quit
rm steamcmd_linux.tar
