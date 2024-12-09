#vnet01
resource "azurerm_virtual_network" "vnet01" {
  name                = var.virtual_network1_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  address_space       = var.vnet01_address_space

  depends_on = [ azurerm_resource_group.rg ]
}

resource "azurerm_subnet" "sub1vnet01" {
  name                 = var.subnet1_vnet01_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet01.name
  address_prefixes     = var.subnet1_vnet01_address_prefix

  depends_on = [ azurerm_resource_group.rg , azurerm_virtual_network.vnet01]
}

resource "azurerm_subnet" "sub2vnet01" {
  name                 = var.subnet2_vnet01_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet01.name
  address_prefixes     = var.subnet2_vnet01_address_prefix

  depends_on = [ azurerm_resource_group.rg , azurerm_virtual_network.vnet01]
}

resource "azurerm_public_ip" "appgtw1pub" {
  name                = var.appgtw1_pub_ip_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  allocation_method   = "Static"

  depends_on = [ azurerm_resource_group.rg , azurerm_virtual_network.vnet01]
}

resource "azurerm_public_ip" "appgtw2pub" {
  name                = var.appgtw2_pub_ip_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  allocation_method   = "Static"

  depends_on = [ azurerm_resource_group.rg , azurerm_virtual_network.vnet01]
}

#vnet02- AKS

resource "azurerm_virtual_network" "vnet02" {
  name                = var.virtual_network2_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  address_space       = var.vnet02_address_space

  depends_on = [ azurerm_resource_group.rg ]
}

resource "azurerm_subnet" "sub1vnet02" {
  name                 = var.subnet1_vnet02_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet02.name
  address_prefixes     = var.subnet1_vnet02_address_prefix

  depends_on = [ azurerm_resource_group.rg , azurerm_virtual_network.vnet02]
}

#subnet nsg
resource "azurerm_network_security_group" "apim_nsg" {
  name                = var.nsg_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  security_rule {
    name                       = "Allow-API-Management-Inbound"
    priority                   = 300
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                  = "Tcp"
    source_port_range         = "*"
    destination_port_range    = "443"
    source_address_prefix     = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "Allow-API-Management-Outbound"
    priority                   = 200
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                  = "Tcp"
    source_port_range         = "*"
    destination_port_range    = "*"
    source_address_prefix     = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "Allow-APIM-Management"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3443"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  depends_on = [ azurerm_resource_group.rg , azurerm_virtual_network.vnet02 , azurerm_subnet.sub1vnet02 ]
}

# subnet1 vnet02 nsg-apim
resource "azurerm_subnet_network_security_group_association" "apim_nsg_association" {
  subnet_id                 = azurerm_subnet.sub1vnet02.id
  network_security_group_id = azurerm_network_security_group.apim_nsg.id

  depends_on = [ azurerm_subnet.sub1vnet02 , azurerm_network_security_group.apim_nsg ]
}

resource "azurerm_route_table" "apim_route_table" {
  name                = var.routetable_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  depends_on = [ azurerm_resource_group.rg , azurerm_subnet.sub1vnet02 ]
}

resource "azurerm_subnet_route_table_association" "apim_route_table_association" {
  subnet_id       = azurerm_subnet.sub1vnet02.id
  route_table_id  = azurerm_route_table.apim_route_table.id

  depends_on = [ azurerm_subnet.sub1vnet02 ]
}

# aks subnet
resource "azurerm_subnet" "defsub2vnet02" {
  name                 = var.subnet2_vnet02_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet02.name
  address_prefixes     = var.subnet2_vnet02_address_prefix

  depends_on = [ azurerm_resource_group.rg , azurerm_virtual_network.vnet02]
}

# apim public ip
resource "azurerm_public_ip" "apim_pub_ip" {
  name                = var.apim_pub_ip_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Static"

  domain_name_label = "apim-wb"

  depends_on = [ azurerm_resource_group.rg ]
}

# vm subnet
resource "azurerm_subnet" "vmsub3vnet02" {
  name                 = var.subnet3_vnet02_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet02.name
  address_prefixes     = var.subnet3_vnet02_address_prefix

  depends_on = [ azurerm_resource_group.rg , azurerm_virtual_network.vnet02]
}

#vm public ip
resource "azurerm_public_ip" "vm-ip" {
  name                = "VM-pub-ip"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Static"
  sku                 = "Standard" # Required for availability zones and resilience
}

#vm nsg
resource "azurerm_network_security_group" "vm-nsg" {
  name                = "VM-NSG"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  security_rule {
    name                       = "AllowSSH"
    priority                   = 1000
    direction                  = "Inbound"
    access                    = "Allow"
    protocol                   = "Tcp"
    source_port_range         = "*"
    destination_port_range    = "22"
    source_address_prefix     = "*"
    destination_address_prefix = "*"
  }
}

#vm nic
resource "azurerm_network_interface" "main" {
  name                = "VM-nic"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = azurerm_subnet.vmsub3vnet02.id
    private_ip_address_allocation = "Static"
    private_ip_address            = var.private_ip_address
    public_ip_address_id          = azurerm_public_ip.vm-ip.id
     
  }
}

resource "azurerm_network_interface_security_group_association" "nic-nsg" {
  network_interface_id      = azurerm_network_interface.main.id
  network_security_group_id = azurerm_network_security_group.vm-nsg.id
}

