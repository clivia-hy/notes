#/bin/bash

sudo dpkg -i runc_1.1.4-0ubuntu1~18.04.2_amd64.deb
sudo dpkg -i containerd_1.6.12-0ubuntu1~18.04.1_amd64.deb
sudo dpkg -i docker.io_20.10.21-0ubuntu1~18.04.3_amd64.deb
sudo dpkg -i bridge-utils_1.5-15ubuntu1_amd64.deb
sudo dpkg -i pigz_2.4-1_amd64.deb
sudo dpkg -i ubuntu-fan_0.12.10_all.deb

sudo usermod -aG docker guanyuan
