#!/bin/sh

echo "provision_worker.sh: Provisioning Worker..."
sudo do-release-upgrade
sudo apt update
sudo apt install -y systemd
curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="agent --server https://apitoiseS:6443 --toke    n 4242" sh -s -
