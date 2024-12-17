# Service Principal
#variable "subscription_id" {
 #   description = "Azure Subscription ID"
#}

#variable "client_id" {
 #   description = "Service principal ID"
#}

#variable "client_secret" {
 #  description = "Service Principal secret"
#}

#variable "tenant_id" {
 #   description = "Azure Service principal tenant_id"
#}

# Resource group
variable "resource_group_location" {
    type = string
    description = "Resource group location"
}

variable "resource_group_name" {
    type = string
    description = "Resource group location"
}

# Storage Account
variable "Storage_account_name" {
    type= string
    description = "Frontend Static website storage account"
}

variable "storage_account_account_tier" {
  type        = string
  description = "The tier of the storage account (e.g., Standard, Premium)."
}

variable "storage_account_account_replication_type" {
  type        = string
  description = "The replication type for the storage account (e.g., LRS, GRS, ZRS, RA-GRS)."
}

variable "storage_account_environment" {
  type        = string
  description = "The environment in which the storage account is deployed (e.g., staging, production)."
}

variable "storage_account_static_website_error_404_document" {
  type        = string
  description = "The name of the 404 error document for the static website in the storage account."
}

variable "storage_account_static_website_index_document" {
  type        = string
  description = "The name of the index document for the static website in the storage account."
}


# CDN frontdoor
variable "cdn_frontdoor_profile_name" {
    type = string
    description = "cdn frontdoor profile name"
}

variable "cdn_frontdoor_profile_endpoint_name" {
    type = string
    description = "cdn frontdoor profile endpoint name"
}

variable "cdn_frontdoor__profile_sku_name" {
  type        = string
  description = "The SKU name for the Front Door service (e.g., Premium_AzureFrontDoor)."
}

variable "cdn_frontdoor_origin_group_name" {
  type        = string
  description = "The name of the origin group for Front Door."
}

variable "cdn_frontdoor_loadbalancing_sample_size" {
  type        = number
  description = "The sample size for load balancing."
}

variable "cdn_frontdoor_loadbalancing_successful_samples_required" {
  type        = number
  description = "The number of successful samples required for load balancing."
}

variable "cdn_frontdoor_health_probe_path" {
  type        = string
  description = "The path for the health probe."
}

variable "cdn_frontdoor_health_probe_protocol" {
  type        = string
  description = "The protocol used for the health probe (e.g., Http, Https)."
}

variable "cdn_frontdoor_health_probe_interval_in_seconds" {
  type        = number
  description = "The interval in seconds between health probes."
}

variable "cdn_frontdoor_origin1_name" {
  type        = string
  description = "The name of the first origin."
}

variable "cdn_frontdoor_origin1_enabled" {
  type        = bool
  description = "Whether the first origin is enabled."
}

variable "cdn_frontdoor_origin1_certificate_name_check_enabled" {
  type        = bool
  description = "Whether certificate name check is enabled for the first origin."
}

variable "cdn_frontdoor_origin1_http_port" {
  type        = number
  description = "The HTTP port for the first origin."
}

variable "cdn_frontdoor_origin1_https_port" {
  type        = number
  description = "The HTTPS port for the first origin."
}

variable "cdn_frontdoor_origin1_priority" {
  type        = number
  description = "The priority of the first origin."
}

variable "cdn_frontdoor_origin1_weight" {
  type        = number
  description = "The weight of the first origin."
}

variable "cdn_frontdoor_origin2_name" {
  type        = string
  description = "The name of the second origin."
}

variable "cdn_frontdoor_origin2_enabled" {
  type        = bool
  description = "Whether the second origin is enabled."
}

variable "cdn_frontdoor_origin2_certificate_name_check_enabled" {
  type        = bool
  description = "Whether certificate name check is enabled for the second origin."
}

variable "cdn_frontdoor_origin2_http_port" {
  type        = number
  description = "The HTTP port for the second origin."
}

variable "cdn_frontdoor_origin2_https_port" {
  type        = number
  description = "The HTTPS port for the second origin."
}

variable "cdn_frontdoor_origin2_priority" {
  type        = number
  description = "The priority of the second origin."
}

