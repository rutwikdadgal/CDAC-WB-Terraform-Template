# service principal


# resource group
resource_group_name     = "preprod-esanjeevani-rg-wb"
resource_group_location = "Central India"

# storage account
Storage_account_name                              = "uatfrontendappwb"
storage_account_account_tier                      = "Standard"
storage_account_account_replication_type          = "LRS"
storage_account_environment                       = "staging"
storage_account_static_website_error_404_document = "custom_not_found.html"
storage_account_static_website_index_document     = "custom_index.html"

# cdn frontdoor
cdn_frontdoor_profile_name                                 = "DEV-esanjeevani-FRONT-DOOR-CDN-WB"
cdn_frontdoor__profile_sku_name                            = "Premium_AzureFrontDoor"
cdn_frontdoor_origin_group_name                            = "appgateway-origin-group"
cdn_frontdoor_loadbalancing_sample_size                    = 4
cdn_frontdoor_loadbalancing_successful_samples_required    = 3
cdn_frontdoor_health_probe_path                            = "/health"
cdn_frontdoor_health_probe_protocol                        = "Http"
cdn_frontdoor_health_probe_interval_in_seconds             = 30
cdn_frontdoor_origin1_name                                 = "appgateway1-origin"
cdn_frontdoor_origin1_enabled                              = true
cdn_frontdoor_origin1_certificate_name_check_enabled       = false
cdn_frontdoor_origin1_http_port                            = 80
cdn_frontdoor_origin1_https_port                           = 443
cdn_frontdoor_origin1_priority                             = 1
cdn_frontdoor_origin1_weight                               = 50
cdn_frontdoor_origin2_name                                 = "appgateway2-origin"
cdn_frontdoor_origin2_enabled                              = true
cdn_frontdoor_origin2_certificate_name_check_enabled       = false
cdn_frontdoor_origin2_http_port                            = 80
cdn_frontdoor_origin2_https_port                           = 443
cdn_frontdoor_origin2_priority                             = 1
cdn_frontdoor_origin2_weight                               = 50
cdn_frontdoor_endpoint_ENV                                 = "Staging"
cdn_frontdoor_route_name                                   = "appgateway-route"
cdn_frontdoor_route_enabled                                = true
cdn_frontdoor_route_forwarding_protocol                    = "HttpOnly" # Change to HttpOnly to force HTTP
cdn_frontdoor_route_https_redirect_enabled                 = false      # Ensure no redirect to HTTPS
cdn_frontdoor_route_patterns_to_match                      = ["/*"]
cdn_frontdoor_route_supported_protocols                    = ["Http"] # Restrict to HTTP protocol
cdn_frontdoor_route_cache_query_string_caching_behavior    = "IgnoreSpecifiedQueryStrings"
cdn_frontdoor_route_cache_query_strings                    = ["account", "settings"]
cdn_frontdoor_route_cache_compression_enabled              = true
cdn_frontdoor_route_cache_content_types_to_compress        = ["text/html", "text/javascript", "text/xml"]
cdn_frontdoor_waf_policy_name                              = "wafpolicy"
cdn_frontdoor_waf_policy_enabled                           = true
cdn_frontdoor_waf_policy_mode                              = "Prevention"
cdn_frontdoor_waf_policy_redirect_url                      = "https://www.contoso.com"
cdn_frontdoor_waf_policy_custom_block_response_status_code = 403
cdn_frontdoor_waf_policy_custom_block_response_body        = "PGh0bWw+CjxoZWFkZXI+PHRpdGxlPkhlbGxvPC90aXRsZT48L2hlYWRlcj4KPGJvZHk+CkhlbGxvIHdvcmxkCjwvYm9keT4KPC9odG1sPg=="
cdn_frontdoor_waf_policy_managed_rule_type                 = "Microsoft_BotManagerRuleSet"
cdn_frontdoor_waf_policy_managed_rule_version              = "1.0"
cdn_frontdoor_waf_policy_managed_rule_action               = "Log"
cdn_frontdoor_profile_endpoint_name                        = "preprod-esanjeevani-swasthyangit-wb"


# vnet
virtual_network1_name = "preprod-esanjeevani-vnet01-wb"
vnet01_address_space  = ["172.17.0.0/16"]
virtual_network2_name = "preproduction-eSanjeevani-Vnet02-wb"
vnet02_address_space  = ["172.18.0.0/16"]
virtual_network3_name = "preproduction-eSanjeevani-Vnet03-wb"
vnet03_address_space  = ["172.19.0.0/16"]

