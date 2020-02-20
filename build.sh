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
ls $home/$bin_dir
sudo rm -rf $home_dir/$bin_dir