variable "cdn_frontdoor_origin2_weight" {
  type        = number
  description = "The weight of the second origin."
}

variable "cdn_frontdoor_endpoint_ENV" {
  type        = string
  description = "The environment for Front Door (e.g., Staging, Production)."
}

variable "cdn_frontdoor_route_name" {
  type        = string
  description = "The name of the routing rule."
}

variable "cdn_frontdoor_route_enabled" {
  type        = bool
  description = "Whether the routing rule is enabled."
}

variable "cdn_frontdoor_route_forwarding_protocol" {
  type        = string
  description = "The protocol used for forwarding (e.g., HttpOnly, HttpsOnly)."
}

variable "cdn_frontdoor_route_https_redirect_enabled" {
  type        = bool
  description = "Whether HTTPS redirect is enabled."
}

variable "cdn_frontdoor_route_patterns_to_match" {
  type        = list(string)
  description = "The patterns to match for routing rules."
}

variable "cdn_frontdoor_route_supported_protocols" {
  type        = list(string)
  description = "The supported protocols for the routing rule."
}

variable "cdn_frontdoor_route_cache_query_string_caching_behavior" {
  type        = string
  description = "The behavior for caching query strings (e.g., IgnoreSpecifiedQueryStrings)."
}

variable "cdn_frontdoor_route_cache_query_strings" {
  type        = list(string)
  description = "The query strings to cache."
}

variable "cdn_frontdoor_route_cache_compression_enabled" {
  type        = bool
  description = "Whether cache compression is enabled."
}

variable "cdn_frontdoor_route_cache_content_types_to_compress" {
  type        = list(string)
  description = "The content types to compress in the cache."
}

variable "cdn_frontdoor_waf_policy_name" {
  type        = string
  description = "The name of the WAF policy."
}

variable "cdn_frontdoor_waf_policy_enabled" {
  type        = bool
  description = "Whether the WAF policy is enabled."
}

variable "cdn_frontdoor_waf_policy_mode" {
  type        = string
  description = "The mode of the WAF policy (e.g., Prevention, Detection)."
}

variable "cdn_frontdoor_waf_policy_redirect_url" {
  type        = string
  description = "The URL to redirect to if the WAF policy blocks a request."
}

variable "cdn_frontdoor_waf_policy_custom_block_response_status_code" {
  type        = number
  description = "The status code for the custom block response."
}

variable "cdn_frontdoor_waf_policy_custom_block_response_body" {
  type        = string
  description = "The body content for the custom block response."
}

variable "cdn_frontdoor_waf_policy_managed_rule_type" {
  type        = string
  description = "The managed rule type for the WAF policy."
}

variable "cdn_frontdoor_waf_policy_managed_rule_version" {
  type        = string
  description = "The version of the managed rule set for the WAF policy."
}

variable "cdn_frontdoor_waf_policy_managed_rule_action" {
  type        = string
  description = "The action for the managed rule (e.g., Log, Block)."
}


# Virtual Network Variables
variable "virtual_network1_name" {
  description = "Name of the first virtual network"
  type        = string
}

variable "vnet01_address_space" {
  description = "Address space for the first virtual network"
  type        = list(string)
}

variable "virtual_network2_name" {
  description = "Name of the second virtual network"
  type        = string
}

variable "vnet02_address_space" {
  description = "Address space for the second virtual network"
  type        = list(string)
}

variable "virtual_network3_name" {
  description = "Name of the third virtual network"
  type        = string
}

variable "vnet03_address_space" {
  description = "Address space for the third virtual network"
  type        = list(string)
}

# Subnet Variables for VNet01
variable "subnet1_vnet01_name" {
  description = "Name of the first subnet in VNet01"
  type        = string
}

variable "subnet1_vnet01_address_prefix" {
  description = "Address prefix for the first subnet in VNet01"
  type        = list(string)
}

variable "subnet2_vnet01_name" {
  description = "Name of the second subnet in VNet01"
  type        = string
}

variable "subnet2_vnet01_address_prefix" {
  description = "Address prefix for the second subnet in VNet01"
  type        = list(string)
}