# subnets
subnet1_vnet01_name           = "APP-GTW-SUBNET-WB"
subnet1_vnet01_address_prefix = ["172.17.2.0/24"]
subnet2_vnet01_name           = "APP-GTW1-SUBNET-WB"
subnet2_vnet01_address_prefix = ["172.17.3.0/24"]
subnet1_vnet02_name           = "Preprod-eSanjeevani-API-Subnet-WB"
subnet1_vnet02_address_prefix = ["172.18.32.0/24"]
subnet2_vnet02_name           = "default"
subnet2_vnet02_address_prefix = ["172.18.0.0/20"]
subnet3_vnet02_name           = "vm-subnet-wb"
subnet3_vnet02_address_prefix = ["172.18.34.0/24"]
subnet4_vnet02_name           = "Gatewaysubnet"
subnet4_vnet02_address_prefix = ["172.18.36.0/24"]
subnet1_vnet03_name           = "mysql_server-wb"
subnet1_vnet03_address_prefix = ["172.19.0.0/24"]
subnet2_vnet03_name           = "cosmos_server-wb"
subnet2_vnet03_address_prefix = ["172.19.2.0/24"]
subnet3_vnet03_name           = "Redis"
subnet3_vnet03_address_prefix = ["172.19.1.0/24"]

# public ips
appgtw1_pub_ip_name           = "appgtw1-wb"
appgtw2_pub_ip_name           = "appgtw2-wb"
apim_pub_ip_name              = "apim-public-ip-wb"
apim_pub_ip_domain_name_label = "apim-wb"
vng_pub_ip_name               = "gtwsub-pub-ip-wb"

#subnet-nsg
nsg_name = "Preprod-eSanjeevani-NSG-wb"


#route table
routetable_name = "apim-route-table"

# appgtw local
backend_address_pool_name      = "beap"
frontend_port_name             = "feport"
frontend_ip_configuration_name = "feip"
backend_http_setting_name      = "be-htst"
listener_name                  = "httplstn"
request_routing_rule_name      = "rqrt"
## appgateway 1
application_gateway1_name                         = "preprod-esanjeevani-Appgtw-wb"
appgtw_waf_policy_name                            = "shared-waf-policy"
appgtw_managed_rule_type                          = "OWASP"
appgtw_managed_rule_version                       = "3.2"
appgtw_sku_name                                   = "WAF_v2"
appgtw_sku_tier                                   = "WAF_v2"
appgtw_sku_capacity                               = 2
appgtw_gateway_ip_config_name                     = "my-gateway-ip-configuration"
appgtw_frontend_port                              = 80
appgtw_backend_http_setting_cookie_based_affinity = "Disabled"
appgtw_backend_http_setting_port                  = 80
appgtw_backend_http_setting_protocol              = "Http"
appgtw_backend_http_setting_request_timeout       = 60
appgtw_http_listener_protocol                     = "Http"
appgtw_request_routing_rule_rule_type             = "Basic"
appgtw_request_routing_rule_priority              = 10
appgtw_waf_config_enabled                         = true
appgtw_waf_config_firewall_mode                   = "Prevention"
appgtw_waf_config_rule_set_type                   = "OWASP"
appgtw_waf_config_rule_set_version                = "3.2"
#appgateway-2
application_gateway2_name                           = "preprod-esanjeevani-Appgtw02-wb"
appgtw2_sku_name                                    = "WAF_v2"
appgtw2_sku_tier                                    = "WAF_v2"
appgtw2_sku_capacity                                = 2
appgtw2_gateway_ip_config_name                      = "my-gateway-ip-configuration"
appgtw2_frontend_port                               = 80
appgtw2_backend_http_settings_cookie_based_affinity = "Disabled"
appgtw2_backend_http_settings_port                  = 80
appgtw2_backend_http_settings_protocol              = "Http"
appgtw2_backend_http_settings_request_timeout       = 60
appgtw2_http_listener_protocol                      = "Http"
appgtw2_request_routing_rule_rule_type              = "Basic"
appgtw2_request_routing_rule_priority               = 20
appgtw2_waf_config_enabled                          = true
appgtw2_waf_config_firewall_mode                    = "Prevention"
appgtw2_waf_config_rule_set_type                    = "OWASP"
appgtw2_waf_config_rule_set_version                 = "3.2"

