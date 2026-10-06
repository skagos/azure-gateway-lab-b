resource "azurerm_nat_gateway" "egress" {
  name                = "${local.name}-nat"
  location            = azurerm_resource_group.lab.location
  resource_group_name = azurerm_resource_group.lab.name
  sku_name            = "Standard"
}