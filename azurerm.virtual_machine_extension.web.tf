resource "azurerm_virtual_machine_extension" "web" {
  name                 = "install-iis"
  virtual_machine_id   = azurerm_windows_virtual_machine.vm.id
  publisher            = "Microsoft.Compute"
  type                 = "CustomScriptExtension"
  type_handler_version = "1.10"
  settings = jsonencode({
    commandToExecute = "powershell.exe -NoProfile -NonInteractive -ExecutionPolicy Bypass -EncodedCommand ${textencodebase64(file("${path.module}/scripts/Install-Web.ps1"), "UTF-16LE")}"
  })
}