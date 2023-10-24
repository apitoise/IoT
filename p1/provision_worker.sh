#!/bin/sh

echo "provision_worker.sh: Provisioning Worker..."
sudo apt update
sudo apt install curl -y
curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="agent --server=https://192.168.56.110:6443 --token=$(cat /vagrant/token)" sh -s -
