#!/bin/bash

sudo apt update
sudo apt install curl -y
sudo curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="server --write-kubeconfig-mode=644 --node-ip=192.168.56.110" sh -s -
kubectl apply -f /vagrant/deploy/app1.yaml
kubectl apply -f /vagrant/deploy/app2.yaml
kubectl apply -f /vagrant/deploy/app3.yaml
