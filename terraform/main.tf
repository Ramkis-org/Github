data "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
 # location = var.location
}

data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}


resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_name
  location            = var.location
  resource_group_name = data.azurerm_resource_group.rg.name
  dns_prefix          = "sre-demo"

  default_node_pool {
    name       = "system"
    vm_size    = "Standard_DS3_v2"
    node_count = 3
    zones      = ["1", "2", "3"]
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin = "azure"
  }
}
