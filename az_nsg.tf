
/*
resource "azurerm_network_security_group" "example" {
  name                = "acceptanceTestSecurityGroup1"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  security_rule {
    name                       = "test123"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = local.special_tags
}
*/

#Below we are using concept of dynamic blocks to define the ports dynamically instead of statically defining each rule
resource "azurerm_network_security_group" "example" {
  name                = "acceptanceTestSecurityGroup1"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  #From the perspective of azure Inbound rules.. Destination ports must be allowed.
  /*
  dynamic "security_rule" {
    for_each = var.nsg_inbound_ports_list
    content {
      name                       = "Allow_source_port_${security_rule.value}"
      priority                   = "1${security_rule.value}"
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = security_rule.value
      destination_port_range     = "*"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  }
*/

  dynamic "security_rule" {
    for_each = var.nsg_inbound_ports_list
    content {
      name                       = "Allow_destination_port_${security_rule.value}"
      priority                   = "2${security_rule.value}"
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = security_rule.value
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  }
  tags = local.special_tags
}