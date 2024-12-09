resource "azurerm_api_management" "apim" {
  name                = var.apim_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  publisher_name      = var.apim_publisher_name
  publisher_email     = var.apim_publisher_email

  sku_name            = var.apim_sku_name
  virtual_network_type = var.apim_virtual_network_type
  virtual_network_configuration {
    subnet_id = azurerm_subnet.sub1vnet02.id
  }

  identity {
    type = var.apim_identity_type
  }

  tags = {
    environment = var.apim_environment
  }

  depends_on = [
    azurerm_resource_group.rg,
    azurerm_virtual_network.vnet02,
    azurerm_subnet.sub1vnet02,
    azurerm_network_security_group.apim_nsg,
    azurerm_subnet_network_security_group_association.apim_nsg_association  # Ensure NSG is associated before APIM
  ]
}







