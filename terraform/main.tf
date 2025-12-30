###########################################################
# Data Sources for Existing Resources
###########################################################

# Existing Resource Group
data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

# Existing Container Registry
data "azurerm_container_registry" "acr" {
  name                = var.acr_name
  resource_group_name = data.azurerm_resource_group.rg.name
}

###########################################################
# AKS Cluster
###########################################################
resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_name
  location            = data.azurerm_resource_group.rg.location
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

###########################################################
# Attach ACR to AKS (AcrPull permission)
###########################################################

resource "azurerm_role_assignment" "aks_acr_pull" {
  scope                = data.azurerm_container_registry.acr.id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
}
