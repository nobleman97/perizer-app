# Sysmon - Monitoring System Health Made Easy

The Sysmon app is a program that monitors the health of your machines and display data in a visually appealing manner.



<!-- <p text-align=center>
<img src=./sysmon-app/.assets/meters.png width=90%  >
</p> -->

This Documentation would walk you through the different parts of the project.


## Architecture Diagram
<p text-align=center>
<img src=./.drawio.png width=90%  >
</p>

## Project Setup

__Requirements:__

- Azure Cli
- Terraform
- GitHub Actions
- Kubectl
- Helm

## Deployment Instructions
### Step 1: Provision resources for backend via portal
I privisioned the resource group and storage account using the Azure Portal and included the info in the providers.tf. I did this to overcome the issue of errors commonly encountered when we try to destroy and rebuild the environment.

### Step 2: Generate Public Key
Next, I generated an ssh key to be used to access the virtual machines associated with the cluster. Copy the public key and replace the one in the [dev.auto.tfvars](./terraform/dev.auto.tfvars) file.

### Step 3: Run Terraform Apply (Would create a pipeline for this in a bit)
Next, cd into the [terraform](./terraform/) directory, run ```terraform init``` and ```terraform apply```. Doing these would create the AKS cluster and the ACR. It would also give the cluster permission to pull from the ACR.

### Step 4: Get the KubeConfig and Install Kubectl
Get the Kube config by running ```terraform output kube_config```. Copy the output. Create a the file __~/.kube/config__ and paste the output content there. Next install Kubectl (Google if for your specific OS).

### Step 5: The CI pipeline
The ci file is located at [.github/workflows/app_ci.yaml](.github/workflows/app_ci.yaml). Set the secrets in your repo and the trigger the run manually.

### Step 6: Set up ArgoCD for Continuous Deployment
cd into the [kubernetes/scripts](kubernetes/scripts/) folder and run the ```installargocd.sh``` script to install Argocd. Follow the instructions in the output to get the initial admin password and portforward to get to the argocd frontend.


<p text-align=center>
<img src=./sysmon-app/.assets/installargo.png width=90%  >
</p>

- Go ahead and login... (username is ```admin```)
<p text-align=center>
<img src=./sysmon-app/.assets/argo_login.png width=70%  >
</p>

### Step 7: Connect your repo to argoCD
First, generate an ssh key pair and add the public key to SSH keys in your github. Next, copy the private key part of the key pair and add it to the space provided for it in the [./kubernetes/argocd-apps/connect-repo.yaml](./kubernetes/argocd-apps/connect-repo.yaml) file.

``` yaml
---
apiVersion: v1
kind: Secret
metadata:
  name: ssh-repo-secret
  namespace: argocd
  labels:
    argocd.argoproj.io/secret-type: repository
stringData:
  url: git@github.com:nobleman97/perizer-app.git  # set your repo here
  sshPrivateKey: |
    -----BEGIN OPENSSH PRIVATE KEY-----
    # Add private key here
    -----END OPENSSH PRIVATE KEY-----
  insecure: "true" # Do not perform a host key check for the server. Defaults to "false"
  enableLfs: "true" # Enable git-lfs for this repository. Defaults to "false"
```

When you've done that, use kubectl apply to apply the yaml to the cluster.
Next, navigate to ArgoCD >> Settings >> Repositories to check if the repository connected successfully.

It should look like this...
<p text-align=center>
<img src=./sysmon-app/.assets/repo.png width=90%  >
</p>

### Step 8: Deploy the Application
Next, cd into [./kubernetes/argocd-apps/sysmon/](./kubernetes/argocd-apps/sysmon/). Go go into each of the files there and ensure the repos are set correctly. Then run ```kubectl apply -f application.yaml``` This will deploy the application. 

### Step 9: Get the Service for the deployment and Visit the application
```bash
root@cfaa7e601541:/home/perizer-app# kubectl get svc -n sysmon
NAME         TYPE           CLUSTER-IP    EXTERNAL-IP    PORT(S)        AGE
sysmon-svc   LoadBalancer   10.0.212.98   4.156.40.245   80:30626/TCP   7h35m
```

Visit the External-Ip...
<p text-align=center>
<img src=./sysmon-app/.assets/meters.png width=90%  >
</p>

### Step 9: Clean Up
cd into the terraform folder and run ```terraform destroy``` to take down the infra.


## Reflections
- While working on this project, I got how to better utilize service principals and managed identities and when to use which.
