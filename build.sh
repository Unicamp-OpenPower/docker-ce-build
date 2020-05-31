#!/bin/bash
set -e
home=$(pwd)

printf "\n\n=========> [CLONNING MASTER AND PATCHING] >>>\n"
git clone https://github.com/docker/docker-ce
git config --global user.name "Vinicius Espindola"
git config --global user.email "vini.couto.e@gmail.com"
python3 patch.py
cd $home/docker-ce
git add . && git commit -m "using community containerd versions"

printf "\n\n=========> [BUILDING <$sys> PACKAGES] >>>\n"
cd $home/$dir
sudo VERSION=0.0.0-dev make $sys

printf "\n\n=========> [CHECKING <$sys> PACKAGES] >>>\n"
ls $home/$bin_dir
#sudo chown -R 777 $home_dir/$bin_dir
