resource "azurerm_servicebus_namespace" "svcbusns" {
  name                = var.servicebus_namespace_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = var.servicebus_namespace_sku
}

resource "azurerm_servicebus_queue" "example" {
  name         = var.servicebus_queue_name
  namespace_id = azurerm_servicebus_namespace.svcbusns.id

  partitioning_enabled = var.servicebus_queue_partitioning_enabled
}