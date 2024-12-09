locals {
  backend_address_pool_name      = var.backend_address_pool_name
  frontend_port_name             = var.frontend_port_name
  frontend_ip_configuration_name = var.frontend_ip_configuration_name
  http_setting_name              = var.backend_http_setting_name
  listener_name                  = var.listener_name
  request_routing_rule_name      = var.request_routing_rule_name
}

# Shared WAF Policy
resource "azurerm_web_application_firewall_policy" "shared_waf_policy" {
  name                = var.appgtw_waf_policy_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  managed_rules {
    managed_rule_set {
      type    = var.appgtw_managed_rule_type
      version = var.appgtw_managed_rule_version
    }
  }
}

# Application Gateway 1
resource "azurerm_application_gateway" "appgateway1" {
  name                = var.application_gateway1_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  sku {
    name     = var.appgtw_sku_name
    tier     = var.appgtw_sku_tier
    capacity = var.appgtw_sku_capacity
  }

  gateway_ip_configuration {
    name      = var.appgtw_gateway_ip_config_name
    subnet_id = azurerm_subnet.sub1vnet01.id
  }

  frontend_port {
    name = local.frontend_port_name
    port = var.appgtw_frontend_port
  }

  frontend_ip_configuration {
    name                 = local.frontend_ip_configuration_name
    public_ip_address_id = azurerm_public_ip.appgtw1pub.id
  }

  backend_address_pool {
    name        = local.backend_address_pool_name
    ip_addresses = azurerm_api_management.apim.private_ip_addresses
  }

  backend_http_settings {
    name                  = local.http_setting_name
    cookie_based_affinity = var.appgtw_backend_http_setting_cookie_based_affinity
    port                  = var.appgtw_backend_http_setting_port
    protocol              = var.appgtw_backend_http_setting_protocol
    request_timeout       = var.appgtw_backend_http_setting_request_timeout
  }

  http_listener {
    name                           = local.listener_name
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = local.frontend_port_name
    protocol                       = var.appgtw_http_listener_protocol
  }

  request_routing_rule {
    name                       = local.request_routing_rule_name
    rule_type                  = var.appgtw_request_routing_rule_rule_type
    priority                   = var.appgtw_request_routing_rule_priority
    http_listener_name         = local.listener_name
    backend_address_pool_name  = local.backend_address_pool_name
    backend_http_settings_name = local.http_setting_name
  }

  waf_configuration {
    enabled          = var.appgtw_waf_config_enabled
    firewall_mode    = var.appgtw_waf_config_firewall_mode
    rule_set_type    = var.appgtw_waf_config_rule_set_type
    rule_set_version = var.appgtw_waf_config_rule_set_version
  }

  depends_on = [azurerm_resource_group.rg , azurerm_web_application_firewall_policy.shared_waf_policy , azurerm_virtual_network.vnet01 , azurerm_public_ip.appgtw1pub , azurerm_subnet.sub1vnet01 , azurerm_api_management.apim ] #azurerm_private_endpoint.apim_private_endpoint
}

# Application Gateway 2
resource "azurerm_application_gateway" "appgateway2" {
  name                = var.application_gateway2_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  sku {
    name     = var.appgtw2_sku_name
    tier     = var.appgtw2_sku_tier
    capacity = var.appgtw2_sku_capacity
  }

  gateway_ip_configuration {
    name      = var.appgtw2_gateway_ip_config_name
    subnet_id = azurerm_subnet.sub1vnet01.id
  }

  frontend_port {
    name = local.frontend_port_name
    port = var.appgtw2_frontend_port
  }

  frontend_ip_configuration {
    name                 = local.frontend_ip_configuration_name
    public_ip_address_id = azurerm_public_ip.appgtw2pub.id
  }

  backend_address_pool {
    name        = local.backend_address_pool_name
    ip_addresses = azurerm_api_management.apim.private_ip_addresses
  }

  backend_http_settings {
    name                  = local.http_setting_name
    cookie_based_affinity = var.appgtw2_backend_http_settings_cookie_based_affinity
    port                  = var.appgtw2_backend_http_settings_port
    protocol              = var.appgtw2_backend_http_settings_protocol
    request_timeout       = var.appgtw2_backend_http_settings_request_timeout
  }

  http_listener {
    name                           = local.listener_name
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = local.frontend_port_name
    protocol                       = var.appgtw2_http_listener_protocol
  }

  request_routing_rule {
    name                       = local.request_routing_rule_name
    rule_type                  = var.appgtw2_request_routing_rule_rule_type
    priority                   = var.appgtw2_request_routing_rule_priority
    http_listener_name         = local.listener_name
    backend_address_pool_name  = local.backend_address_pool_name
    backend_http_settings_name = local.http_setting_name
  }

  waf_configuration {
    enabled          = var.appgtw2_waf_config_enabled
    firewall_mode    = var.appgtw2_waf_config_firewall_mode
    rule_set_type    = var.appgtw2_waf_config_rule_set_type
    rule_set_version = var.appgtw2_waf_config_rule_set_version
  }

  depends_on = [azurerm_resource_group.rg , azurerm_web_application_firewall_policy.shared_waf_policy , azurerm_virtual_network.vnet01 , azurerm_public_ip.appgtw1pub , azurerm_subnet.sub1vnet01 , azurerm_api_management.apim ] #azurerm_private_endpoint.apim_private_endpoint
}
