#!/bin/bash

sudo apt -y install make
printf "deb https://oplab9.parqtec.unicamp.br/pub/repository/debian/ ./\n" >> /etc/apt/sources.list
wget https://oplab9.parqtec.unicamp.br/pub/key/openpower-gpgkey-public.asc
sudo apt-key add openpower-gpgkey-public.asc
sudo apt-get update
sudo apt-get -y install docker-ce

git clone https://github.com/docker/cli.git
git clone https://github.com/moby/moby.git
git clone https://github.com/docker/scan-cli-plugin.git
git clone https://github.com/docker/docker-ce-packaging.git
wget https://raw.githubusercontent.com/Unicamp-OpenPower/docker-ce-build/master/patch2.py

#cd cli
#git checkout v$git_ver
#cd ..

#cd moby
#git checkout v$git_ver
#cd ..

python3 patch2.py
mkdir -p docker-ce-packaging/src/github.com/docker/cli
mkdir -p docker-ce-packaging/src/github.com//docker/docker
mkdir -p docker-ce-packaging/src/github.com/docker/scan-cli-plugin

sudo cp -r cli/* docker-ce-packaging/src/github.com/docker/cli
sudo cp -r moby/* docker-ce-packaging/src/github.com/docker/docker
sudo cp -r scan-cli-plugin/* docker-ce-packaging/src/github.com/docker/scan-cli-plugin

cd docker-ce-packaging/deb
sudo VERSION=$git_ver make $sys
cd debbuild/$sys
ls