# Subnet Variables for VNet02
variable "subnet1_vnet02_name" {
  description = "Name of the first subnet in VNet02"
  type        = string
}

variable "subnet1_vnet02_address_prefix" {
  description = "Address prefix for the first subnet in VNet02"
  type        = list(string)
}

variable "subnet2_vnet02_name" {
  description = "Name of the second subnet in VNet02"
  type        = string
}

variable "subnet2_vnet02_address_prefix" {
  description = "Address prefix for the second subnet in VNet02"
  type        = list(string)
}

variable "subnet3_vnet02_name" {
  description = "Name of the third subnet in VNet02"
  type        = string
}

variable "subnet3_vnet02_address_prefix" {
  description = "Address prefix for the third subnet in VNet02"
  type        = list(string)
}

variable "subnet4_vnet02_name" {
  description = "Name of the fourth subnet in VNet02"
  type        = string
}

variable "subnet4_vnet02_address_prefix" {
  description = "Address prefix for the fourth subnet in VNet02"
  type        = list(string)
}

# Subnet Variables for VNet03
variable "subnet1_vnet03_name" {
  description = "Name of the first subnet in VNet03"
  type        = string
}

variable "subnet1_vnet03_address_prefix" {
  description = "Address prefix for the first subnet in VNet03"
  type        = list(string)
}

variable "subnet2_vnet03_name" {
  description = "Name of the second subnet in VNet03"
  type        = string
}

variable "subnet2_vnet03_address_prefix" {
  description = "Address prefix for the second subnet in VNet03"
  type        = list(string)
}

variable "subnet3_vnet03_name" {
  description = "Name of the third subnet in VNet03"
  type        = string
}

variable "subnet3_vnet03_address_prefix" {
  description = "Address prefix for the third subnet in VNet03"
  type        = list(string)
}

# Public IP Variables
variable "appgtw1_pub_ip_name" {
  description = "Public IP name for App Gateway 1"
  type        = string
}

variable "appgtw2_pub_ip_name" {
  description = "Public IP name for App Gateway 2"
  type        = string
}

variable "apim_pub_ip_name" {
  description = "Public IP name for API Management"
  type        = string
}

variable "apim_pub_ip_domain_name_label" {
  description = "Domain name label for API Management public IP"
  type        = string
}

variable "vng_pub_ip_name" {
  description = "Public IP name for the virtual network gateway"
  type        = string
}

# Network Security Group (NSG)
variable "nsg_name" {
  description = "Name of the Network Security Group"
  type        = string
}

# Route Table
variable "routetable_name" {
  description = "Name of the route table"
  type        = string
}


#application gateway (local)
variable "backend_address_pool_name" {
  type        = string
  description = "The name of the backend address pool for the Application Gateway"
}

variable "frontend_port_name" {
  type        = string
  description = "The name of the frontend port for the Application Gateway"
}

variable "frontend_ip_configuration_name" {
  type        = string
  description = "The name of the frontend IP configuration for the Application Gateway"
}

variable "backend_http_setting_name" {
  type        = string
  description = "The name of the HTTP setting for the Application Gateway backend"
}

variable "listener_name" {
  type        = string
  description = "The name of the listener for the Application Gateway"
}

variable "request_routing_rule_name" {
  type        = string
  description = "The name of the request routing rule for the Application Gateway"
}

# appgtw 1
variable "application_gateway1_name" {
    type = string
    description = "application gateway name"
}

variable "appgtw_waf_policy_name" {
    type = string
}

variable "appgtw_managed_rule_type" {
    type = string
}

variable "appgtw_managed_rule_version" {
  type        = string
  description = "The version of the managed rule set for the WAF"
}

variable "appgtw_sku_name" {
  type        = string
  description = "The SKU name of the Application Gateway"
}

variable "appgtw_sku_tier" {
  type        = string
  description = "The SKU tier of the Application Gateway"
}

variable "appgtw_sku_capacity" {
  type        = number
  description = "The capacity for the Application Gateway SKU"
}

