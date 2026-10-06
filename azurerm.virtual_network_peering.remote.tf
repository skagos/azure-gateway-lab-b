resource "azurerm_virtual_network_peering" "remote" {
  count                        = var.enable_peering ? 1 : 0
  name                         = "to-gateway-lab-a"
  resource_group_name          = azurerm_resource_group.lab.name
  virtual_network_name         = azurerm_virtual_network.lab.name
  remote_virtual_network_id    = "/subscriptions/${var.subscription_id}/resourceGroups/gateway-lab-a-rg/providers/Microsoft.Network/virtualNetworks/gateway-lab-a-vnet"
  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}