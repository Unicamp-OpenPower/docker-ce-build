#!/bin/bash
set -e
home=$(pwd)

printf "\n\n=========> [CLONNING MASTER AND PATCHING] >>>\n"
git clone https://github.com/docker/docker-ce
cd $home/docker-ce
git am --3way ../patches/*

printf "\n\n=========> [BUILDING <$sys> PACKAGES] >>>\n"
cd $home/$dir
sudo VERSION=0.0.0-dev make $sys

printf "\n\n=========> [CHECKING <$sys> PACKAGES] >>>\n"
sudo chown -R 777 $home_dir/$bin_dir
ls $home/$bin_dir