variable "appgtw_gateway_ip_config_name" {
  type        = string
  description = "The name of the IP configuration for the Application Gateway"
}

variable "appgtw_frontend_port" {
  type        = number
  description = "The frontend port for the Application Gateway"
}

variable "appgtw_backend_http_setting_cookie_based_affinity" {
  type        = string
  description = "The cookie-based affinity setting for backend HTTP settings"
}

variable "appgtw_backend_http_setting_port" {
  type        = number
  description = "The backend HTTP setting port"
}

variable "appgtw_backend_http_setting_protocol" {
  type        = string
  description = "The backend HTTP setting protocol"
}

variable "appgtw_backend_http_setting_request_timeout" {
  type        = number
  description = "The backend HTTP setting request timeout (in seconds)"
}

variable "appgtw_http_listener_protocol" {
  type        = string
  description = "The protocol for the Application Gateway HTTP listener"
}

variable "appgtw_request_routing_rule_rule_type" {
  type        = string
  description = "The rule type for the request routing rule"
}

variable "appgtw_request_routing_rule_priority" {
  type        = number
  description = "The priority for the request routing rule"
}

variable "appgtw_waf_config_enabled" {
  type        = bool
  description = "Enable or disable WAF configuration"
}

variable "appgtw_waf_config_firewall_mode" {
  type        = string
  description = "The firewall mode for WAF configuration"
}

variable "appgtw_waf_config_rule_set_type" {
  type        = string
  description = "The rule set type for WAF configuration"
}

variable "appgtw_waf_config_rule_set_version" {
  type        = string
  description = "The rule set version for WAF configuration"
}


# appgtw 2
variable "application_gateway2_name" {
    type = string
    description = "application gateway name"
}

variable "appgtw2_sku_name" {
  type        = string
  description = "The SKU name for the second Application Gateway"
}

variable "appgtw2_sku_tier" {
  type        = string
  description = "The SKU tier for the second Application Gateway"
}

variable "appgtw2_sku_capacity" {
  type        = number
  description = "The SKU capacity for the second Application Gateway"
}

variable "appgtw2_gateway_ip_config_name" {
  type        = string
  description = "The name of the gateway IP configuration for the second Application Gateway"
}

variable "appgtw2_frontend_port" {
  type        = number
  description = "The frontend port for the second Application Gateway"
}

variable "appgtw2_backend_http_settings_cookie_based_affinity" {
  type        = string
  description = "The cookie-based affinity setting for backend HTTP settings in the second Application Gateway"
}

variable "appgtw2_backend_http_settings_port" {
  type        = number
  description = "The port for backend HTTP settings in the second Application Gateway"
}

variable "appgtw2_backend_http_settings_protocol" {
  type        = string
  description = "The protocol for backend HTTP settings in the second Application Gateway"
}

variable "appgtw2_backend_http_settings_request_timeout" {
  type        = number
  description = "The request timeout for backend HTTP settings in the second Application Gateway"
}

variable "appgtw2_http_listener_protocol" {
  type        = string
  description = "The protocol for the HTTP listener in the second Application Gateway"
}

variable "appgtw2_request_routing_rule_rule_type" {
  type        = string
  description = "The rule type for the request routing rule in the second Application Gateway"
}

variable "appgtw2_request_routing_rule_priority" {
  type        = number
  description = "The priority for the request routing rule in the second Application Gateway"
}

variable "appgtw2_waf_config_enabled" {
  type        = bool
  description = "Whether WAF (Web Application Firewall) is enabled for the second Application Gateway"
}

variable "appgtw2_waf_config_firewall_mode" {
  type        = string
  description = "The firewall mode for WAF in the second Application Gateway"
}

variable "appgtw2_waf_config_rule_set_type" {
  type        = string
  description = "The rule set type for WAF in the second Application Gateway"
}

variable "appgtw2_waf_config_rule_set_version" {
  type        = string
  description = "The rule set version for WAF in the second Application Gateway"
}

# APIM 
variable "apim_name" {
    type = string
    description = "api management service name"
}

variable "apim_publisher_name" {
    type = string
    description = "api management service name"
}

