#!/bin/sh

echo "provision_serv.sh: Provisioning Server..."
sudo yum install -y net-tools
systemctl disable firewalld --now
mkdir -p /etc/rancher/k3s/
openssl genrsa -out /etc/rancher/k3s/k3s-ca-key.pem 2048
openssl req -x509 -new -nodes -key /etc/rancher/k3s/k3s-ca-key.pem -days 365 -out /etc/rancher/k3s/k3s-ca-cert.pem -subj "/CN=apitoiseS"
sudo curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="server --write-kubeconfig-mode=644 --flannel-backend none --node-ip=\"192.168.56.110\"" sh -s -
