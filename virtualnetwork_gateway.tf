resource "azurerm_virtual_network_gateway" "vng" {
  name                = var.vng_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  type     = var.vng_type
  vpn_type = var.vng_vpn_type

  active_active = var.vng_active_active
  enable_bgp    = var.vng_enable_bgp
  sku           = var.vng_sku

  ip_configuration {
    name                          = var.vng_ip_config_name
    public_ip_address_id          = azurerm_public_ip.gtwsub-pub-ip.id
    private_ip_address_allocation = var.vng_private_ip_address_allocation
    subnet_id                     = azurerm_subnet.gtwsub4vnet02.id
  }

  vpn_client_configuration {
    address_space = var.vng_client_address_space

    root_certificate {
      name = var.vng_root_certificate_name

      public_cert_data = var.public_cert_data

    }
  }

  depends_on = [ azurerm_resource_group.rg , azurerm_virtual_network.vnet02 , azurerm_subnet.gtwsub4vnet02 , azurerm_public_ip.gtwsub-pub-ip , azurerm_api_management.apim , azurerm_cdn_frontdoor_origin.origin2, azurerm_cdn_frontdoor_origin.origin1]
}