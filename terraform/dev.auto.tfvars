rg_name  = "rg-k8s-dev-eastus2-1"
rg_location = "eastus2"

# azuread_app_name = "spn-k8s-dev-eastus2-1"

# kv_name = "raven-k8s-key-vault"

aks-name = "aks-stream-dev-eastus2-1"

ssh-public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCvqGKPqbSFWD4u+b+Ym93kRTgwlCpPvav7FyToUks3eQwG86FjoBaykmEVZizXxYPzI2ux2B+UcV4LGrUzqeVDKmPU77W6utlRsZFihAqkdWNGb/IQVHiqTpnyRaPolfBodrFUnDLosrzSgJgD6vsa4EOb17Zs7D/fmmO1nd4a6b8zuDXgrgu0Y67QKYZ41FsxXLINE7bdbOSj5idPyAWI86zsPrStqGoezc6ZT/F95gOP7TGljGGhuVAxmNJ0Y6qtHhZ2iNlL2FCpiUytjgDSiYvzHOm0MQKI1WdWixUN4MJTCA/9fBK42hgrTve4sXhzUGo4JBtZbumged/UZ35uGtZLc/ZZDZ9q5wBW3tuki4yJ8CQGRU9EAC1let4XSO+RQ1/si3HdFfyg6f2WXPiQaC8bhctXfSUVTTRDz3RiPyNGEPk0JdO5JW9EkfqSaU+fSXCGIX8XRC743YBeO/APjt+vGka0odsTO5eV5okjXo6djZ+gzauNTMSyQffiHpk= root@19ad433f76c0"

dns-names = {
  "com" = {
    name = "ravenlivestream-api.com"
  }

  "website" = {
    name = "ravenlivestream-api.website"
  }
}

dns-prefix = "raven-k8s"

http_application_routing_enabled = false