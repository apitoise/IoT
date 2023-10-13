#!/bin/sh

echo "provision_worker.sh: Provisioning Worker..."
sudo yum install -y net-tools
systemctl disable firewalld --now
curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="agent --server https://192.168.56.110:6443 --token 4242" sh -s -
