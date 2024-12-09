resource "azurerm_cosmosdb_account" "db1" {
  name                = var.cosmosdb1_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  offer_type          = var.cosmosdb1_offer_type
  kind                = var.cosmosdb1_kind

  automatic_failover_enabled = var.cosmosdb1_automatic_failover_enabled

  capabilities {
    name = "EnableAggregationPipeline"
  }

  capabilities {
    name = "mongoEnableDocLevelTTL"
  }

  capabilities {
    name = "MongoDBv3.4"
  }

  capabilities {
    name = "EnableMongo"
  }

  consistency_policy {
    consistency_level       = var.cosmosdb1_consistency_policylevel
    max_interval_in_seconds = var.cosmosdb1_consistency_policy_max_interval_in_seconds
    max_staleness_prefix    = var.cosmosdb1_consistency_policy_max_interval_in_seconds
  }

  geo_location {
    location          = var.cosmosdb1_geolocation_location # Single region: Central India
    failover_priority = var.cosmosdb1_geolocation_failover_priority            # Required for single-region configuration
  }
  is_virtual_network_filter_enabled = var.cosmosdb1_is_virtual_network_filter_enabled
  virtual_network_rule {
    id = azurerm_subnet.sub2vnet03.id
  }

  depends_on = [ azurerm_resource_group.rg , azurerm_virtual_network.vnet03 , azurerm_subnet.sub2vnet03]
}

resource "azurerm_cosmosdb_account" "db2" {
  name                = var.cosmosdb2_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  offer_type          = var.cosmosdb2_offer_type
  kind                = var.cosmosdb2_kind

  automatic_failover_enabled = var.cosmosdb2_automatic_failover_enabled

  capabilities {
    name = "EnableAggregationPipeline"
  }

  capabilities {
    name = "mongoEnableDocLevelTTL"
  }

  capabilities {
    name = "MongoDBv3.4"
  }

  capabilities {
    name = "EnableMongo"
  }

  consistency_policy {
    consistency_level       = var.cosmosdb2_consistency_policylevel
    max_interval_in_seconds = var.cosmosdb2_consistency_policy_max_interval_in_seconds
    max_staleness_prefix    = var.cosmosdb2_consistency_policy_max_staleness_prefix
  }

  geo_location {
    location          = var.cosmosdb2_geolocation_location # Single region: Central India
    failover_priority = var.cosmosdb2_geolocation_failover_priority            # Required for single-region configuration
  }
  is_virtual_network_filter_enabled = var.cosmosdb2_is_virtual_network_filter_enabled
  virtual_network_rule {
    id = azurerm_subnet.sub2vnet03.id
  }

  depends_on = [ azurerm_resource_group.rg , azurerm_virtual_network.vnet03 , azurerm_subnet.sub2vnet03]
}