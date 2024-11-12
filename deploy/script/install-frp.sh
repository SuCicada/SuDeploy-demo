#!/bin/bash

mkdir -p ~/TOOL/
cd ~/TOOL/
VER=0.52.3
NAME=frp_${VER}_linux_amd64
wget "https://github.com/fatedier/frp/releases/download/v${VER}/${NAME}.tar.gz"
tar zxvf ${NAME}.tar.gz
ln -s ${NAME} frp