variable "apim_publisher_email" {
    type = string
    description = "api management service name"
}

variable "apim_sku_name" {
    type = string
    description = "apim sku type"
}

variable "apim_virtual_network_type" {
    type = string
    description = "virtual network type"
}

variable "apim_identity_type" {
    type = string
    description = "managed identity type"
}

variable "apim_environment" {
    type = string
    description = "apim env type"
}


# aks
variable "aks_name" {
    type = string
    description = "aks name"
}

variable "dns_prefix_aks" {
    type = string
    description = "dns prefix of aks"
}

variable "aks_nodepool_name" {
    type = string
    description = "aks nodepool name"
}

variable "aks_node_count" {
    type = number
}

variable "aks_vm_size" {
    type = string
    description = "aks vm nodes size"
}

variable "aks_auto_scaling_enabled" {
    type = bool
    description = "autoscating true or false"
}

variable "aks_node_min_count" {
    type = number
    description = "min node count"
}

variable "aks_node_max_count" {
    type = number
    description = "max node count"
}

variable "aks_identity_type" {
    type = string
    description = "managed identity type"  
}

variable "aks_network_plugin" {
    type = string
    description = "network plugin type"
}

variable "aks_Environment" {
    type = string
    description = "aks environment"
}

variable "aks_role_definition_name" {
    type = string
    description = "aks role definition name"
}

# automation account
variable "automation_account_name" {
  type        = string
  description = "The name of the automation account."
}

variable "automation_account_sku_name" {
  type        = string
  description = "The SKU name of the automation account (e.g., Basic, Standard)."
}

variable "automation_account_environment" {
  type        = string
  description = "The environment for the automation account (e.g., staging, production)."
}

# container_registries
variable "acr1_name" {
  type        = string
  description = "The name of the first Azure Container Registry (ACR)."
}

variable "acr1_sku" {
  type        = string
  description = "The SKU for the first ACR (e.g., Basic, Standard, Premium)."
}

variable "acr1_admin_enabled" {
  type        = bool
  description = "Whether the admin user is enabled for the first ACR."
}

variable "acr2_name" {
  type        = string
  description = "The name of the second Azure Container Registry (ACR)."
}

variable "acr2_sku" {
  type        = string
  description = "The SKU for the second ACR (e.g., Basic, Standard, Premium)."
}

variable "acr2_admin_enabled" {
  type        = bool
  description = "Whether the admin user is enabled for the second ACR."
}

#cosmos dbs
variable "cosmosdb1_name" {
  type        = string
  description = "The name of the first Cosmos DB instance."
}

variable "cosmosdb1_offer_type" {
  type        = string
  description = "The offer type for the first Cosmos DB instance (e.g., Standard)."
}

variable "cosmosdb1_kind" {
  type        = string
  description = "The kind of the first Cosmos DB instance (e.g., MongoDB)."
}

variable "cosmosdb1_automatic_failover_enabled" {
  type        = bool
  description = "Whether automatic failover is enabled for the first Cosmos DB instance."
}

variable "cosmosdb1_consistency_policylevel" {
  type        = string
  description = "The consistency policy level for the first Cosmos DB instance (e.g., BoundedStaleness)."
}

variable "cosmosdb1_consistency_policy_max_interval_in_seconds" {
  type        = number
  description = "The maximum interval (in seconds) for consistency policy in the first Cosmos DB instance."
}

variable "cosmosdb1_consistency_policy_max_staleness_prefix" {
  type        = number
  description = "The maximum staleness prefix for consistency policy in the first Cosmos DB instance."
}

variable "cosmosdb1_geolocation_location" {
  type        = string
  description = "The geolocation region for the first Cosmos DB instance."
}

variable "cosmosdb1_geolocation_failover_priority" {
  type        = number
  description = "The failover priority for the first Cosmos DB instance."
}

variable "cosmosdb1_is_virtual_network_filter_enabled" {
  type        = bool
  description = "Whether virtual network filter is enabled for the first Cosmos DB instance."
}

# For cosmosdb2

