#!/bin/bash

kubectl create secret generic ssh-secret --from-file=id_rsa=/root/.ssh/raven -n argocd