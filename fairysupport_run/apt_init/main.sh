#!/bin/bash

. ../common/common.sh

sudo -S apt -y update
sudo -S ufw enable
apt_install "lsof" "lsof"
apt_install "policycoreutils-python" "policycoreutils-python"
apt_install "iproute" "iproute"
apt_install "wget" "wget"
apt_install_regexp "^gcc.x86_64 " "gcc"

