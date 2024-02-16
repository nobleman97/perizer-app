variable "rg_name" {
  type = string
}

variable "rg_location" {
  type = string
}

# variable "azuread_app_name" {
#   type = string
# }

# variable "kv_name" {
#   type = string
# }

#    ------- AKS -------

variable "aks-name" {
  type = string
}

variable "ssh-public_key" {
  type = string
}

variable "dns-names" {
  type = map(object({
    name = string
  }))
}

variable "dns-prefix" {
  type = string
  # default = "raven-k8s"
}

variable "http_application_routing_enabled" {
  type = bool
}

variable "vm_size" {
  type = string
}

#   ---- AKS -----
variable "acrs" {
  type = map(object({
    name = string
    location = string
    rg_name = string
    sku = string
    admin_enabled = bool
  }))
}
