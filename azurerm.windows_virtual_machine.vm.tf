resource "azurerm_windows_virtual_machine" "vm" {
  name                  = "${local.name}-vm"
  computer_name         = "lab-b-vm"
  location              = azurerm_resource_group.lab.location
  resource_group_name   = azurerm_resource_group.lab.name
  size                  = var.vm_size
  admin_username        = "azureadmin"
  admin_password        = var.admin_password
  network_interface_ids = [azurerm_network_interface.vm.id]
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-datacenter"
    version   = "latest"
  }
  depends_on = [
    azurerm_subnet_network_security_group_association.vm,
    azurerm_subnet_nat_gateway_association.vm,
    azurerm_nat_gateway_public_ip_association.egress
  ]
  tags = local.tags
}