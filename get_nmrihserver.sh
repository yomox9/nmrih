#/bin/sh -ex

echo -----------------------------------------------
wget -c http://media.steampowered.com/client/steamcmd_linux.tar.gz
echo -----------------------------------------------
gzip -dk steamcmd_linux.tar.gz
echo -----------------------------------------------
tar -xvf steamcmd_linux.tar
echo -----------------------------------------------
./steamcmd.sh +login anonymous +force_install_dir "./server" +app_update 317670 validate +quit
echo -----------------------------------------------
rm steamcmd_linux.tar
echo -----------------------------------------------
