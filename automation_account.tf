resource "azurerm_automation_account" "example" {
  name                = var.automation_account_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku_name            = var.automation_account_sku_name

  tags = {
    environment = var.automation_account_environment
  }
}