#vng(vpn) subnet
resource "azurerm_subnet" "gtwsub4vnet02" {
  name                 = var.subnet4_vnet02_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet02.name
  address_prefixes     = var.subnet4_vnet02_address_prefix

  depends_on = [ azurerm_resource_group.rg , azurerm_virtual_network.vnet02]
}

#vng(vpn) public ip
resource "azurerm_public_ip" "gtwsub-pub-ip" {
  name                = var.vng_pub_ip_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                  = "Standard"
  allocation_method = "Static"

  zones = ["1"]
}

#vnet03

resource "azurerm_virtual_network" "vnet03" {
  name                = var.virtual_network3_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  address_space       = var.vnet03_address_space

  depends_on = [ azurerm_resource_group.rg ]
}

# mysql db subnet
resource "azurerm_subnet" "sub1vnet03" {
  name                 = var.subnet1_vnet03_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet03.name
  address_prefixes     = var.subnet1_vnet03_address_prefix
  service_endpoints    = ["Microsoft.Storage"]
  delegation {
    name = "fs"
    service_delegation {
      name = "Microsoft.DBforMySQL/flexibleServers"
      actions = [
        "Microsoft.Network/virtualNetworks/subnets/join/action",
      ]
    }
  }
  depends_on = [ azurerm_resource_group.rg , azurerm_virtual_network.vnet03 ]
}

# cosmos db subnet
resource "azurerm_subnet" "sub2vnet03" {
  name                 = var.subnet2_vnet03_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet03.name
  address_prefixes     = var.subnet2_vnet03_address_prefix
  service_endpoints = ["Microsoft.AzureCosmosDB"]
  depends_on = [ azurerm_resource_group.rg , azurerm_virtual_network.vnet03 ]
}

# redis cache subnet
resource "azurerm_subnet" "sub3vnet03" {
  name                 = var.subnet3_vnet03_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet03.name
  address_prefixes     = var.subnet3_vnet03_address_prefix

  service_endpoints = ["Microsoft.Storage"]
}



# Peering between vnet01 and vnet02
resource "azurerm_virtual_network_peering" "vnet01_to_vnet02" {
  name                      = "vnet01-to-vnet02"
  resource_group_name       = azurerm_resource_group.rg.name
  virtual_network_name      = azurerm_virtual_network.vnet01.name
  remote_virtual_network_id = azurerm_virtual_network.vnet02.id
  allow_forwarded_traffic   = true
  allow_gateway_transit     = false
  use_remote_gateways       = false

  depends_on = [azurerm_resource_group.rg, azurerm_virtual_network.vnet01, azurerm_virtual_network.vnet02]
}

resource "azurerm_virtual_network_peering" "vnet02_to_vnet01" {
  name                      = "vnet02-to-vnet01"
  resource_group_name       = azurerm_resource_group.rg.name
  virtual_network_name      = azurerm_virtual_network.vnet02.name
  remote_virtual_network_id = azurerm_virtual_network.vnet01.id
  allow_forwarded_traffic   = true
  allow_gateway_transit     = false
  use_remote_gateways       = false

  depends_on = [azurerm_resource_group.rg, azurerm_virtual_network.vnet01, azurerm_virtual_network.vnet02]
}



# Peering between vnet02 and vnet03
resource "azurerm_virtual_network_peering" "vnet02_to_vnet03" {
  name                      = "vnet02-to-vnet03"
  resource_group_name       = azurerm_resource_group.rg.name
  virtual_network_name      = azurerm_virtual_network.vnet02.name
  remote_virtual_network_id = azurerm_virtual_network.vnet03.id
  allow_forwarded_traffic   = true
  allow_gateway_transit     = false
  use_remote_gateways       = false

  depends_on = [azurerm_resource_group.rg, azurerm_virtual_network.vnet03, azurerm_virtual_network.vnet02]
}

resource "azurerm_virtual_network_peering" "vnet03_to_vnet02" {
  name                      = "vnet03-to-vnet02"
  resource_group_name       = azurerm_resource_group.rg.name
  virtual_network_name      = azurerm_virtual_network.vnet03.name
  remote_virtual_network_id = azurerm_virtual_network.vnet02.id
  allow_forwarded_traffic   = true
  allow_gateway_transit     = false
  use_remote_gateways       = false

  depends_on = [azurerm_resource_group.rg, azurerm_virtual_network.vnet03, azurerm_virtual_network.vnet02]
}



# Peering between vnet01 and vnet03
resource "azurerm_virtual_network_peering" "vnet01_to_vnet03" {
  name                      = "vnet01-to-vnet03"
  resource_group_name       = azurerm_resource_group.rg.name
  virtual_network_name      = azurerm_virtual_network.vnet01.name
  remote_virtual_network_id = azurerm_virtual_network.vnet03.id
  allow_forwarded_traffic   = true
  allow_gateway_transit     = false
  use_remote_gateways       = false

  depends_on = [azurerm_resource_group.rg, azurerm_virtual_network.vnet01, azurerm_virtual_network.vnet03]
}

resource "azurerm_virtual_network_peering" "vnet03_to_vnet01" {
  name                      = "vnet03-to-vnet01"
  resource_group_name       = azurerm_resource_group.rg.name
  virtual_network_name      = azurerm_virtual_network.vnet03.name
  remote_virtual_network_id = azurerm_virtual_network.vnet01.id
  allow_forwarded_traffic   = true
  allow_gateway_transit     = false
  use_remote_gateways       = false

  depends_on = [azurerm_resource_group.rg, azurerm_virtual_network.vnet01, azurerm_virtual_network.vnet03]
}


