resource "azurerm_redis_cache" "redis1" {
  name                 = var.redis1_cache_name
  location             = azurerm_resource_group.rg.location
  resource_group_name  = azurerm_resource_group.rg.name
  capacity             = var.redis1_cache_capacity
  family               = var.redis1_cache_family
  sku_name             = var.redis1_cache_sku_name
  non_ssl_port_enabled = var.redis1_cache_non_ssl_port_enabled
  minimum_tls_version  = var.redis1_cache_minimum_tls_version

  subnet_id = azurerm_subnet.sub3vnet03.id

  redis_configuration {
  }
  depends_on = [ azurerm_resource_group.rg  , azurerm_virtual_network.vnet03 , azurerm_subnet.sub3vnet03]
}

resource "azurerm_redis_cache" "redis2" {
  name                 = var.redis2_cache_name
  location             = azurerm_resource_group.rg.location
  resource_group_name  = azurerm_resource_group.rg.name
  capacity             = var.redis2_cache_capacity
  family               = var.redis2_cache_family
  sku_name             = var.redis2_cache_sku_name
  non_ssl_port_enabled = var.redis2_cache_non_ssl_port_enabled
  minimum_tls_version  = var.redis2_cache_minimum_tls_version

  subnet_id = azurerm_subnet.sub3vnet03.id

  redis_configuration {
  }
  depends_on = [ azurerm_resource_group.rg  , azurerm_virtual_network.vnet03 , azurerm_subnet.sub3vnet03]
}


