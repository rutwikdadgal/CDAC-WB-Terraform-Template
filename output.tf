output "resource_group_name" {
    value = azurerm_resource_group.rg.name
}

output "client_certificate" {
  value     = azurerm_kubernetes_cluster.aks.kube_config[0].client_certificate
  sensitive = true
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.aks.kube_config_raw
  sensitive = true
}

# output "primary_server_fqdn" {
#   value = azurerm_mysql_flexible_server.mysql_server.fqdn
# }

# output "replica_server_fqdn" {
#   value = azurerm_mysql_flexible_server.replica_mysql.fqdn
# }

output "acr_login_server" {
  value = azurerm_container_registry.acr.login_server
}

output "acr_login_server1" {
  value = azurerm_container_registry.acr2.login_server
}

output "source_server_id" {
  value = azurerm_mysql_flexible_server.mysql_server.id
}


