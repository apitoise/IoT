#!/bin/sh

echo "provision_serv.sh: Provisioning Server..."
sudo do-release-upgrade
sudo apt update
sudo apt install -y systemd
sudo curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="server --write-kubeconfig-mode=644" sh -s - --flannel-backend none     --token 4242
