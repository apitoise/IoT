#!/bin/bash

sudo apt update
sudo apt install curl -y
sudo curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="server --write-kubeconfig-mode=644" sh -s -
