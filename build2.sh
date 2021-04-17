#!/bin/bash
sys="ubuntu-focal"
git_ver="20.10.6"

sudo apt -y install make

git clone https://github.com/docker/cli.git
git clone https://github.com/moby/moby.git
git clone https://github.com/docker/scan-cli-plugin.git
git clone https://github.com/docker/docker-ce-packaging.git
wget https://raw.githubusercontent.com/Unicamp-OpenPower/docker-ce-build/master/patch2.py

cd cli
git checkout v$git_ver
git config --global user.name "Your Name"
git config --global user.email "user@example.com"
git add . && git commit -m "using community containerd versions"
cd ..

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