variable "cosmosdb2_name" {
  type        = string
  description = "The name of the second Cosmos DB instance."
}

variable "cosmosdb2_offer_type" {
  type        = string
  description = "The offer type for the second Cosmos DB instance (e.g., Standard)."
}

variable "cosmosdb2_kind" {
  type        = string
  description = "The kind of the second Cosmos DB instance (e.g., MongoDB)."
}

variable "cosmosdb2_automatic_failover_enabled" {
  type        = bool
  description = "Whether automatic failover is enabled for the second Cosmos DB instance."
}

variable "cosmosdb2_consistency_policylevel" {
  type        = string
  description = "The consistency policy level for the second Cosmos DB instance (e.g., BoundedStaleness)."
}

variable "cosmosdb2_consistency_policy_max_interval_in_seconds" {
  type        = number
  description = "The maximum interval (in seconds) for consistency policy in the second Cosmos DB instance."
}

variable "cosmosdb2_consistency_policy_max_staleness_prefix" {
  type        = number
  description = "The maximum staleness prefix for consistency policy in the second Cosmos DB instance."
}

variable "cosmosdb2_geolocation_location" {
  type        = string
  description = "The geolocation region for the second Cosmos DB instance."
}

variable "cosmosdb2_geolocation_failover_priority" {
  type        = number
  description = "The failover priority for the second Cosmos DB instance."
}

variable "cosmosdb2_is_virtual_network_filter_enabled" {
  type        = bool
  description = "Whether virtual network filter is enabled for the second Cosmos DB instance."
}

# mysql flexible server
variable "mysql_flexible_server_pvtdns_zone_name" {
  type        = string
  description = "The private DNS zone name for the MySQL flexible server."
}

variable "mysql_flexible_server_private_dns_zone_virtual_network_link_name" {
  type        = string
  description = "The name of the virtual network link for the MySQL flexible server's private DNS zone."
}

variable "mysql_flexible_server_name" {
  type        = string
  description = "The name of the MySQL flexible server."
}

variable "mysql_flexible_server_administrator_login" {
  type        = string
  description = "The administrator login name for the MySQL flexible server."
}

variable "mysql_flexible_server_administrator_password" {
  type        = string
  description = "The administrator password for the MySQL flexible server."
  sensitive   = true
}

variable "mysql_flexible_server_backup_retention_days" {
  type        = number
  description = "The number of backup retention days for the MySQL flexible server."
}

variable "mysql_flexible_server_geo_redundant_backup_enabled" {
  type        = bool
  description = "Whether geo-redundant backup is enabled for the MySQL flexible server."
}

variable "mysql_flexible_server_sku_name" {
  type        = string
  description = "The SKU name for the MySQL flexible server."
}

variable "mysql_flexible_server_zone" {
  type        = number
  description = "The zone for the MySQL flexible server."
}

# redis cache
variable "redis1_cache_name" {
  type        = string
  description = "The name of the first Redis cache instance."
}

variable "redis1_cache_capacity" {
  type        = number
  description = "The capacity of the first Redis cache instance."
}

variable "redis1_cache_family" {
  type        = string
  description = "The family of the first Redis cache instance (e.g., P, M)."
}

variable "redis1_cache_sku_name" {
  type        = string
  description = "The SKU name of the first Redis cache instance."
}

variable "redis1_cache_non_ssl_port_enabled" {
  type        = bool
  description = "Whether the non-SSL port is enabled for the first Redis cache instance."
}

variable "redis1_cache_minimum_tls_version" {
  type        = string
  description = "The minimum TLS version for the first Redis cache instance."
}

variable "redis2_cache_name" {
  type        = string
  description = "The name of the second Redis cache instance."
}

variable "redis2_cache_capacity" {
  type        = number
  description = "The capacity of the second Redis cache instance."
}

variable "redis2_cache_family" {
  type        = string
  description = "The family of the second Redis cache instance (e.g., P, M)."
}

variable "redis2_cache_sku_name" {
  type        = string
  description = "The SKU name of the second Redis cache instance."
}

