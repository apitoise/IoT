#!/usr/bin/env sh

k3d cluster delete yacht-cluster

echo "Creating cluster..."

k3d cluster create yacht-cluster --api-port 6443 -p 8080:80@loadbalancer --agents 2

kubectl create namespace argocd
kubectl create namespace dev

echo "Launching ArgoCD..."

kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
kubectl wait --for=condition=Ready pods --all -n argocd --timeout=-1s

# Change password to user42
kubectl -n argocd patch secret argocd-secret -p '{"stringData":  {
    "admin.password": "$2a$12$vHxjugfRcmFr/2AR5Jft6O1h7gayUL6/aCBaHOS6vEe9Rk5nawU8K",
    "admin.passwordMtime": "'$(date +%FT%T%Z)'"
  }}'

kubectl apply -f app.yaml -n argocd

echo "To access ArgoCD, launch: \"sudo kubectl port-forward -n argocd svc/argocd-server 8080:443 &\""
echo "To access App, launch: \"sudo kubectl port-forward -n dev svc/app-service 8888:8888 &\"\n"
echo "Access to ArgoCD: https://localhost:8080\nusername: admin\npassword: user42\n"
echo "Access to App: http://localhost:8888"
