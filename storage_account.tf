# random 
#resource "random_string" "suffix" {
   #length  = 6
  # special = false
 #  upper = false
#}

resource "azurerm_storage_account" "sa" {
  name                     = "${var.Storage_account_name}"      
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = var.storage_account_account_tier
  account_replication_type = var.storage_account_account_replication_type

  tags = {
    environment = var.storage_account_environment
  }

  depends_on = [ azurerm_resource_group.rg ]
}

resource "azurerm_storage_account_static_website" "test" {
  storage_account_id = azurerm_storage_account.sa.id
  error_404_document = var.storage_account_static_website_error_404_document
  index_document     = var.storage_account_static_website_index_document
}