variable "redis2_cache_non_ssl_port_enabled" {
  type        = bool
  description = "Whether the non-SSL port is enabled for the second Redis cache instance."
}

variable "redis2_cache_minimum_tls_version" {
  type        = string
  description = "The minimum TLS version for the second Redis cache instance."
}

# service bus
variable "servicebus_namespace_name" {
  type        = string
  description = "The name of the Service Bus namespace."
}

variable "servicebus_namespace_sku" {
  type        = string
  description = "The SKU of the Service Bus namespace (e.g., Standard, Basic, Premium)."
}

variable "servicebus_queue_name" {
  type        = string
  description = "The name of the Service Bus queue."
}

variable "servicebus_queue_partitioning_enabled" {
  type        = bool
  description = "Whether partitioning is enabled for the Service Bus queue."
}

# vm 
variable "vm_name" {
  type        = string
  description = "The name of the virtual machine."
}

variable "vm_vm_size" {
  type        = string
  description = "The size of the virtual machine (e.g., Standard_D2as_v4)."
}

variable "vm_delete_os_disk_on_termination" {
  type        = bool
  description = "Specifies whether the OS disk should be deleted upon VM termination."
}

variable "vm_delete_data_disks_on_termination" {
  type        = bool
  description = "Specifies whether the data disks should be deleted upon VM termination."
}

variable "vm_publisher" {
  type        = string
  description = "The publisher of the image (e.g., Canonical)."
}

variable "vm_offer" {
  type        = string
  description = "The offer for the image (e.g., 0001-com-ubuntu-server-jammy)."
}

variable "vm_sku" {
  type        = string
  description = "The SKU of the image (e.g., 22_04-lts)."
}

variable "vm_version" {
  type        = string
  description = "The version of the image (e.g., latest)."
}

variable "vm_disk_name" {
  type        = string
  description = "The name of the virtual machine's disk (e.g., myosdisk1)."
}

variable "vm_caching" {
  type        = string
  description = "The caching behavior for the OS disk (e.g., ReadWrite)."
}

variable "vm_create_option" {
  type        = string
  description = "The create option for the VM (e.g., FromImage)."
}

variable "vm_managed_disk_type" {
  type        = string
  description = "The type of managed disk (e.g., Standard_LRS)."
}

variable "vm_computer_name" {
  type        = string
  description = "The computer name for the virtual machine (e.g., hostname)."
}

variable "vm_admin_username" {
  type        = string
  description = "The administrator username for the VM."
}

variable "vm_admin_password" {
  type        = string
  description = "The administrator password for the VM."
}

variable "vm_disable_password_authentication" {
  type        = bool
  description = "Specifies whether password authentication is disabled for the VM."
}

variable "vm_environment" {
  type        = string
  description = "The environment in which the VM is deployed (e.g., staging, production)."
}

variable "private_ip_address" {
  type = string
}

#vpn
variable "vng_name" {
  type        = string
  description = "The name of the virtual network gateway."
}

variable "vng_type" {
  type        = string
  description = "The type of the virtual network gateway (Vpn)."
}

variable "vng_vpn_type" {
  type        = string
  description = "The VPN type for the virtual network gateway (RouteBased)."
}

variable "vng_active_active" {
  type        = bool
  description = "Whether the virtual network gateway is active-active."
}

variable "vng_enable_bgp" {
  type        = bool
  description = "Whether BGP is enabled for the virtual network gateway."
}

variable "vng_sku" {
  type        = string
  description = "The SKU for the virtual network gateway (VpnGw1AZ)."
}

variable "vng_ip_config_name" {
  type        = string
  description = "The name of the IP configuration for the virtual network gateway."
}

variable "vng_private_ip_address_allocation" {
  type        = string
  description = "The private IP address allocation for the virtual network gateway (Dynamic)."
}

variable "vng_client_address_space" {
  type        = list(string)
  description = "The address space for the VPN client (e.g., ['10.2.0.0/24'])."
}

variable "vng_root_certificate_name" {
  type        = string
  description = "The name of the root certificate for the VPN."
}

variable "public_cert_data" {
  type        = string
  description = "The public certificate data for the VPN."
}








