#!/bin/bash

# Install Helm
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

helm repo add argo https://argoproj.github.io/argo-helm

helm install argo argo/argo-cd --version 5.52.1 --namespace argocd --create-namespace 