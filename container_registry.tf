resource "azurerm_container_registry" "acr" {
  name                = var.acr1_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = var.acr1_sku
  admin_enabled       = var.acr1_admin_enabled

  depends_on = [ azurerm_resource_group.rg ]
}

resource "azurerm_container_registry" "acr2" {
  name                = var.acr2_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = var.acr2_sku
  admin_enabled       = var.acr2_admin_enabled

  depends_on = [ azurerm_resource_group.rg ]
}

