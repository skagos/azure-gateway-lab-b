output "resource_group_name" { value = azurerm_resource_group.lab.name }
output "vm_name" { value = azurerm_windows_virtual_machine.vm.name }
output "vm_private_ip" { value = azurerm_network_interface.vm.private_ip_address }
output "vnet_id" { value = azurerm_virtual_network.lab.id }
