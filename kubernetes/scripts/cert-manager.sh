#!/bin/bash

# Label the cert-manager namespace to disable resource validation
kubectl label namespace ingress-nginx cert-manager.io/disable-validation=true

# Add the Jetstack Helm repository
helm repo add cert-manager https://charts.jetstack.io
# helm repo add jetstack https://charts.jetstack.io
helm repo update

# Install CRDs with kubectl
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.13.3/cert-manager.crds.yaml

# # Install the cert-manager Helm chart
# helm install cert-manager jetstack/cert-manager \
#   --namespace ingress-nginx \
#   --version v1.7.1

helm install cert-manager cert-manager/cert-manager --version 1.13.3 \
  --namespace ingress-nginx