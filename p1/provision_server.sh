#!/bin/sh

echo "provision_serv.sh: Provisioning Server..."
sudo apt update
sudo apt install curl -y
sudo curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="server --write-kubeconfig-mode=644 --node-ip=192.168.56.110" sh -s -
cat /var/lib/rancher/k3s/server/token > /vagrant/token
