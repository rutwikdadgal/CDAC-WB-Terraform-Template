resource "azurerm_private_dns_zone" "pvtdns" {
  name                = var.mysql_flexible_server_pvtdns_zone_name
  resource_group_name = azurerm_resource_group.rg.name

  depends_on = [ azurerm_resource_group.rg ]
}

resource "azurerm_private_dns_zone_virtual_network_link" "pvtdnslink" {
  name                  = var.mysql_flexible_server_private_dns_zone_virtual_network_link_name
  private_dns_zone_name = azurerm_private_dns_zone.pvtdns.name
  virtual_network_id    = azurerm_virtual_network.vnet03.id
  resource_group_name   = azurerm_resource_group.rg.name
}

resource "azurerm_mysql_flexible_server" "mysql_server" {
  name                   = var.mysql_flexible_server_name
  resource_group_name    = azurerm_resource_group.rg.name
  location               = azurerm_resource_group.rg.location
  administrator_login    = var.mysql_flexible_server_administrator_login
  administrator_password = var.mysql_flexible_server_administrator_password
  backup_retention_days  = var.mysql_flexible_server_backup_retention_days
  geo_redundant_backup_enabled = var.mysql_flexible_server_geo_redundant_backup_enabled
  delegated_subnet_id    = azurerm_subnet.sub1vnet03.id
  private_dns_zone_id    = azurerm_private_dns_zone.pvtdns.id
  sku_name               = var.mysql_flexible_server_sku_name

  zone = var.mysql_flexible_server_zone

  # No high_availability block here

  depends_on = [
    azurerm_private_dns_zone_virtual_network_link.pvtdnslink,
    azurerm_resource_group.rg,
    azurerm_virtual_network.vnet03,
    azurerm_subnet.sub1vnet03,
    azurerm_private_dns_zone.pvtdns
  ]
}


