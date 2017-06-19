#!/bin/sh -ex
cd
ls -1 /media/user/ | while read line
do
	sudo cp -rp /media/user/$line/.ssh ~/
done
chmod 600 ~/.ssh/id_rsa
sudo apt-get install git
sudo apt-get install athena-jot
sudo apt-get install expect
git init
git config --global user.name "yomox9"
git config --global user.email "yomox9@gmail.com"
git remote -v
git remote -v | grep git@github.com:yomox9/nmrih.git
if [ ! $? ];then
	git remote add nmrih git@github.com:yomox9/nmrih.git
fi
git config --global push.default matching
git clone https://github.com/yomox9/nmrih
