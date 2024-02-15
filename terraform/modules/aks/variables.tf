variable "aks-name" {
  type = string
}

variable "location" {
    type = string
}

variable "resource_group_name" {
  type = string
}

variable "dns-prefix" {
  type = string
  default = "raven-k8s"
}

variable "http_application_routing_enabled" {
  type = bool
}
# variable "client_id" {
#   type = string
# }

# variable "client_secret" {
#   type = string
# }

variable "ssh_public_key" {
  type = string
}