resource "azurerm_subnet" "vm" {
  name                            = "vm"
  resource_group_name             = azurerm_resource_group.lab.name
  virtual_network_name            = azurerm_virtual_network.lab.name
  address_prefixes                = ["10.60.1.0/24"]
  default_outbound_access_enabled = false
}