#apim
apim_name                 = "Preproduction-eSanjeevani-apigtw-wb"
apim_publisher_name       = "My Company"
apim_publisher_email      = "company@terraform.io"
apim_sku_name             = "Developer_1"
apim_virtual_network_type = "Internal"
apim_identity_type        = "SystemAssigned"
apim_environment          = "Staging"

# AKS
aks_name                 = "preproduction-eSanjeevani-AKS-WB"
dns_prefix_aks           = "aks-cluster"
aks_nodepool_name        = "aksnodepool"
aks_node_count           = 1
aks_vm_size              = "Standard_D2_v2"
aks_auto_scaling_enabled = true
aks_node_min_count       = 1
aks_node_max_count       = 5
aks_identity_type        = "SystemAssigned"
aks_network_plugin       = "kubenet"
aks_Environment          = "staging"
aks_role_definition_name = "AcrPull"

# automation account
automation_account_name        = "preprod-autoaccount-WB"
automation_account_sku_name    = "Basic"
automation_account_environment = "staging"

# container registries
acr1_name          = "PreprodeSanjeevaniCR1WB"
acr1_sku           = "Basic"
acr1_admin_enabled = false
acr2_name          = "DEVWADHWANICR1WB"
acr2_sku           = "Basic"
acr2_admin_enabled = false

# cosmos db
cosmosdb1_name                                       = "patientform-mig-mongodb-esanjeevani-wb"
cosmosdb1_offer_type                                 = "Standard"
cosmosdb1_kind                                       = "MongoDB"
cosmosdb1_automatic_failover_enabled                 = false
cosmosdb1_consistency_policylevel                    = "BoundedStaleness"
cosmosdb1_consistency_policy_max_interval_in_seconds = 300
cosmosdb1_consistency_policy_max_staleness_prefix    = 100000
cosmosdb1_geolocation_location                       = "centralindia" # Single region: Central India
cosmosdb1_geolocation_failover_priority              = 0              # Required for single-region configuration
cosmosdb1_is_virtual_network_filter_enabled          = true
#db2
cosmosdb2_name                                       = "preprod-mig-esanjeevani-wb-cosmosdb"
cosmosdb2_offer_type                                 = "Standard"
cosmosdb2_kind                                       = "MongoDB"
cosmosdb2_automatic_failover_enabled                 = false
cosmosdb2_consistency_policylevel                    = "BoundedStaleness"
cosmosdb2_consistency_policy_max_interval_in_seconds = 300
cosmosdb2_consistency_policy_max_staleness_prefix    = 100000
cosmosdb2_geolocation_location                       = "centralindia" # Single region: Central India
cosmosdb2_geolocation_failover_priority              = 0              # Required for single-region configuration
cosmosdb2_is_virtual_network_filter_enabled          = true

# mysql flexible server
mysql_flexible_server_pvtdns_zone_name                           = "preprod-mysql-db-wb.mysql.database.azure.com"
mysql_flexible_server_private_dns_zone_virtual_network_link_name = "pvtdnslinkVnetZone.com"
mysql_flexible_server_name                                       = "preprod-esanjeevani-mysqldb-wb"
mysql_flexible_server_administrator_login                        = "azureuser"
mysql_flexible_server_administrator_password                     = "azureuser@123"
mysql_flexible_server_backup_retention_days                      = 7
mysql_flexible_server_geo_redundant_backup_enabled               = true
mysql_flexible_server_sku_name                                   = "GP_Standard_D2ds_v4"
mysql_flexible_server_zone                                       = "1"

# redis cache1
redis1_cache_name                 = "preproduction-esanjeevani-wb"
redis1_cache_capacity             = 1
redis1_cache_family               = "P"
redis1_cache_sku_name             = "Premium"
redis1_cache_non_ssl_port_enabled = false
redis1_cache_minimum_tls_version  = "1.2"
# redis2
redis2_cache_name                 = "preproduction-esanjeevani-SignalR-redis-wb"
redis2_cache_capacity             = 1
redis2_cache_family               = "P"
redis2_cache_sku_name             = "Premium"
redis2_cache_non_ssl_port_enabled = false
redis2_cache_minimum_tls_version  = "1.2"

# service bus
servicebus_namespace_name             = "preproduction-esanjeevani-queue-wb"
servicebus_namespace_sku              = "Standard"
servicebus_queue_name                 = "queue"
servicebus_queue_partitioning_enabled = true

