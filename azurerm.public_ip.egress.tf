resource "azurerm_public_ip" "egress" {
  name                = "${local.name}-egress-pip"
  location            = azurerm_resource_group.lab.location
  resource_group_name = azurerm_resource_group.lab.name
  allocation_method   = "Static"
  sku                 = "Standard"
}