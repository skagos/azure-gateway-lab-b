resource "azurerm_resource_group" "lab" {
  name     = "${local.name}-rg"
  location = var.location
  tags     = local.tags
}