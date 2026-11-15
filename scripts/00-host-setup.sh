#!/bin/bash
set -euo pipefail


echo 'Acquire::ForceIPv4 "true";' | sudo tee /etc/apt/apt.conf.d/99force-ipv4 > /dev/null


echo "http://mirrors.kernel.org/ubuntu/" | sudo tee /etc/apt/apt-mirrors.txt > /dev/null

sudo apt-get update
sudo apt-get install -y build-essential bison flex texinfo gawk m4 zstd wget
sudo ln -sf bash /bin/sh


sudo mkdir -p $LFS/sources $LFS/tools $LFS/usr/bin $LFS/usr/lib $LFS/usr/sbin $LFS/etc $LFS/var $LFS/lib64

for i in bin lib sbin; do sudo ln -sfn usr/$i $LFS/$i; done
sudo chown -R "$USER" $LFS
mkdir -p "$GITHUB_WORKSPACE/logs"
