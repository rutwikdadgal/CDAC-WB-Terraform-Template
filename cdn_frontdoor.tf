# Azure Front Door Profile
resource "azurerm_cdn_frontdoor_profile" "fd" {
  name                = var.cdn_frontdoor_profile_name
  resource_group_name = azurerm_resource_group.rg.name
  sku_name            = var.cdn_frontdoor__profile_sku_name

  depends_on = [azurerm_resource_group.rg]
}

# Azure Front Door Origin Group
resource "azurerm_cdn_frontdoor_origin_group" "origin_group" {
  name                     = var.cdn_frontdoor_origin_group_name
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.fd.id

  load_balancing {
    sample_size                 = var.cdn_frontdoor_loadbalancing_sample_size
    successful_samples_required = var.cdn_frontdoor_loadbalancing_successful_samples_required
  }

  health_probe {
    path                = var.cdn_frontdoor_health_probe_path
    protocol            = var.cdn_frontdoor_health_probe_protocol
    interval_in_seconds = var.cdn_frontdoor_health_probe_interval_in_seconds
  }

  depends_on = [ azurerm_resource_group.rg , azurerm_cdn_frontdoor_profile.fd ]
}

# Azure Front Door Origin for Application Gateway 1
resource "azurerm_cdn_frontdoor_origin" "origin1" {
  name                          = var.cdn_frontdoor_origin1_name
  cdn_frontdoor_origin_group_id = azurerm_cdn_frontdoor_origin_group.origin_group.id
  enabled                       = var.cdn_frontdoor_origin1_enabled

  certificate_name_check_enabled = var.cdn_frontdoor_origin1_certificate_name_check_enabled
  host_name                      = azurerm_public_ip.appgtw1pub.ip_address
  http_port                      = var.cdn_frontdoor_origin1_http_port
  https_port                     = var.cdn_frontdoor_origin1_https_port
  origin_host_header             = azurerm_public_ip.appgtw1pub.ip_address

  priority = var.cdn_frontdoor_origin1_priority
  weight   = var.cdn_frontdoor_origin1_weight

  depends_on = [azurerm_public_ip.appgtw1pub , azurerm_cdn_frontdoor_profile.fd , azurerm_application_gateway.appgateway1 , azurerm_cdn_frontdoor_origin_group.origin_group]
}

# Azure Front Door Origin for Application Gateway 2
resource "azurerm_cdn_frontdoor_origin" "origin2" {
  name                          = var.cdn_frontdoor_origin2_name
  cdn_frontdoor_origin_group_id = azurerm_cdn_frontdoor_origin_group.origin_group.id
  enabled                       = var.cdn_frontdoor_origin2_enabled

  certificate_name_check_enabled = var.cdn_frontdoor_origin2_certificate_name_check_enabled
  host_name                      = azurerm_public_ip.appgtw2pub.ip_address
  http_port                      = var.cdn_frontdoor_origin2_http_port
  https_port                     = var.cdn_frontdoor_origin2_https_port
  origin_host_header             = azurerm_public_ip.appgtw2pub.ip_address

  priority = var.cdn_frontdoor_origin2_priority
  weight   = var.cdn_frontdoor_origin2_weight

  depends_on = [azurerm_public_ip.appgtw2pub , azurerm_cdn_frontdoor_profile.fd , azurerm_application_gateway.appgateway2 , azurerm_cdn_frontdoor_origin_group.origin_group]
}

# Azure Front Door Endpoint
resource "azurerm_cdn_frontdoor_endpoint" "endpoint" {
  name                     = var.cdn_frontdoor_profile_endpoint_name
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.fd.id

  tags = {
    ENV = var.cdn_frontdoor_endpoint_ENV
  }

  depends_on = [ azurerm_resource_group.rg , azurerm_cdn_frontdoor_profile.fd ]
}

# Azure Front Door Route to HTTP
resource "azurerm_cdn_frontdoor_route" "route" {
  name                          = var.cdn_frontdoor_route_name
  cdn_frontdoor_endpoint_id     = azurerm_cdn_frontdoor_endpoint.endpoint.id
  cdn_frontdoor_origin_group_id = azurerm_cdn_frontdoor_origin_group.origin_group.id
  cdn_frontdoor_origin_ids      = [
    azurerm_cdn_frontdoor_origin.origin1.id,
    azurerm_cdn_frontdoor_origin.origin2.id
  ]
  enabled                       = var.cdn_frontdoor_route_enabled

  forwarding_protocol    = var.cdn_frontdoor_route_forwarding_protocol  # Change to HttpOnly to force HTTP
  https_redirect_enabled = var.cdn_frontdoor_route_https_redirect_enabled     # Ensure no redirect to HTTPS
  patterns_to_match      = var.cdn_frontdoor_route_patterns_to_match
  supported_protocols    = var.cdn_frontdoor_route_supported_protocols  # Restrict to HTTP protocol

  cache {
    query_string_caching_behavior = var.cdn_frontdoor_route_cache_query_string_caching_behavior
    query_strings                 = var.cdn_frontdoor_route_cache_query_strings
    compression_enabled           = var.cdn_frontdoor_route_cache_compression_enabled
    content_types_to_compress     = var.cdn_frontdoor_route_cache_content_types_to_compress
  }

  depends_on = [azurerm_cdn_frontdoor_endpoint.endpoint , azurerm_cdn_frontdoor_origin.origin1 , azurerm_cdn_frontdoor_origin.origin2 , azurerm_cdn_frontdoor_origin_group.origin_group]
}

resource "azurerm_cdn_frontdoor_firewall_policy" "waf" {
  name                              = var.cdn_frontdoor_waf_policy_name
  resource_group_name               = azurerm_resource_group.rg.name
  sku_name                          = azurerm_cdn_frontdoor_profile.fd.sku_name
  enabled                           = var.cdn_frontdoor_waf_policy_enabled
  mode                              = var.cdn_frontdoor_waf_policy_mode
  redirect_url                      = var.cdn_frontdoor_waf_policy_redirect_url
  custom_block_response_status_code = var.cdn_frontdoor_waf_policy_custom_block_response_status_code
  custom_block_response_body        = var.cdn_frontdoor_waf_policy_custom_block_response_body
  
  managed_rule {
    type    = var.cdn_frontdoor_waf_policy_managed_rule_type
    version = var.cdn_frontdoor_waf_policy_managed_rule_version
    action  = var.cdn_frontdoor_waf_policy_managed_rule_action
  }

  depends_on = [ azurerm_resource_group.rg , azurerm_cdn_frontdoor_profile.fd ]
}