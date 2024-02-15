#!/bin/bash

# helm upgrade --install ingress-nginx ingress-nginx \
#   --repo https://kubernetes.github.io/ingress-nginx \
#   --namespace ingress-nginx --create-namespace \
#   --set controller.replicaCount=2

kubectl create namespace ingress-nginx

# Add the Helm repository
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update

helm upgrade --install ingress-nginx ingress-nginx \
  --repo https://kubernetes.github.io/ingress-nginx \
  --namespace ingress-nginx \
  --set controller.config.http2=true \
  --set controller.config.http2-push="on" \
  --set controller.config.http2-push-preload="on" \
  --set controller.ingressClassByName=true \
  --set controller.ingressClassResource.controllerValue=k8s.io/ingress-nginx \
  --set controller.ingressClassResource.enabled=true \
  --set controller.ingressClassResource.name=nginx \
  --set controller.service.externalTrafficPolicy=Local \
  --set controller.setAsDefaultIngress=true

# helm repo add bitnami https://charts.bitnami.com/bitnami
# helm install ingress-nginx bitnami/nginx-ingress-controller --version 10.1.0 \
#   --namespace ingress-nginx --create-namespace 