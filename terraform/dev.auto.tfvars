rg_name  = "rg-k8s-dev-eastus-1"
rg_location = "eastus"


aks-name = "aks-stream-dev-eastus-1"

ssh-public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDTaWnGPWsl6ohdw3uAGx5pFRnLCMuB+EpMgJAaZsOkS/mP/MD8iGWgJ5ZWr2J+QbfsPoPvc5QbKcTTp5E2Tjcbs0ge5kB+uvJSDxuEzCcQexpmAsMFvwsPQm6O8dCFNVGPc31UjyGfFWShbaIoI9z6sOGpP6ST6Q89rquQmMEu4esbyG87V0Q+VzjV1TIPJR2qUJKwZNMVppFfAdF4V87x0YykswftNqu/v65Pkdhi7WbbWdRuMyI/C6ci5UFf8FoXTOtc5ibIOi8Z0YbdwjaTtSFBvavFbBMK+Tt6g3psTgcEAMngnKqsrIeIlCICZ4mj3J0TU3O+PcK4VftCpX3fHzfgCBU/mSwx9abOFmxQ3U45OXFOhR/iIfRgCJR+i+nljaBqC6ctkMHydrVtDiJi+Uw4M6VuRV4pp5P/bFjCuVd8IGJIeA9/fN9UFPZ9YzYBag7Hsi7xXlNurR/mu5ZdwQOlRPaqw97UxiJPNd9EzPsILk2aBnBg32wAGGxbQxM= root@cfaa7e601541"

# dns-names = {
#   "com" = {
#     name = "ravenlivestream-api.com"
#   }

#   "website" = {
#     name = "ravenlivestream-api.website"
#   }
# }

dns-prefix = "raven-k8s"

http_application_routing_enabled = false

vm_size = "Standard_DS3_v2"


acrs = {
  "main" = {
    name = "sysmon"
    sku = "Standard"
    location = "eastus"
    rg_name = "rg-k8s-dev-eastus-1"
    admin_enabled = true
  }
}