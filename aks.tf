resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = var.dns_prefix_aks

  default_node_pool {
    name       = var.aks_nodepool_name
    node_count = 1
    vm_size    = var.aks_vm_size
    vnet_subnet_id = azurerm_subnet.defsub2vnet02.id  # Link to the private subnet
    auto_scaling_enabled = var.aks_auto_scaling_enabled
    min_count           = var.aks_node_min_count
    max_count           = var.aks_node_max_count
  }


  identity {
    type = var.aks_identity_type
  }

  network_profile {
    network_plugin = var.aks_network_plugin  # Use Azure CNI for networking
    #network_policy = "None"
  }

  tags = {
    Environment = var.aks_Environment
  }

  depends_on = [azurerm_resource_group.rg, azurerm_virtual_network.vnet02, azurerm_subnet.defsub2vnet02]
}

# Grant AKS the AcrPull role for the first Container Registry
resource "azurerm_role_assignment" "acr_pull_role" {
  principal_id         = azurerm_kubernetes_cluster.aks.identity[0].principal_id
  role_definition_name = var.aks_role_definition_name
  scope                = azurerm_container_registry.acr.id

  depends_on = [ azurerm_kubernetes_cluster.aks , azurerm_container_registry.acr ]
}

# Grant AKS the AcrPull role for the second Container Registry
resource "azurerm_role_assignment" "acr1_pull_role" {
  principal_id         = azurerm_kubernetes_cluster.aks.identity[0].principal_id
  role_definition_name = var.aks_role_definition_name
  scope                = azurerm_container_registry.acr2.id

  depends_on = [ azurerm_kubernetes_cluster.aks , azurerm_container_registry.acr2 ]
}

