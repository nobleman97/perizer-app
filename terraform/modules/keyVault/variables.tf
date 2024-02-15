variable "kv_name" {
  type = string

}

variable "kv_location" {
  type = string
}

variable "rg_name" {
  type = string
}

variable "service_principal_object_id" {}

variable "service_principal_tenant_id" {}

# variable "service_principal_application_id" {
#   type = string
# }

# My user object id: 1d1797d5-ad69-4218-b9bf-ad7c3c4569b4
# My tenant id: 7ec4cc2f-47f9-41c2-9bc1-3d7710711120

variable "my_tenant_id" {
  type = string
  default = "7ec4cc2f-47f9-41c2-9bc1-3d7710711120"
}

variable "my_object_id" {
  type = string
  default = "1d1797d5-ad69-4218-b9bf-ad7c3c4569b4"
}