#virtual machine
vm_name                             = "esanjeevani-Snomed01-wb"
vm_vm_size                          = "Standard_D2as_v4"
vm_delete_os_disk_on_termination    = true
vm_delete_data_disks_on_termination = true
vm_publisher                        = "Canonical"
vm_offer                            = "0001-com-ubuntu-server-jammy"
vm_sku                              = "22_04-lts"
vm_version                          = "latest"
vm_disk_name                        = "myosdisk1"
vm_caching                          = "ReadWrite"
vm_create_option                    = "FromImage"
vm_managed_disk_type                = "Standard_LRS"
vm_computer_name                    = "azureuser"
vm_admin_username                   = "azureuser"
vm_admin_password                   = "azureuser@123"
vm_disable_password_authentication  = false
vm_environment                      = "staging"
private_ip_address                  = "172.18.34.7"

#vpn(virtual network gtw)
vng_name                          = "newuatgatewaywb"
vng_type                          = "Vpn"
vng_vpn_type                      = "RouteBased"
vng_active_active                 = false
vng_enable_bgp                    = false
vng_sku                           = "VpnGw1AZ"
vng_ip_config_name                = "vnetGatewayConfig"
vng_private_ip_address_allocation = "Dynamic"
vng_client_address_space          = ["10.2.0.0/24"]
vng_root_certificate_name         = "Root-CA"
public_cert_data                  = <<EOF
MIIDuzCCAqOgAwIBAgIQCHTZWCM+IlfFIRXIvyKSrjANBgkqhkiG9w0BAQsFADBn
MQswCQYDVQQGEwJVUzEVMBMGA1UEChMMRGlnaUNlcnQgSW5jMRkwFwYDVQQLExB3
d3cuZGlnaWNlcnQuY29tMSYwJAYDVQQDEx1EaWdpQ2VydCBGZWRlcmF0ZWQgSUQg
Um9vdCBDQTAeFw0xMzAxMTUxMjAwMDBaFw0zMzAxMTUxMjAwMDBaMGcxCzAJBgNV
BAYTAlVTMRUwEwYDVQQKEwxEaWdpQ2VydCBJbmMxGTAXBgNVBAsTEHd3dy5kaWdp
Y2VydC5jb20xJjAkBgNVBAMTHURpZ2lDZXJ0IEZlZGVyYXRlZCBJRCBSb290IENB
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAvAEB4pcCqnNNOWE6Ur5j
QPUH+1y1F9KdHTRSza6k5iDlXq1kGS1qAkuKtw9JsiNRrjltmFnzMZRBbX8Tlfl8
zAhBmb6dDduDGED01kBsTkgywYPxXVTKec0WxYEEF0oMn4wSYNl0lt2eJAKHXjNf
GTwiibdP8CUR2ghSM2sUTI8Nt1Omfc4SMHhGhYD64uJMbX98THQ/4LMGuYegou+d
GTiahfHtjn7AboSEknwAMJHCh5RlYZZ6B1O4QbKJ+34Q0eKgnI3X6Vc9u0zf6DH8
Dk+4zQDYRRTqTnVO3VT8jzqDlCRuNtq6YvryOWN74/dq8LQhUnXHvFyrsdMaE1X2
DwIDAQABo2MwYTAPBgNVHRMBAf8EBTADAQH/MA4GA1UdDwEB/wQEAwIBhjAdBgNV
HQ4EFgQUGRdkFnbGt1EWjKwbUne+5OaZvRYwHwYDVR0jBBgwFoAUGRdkFnbGt1EW
jKwbUne+5OaZvRYwDQYJKoZIhvcNAQELBQADggEBAHcqsHkrjpESqfuVTRiptJfP
9JbdtWqRTmOf6uJi2c8YVqI6XlKXsD8C1dUUaaHKLUJzvKiazibVuBwMIT84AyqR
QELn3e0BtgEymEygMU569b01ZPxoFSnNXc7qDZBDef8WfqAV/sxkTi8L9BkmFYfL
uGLOhRJOFprPdoDIUBB+tmCl3oDcBy3vnUeOEioz8zAkprcb3GHwHAK+vHmmfgcn
WsfMLH4JCLa/tRYL+Rw/N3ybCkDp00s0WUZ+AoDywSl0Q/ZEnNY0MsFiw6LyIdbq
M/s/1JRtO3bDSzD9TazRVzn2oBqzSa8VgIo5C1nOnoAKJTlsClJKvIhnRlaLQqk=
EOF
# need to paste the cert data between EOF













