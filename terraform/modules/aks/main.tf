data "azurerm_kubernetes_service_versions" "current" {
  location = var.location
  include_preview = false
}

resource "azurerm_kubernetes_cluster" "main" {
  name                = var.aks-name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "${var.dns-prefix}-cluster"
  
  kubernetes_version = data.azurerm_kubernetes_service_versions.current.latest_version

  node_resource_group = "${var.resource_group_name}-nrg"

  default_node_pool {
    name       = "defaultpool"
    enable_auto_scaling = true
    min_count = 1
    max_count = 3
    os_disk_size_gb = 50
    type = "VirtualMachineScaleSets"
    vm_size    = "Standard_D2_v3"
    zones = [1]
    max_pods = 110
    
    enable_node_public_ip = false
    
    node_labels = {
      "nodepool-type"    = "system"
      "environment"      = "dev"
      "nodepools"       = "linux"
    }
  }

  
  identity {
    type = "SystemAssigned"
  }
 
  http_application_routing_enabled = var.http_application_routing_enabled

  # service_principal  {
  #   client_id = var.client_id
  #   client_secret = var.client_secret
  # }


  linux_profile {
    admin_username = "ubuntu"
    ssh_key {
        key_data = var.ssh_public_key
        # key_data = file(var.ssh_public_key)
    }
  }

  network_profile {
      network_plugin = "azure"
      load_balancer_sku = "standard"
  }



  tags = {
    Environment = "Development"
  }


}



