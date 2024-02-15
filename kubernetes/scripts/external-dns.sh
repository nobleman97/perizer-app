#!/bin/bash
# Add the Helm repository
helm repo add bitnami https://charts.bitnami.com/bitnami

helm repo update

# Use Helm to deploy an External DNS
helm install external-dns bitnami/external-dns --namespace ingress-nginx \
  --set provider=azure --set txtOwnerId=aks-stream-dev-eastus2-1 \
  --set policy=sync \
  --set azure.resourceGroup=rg-k8s-dev-eastus2-1 \
  --set azure.tenantId="7ec4cc2f-47f9-41c2-9bc1-3d7710711120" \
  --set azure.subscriptionId="748eb544-b60d-4d2d-8425-eef6ac8db70c" \
  --set azure.useManagedIdentityExtension=true \
  --set azure.userAssignedIdentityID="fdb917f0-701e-4a8e-abed-cd12482e53b1" # Use the clientID for the vmss identity

  # --set azure.userAssignedIdentityID="f6d793a2-7e03-43b6-b5f0-832287a67a11"


# ### Useful Link for Installing External DNS
# - [https://github.com/kubernetes-sigs/external-dns/blob/master/docs/tutorials/azure.md#service-principal](https://github.com/kubernetes-sigs/external-dns/blob/master/docs/tutorials/azure.md#service-principal)


# ```
# $ kubectl create secret generic external-dns --namespace "ingress-nginx" --from-file /local/path/to/azure.json
# ```
